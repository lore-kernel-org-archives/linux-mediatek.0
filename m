Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24457C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 19:52:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576A7613C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576A7613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qMZ/8pUdYmnj89QtvkkpbdKg/UbfYLa4r7OBvYI9MnI=; b=NeGAnwsPr0Mgxw2zIKv2FRQe5
	wxKlPYOvML3AEbiNha4mMbhtI9lVtKzats1TCDr5wnWIj5W1BVVbcEU7rHOTtHv3zhhG4InxdVgZ5
	46j/ZjTpG+/x8jo6wbQriRj01sIIutKum7N1K67uDZ08l2B29q5w6oHHXhyX4tltnd0xzW52VAHmK
	kgEsi2gqZr+o9x1MrZLJid2vP1fDEWJfwfRbAm9EbLQhFaRSDQz8V78QZlBBb2Zld3B9OVw4HFuaS
	pcO5UWjmBI9GFSaKce2+yE63XCvaIby9eijDiHkkhtpjwYN0MOgRShWG21vdoPG64lE0XP8u0U0cE
	fpn6XhXHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYwPg-00CyD7-Ie; Tue, 20 Apr 2021 19:52:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYwPP-00CyC5-55; Tue, 20 Apr 2021 19:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=91fi6dwzAdBY2nGUmibCb/N6XGFP0Q1yBnL6rpHM38c=; b=lxnauKv0AQV18ynfdaGYf2eMmK
 8wgJDY6IDl+sBFIUJ8R1qalpB5JkHz2URgFhjbI83azWrH9GZF0jnkxqUvg0+pl9aiajxkA2B248w
 5NJigRjNapSCarM/KKOeUizCFqJSQwo3/758DWc/+cFjf21D0sJ94jsao6CxsXZhyWlBp/RGa8iFa
 47QUFNfNI7MqVnCPpazdqwxsQgpsvsf/dPzo29wWO9VLrovNBwvPtAU8DJ3xko956xHGpiE7bp0h8
 eaPb1JP/bxjC20kUXg6qmey2uPr+gXTkAdav87S/5HLC9uiU6I7RMdohTJG/zwMhrbZ6Lgli36kmQ
 PHJOXV4Q==;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYwPJ-00CO1q-ET; Tue, 20 Apr 2021 19:51:41 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso32139454otv.6; 
 Tue, 20 Apr 2021 12:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=91fi6dwzAdBY2nGUmibCb/N6XGFP0Q1yBnL6rpHM38c=;
 b=bHP7WWRST1sVjfmi8FsJ0wil9yjrtDZhIQ2o817oLOlKYLkRaMleRisxB8sP8sAnRd
 VyGfOYKNvAdlqsT5Dps2UXduidvHj/0yPyjAzYSl84uqaSZUCzpyTF1OMLxzD6JPVXTF
 FT4VmH1ZqATGmZ1D+mR3O96QrBqaQVDMP/ygkEj6VkgIwOn4e0SkR1JzR8IquXT+BE1D
 sIlp/zWHlDbhaVF1jZknH5PDbS3NPWpn+L8m69YTStzIyIS9hvyKxLALncL8dTm69G3G
 jwK7Q4E6qVteTCWntDu7DctL7E7pq+YJgpmGjK9MPYa8y0GIP2ar5kTFmSd/uQnG8vis
 y0PQ==
X-Gm-Message-State: AOAM533zFGrRmI63Mbu5Nk1tIxPOOwyMFnEfr/12UYiriTVTEuNDVeCi
 vhs/Ps/BV//gxi306jhs7w==
X-Google-Smtp-Source: ABdhPJyDOyHsUaTNR8GhgpoBM5E9nKGrXLHVqaHZkgjU1rUdcTZ12QClh2TVTRdYZKw3WqsuwQxNbA==
X-Received: by 2002:a9d:628f:: with SMTP id x15mr5024183otk.186.1618948295051; 
 Tue, 20 Apr 2021 12:51:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w141sm3757oie.5.2021.04.20.12.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:51:34 -0700 (PDT)
Received: (nullmailer pid 3704908 invoked by uid 1000);
 Tue, 20 Apr 2021 19:51:32 -0000
Date: Tue, 20 Apr 2021 14:51:32 -0500
From: Rob Herring <robh@kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support custom
 GMAC label
Message-ID: <20210420195132.GA3686955@robh.at.kernel.org>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_125137_513851_385558CE 
X-CRM114-Status: GOOD (  22.54  )
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

On Mon, Apr 19, 2021 at 08:46:59AM -0700, Ilya Lipnitskiy wrote:
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
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 6b00c12c6c43..df3cda63a8c5 100644
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
> @@ -2867,9 +2868,10 @@ static int mtk_add_mac(struct mtk_eth *eth, struct=
 device_node *np)
>  		return -EINVAL;
>  	}
>  =

> -	eth->netdev[id] =3D alloc_etherdev(sizeof(*mac));
> +	eth->netdev[id] =3D alloc_netdev(sizeof(*mac), label ? label : "eth%d",
> +				       NET_NAME_UNKNOWN, ether_setup);

'label' is generally supposed to correspond to the sticker for the =

device connector for a human to id. I can't really tell if that's the =

case here. I don't see how 'gmacX' vs. 'ethX' maps to DSA master vs. =

slave.

I don't think this should be handled within a specific driver either. If =

we're going to have a way to name things, then fix it in =

alloc_etherdev().

It can also be argued that device naming for userspace is a userspace =

(udev) problem. =


Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
