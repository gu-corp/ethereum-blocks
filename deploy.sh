if [ -z "${NETWORK_NAME}" ]
then
  echo NETWORK_NAME env is missing
  exit 1
fi

if [ -z "${SUBGRAPH_NAME}" ]
then
  echo SUBGRAPH_NAME env is missing
  exit 1
fi

if [ -z "${GRAPH_NODE_URL}" ]
then
  echo GRAPH_NODE_URL env is missing
  exit 1
fi

if [ -z "${IPFS_URL}" ]
then
  echo IPFS_URL env is missing
  exit 1
fi

if [ -z "${VERSION}" ]
then
  VERSION="v1.0.0"
fi

# Generate subgraph.yaml from subgraph-template.yaml
sed "s/NETWORK_NAME/$NETWORK_NAME/g;" $1 subgraph-template.yaml > subgraph.yaml

yarn
npm run build

npm run graph -- remove $SUBGRAPH_NAME --node $GRAPH_NODE_URL
npm run graph -- create $SUBGRAPH_NAME --node $GRAPH_NODE_URL
npm run graph -- deploy $SUBGRAPH_NAME --node $GRAPH_NODE_URL --ipfs $IPFS_URL --version-label $VERSION