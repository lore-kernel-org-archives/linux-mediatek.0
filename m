Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79067FA372A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjCw3B/ZE6UsbRGFFrEOWgoAv9dKcIBGeE3THIAgxpw=; b=sj7LkqIdrKpp+H0J5ozpXNJFt8
	acEWiLb5PTpN0gHI3E/pZ4VH2HmWQbD0znoBvHbWE226mmF2z3kTqzJ1wntGbl02MEDRKMYa9gc42
	t51RSHOgF8en96TDqlzCGmYdBAXcVwlybtZ7gwfoIWYjzf1ZZhwFEfqyqpjgkOYy2OlXLUqDzgV7/
	l/5AUWHqdj3C6lF4cJyqJ2+pur6UxPpBj7cPKSSvYHFv1wn6p3phoGPuFKNZ25jXKwCWfMj44d1yN
	PKhiXbzNvqyJS5RuNRg4Z3HKyn6+hUsR07aLZ+/W4lniy8ah/R2rwFTSPK16DF+7JtJqGhalb9OW8
	S4Dzf8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdDE-000000087od-3y9D;
	Fri, 02 Jan 2026 11:20:56 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdDB-000000087ne-2H6I
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 11:20:56 +0000
Message-ID: <6856f6aa-c6b8-4966-9dd2-9bf0315395c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767352837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjCw3B/ZE6UsbRGFFrEOWgoAv9dKcIBGeE3THIAgxpw=;
	b=lUQSooyi39lfIMRVjaV/kmKb7WdyvSWRxBnlGP3xc7CZNiG0dOFmTTzioIzLXkKrGeGHx9
	lasbtDCBKxbzFDV+WYUYuNUwnSsnqm+3PQ9iL5AzpZ0pAi2o/XZImmck8yhSNLNwagcyb2
	drVc+NYVSsYpBIhkYqQwHgaGHcI5Byo=
Date: Fri, 2 Jan 2026 11:20:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] net: mediatek: add null pointer check for hardware
 offloading
To: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
References: <20251231225206.3212871-1-Sebastian.Wolf@pace-systems.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251231225206.3212871-1-Sebastian.Wolf@pace-systems.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_032054_301066_D21F49E1 
X-CRM114-Status: GOOD (  21.81  )
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

On 31/12/2025 22:52, Sebastian Roland Wolf wrote:
> From: Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
> 
> Add a null pointer check to prevent kernel crashes when hardware
> offloading is active on MediaTek devices.
> 
> In some edge cases, the ethernet pointer or its associated netdev
> element can be NULL. Checking these pointers before access is
> mandatory to avoid segmentation faults and kernel oops.
> 
> This improves the robustness of the validation check for mtk_eth
> ingress devices introduced in commit 73cfd947dbdb ("net: mediatek:
> add support for ingress traffic offloading").
> 
> Fixes: 73cfd947dbdb ("net: mediatek: add support for ingress traffic offloading")
> net: mediatek: Add null pointer check to prevent crashes with active hardware offloading.
> 
> Signed-off-by: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
> ---
>   drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index e9bd32741983..6900ac87e1e9 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -270,7 +270,8 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
>   		flow_rule_match_meta(rule, &match);
>   		if (mtk_is_netsys_v2_or_greater(eth)) {

The code dereferences eth here ...

>   			idev = __dev_get_by_index(&init_net, match.key->ingress_ifindex);
> -			if (idev && idev->netdev_ops == eth->netdev[0]->netdev_ops) {
> +			if (idev && eth && eth->netdev[0] &&

... but it is checked a couple of lines after.

Even more, the function starts with providing rhahstable to lookup
cookie. I'm really doubt eth can be NULL.
At the same time lack of eth->netdev[0] looks like a design problem,
because according to the code there might be up to 3 netdev devices
registered for ppe.

I'm not familiar with the code, but it would be better to have a splat
of crash to check what was exactly missing, and drgn can help you find
if there were other netdevs available at the moment of crash.

> +			    idev->netdev_ops == eth->netdev[0]->netdev_ops) {
>   				struct mtk_mac *mac = netdev_priv(idev);
>   
>   				if (WARN_ON(mac->ppe_idx >= eth->soc->ppe_num))


