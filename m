Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1C8C433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 16:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1227E2053B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 16:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="khVHCmee";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FBdfJX7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1227E2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WUJUFDFUtqXaFZUH276Dx1bHGolH6kC+Xqz2yiiT/xk=; b=khVHCmeeEbAdAoXxblvfn7jb8
	2Pf+BinGYodTqoynAD397pvUrgYeXExtSSU32aqNsiOBWz4w9Z3Pp6Gk0q4D1ilhgovs8Hjx5gX3X
	o6JzrsymFDwhCQz+sountcIXKmCRAPMHC5gqWVneNmj7N35Hmi12A+ZJJgBsPabJgE20GpnH60F9l
	IPLKb0hnHDLIHutNlqvCukLzWTpm+CaQnvNU4SmT/camHyIJ6Gnlk/XFLdb2NPq3poGVCUxATSSVD
	vS+PXOOoA3N479UhbU31n9GlMUDjnWxIIiHnQYCR3supD0NHBIpfsAnOIW1PdGcsgU503IzT8gW0r
	+mkOz7vOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0S3Y-0000ZC-Jk; Tue, 28 Jul 2020 16:02:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0S3V-0008LR-O3; Tue, 28 Jul 2020 16:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sCLxp6AUq1KmYBCwLzSeRjYy8jCk/8A7PYbEtgGG+qY=; b=FBdfJX7RXHbQPC7Lt8l5KLv3H
 5jw/LPb2H4Mg8qL/wp+zku+Lj2h55sF0Y6agIQNJrTBNjuBM9YOt0dEfgsWwBqWZVZPVj/yy7mrgK
 xaURIu7OaaysamVAf538TZYDzlKIjek98q5EwLJwpAnb5XnhO0tA+qbCsqBVf2rDg4yGWQPNYc79o
 8EeRnwjSAsDHAgWqCyMhXAMEBJQ+/QqPObuLXw25uaqcWjM9VtAKN9zl04D1Dp9ltFZNmpAx1Od0x
 DuDxhjZIZG6j4Ee3Rmiuk9h5s+heolj6SGeBoLaIjNjlSGOngJEv4YF1wECBdZ2vOJZgqM4ysAKd0
 ZPvrb1+JQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45296)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1k0S0S-0004SE-PO; Tue, 28 Jul 2020 16:59:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1k0S0O-0004n3-Kl; Tue, 28 Jul 2020 16:59:04 +0100
Date: Tue, 28 Jul 2020 16:59:04 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200728155904.GT1551@shell.armlinux.org.uk>
References: <20200728122743.78489-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728122743.78489-1-frank-w@public-files.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_120217_821185_75FD9C1D 
X-CRM114-Status: GOOD (  20.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Landen Chao <landen.chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 02:27:43PM +0200, Frank Wunderlich wrote:
> From: Landen Chao <landen.chao@mediatek.com>
> =

> in recent Kernel-Versions there are warnings about incorrect MTU-Size
> like these:

Can the above also be fixed for incorrect capitalisation and improper
hyphernation please?

Thanks.

> =

> eth0: mtu greater than device maximum
> mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA =
overhead
> =

> Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set th=
e MTU")
> Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 85735d32ecb0..a1c45b39a230 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2891,6 +2891,8 @@ static int mtk_add_mac(struct mtk_eth *eth, struct =
device_node *np)
>  	eth->netdev[id]->irq =3D eth->irq[0];
>  	eth->netdev[id]->dev.of_node =3D np;
> =

> +	eth->netdev[id]->max_mtu =3D MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
> +
>  	return 0;
> =

>  free_netdev:
> --
> 2.25.1
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
