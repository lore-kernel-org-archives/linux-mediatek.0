Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8290C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:22:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7433B64E09
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7433B64E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HKUVRiL85DeqjVMdacHgzqgc6kEYvg+rdixlruoG5IM=; b=Z+uV9w8j+WMBSkGS5SASlT6SZ
	uLtrf9Nshb9UtxFBh+NM0QZCE7W1ScUWV5Z2JZzvkHdhbit/kxH/kFrdC9/ou4IiINONHfUXm8qBq
	lhXdeZtsYp39G9UvKsR2FrGCzKks8OicsdBkefJ3iMIlO6xlStpxybuR6flZ6flyEZvGGX4V4dCA5
	DEBWzgVJAEyWpuSVeAQ/Da6jO4P+2wFs78o3jeaAaNLcJwXQZb0DgJPMhNvQ+JbPI5J2KZ4IUz797
	VJ7M/EX6HbzMX3V0pLgK4Wnrc4zbHveM1lvk1zVx8lKKXQWcccL1Vey/ZAAD5OdTRZx1JiOD9Lsfj
	7/frqqaUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5P2V-0003UW-Nm; Fri, 29 Jan 2021 08:21:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5P2R-0003QU-Lo; Fri, 29 Jan 2021 08:21:57 +0000
X-UUID: 0705c3a220bc4d5b8a769f5d13b88b79-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CLobLn6bICgFMKKKwjHAF6jHqoEhPtYplivFdZU9Cuo=; 
 b=tUz0C18Qqo50VIU3GouO3nXqmzL1YNxF6nXELK2PH4mPlCN+KEfE2n1tNafUERoKy/W3RJcsCJt+VVDJ1eaFwfUb3NOGzRgjgBKDMUppBLWZ4Tye6oBGTcJc+VRvVzhNJ2iXErSBFpVIeWy0neiHoKreIPWamlGAjF67Iff2Nkg=;
X-UUID: 0705c3a220bc4d5b8a769f5d13b88b79-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 5313051; Fri, 29 Jan 2021 00:21:49 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 00:21:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:21:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:21:40 +0800
Message-ID: <1611908500.31184.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:21:40 +0800
In-Reply-To: <20210129073436.2429834-5-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B9506A6240F53003C89395367A3003479BD04D05EB24A63E0EEDC54AE4EC96B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_032155_909622_32EB90E4 
X-CRM114-Status: GOOD (  18.09  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> enable OVL_LAYER_SMI_ID_EN for multi-layer usecase, without this patch,
> ovl will hang up when more than 1 layer enabled.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index da7e38a28759b..961f87f8d4d15 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -24,6 +24,7 @@
>  #define DISP_REG_OVL_RST			0x0014
>  #define DISP_REG_OVL_ROI_SIZE			0x0020
>  #define DISP_REG_OVL_DATAPATH_CON		0x0024
> +#define OVL_LAYER_SMI_ID_EN				BIT(0)
>  #define OVL_BGCLR_SEL_IN				BIT(2)
>  #define DISP_REG_OVL_ROI_BGCLR			0x0028
>  #define DISP_REG_OVL_SRC_CON			0x002c
> @@ -62,6 +63,7 @@ struct mtk_disp_ovl_data {
>  	unsigned int gmc_bits;
>  	unsigned int layer_nr;
>  	bool fmt_rgb565_is_0;
> +	bool smi_id_en;
>  };
>  
>  /**
> @@ -134,6 +136,13 @@ void mtk_ovl_start(struct device *dev)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
> +	if (ovl->data->smi_id_en) {
> +		unsigned int reg;
> +
> +		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +		reg = reg | OVL_LAYER_SMI_ID_EN;
> +		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +	}
>  	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
>  }
>  
> @@ -142,6 +151,14 @@ void mtk_ovl_stop(struct device *dev)
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
> +	if (ovl->data->smi_id_en) {
> +		unsigned int reg;
> +
> +		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +		reg = reg & ~OVL_LAYER_SMI_ID_EN;
> +		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +	}
> +
>  }
>  
>  void mtk_ovl_config(struct device *dev, unsigned int w,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
