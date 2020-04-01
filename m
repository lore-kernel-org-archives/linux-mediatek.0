Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC64BC2D0F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF58F2071A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MnLkaCFC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jySO1Vft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF58F2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNGmZVEi5tBwBwwp9mCH0O+zbcx/3Caxn6xBaN9v9v4=; b=MnLkaCFCuxIXO5
	vqhsRRmOWM79i89Ea8jurj/4hCRerg+WtkhoyIkmlyp4zakRJlttrNvwLCp6eh/0KGaviKkCA+HM2
	UxNeBbVl6IFlxCgBmdL7n4dLQDY98FAdlesPsyMDmbkbXmdt+AFFh4OPSKK6LZOcvoStXzGkbv6of
	g3UP9M6cmRhH1khyhtoBUILKwDFWfZ0pvzU127pTLQ6F3jCOoE2ju0oQCnt5MvWQ4l5l9yA+jGIQ4
	JmWX+XlU+vdMz+J/MKLWS7v5p7DI3WSum5aYqn1F9vh6DzDLT6uDR8eGSMKH4CGuYSRdO8Oq6cgbJ
	h0rhvj0BknorFthY2PrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJT4y-0001LI-Aw; Wed, 01 Apr 2020 02:26:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJT4v-0001JX-ET
 for linux-mediatek@lists.infradead.org; Wed, 01 Apr 2020 02:26:07 +0000
X-UUID: 1f8990530e5843c099831ca7edcf62c9-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AVMXu0r+6z6IDu7t/jy3++IgcoN/EedNyjzmILOaaOM=; 
 b=jySO1VftyI+JCu8nT4nnSfsW2nEJaszEKy8KiKELtSvTD3NbnH5XWKNBmJKAG0zdwAYECn/kMruS+BtYbBWPZx+usJpVeC2Z8JJ4UktjDMvRzaR3C7ZFSdRjHVkqJsXMlIA6P7bO+3jucbnhuRMibqphX7GQJDdcFl5golmY8YA=;
X-UUID: 1f8990530e5843c099831ca7edcf62c9-20200331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 136803057; Tue, 31 Mar 2020 18:25:58 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 19:15:58 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 10:15:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 10:15:54 +0800
Message-ID: <1585707361.28859.19.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy
 to mtk_hdmi driver
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 10:16:01 +0800
In-Reply-To: <20200331155728.18032-2-chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-2-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_192605_498114_BE4A3B52 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> tz_disabled is used to control mtk_hdmi output signal, but this variable
> is stored in mtk_hdmi_phy and mtk_hdmi_phy does not use it. So move
> tz_disabled to mtk_hdmi where it's used.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           | 22 ++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |  1 -
>  .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |  1 -
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 5e4a4dbda443..878433c09c9b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -144,11 +144,16 @@ struct hdmi_audio_param {
>  	struct hdmi_codec_params codec_params;
>  };
>  
> +struct mtk_hdmi_conf {
> +	bool tz_disabled;
> +};
> +
>  struct mtk_hdmi {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
>  	struct drm_connector conn;
>  	struct device *dev;
> +	const struct mtk_hdmi_conf *conf;
>  	struct phy *phy;
>  	struct device *cec_dev;
>  	struct i2c_adapter *ddc_adpt;
> @@ -230,7 +235,6 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>  static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>  {
>  	struct arm_smccc_res res;
> -	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(hdmi->phy);
>  
>  	/*
>  	 * MT8173 HDMI hardware has an output control bit to enable/disable HDMI
> @@ -238,7 +242,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>  	 * The ARM trusted firmware provides an API for the HDMI driver to set
>  	 * this control bit to enable HDMI output in supervisor mode.
>  	 */
> -	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
> +	if (hdmi->conf->tz_disabled)
>  		regmap_update_bits(hdmi->sys_regmap,
>  				   hdmi->sys_offset + HDMI_SYS_CFG20,
>  				   0x80008005, enable ? 0x80000005 : 0x8000);
> @@ -1688,6 +1692,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	hdmi->dev = dev;
> +	hdmi->conf = of_device_get_match_data(dev);
>  
>  	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
>  	if (ret)
> @@ -1765,8 +1770,19 @@ static int mtk_hdmi_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
>  			 mtk_hdmi_suspend, mtk_hdmi_resume);
>  
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
> +	.tz_disabled = true,
> +};
> +
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173;
> +
>  static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
> -	{ .compatible = "mediatek,mt8173-hdmi", },
> +	{ .compatible = "mediatek,mt2701-hdmi",
> +	  .data = &mtk_hdmi_conf_mt2701,
> +	},
> +	{ .compatible = "mediatek,mt8173-hdmi",
> +	  .data = &mtk_hdmi_conf_mt8173,
> +	},
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> index 2d8b3182470d..fc1c2efd1128 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> @@ -20,7 +20,6 @@
>  struct mtk_hdmi_phy;
>  
>  struct mtk_hdmi_phy_conf {
> -	bool tz_disabled;
>  	unsigned long flags;
>  	const struct clk_ops *hdmi_phy_clk_ops;
>  	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index d3cc4022e988..99fe05cd3598 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -237,7 +237,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
>  }
>  
>  struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
> -	.tz_disabled = true,
>  	.flags = CLK_SET_RATE_GATE,
>  	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
>  	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
