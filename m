Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFE1C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:52:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B30217F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H217absP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kgS4d68Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B30217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0SsjGniVmXx+jfilDXmLjZt1F15vQ+vUlSjaN5fYYY=; b=H217absPIGzfP+
	VPT3D0W2F/yjeZGDmyBrIbMUWDRxtjuBg0dJ6G2ExIv8Co/lOf8HgZ001dMOtV3JgshsrQvQek8T8
	Yew9/M3LS++a5tSQaqdO8hjZ8rb0CgzquG5ocg/9WSS52EXC9/zJlPkL5lo1Kdp1ggOaAJ8/WjoHc
	4P1oKhDrVQbAWNQDj/I5n+2RyG1SSlzQ3IFRUGfm6kwzf7Kjm0osiGhInOAkOTZ8vWrAJXio7RdTK
	RNjvQZajYL1UvBhUttejKBBdFVtBQSRuFFI+KBth9Cankvt7Hs2yI7G+mFYWhhNkNvMMQacd5ckEW
	zasfQOs7gOwx/guqRuVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imtOr-0002NS-1g; Thu, 02 Jan 2020 05:52:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imtOj-0002Fl-GI; Thu, 02 Jan 2020 05:51:55 +0000
X-UUID: 6a6aa4f1d8c44d6581701820fd8ebcf4-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IG2tyrpeNx9yyPt33Qko2hevHTaK1+2NS/W2pIy+XKo=; 
 b=kgS4d68ZxSl6Lw6T7W8m1OVr2Fbb98usF2BWqyNydEvXkwTaJlewz1BdLxqDHh9azTt2+JYf8R4i5e/Y0eHobo0SovUWF9q5FyiV7xcOYyNWaECUtsH5EVXEnooFPT88hFx8sDxAAu7W3j6kk3ykRyzKBvAdPOTr+ZVVuvlmauY=;
X-UUID: 6a6aa4f1d8c44d6581701820fd8ebcf4-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1123633648; Wed, 01 Jan 2020 21:51:51 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 21:46:32 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 13:44:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:45:26 +0800
Message-ID: <1577943967.24650.12.camel@mtksdaap41>
Subject: Re: [PATCH v6, 14/14] drm/mediatek: add support for mediatek SOC
 MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 2 Jan 2020 13:46:07 +0800
In-Reply-To: <1577937624-14313-15-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28683DAAFC551684F3E1FC34F20358448C73EAFC4041B0F9EFC155F340F1E3992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_215153_555837_D2531668 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> This patch add support for mediatek SOC MT8183
> 1.ovl_2l share driver with ovl
> 2.rdma1 share drive with rdma0, but fifo size is different
> 3.add mt8183 mutex private data, and mmsys private data
> 4.add mt8183 main and external path module for crtc create
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 18 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 69 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h   |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 48 ++++++++++++++++++++++
>  5 files changed, 142 insertions(+)
> 

[snip]

> +
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> @@ -449,12 +477,22 @@ static void mtk_drm_unbind(struct device *dev)
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8173-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma1",

"mediatek,mt8183-disp-rdma1" does not exist in binding document.

Regards,
CK

> +	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-wdma",
>  	  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },
>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",
> @@ -463,22 +501,30 @@ static void mtk_drm_unbind(struct device *dev)
>  	  .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8183-disp-dither",
> +	  .data = (void *)MTK_DISP_DITHER },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",
>  	  .data = (void *)MTK_DISP_UFOE },
>  	{ .compatible = "mediatek,mt2701-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8183-dsi",
> +	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt2701-dpi",
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8183-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt2701-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2712-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
> @@ -672,6 +718,8 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>  	  .data = &mt2712_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8173-mmsys",
>  	  .data = &mt8173_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8183-mmsys",
> +	  .data = &mt8183_mmsys_driver_data},
>  	{ }
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
