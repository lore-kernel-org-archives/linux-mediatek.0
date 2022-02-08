Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA73CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 02:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwgE2VvYywqU9oAlvLGEgtC7f6r0iNo9lhfet0RyRio=; b=Lm+BNkTmEjtl1w
	SbDH8ZjeEG2Ccp3RhL9zUTxeYoprp6atB2wExqnMeJ1FgqbH/9Apy8HKKP41Imzy0wMWNlfsGDTjD
	LNIuy6gnPsv1Tzq1XEsIpKrIgjTEL4IvMatmGJxwUCSfEE7UhY6R/v08xSKsHuMfJOi7Z1wzfE6Rq
	O+dHG8CqaJtRF/BTpiOHSsGfNacYgE3BegTTWCN6t54XGjX2xYgY6yqIrRqj+faKK+GCoH/j1pOkP
	SktAHlG8R+MhoqKe6Q86iOlzAaGGG4Pp3dfubts3AKgwZ7IxG/jciNbxMoZzY0budbG0eImvjRmDU
	LI4Qb/QQQTrwBl4oMtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHGeA-00CKQ5-65; Tue, 08 Feb 2022 02:54:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHGe5-00CKPZ-Hu; Tue, 08 Feb 2022 02:54:24 +0000
X-UUID: 417b5eb747ef4b45af1347ad77b2e84f-20220207
X-UUID: 417b5eb747ef4b45af1347ad77b2e84f-20220207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 318248329; Mon, 07 Feb 2022 19:54:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 18:49:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 10:49:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Feb 2022 10:49:12 +0800
Message-ID: <dfdb1d9f0e8f65347a7cd33bcad67851b46ad14c.camel@mediatek.com>
Subject: Re: [PATCH v7 8/8] drm/mediatek: Add mt8195 eDP support
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 8 Feb 2022 10:49:12 +0800
In-Reply-To: <20211217150854.2081-9-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-9-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_185421_609861_29829E6A 
X-CRM114-Status: GOOD (  26.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Guillaume:

On Fri, 2021-12-17 at 16:08 +0100, Guillaume Ranquet wrote:
> This adds support of eDP panel to the mt8195 DP driver.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.

This patch looks good to me, but I've a question. Do you have both
display port platform and eDP platform? If you have only one of these,
why do you upstream the one which you never have?

Regards,
CK

> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 102 +++++++++++++++++++++-------
> --
>  1 file changed, 73 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 41e95a0bcaa2c..a256d55346a23 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -228,6 +228,11 @@ static struct regmap_config mtk_dp_regmap_config
> = {
>  	.name = "mtk-dp-registers",
>  };
>  
> +static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp->next_bridge;
> +}
> +
>  static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
>  {
>  	return container_of(b, struct mtk_dp, bridge);
> @@ -1185,26 +1190,49 @@ static int mtk_dp_get_calibration_data(struct
> mtk_dp *mtk_dp)
>  		return PTR_ERR(buf);
>  	}
>  
> -	cal_data->glb_bias_trim =
> -		check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f,
> 0xf);
> -	cal_data->clktx_impse =
> -		check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf,
> 0x8);
> -	cal_data->ln0_tx_impsel_pmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf,
> 0x8);
> -	cal_data->ln0_tx_impsel_nmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf,
> 0x8);
> -	cal_data->ln1_tx_impsel_pmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf,
> 0x8);
> -	cal_data->ln1_tx_impsel_nmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf,
> 0x8);
> -	cal_data->ln2_tx_impsel_pmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf,
> 0x8);
> -	cal_data->ln2_tx_impsel_nmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
> -	cal_data->ln3_tx_impsel_pmos =
> -		check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
> -	cal_data->ln3_tx_impsel_nmos =
> -		check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
> +	if (mtk_dp_is_edp(mtk_dp)) {
> +		cal_data->glb_bias_trim =
> +			check_cal_data_valid(1, 0x1e, (buf[3] >> 27) &
> 0x1f, 0xf);
> +		cal_data->clktx_impse =
> +			check_cal_data_valid(1, 0xe, (buf[0] >> 9) &
> 0xf, 0x8);
> +		cal_data->ln0_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 28) &
> 0xf, 0x8);
> +		cal_data->ln0_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 24) &
> 0xf, 0x8);
> +		cal_data->ln1_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 20) &
> 0xf, 0x8);
> +		cal_data->ln1_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 16) &
> 0xf, 0x8);
> +		cal_data->ln2_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 12) &
> 0xf, 0x8);
> +		cal_data->ln2_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 8) &
> 0xf, 0x8);
> +		cal_data->ln3_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[2] >> 4) &
> 0xf, 0x8);
> +		cal_data->ln3_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, buf[2] & 0xf,
> 0x8);
> +	} else {
> +		cal_data->glb_bias_trim =
> +			check_cal_data_valid(1, 0x1e, (buf[0] >> 27) &
> 0x1f, 0xf);
> +		cal_data->clktx_impse =
> +			check_cal_data_valid(1, 0xe, (buf[0] >> 13) &
> 0xf, 0x8);
> +		cal_data->ln0_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 28) &
> 0xf, 0x8);
> +		cal_data->ln0_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 24) &
> 0xf, 0x8);
> +		cal_data->ln1_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 20) &
> 0xf, 0x8);
> +		cal_data->ln1_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 16) &
> 0xf, 0x8);
> +		cal_data->ln2_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 12) &
> 0xf, 0x8);
> +		cal_data->ln2_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 8) &
> 0xf, 0x8);
> +		cal_data->ln3_tx_impsel_pmos =
> +			check_cal_data_valid(1, 0xe, (buf[1] >> 4) &
> 0xf, 0x8);
> +		cal_data->ln3_tx_impsel_nmos =
> +			check_cal_data_valid(1, 0xe, buf[1] & 0xf,
> 0x8);
> +	}
>  
>  	kfree(buf);
>  
> @@ -1322,7 +1350,11 @@ static void mtk_dp_video_mute(struct mtk_dp
> *mtk_dp, bool enable)
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
>  			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
>  			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
> -	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
> +
> +	if (mtk_dp_is_edp(mtk_dp))
> +		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> enable);
> +	else
> +		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> enable);
>  }
>  
>  static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
> @@ -2326,6 +2358,9 @@ static enum drm_connector_status
> mtk_dp_bdg_detect(struct drm_bridge *bridge)
>  	enum drm_connector_status ret = connector_status_disconnected;
>  	u8 sink_count = 0;
>  
> +	if (mtk_dp_is_edp(mtk_dp))
> +		return connector_status_connected;
> +
>  	if (mtk_dp_plug_state(mtk_dp)) {
>  		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT,
> &sink_count);
>  		if (DP_GET_SINK_COUNT(sink_count))
> @@ -2888,7 +2923,11 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  	}
>  
>  	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 
> 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge)) {
> +	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) 
> == -ENODEV) {
> +		dev_info(dev,
> +			 "No panel connected in devicetree, continuing
> as external DP\n");
> +		mtk_dp->next_bridge = NULL;
> +	} else if (IS_ERR(mtk_dp->next_bridge)) {
>  		ret = PTR_ERR(mtk_dp->next_bridge);
>  		dev_err_probe(dev, ret, "Failed to get bridge\n");
>  		return ret;
> @@ -2915,12 +2954,14 @@ static int mtk_dp_probe(struct
> platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, mtk_dp);
>  
> -	mutex_init(&mtk_dp->update_plugged_status_lock);
> -	ret = mtk_dp_register_audio_driver(dev);
> -	if (ret) {
> -		dev_err(dev, "Failed to register audio driver: %d\n",
> -			ret);
> -		return ret;
> +	if (!mtk_dp_is_edp(mtk_dp)) {
> +		mutex_init(&mtk_dp->update_plugged_status_lock);
> +		ret = mtk_dp_register_audio_driver(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to register audio driver:
> %d\n",
> +				ret);
> +			return ret;
> +		}
>  	}
>  
>  	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-
> dp-phy",
> @@ -2944,7 +2985,10 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  
>  	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
>  	mtk_dp->bridge.of_node = dev->of_node;
> -	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +	if (mtk_dp_is_edp(mtk_dp))
> +		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	else
> +		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
>  	mtk_dp->bridge.ops =
>  		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> DRM_BRIDGE_OP_HPD;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
