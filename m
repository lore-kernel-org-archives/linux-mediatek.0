Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtUtOVFIX1S5dYponSIkKa4oK3F37sgReDho44uMs6o=; b=f5k6Lhu3SmfPso
	/YVlBZDmtOB9kNQbEAtgRCqV1GeSOSLCPzMvfw4QjAtL1hM7lHveVoy4yygI8TDDq7VCghpN0GfGI
	nSrMa+DcqaWCsTZjKmkVDpsICxzj+6hpqCbmootHwecm3R48VEVIL8PJQ+2N4oMxWOjsmuEZiNsTy
	FJCtZaYAMEFYzd9aqOoMLw/LrizbVNj46x1sKGZ5H4MX3m7leRo7E0aTAP86k7LzRZfKcsktSv0nc
	drcpSVeGMPstDzkDKbjGCMJ25Yp+UfKXdIvRCSRL4A9K7cP2rZbiNfVSL9jPYUtupwK56tzfk24AG
	EtENKc2e4TeED0MFVJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxuF-0030P4-Qg; Thu, 31 Mar 2022 16:44:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxtv-0030Ez-84; Thu, 31 Mar 2022 16:44:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6D81A1F46FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648745038;
 bh=94Cb7myupDPAqE8jKAnxrfz3kkcstfEKE3FYesYmFY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnU2A92cVWBCeTzZ3DSb/z5w+q3NrzUc5piQzdi37Hb5+v9KBKh+sXdqJ1sUcdqho
 WMi6YxxFQoGmezY679nf23D/jPAdf6pDmLwP9/qX54M04YBcnJT2DE1czXcgTetqrR
 qR0zAeIKal/RVFnZXOUySsYImTjWOVkJ+tHMzhQe7CNH4PG0ibD/pgxGUQKDqcj0y7
 HFgOOIYe4xaISAuHOJ/zSvvr6ATrpYKSqnBRA83UnK73YWAufPtMfOXLbbzWkvtcPr
 U7yUvhx8Q2AAp5+bFMh7rPOp0vrkKDEwfUHRExvr681eSN7ZVRaoAMYZxdHlv1wEQ3
 rDZBC4axRjpCA==
Date: Thu, 31 Mar 2022 12:43:53 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: Move and check return value
 of platform_get_irq()
Message-ID: <20220331164353.unrxdeq756tj5et3@notapiano>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
 <20220331075817.7122-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331075817.7122-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_094359_490216_1865BD24 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, Mar 31, 2022 at 09:58:17AM +0200, AngeloGioacchino Del Regno wrote:
> Move the call to platform_get_irq() earlier in the probe function
> and check for its return value: if no interrupt is specified, it
> wouldn't make sense to try to call devm_request_irq() so, in that
> case, we can simply return early.
> =

> Moving the platform_get_irq() call also makes it possible to use
> one less goto, as clocks aren't required at that stage.
> =

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 852514366f1f..332cbcabc299 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2204,6 +2204,10 @@ static int pwrap_probe(struct platform_device *pde=
v)
>  	if (!wrp)
>  		return -ENOMEM;
>  =

> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
>  	platform_set_drvdata(pdev, wrp);
>  =

>  	wrp->master =3D of_device_get_match_data(&pdev->dev);
> @@ -2316,7 +2320,6 @@ static int pwrap_probe(struct platform_device *pdev)
>  	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_INT1_EN))
>  		pwrap_writel(wrp, wrp->master->int1_en_all, PWRAP_INT1_EN);
>  =

> -	irq =3D platform_get_irq(pdev, 0);
>  	ret =3D devm_request_irq(wrp->dev, irq, pwrap_interrupt,
>  			       IRQF_TRIGGER_HIGH,
>  			       "mt-pmic-pwrap", wrp);
> -- =

> 2.35.1
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
