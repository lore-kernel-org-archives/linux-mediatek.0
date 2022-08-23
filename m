Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC97C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP+712EO8yi9wgRvfODGAmrYDSOcaT+a9BpRVZKH65c=; b=dDm9LxR1AWPVZ036PMpkJsMscU
	rUOesQtXH/yIUWRnLC7gTftOHox05yanbxFECp2Mmq5F8hX0uWae4y+HZ69M9vGMC1OWYW5KZQqFM
	jpfoleo3BWrqjpTJrX8reoliMpLn4zZBmNcHtR0EJGRDus2vMyIofU+KxOVRJZytqgnKEz/k4tEgV
	eQYx6cdTAoHwANCTNJZrBpthe7F3FVtwDJkrrBtt/XwGUCrolnzdskViwng2xqJBn6vCMGgr1darI
	PAo6EnkrPbt+iOd2DU+G4outuHU1nijjlic5i+ybFA0IpG3VVcVWLTLfdF3m9IUsNQQhmujuENk2l
	CDvUAZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTno-006GgO-Hx; Tue, 23 Aug 2022 13:18:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTnj-006GdK-Eo
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 13:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661260718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YP+712EO8yi9wgRvfODGAmrYDSOcaT+a9BpRVZKH65c=;
	b=IP/hva4bjsDwy4zZfTuLEK77LSYMeepNcunhAmqHsmlr4OOKgr4r7kugY2t0XLKRkRXRH0
	NZSDJji7I06vHUJrj5UG8vnitj/rqHN+41VsdRBkqq4nHSVywvtcBNagWevr0ixL/gLP/4
	u2OSf+FtxW6EhKWWLu8WUHfGJXKkiYQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-Wc8Hz9naMzW3b8Qgg9p58Q-1; Tue, 23 Aug 2022 09:18:36 -0400
X-MC-Unique: Wc8Hz9naMzW3b8Qgg9p58Q-1
Received: by mail-qt1-f197.google.com with SMTP id y12-20020ac8708c000000b00342f1bb8428so10489543qto.5
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 06:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=YP+712EO8yi9wgRvfODGAmrYDSOcaT+a9BpRVZKH65c=;
        b=TtflKKoUo/XzQ1wxCC4POL7nE2mC9x89UQgYU+eIARwseIWHwKM2Q5v/pepboTZ+m9
         Arvx/1qzqDVlT/ENLQgzZY9cDlMDs6hgEGsnUKySu9SuliyKGJki8Y54whVVcudyivEk
         +e7l1qjXurMbu14fcVb1fjvvLcTKxLZuEp5bFOdb1cwJfB6C6R18pxAsPU+E38BVeOsf
         b93ztcWI2Hhn8Nh55oKfFifiOdiO0OsU4/CUA/qnKoL1E1LMZfPmIcTFE2U1YQO4xi2l
         VMIwOOhdfa1jrf04Iu6TDmywd6cmJpxqzgoNMG8aC1HxTaUrZZi6zoPRlCBp8v9emYbo
         312g==
X-Gm-Message-State: ACgBeo0TL0rzFclCchXVByX6BS+uX2TEuQVX72u8WAFFWEW5vHjOaUxB
	IK3YvbJpdQkHZy4Fu9qNi9yfLtL1zrQ4KfdyLrexUTWCm/6gilcBVynjtMSBxEg3jZV0tv3Bs3Y
	nxFJ8j5w7VlPCmhoyoDVTxselb8QDE950
X-Received: by 2002:ac8:5a14:0:b0:344:5660:6530 with SMTP id n20-20020ac85a14000000b0034456606530mr19425723qta.12.1661260716089;
        Tue, 23 Aug 2022 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hwSQGeIZ9queTWLty8Bh40ABYaAKoYdFJ7Gn3EzseAexOMiQQFmESLu7m7qzBuysV+lq6xQ==
X-Received: by 2002:ac8:5a14:0:b0:344:5660:6530 with SMTP id n20-20020ac85a14000000b0034456606530mr19425692qta.12.1661260715820;
        Tue, 23 Aug 2022 06:18:35 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-176.dyn.eolo.it. [146.241.97.176])
        by smtp.gmail.com with ESMTPSA id r1-20020a05620a298100b006bb53282393sm13806625qkp.81.2022.08.23.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 06:18:35 -0700 (PDT)
Message-ID: <efd1c89e3bbd7364ef381292c9ceff430cbeda8d.camel@redhat.com>
Subject: Re: [PATCH 2/4] net: mediatek: sgmii: ensure the SGMII PHY is
 powered down on configuration
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Date: Tue, 23 Aug 2022 15:18:31 +0200
In-Reply-To: <20220820224538.59489-3-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
	 <20220820224538.59489-3-lynxis@fe80.eu>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_061839_647454_36751196 
X-CRM114-Status: GOOD (  18.82  )
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

On Sun, 2022-08-21 at 00:45 +0200, Alexander Couzens wrote:
> The code expect the PHY to be in power down which is only true after reset.
> Allow changes of the SGMII parameters more than once.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index a01bb20ea957..782812434367 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -7,6 +7,7 @@
>   *
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/phylink.h>
> @@ -24,6 +25,9 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
>  {
>  	unsigned int val;
>  
> +	/* PHYA power down */
> +	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);

in mtk_pcs_setup_mode_an() and in mtk_pcs_setup_mode_force() the code
carefully flips only the SGMII_PHYA_PWD bit. Is it safe to overwrite
the full register contents?

> +
>  	/* Setup the link timer and QPHY power up inside SGMIISYS */
>  	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
>  		     SGMII_LINK_TIMER_DEFAULT);
> @@ -36,6 +40,10 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
>  	val |= SGMII_AN_RESTART;
>  	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
>  
> +	/* Release PHYA power down state
> +	 * unknown how much the QPHY needs but it is racy without a sleep
> +	 */
> +	usleep_range(50, 100);

Ouch, this looks fragile, without any related H/W specification. 

>  	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
>  
>  	return 0;
> @@ -50,6 +58,9 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
>  {
>  	unsigned int val;
>  
> +	/* PHYA power down */
> +	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
> +
>  	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
>  	val &= ~RG_PHY_SPEED_MASK;
>  	if (interface == PHY_INTERFACE_MODE_2500BASEX)
> @@ -67,7 +78,10 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
>  	val |= SGMII_SPEED_1000;
>  	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
>  
> -	/* Release PHYA power down state */
> +	/* Release PHYA power down state
> +	 * unknown how much the QPHY needs but it is racy without a sleep
> +	 */
> +	usleep_range(50, 100);

Same here.

Thanks!

Paolo


