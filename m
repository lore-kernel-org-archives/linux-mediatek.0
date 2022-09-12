Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD2ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 02:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zb5g2Dtwnd0niNSHQptrhlXfvWjRZvKzA/ifzCVC/w=; b=xKFa/hbpbrxz4F+f3vaqT65qFj
	DpeSLYA1wW4rwnZLmqmxqU7X34zKkTUGMHix4mIsFayB58KRKnY1CBQw5ihyWMhhgAcfAWR0U8/Zt
	wlRR0khwpU0dsItp+yZl2VxrxR/l6HBkUukh8t/iR/tMcBRCjVGDsC4uLbZlKJ7v3UbA3mWyqCYID
	1q0yW4v0C5r7u9pmhISd5fh7ffEpk1n0B1hpg0KVgNtc70xQ8BEiX7GuPTVOFchcCaECMgoKIseSd
	Xv3292bX1kNOcA2QGNkqJJRva2awpXNE8POGhKBLJr8e36jHF4z0GJ1XejnS/1YqIxQ2sIN9Mh5II
	Le0+r6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXZfb-006TnT-75; Mon, 12 Sep 2022 02:59:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXZfQ-006Tjl-2d; Mon, 12 Sep 2022 02:59:25 +0000
X-UUID: 3ee6114c8a0047d782b9849c27441522-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8zb5g2Dtwnd0niNSHQptrhlXfvWjRZvKzA/ifzCVC/w=;
	b=LQvSjRyXD2QgCiYSEL+UP/DLBS46F9zSqVe6/nBCq1Os7WSMEuIJ94Fbn7qNygtQEW9dCS2lA16QJRwZ/v9PI3TK6pGJmcgS/hRrq262TZFRANeCZY4vYxPYrNtARy6izDheKv6RnIvstzdCUDBHVnFOqqu4wUuMEF8nRk4YhGg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4f1aa21c-d475-4eff-a3e0-ea3e307bbcb1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:015b09f6-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3ee6114c8a0047d782b9849c27441522-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 935207560; Sun, 11 Sep 2022 19:59:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 12 Sep 2022 10:48:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:48:44 +0800
Message-ID: <44d19c4ea29bdbf3a07890ed25fd637f8805b6c6.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 3/9] drm/mediatek: Adjust
 mtk_drm_gamma_set_common parameters
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH.Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Sep 2022 10:48:44 +0800
In-Reply-To: <20220912013006.27541-4-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_195924_141738_824E8C4B 
X-CRM114-Status: GOOD (  20.70  )
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

Hi, Jason:

On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> Adjust the parameters in mtk_drm_gamma_set_common()
>   - add (struct device *dev) to get lut_diff from gamma's driver data
>   - remove (bool lut_diff) and use false as default value in the
> function
> 
> Fixes: 051524cbe62d ("FROMGIT: drm/mediatek: Add lut diff flag for
> new gamma hardware support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 +++++++------
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 0f9d7efb61d7..6517e0a5a7d8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct
> drm_crtc_state *state)
>  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
>  
>  	if (aal->data && aal->data->has_gamma)
> -		mtk_gamma_set_common(aal->regs, state, false);
> +		mtk_gamma_set_common(NULL, aal->regs, state);
>  }
>  
>  void mtk_aal_start(struct device *dev)
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 33e61a136bbc..a83e5fbc8724 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -52,7 +52,7 @@ void mtk_gamma_config(struct device *dev, unsigned
> int w,
>  		      unsigned int h, unsigned int vrefresh,
>  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> *state);
> -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state
> *state, bool lut_diff);
> +void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> struct drm_crtc_state *state);

This function is called by both aal and gamma driver, so I would like
to pass struct device dev because priv data of aal and gamma are
different. Make this function command for both aal and gamma driver.

Regards,
CK

>  void mtk_gamma_start(struct device *dev);
>  void mtk_gamma_stop(struct device *dev);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index bbd558a036ec..f54a6a618348 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -54,14 +54,19 @@ void mtk_gamma_clk_disable(struct device *dev)
>  	clk_disable_unprepare(gamma->clk);
>  }
>  
> -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state
> *state, bool lut_diff)
> +void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> struct drm_crtc_state *state)
>  {
> +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> +	bool lut_diff = false;
>  	unsigned int i, reg;
>  	struct drm_color_lut *lut;
>  	void __iomem *lut_base;
>  	u32 word;
>  	u32 diff[3] = {0};
>  
> +	if (gamma && gamma->data)
> +		lut_diff = gamma->data->lut_diff;
> +
>  	if (state->gamma_lut) {
>  		reg = readl(regs + DISP_GAMMA_CFG);
>  		reg = reg | GAMMA_LUT_EN;
> @@ -91,12 +96,8 @@ void mtk_gamma_set_common(void __iomem *regs,
> struct drm_crtc_state *state, bool
>  void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>  {
>  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> -	bool lut_diff = false;
> -
> -	if (gamma->data)
> -		lut_diff = gamma->data->lut_diff;
>  
> -	mtk_gamma_set_common(gamma->regs, state, lut_diff);
> +	mtk_gamma_set_common(dev, gamma->regs, state);
>  }
>  
>  void mtk_gamma_config(struct device *dev, unsigned int w,


