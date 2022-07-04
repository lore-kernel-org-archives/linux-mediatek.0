Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB68CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k/Q2GSvqRdOgXY0xA1Gm6TVjAPFSKuEU+w56edwX3E=; b=iWCpNB22IqitJSurmjChLs5zPw
	LhWyo9tDIA9pvk74mbaXQtCLyru0QJZXuIMwZIFZcTpQmaG8dvbYtt/L3evXmWsNiXVf1xTGr9D6I
	ghtY4b49astavFrE8g/XaSchLtO8YJpNYZv79J4ZDNrpFBmv548KoOVS+PAnjTeLnZviVpMvaZUpk
	bvT7vcbo9WRn1B1eSNxKO1gWnHSxRuR8cVytXT9y1ZDLDrCp3X653z2zQM3r45dOjMWI7xy56zabE
	3pIsnXBgJmZDXmV+8iNn2LhY/WrIAV1L10LD3velcmvu7C9BtnMT5VGWOOQjpYchgkotrKMv4W8Ni
	Y7MClkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Jan-007Bmc-Vl; Mon, 04 Jul 2022 10:46:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J8f-006s9y-Aw; Mon, 04 Jul 2022 10:17:10 +0000
X-UUID: 181c193be1184b2e8eac05913a75f74a-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6c7e1c49-d7a0-4a0e-84ad-d82499842c8e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:b6398ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 181c193be1184b2e8eac05913a75f74a-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1383287317; Mon, 04 Jul 2022 03:17:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 17:16:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 4 Jul 2022 17:16:27 +0800
Message-ID: <870cac7815d0f2ec9cfe4a18b19c141723fcd178.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: ensure bridge disable happends before
 suspend
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: David Airlie <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Mon, 4 Jul 2022 17:16:27 +0800
In-Reply-To: <20220629190545.478113-1-hsinyi@chromium.org>
References: <20220629190545.478113-1-hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031709_435848_2A9E791C 
X-CRM114-Status: GOOD (  21.39  )
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

Hi, Hsin-yi:

On Thu, 2022-06-30 at 03:05 +0800, Hsin-Yi Wang wrote:
> Make sure bridge_disable will be called before suspend by calling
> drm_mode_config_helper_suspend() in .prepare callback.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The issue is found if suspend is called via VT2 in several MTK SoC
> (eg.
> MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
> bridge disable is called through mtk-drm's suspend, and it needs to
> be
> called before bridge pm runtime suspend.
> So we move the hook to .prepare() and .complete().
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 13a1bbe7ead7f..a42812e490007 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -828,8 +828,7 @@ static int mtk_drm_remove(struct platform_device
> *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int mtk_drm_sys_suspend(struct device *dev)
> +static int mtk_drm_sys_prepare(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>  	struct drm_device *drm = private->drm;
> @@ -840,20 +839,21 @@ static int mtk_drm_sys_suspend(struct device
> *dev)
>  	return ret;
>  }
>  
> -static int mtk_drm_sys_resume(struct device *dev)
> +static void mtk_drm_sys_complete(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>  	struct drm_device *drm = private->drm;
>  	int ret;
>  
>  	ret = drm_mode_config_helper_resume(drm);
> -
> -	return ret;
> +	if (ret)
> +		dev_err(dev, "Failed to resume\n");
>  }
> -#endif
>  
> -static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> -			 mtk_drm_sys_resume);
> +static const struct dev_pm_ops mtk_drm_pm_ops = {
> +	.prepare = mtk_drm_sys_prepare,
> +	.complete = mtk_drm_sys_complete,
> +};
>  
>  static struct platform_driver mtk_drm_platform_driver = {
>  	.probe	= mtk_drm_probe,


