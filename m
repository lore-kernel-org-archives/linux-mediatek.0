Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC41C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M61kRHvOIZ/sRORiM9e2334kSvQ3+DQsC7G4eknZbSo=; b=Xs0RxzlBa8EU2+UyXLxczojLgf
	JduykRbhajYk1Ius805k/aHhG0fnS0GFwBsd+fkqTcrUT8tIbayyatYZbjqyUhevZ8nxh+FAzqd2N
	L5+Inm8qk2JAn5uzcIsDLRYXTNNOsfgxxNDNsgNPoHuKOHQ07daR+lMMolAcYNeorgcmsbniTIBw/
	oROq9DETtlcJGgj4ytcWvcBy6RRpZwEHO/1K2nBoTPagZzyKVyOfMf/pnPRSdKlysXOeKIjXP6Wgc
	3jNVe1yttGXm7uJ0HSPQUuVtdxZxYbDg24LBy4wp7C67L9Qqc3HedihoPv8ibu9fReH/LEfFgCfND
	2J10Gj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdV0K-00000000Ok9-0XA5;
	Mon, 12 Aug 2024 13:22:32 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUzS-00000000OR5-33I1;
	Mon, 12 Aug 2024 13:21:41 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WjFRC4jPlzQpf0;
	Mon, 12 Aug 2024 21:16:55 +0800 (CST)
Received: from kwepemm000007.china.huawei.com (unknown [7.193.23.189])
	by mail.maildlp.com (Postfix) with ESMTPS id EBCAC180102;
	Mon, 12 Aug 2024 21:21:27 +0800 (CST)
Received: from [10.67.120.192] (10.67.120.192) by
 kwepemm000007.china.huawei.com (7.193.23.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 21:21:26 +0800
Message-ID: <88382c22-a45b-4cd6-8313-4db1350d8e7c@huawei.com>
Date: Mon, 12 Aug 2024 21:21:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, "David S. Miller" <davem@davemloft.net>, David
 Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
	<nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
	<Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yisen Zhuang
	<yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 3/3] net: hns3: Use
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
To: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
 <20240812-ipv6_addr-helpers-v1-3-aab5d1f35c40@kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20240812-ipv6_addr-helpers-v1-3-aab5d1f35c40@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.192]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000007.china.huawei.com (7.193.23.189)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_062139_339870_CD4952C5 
X-CRM114-Status: GOOD (  18.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Jijie Shao <shaojijie@huawei.com>

on 2024/8/12 20:11, Simon Horman wrote:
> Use new ipv6_addr_cpu_to_be32 and ipv6_addr_be32_to_cpu helper,
> and IPV6_ADDR_WORDS. This is arguably slightly nicer.
>
> No functional change intended.
> Compile tested only.
>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>   .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    | 79 +++++++++++-----------
>   .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |  8 ++-
>   2 files changed, 44 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> index 82574ce0194f..ce629cbc5d01 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> @@ -13,8 +13,9 @@
>   #include <linux/platform_device.h>
>   #include <linux/if_vlan.h>
>   #include <linux/crash_dump.h>
> -#include <net/ipv6.h>
> +
>   #include <net/rtnetlink.h>
> +
>   #include "hclge_cmd.h"
>   #include "hclge_dcb.h"
>   #include "hclge_main.h"
> @@ -6278,15 +6279,15 @@ static void hclge_fd_get_ip4_tuple(struct ethtool_rx_flow_spec *fs,
>   static void hclge_fd_get_tcpip6_tuple(struct ethtool_rx_flow_spec *fs,
>   				      struct hclge_fd_rule *rule, u8 ip_proto)
>   {
> -	be32_to_cpu_array(rule->tuples.src_ip, fs->h_u.tcp_ip6_spec.ip6src,
> -			  IPV6_SIZE);
> -	be32_to_cpu_array(rule->tuples_mask.src_ip, fs->m_u.tcp_ip6_spec.ip6src,
> -			  IPV6_SIZE);
> +	ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
> +			      fs->h_u.tcp_ip6_spec.ip6src);
> +	ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
> +			      fs->m_u.tcp_ip6_spec.ip6src);
>   
> -	be32_to_cpu_array(rule->tuples.dst_ip, fs->h_u.tcp_ip6_spec.ip6dst,
> -			  IPV6_SIZE);
> -	be32_to_cpu_array(rule->tuples_mask.dst_ip, fs->m_u.tcp_ip6_spec.ip6dst,
> -			  IPV6_SIZE);
> +	ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
> +			      fs->h_u.tcp_ip6_spec.ip6dst);
> +	ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
> +			      fs->m_u.tcp_ip6_spec.ip6dst);
>   
>   	rule->tuples.src_port = be16_to_cpu(fs->h_u.tcp_ip6_spec.psrc);
>   	rule->tuples_mask.src_port = be16_to_cpu(fs->m_u.tcp_ip6_spec.psrc);
> @@ -6307,15 +6308,15 @@ static void hclge_fd_get_tcpip6_tuple(struct ethtool_rx_flow_spec *fs,
>   static void hclge_fd_get_ip6_tuple(struct ethtool_rx_flow_spec *fs,
>   				   struct hclge_fd_rule *rule)
>   {
> -	be32_to_cpu_array(rule->tuples.src_ip, fs->h_u.usr_ip6_spec.ip6src,
> -			  IPV6_SIZE);
> -	be32_to_cpu_array(rule->tuples_mask.src_ip, fs->m_u.usr_ip6_spec.ip6src,
> -			  IPV6_SIZE);
> +	ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
> +			      fs->h_u.usr_ip6_spec.ip6src);
> +	ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
> +			      fs->m_u.usr_ip6_spec.ip6src);
>   
> -	be32_to_cpu_array(rule->tuples.dst_ip, fs->h_u.usr_ip6_spec.ip6dst,
> -			  IPV6_SIZE);
> -	be32_to_cpu_array(rule->tuples_mask.dst_ip, fs->m_u.usr_ip6_spec.ip6dst,
> -			  IPV6_SIZE);
> +	ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
> +			      fs->h_u.usr_ip6_spec.ip6dst);
> +	ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
> +			      fs->m_u.usr_ip6_spec.ip6dst);
>   
>   	rule->tuples.ip_proto = fs->h_u.usr_ip6_spec.l4_proto;
>   	rule->tuples_mask.ip_proto = fs->m_u.usr_ip6_spec.l4_proto;
> @@ -6744,21 +6745,19 @@ static void hclge_fd_get_tcpip6_info(struct hclge_fd_rule *rule,
>   				     struct ethtool_tcpip6_spec *spec,
>   				     struct ethtool_tcpip6_spec *spec_mask)
>   {
> -	cpu_to_be32_array(spec->ip6src,
> -			  rule->tuples.src_ip, IPV6_SIZE);
> -	cpu_to_be32_array(spec->ip6dst,
> -			  rule->tuples.dst_ip, IPV6_SIZE);
> +	ipv6_addr_cpu_to_be32(spec->ip6src, rule->tuples.src_ip);
> +	ipv6_addr_cpu_to_be32(spec->ip6dst, rule->tuples.dst_ip);
>   	if (rule->unused_tuple & BIT(INNER_SRC_IP))
>   		memset(spec_mask->ip6src, 0, sizeof(spec_mask->ip6src));
>   	else
> -		cpu_to_be32_array(spec_mask->ip6src, rule->tuples_mask.src_ip,
> -				  IPV6_SIZE);
> +		ipv6_addr_cpu_to_be32(spec_mask->ip6src,
> +				      rule->tuples_mask.src_ip);
>   
>   	if (rule->unused_tuple & BIT(INNER_DST_IP))
>   		memset(spec_mask->ip6dst, 0, sizeof(spec_mask->ip6dst));
>   	else
> -		cpu_to_be32_array(spec_mask->ip6dst, rule->tuples_mask.dst_ip,
> -				  IPV6_SIZE);
> +		ipv6_addr_cpu_to_be32(spec_mask->ip6dst,
> +				      rule->tuples_mask.dst_ip);
>   
>   	spec->tclass = rule->tuples.ip_tos;
>   	spec_mask->tclass = rule->unused_tuple & BIT(INNER_IP_TOS) ?
> @@ -6777,19 +6776,19 @@ static void hclge_fd_get_ip6_info(struct hclge_fd_rule *rule,
>   				  struct ethtool_usrip6_spec *spec,
>   				  struct ethtool_usrip6_spec *spec_mask)
>   {
> -	cpu_to_be32_array(spec->ip6src, rule->tuples.src_ip, IPV6_SIZE);
> -	cpu_to_be32_array(spec->ip6dst, rule->tuples.dst_ip, IPV6_SIZE);
> +	ipv6_addr_cpu_to_be32(spec->ip6src, rule->tuples.src_ip);
> +	ipv6_addr_cpu_to_be32(spec->ip6dst, rule->tuples.dst_ip);
>   	if (rule->unused_tuple & BIT(INNER_SRC_IP))
>   		memset(spec_mask->ip6src, 0, sizeof(spec_mask->ip6src));
>   	else
> -		cpu_to_be32_array(spec_mask->ip6src,
> -				  rule->tuples_mask.src_ip, IPV6_SIZE);
> +		ipv6_addr_cpu_to_be32(spec_mask->ip6src,
> +				      rule->tuples_mask.src_ip);
>   
>   	if (rule->unused_tuple & BIT(INNER_DST_IP))
>   		memset(spec_mask->ip6dst, 0, sizeof(spec_mask->ip6dst));
>   	else
> -		cpu_to_be32_array(spec_mask->ip6dst,
> -				  rule->tuples_mask.dst_ip, IPV6_SIZE);
> +		ipv6_addr_cpu_to_be32(spec_mask->ip6dst,
> +				      rule->tuples_mask.dst_ip);
>   
>   	spec->tclass = rule->tuples.ip_tos;
>   	spec_mask->tclass = rule->unused_tuple & BIT(INNER_IP_TOS) ?
> @@ -7007,7 +7006,7 @@ static void hclge_fd_get_flow_tuples(const struct flow_keys *fkeys,
>   	} else {
>   		int i;
>   
> -		for (i = 0; i < IPV6_SIZE; i++) {
> +		for (i = 0; i < IPV6_ADDR_WORDS; i++) {
>   			tuples->src_ip[i] = be32_to_cpu(flow_ip6_src[i]);
>   			tuples->dst_ip[i] = be32_to_cpu(flow_ip6_dst[i]);
>   		}
> @@ -7262,14 +7261,14 @@ static int hclge_get_cls_key_ip(const struct flow_rule *flow,
>   		struct flow_match_ipv6_addrs match;
>   
>   		flow_rule_match_ipv6_addrs(flow, &match);
> -		be32_to_cpu_array(rule->tuples.src_ip, match.key->src.s6_addr32,
> -				  IPV6_SIZE);
> -		be32_to_cpu_array(rule->tuples_mask.src_ip,
> -				  match.mask->src.s6_addr32, IPV6_SIZE);
> -		be32_to_cpu_array(rule->tuples.dst_ip, match.key->dst.s6_addr32,
> -				  IPV6_SIZE);
> -		be32_to_cpu_array(rule->tuples_mask.dst_ip,
> -				  match.mask->dst.s6_addr32, IPV6_SIZE);
> +		ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
> +				      match.key->src.s6_addr32);
> +		ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
> +				      match.mask->src.s6_addr32);
> +		ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
> +				      match.key->dst.s6_addr32);
> +		ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
> +				      match.mask->dst.s6_addr32);
>   	} else {
>   		rule->unused_tuple |= BIT(INNER_SRC_IP);
>   		rule->unused_tuple |= BIT(INNER_DST_IP);
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
> index b5178b0f88b3..b9fc719880bb 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
> @@ -8,7 +8,9 @@
>   #include <linux/phy.h>
>   #include <linux/if_vlan.h>
>   #include <linux/kfifo.h>
> +
>   #include <net/devlink.h>
> +#include <net/ipv6.h>
>   
>   #include "hclge_cmd.h"
>   #include "hclge_ptp.h"
> @@ -718,15 +720,15 @@ struct hclge_fd_cfg {
>   };
>   
>   #define IPV4_INDEX	3
> -#define IPV6_SIZE	4
> +
>   struct hclge_fd_rule_tuples {
>   	u8 src_mac[ETH_ALEN];
>   	u8 dst_mac[ETH_ALEN];
>   	/* Be compatible for ip address of both ipv4 and ipv6.
>   	 * For ipv4 address, we store it in src/dst_ip[3].
>   	 */
> -	u32 src_ip[IPV6_SIZE];
> -	u32 dst_ip[IPV6_SIZE];
> +	u32 src_ip[IPV6_ADDR_WORDS];
> +	u32 dst_ip[IPV6_ADDR_WORDS];
>   	u16 src_port;
>   	u16 dst_port;
>   	u16 vlan_tag1;
>

