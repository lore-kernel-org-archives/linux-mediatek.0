Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F95C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM8ESSfiaZaqIiOI66AUWYeHVk5Mw0k42QgsaovTBTk=; b=N7I9aZJKhS6lfS
	Bd6484ZyVIJdzLEBxu3REkU9KLPVqyTCaftQSvCa3yABmx8xvkKu927yBciqUuESfOO6ZIW3aV4xo
	MJipeC5nrbPdPCfkHbVI4EKG/xe8G8p12ugthvxKRY6TTmlP2H6tsLIFWvsbDK7ZLuhdgYKkZRH8e
	mjyG3cz1VJILxE5koD9fA6gbEqP6J2Zdoby+6UXLeN/W6QKDvHvn9py7T21v34xvARCwpVIi10IeW
	RRGidYA7yhfIrl+GWOHhNMQcideiQIEz4H9e7fwi/gky3E3Nq+s9i3Ly6qBHl0V7Dcm7MuwQNPEmx
	OGjnoGSJmoJLJ7KeFQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxtc-00306R-2L; Thu, 31 Mar 2022 16:43:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxtN-002zzu-TQ; Thu, 31 Mar 2022 16:43:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 4C2071F46FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648745002;
 bh=uT5NxOT2hxMExd4I67KSu5UmcCZGrR+I7Ap+qLmu2RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h4bVwDXdFftGkDwqukTvYLRUYMaTK0O9R7+SVp/Ajv6ZmQOdgk16pWGvTL8SN5BRT
 fY5at0sb/yVDCFC48w73x/4JM2RZt0svkWbLsE1Xw+6IDhTZL9hjy5yT1HTNi7GCK6
 LC/QFMo2MN/JXtJw2AvWr13rWQ2wM9WM3pLIR39zemHtbaUCl1s9LENeKi9UOZ8/Jf
 uE8N1MkpeMOnetnQDna6FTwH1lcwVH1kXlzKXoxRpdMwSwwA14uDEtC+LfxDV/4n+z
 0K40m3E0JTVigD7X/2KWyj9cS96GGcgjgShr6nZF5GIIEH6iqmjCi2rTI+2RMG5ENn
 uWGKVlnceG+yw==
Date: Thu, 31 Mar 2022 12:43:18 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: pwrap: Switch to
 devm_platform_ioremap_resource_byname()
Message-ID: <20220331164318.5o53hxave6yrvkex@notapiano>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
 <20220331075817.7122-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331075817.7122-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_094326_103743_FBB89CBB 
X-CRM114-Status: GOOD (  16.01  )
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

On Thu, Mar 31, 2022 at 09:58:16AM +0200, AngeloGioacchino Del Regno wrote:
> In order to simplify ioremapping resources, instead of calling
> platform_get_resource_byname() and then devm_ioremap_resource(),
> simply call devm_platform_ioremap_resource_byname().
> =

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 54a5300ab72b..852514366f1f 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2191,7 +2191,6 @@ static int pwrap_probe(struct platform_device *pdev)
>  	struct pmic_wrapper *wrp;
>  	struct device_node *np =3D pdev->dev.of_node;
>  	const struct of_device_id *of_slave_id =3D NULL;
> -	struct resource *res;
>  =

>  	if (np->child)
>  		of_slave_id =3D of_match_node(of_slave_match_tbl, np->child);
> @@ -2211,8 +2210,7 @@ static int pwrap_probe(struct platform_device *pdev)
>  	wrp->slave =3D of_slave_id->data;
>  	wrp->dev =3D &pdev->dev;
>  =

> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrap");
> -	wrp->base =3D devm_ioremap_resource(wrp->dev, res);
> +	wrp->base =3D devm_platform_ioremap_resource_byname(pdev, "pwrap");
>  	if (IS_ERR(wrp->base))
>  		return PTR_ERR(wrp->base);
>  =

> @@ -2226,9 +2224,7 @@ static int pwrap_probe(struct platform_device *pdev)
>  	}
>  =

>  	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_BRIDGE)) {
> -		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -				"pwrap-bridge");
> -		wrp->bridge_base =3D devm_ioremap_resource(wrp->dev, res);
> +		wrp->bridge_base =3D devm_platform_ioremap_resource_byname(pdev, "pwra=
p-bridge");
>  		if (IS_ERR(wrp->bridge_base))
>  			return PTR_ERR(wrp->bridge_base);
>  =

> -- =

> 2.35.1
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
