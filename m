Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64AFC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 12:16:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EA9611F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 12:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3EA9611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/2bFKiigcDe9mXON9vNFIEdsHe5OMzeup5OlzXtXtZY=; b=clhmB0BvbE3rx0pDduEO2Kjdq
	mjN01An2qwHkqelVITDZVlMjoNv5vOC1uThz9jyLeVoVqHp3uFAQNuq9rf0wG+OttPFx5++P4Q74P
	D/775El9RBWjIxwCPM6J1TMcVJP2n+jXnaHormD+I8UifLCuu1w/ziXnIYSH2beAwtmoEW/vLne6K
	N8VM7rGR2GSmCZp7l6XSD+skq64KIDXfe6hmTp2BIgVEp5/a4Ctng4lWvFLzH9MLlVCsMl/sqnhwm
	1QKrYc+3pINTCaju5YlaNAStD2qAU4u2f5/drZXOXXTyQpvueDvjHc/vJJNS2vsFWOOCJK5T9E8QN
	l5zjpGEnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSom-009pbf-G6; Mon, 19 Apr 2021 12:15:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSoa-009paW-NP; Mon, 19 Apr 2021 12:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=NyiLHws0iWwRSBUEmBa0u4IkgtunixVAzh1dyI3MN5A=; b=0ajfnKErfCQnRY90bWpsQgqv0l
 y2taxydpoLMM+gaXwsktFje0xFaM+DDDdL4puv4JdFmEZ9uSzYuDdJTLgdHZqayx1uE1+E/j8BOPl
 +cmdhn4eLDB0+0pj07aDd0Pu+d1ZH9DE5gzA9JJ5xFkkEczn9HXOsGfjsYaoQF3taAwPwh9CqZyL3
 HrOOhABL9ESjiMbZohbqXtSHePRR/GoMt4V7gVIHrBxcmZDWE4V70xZhq7ZWfpx9MiWexYzex4+Dq
 +mCpaySLIoYaQqL9pNa5GLdd7hfUM4uygnE/yIbq/mrr+g+chuBDX2/2HIk+gzzMXA83cRYn2u1Ze
 IzQg6btA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSoU-00BLFp-N3; Mon, 19 Apr 2021 12:15:43 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lYSo4-00HWif-T8; Mon, 19 Apr 2021 14:15:12 +0200
Date: Mon, 19 Apr 2021 14:15:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 2/2] net: ethernet: mediatek: support custom
 GMAC label
Message-ID: <YH10UNuJZ5s7dfLh@lunn.ch>
References: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
 <20210419040352.2452-3-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419040352.2452-3-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_051538_772235_D1AC3316 
X-CRM114-Status: GOOD (  18.20  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Apr 18, 2021 at 09:03:52PM -0700, Ilya Lipnitskiy wrote:
> The MAC device name can now be set within DTS file instead of always
> being "ethX". This is helpful for DSA to clearly label the DSA master
> device and distinguish it from DSA slave ports.
> =

> For example, some devices, such as the Ubiquiti EdgeRouter X, may have
> ports labeled ethX. Labeling the master GMAC with a different prefix
> than DSA ports helps with clarity.
> =

> Suggested-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 6b00c12c6c43..4c0ce4fb7735 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2845,6 +2845,7 @@ static const struct net_device_ops mtk_netdev_ops =
=3D {
>  =

>  static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  {
> +	const char *label =3D of_get_property(np, "label", NULL);
>  	const __be32 *_id =3D of_get_property(np, "reg", NULL);
>  	phy_interface_t phy_mode;
>  	struct phylink *phylink;
> @@ -2940,6 +2941,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct =
device_node *np)
>  	else
>  		eth->netdev[id]->max_mtu =3D MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
>  =

> +	if (label)
> +		strscpy(eth->netdev[id]->name, label, IFNAMSIZ);

It is better to use alloc_netdev_mqs() so you get validation the name
is unique.

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
