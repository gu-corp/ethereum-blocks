# EIP-721 Subgraph

## Deployment
```
NETWORK_NAME=xxx SUBGRAPH_NAME=xxx GRAPH_NODE_URL=xxx IPFS_URL=xxx VERSION=xxx sh deploy.sh
```
Notes:
- NETWORK_NAME: Deployed network name in Graphnode
- START_BLOCK: Start block
- SUBGRAPH_NAME: Subgraph name
- GRAPH_NODE_URL: Graphnode admin url
- IPFS_URL: IPFS url
- VERSION: Subgraph version. Ex: v0.0.9

Example:
```
NETWORK_NAME=gusandbox SUBGRAPH_NAME=gu-corp/ethereum-blocks GRAPH_NODE_URL=http://localhost:8020/ IPFS_URL=http://localhost:5001/ VERSION=v1.0.0 sh deploy.sh
```

## Example graphQL query
```
query {
    blocks (orderBy: "number", orderDirection: "desc") {
        id
        number
        gasUsed
        gasLimit
        timestamp
    }
}
```
