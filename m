Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53ADC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:16:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A64207C4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HY3HKziS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A64207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jTXGsLTXq0VEBLTVmSDWPgxBODDcPVZbecbFeNEewdA=; b=HY3HKziSpHMttLmFsHlH6WQMV
	ikklXauBS0H/f1NjRBIbwXxizi/taN69E9iDDzKo2J+rk2M5csgyGB+8FXLpxmdxNdJVZcffkrAnh
	2X0HXm6dTtNS7Edrg2xEI8BiblEivj0FBgjHPX8My4NUDnj+joDQbX9t/8lTKIppCpO/KbYc1fknj
	sca9hdb/bOpdpf1bGQ1Y1Qp4cq6tYEIB5LxWjY315Sv5uKV3oCvpfZKmbvx/Ae/Msr+BC8eCTqYqo
	xgW6wNZNdOhtROmcoe/wXaY0LtnFdgcbvHVBlNHiqw3tmbUQx4oucSHSVBPvi+fGW6GLFHVg6kmZY
	te24kqAyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtBnp-0003wA-42; Wed, 08 Jul 2020 15:16:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtBnk-0003uw-5W; Wed, 08 Jul 2020 15:16:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 301EE2A1B15
Subject: Re: [RESEND PATCH 2/3] drm/mediatek: mtk_dpi: Convert to bridge driver
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-3-enric.balletbo@collabora.com>
 <20200701135153.475db3a5@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <fcdc74a6-2ff9-34c6-6b07-ee7e55d6bc8d@collabora.com>
Date: Wed, 8 Jul 2020 17:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701135153.475db3a5@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_111600_398427_7901158E 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Boris,

Thank you for review the patch.

On 1/7/20 13:51, Boris Brezillon wrote:
> On Mon, 18 May 2020 19:39:08 +0200
> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
> 
>> Convert mtk_dpi to a bridge driver with built-in encoder support for
>> compatibility with existing component drivers.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> ---
>>
>>  drivers/gpu/drm/mediatek/mtk_dpi.c | 66 +++++++++++++++---------------
>>  1 file changed, 34 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 7112125dc3d1..baad198c69eb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -61,6 +61,7 @@ enum mtk_dpi_out_color_format {
>>  struct mtk_dpi {
>>  	struct mtk_ddp_comp ddp_comp;
>>  	struct drm_encoder encoder;
>> +	struct drm_bridge bridge;
>>  	struct drm_bridge *next_bridge;
>>  	void __iomem *regs;
>>  	struct device *dev;
>> @@ -77,9 +78,9 @@ struct mtk_dpi {
>>  	int refcount;
>>  };
>>  
>> -static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
>> +static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
>>  {
>> -	return container_of(e, struct mtk_dpi, encoder);
>> +	return container_of(b, struct mtk_dpi, bridge);
>>  }
>>  
>>  enum mtk_dpi_polarity {
>> @@ -518,50 +519,44 @@ static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
>>  	.destroy = mtk_dpi_encoder_destroy,
>>  };
>>  
>> -static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
>> -				       const struct drm_display_mode *mode,
>> -				       struct drm_display_mode *adjusted_mode)
>> +static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>> +				 enum drm_bridge_attach_flags flags)
>>  {
>> -	return true;
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>> +
>> +	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
>> +				 &dpi->bridge, flags);
>>  }
>>  
>> -static void mtk_dpi_encoder_mode_set(struct drm_encoder *encoder,
>> -				     struct drm_display_mode *mode,
>> -				     struct drm_display_mode *adjusted_mode)
>> +static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	drm_mode_copy(&dpi->mode, adjusted_mode);
>>  }
>>  
>> -static void mtk_dpi_encoder_disable(struct drm_encoder *encoder)
>> +static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	mtk_dpi_power_off(dpi);
>>  }
>>  
>> -static void mtk_dpi_encoder_enable(struct drm_encoder *encoder)
>> +static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	mtk_dpi_power_on(dpi);
>>  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
>>  }
>>  
>> -static int mtk_dpi_atomic_check(struct drm_encoder *encoder,
>> -				struct drm_crtc_state *crtc_state,
>> -				struct drm_connector_state *conn_state)
>> -{
>> -	return 0;
>> -}
>> -
>> -static const struct drm_encoder_helper_funcs mtk_dpi_encoder_helper_funcs = {
>> -	.mode_fixup = mtk_dpi_encoder_mode_fixup,
>> -	.mode_set = mtk_dpi_encoder_mode_set,
>> -	.disable = mtk_dpi_encoder_disable,
>> -	.enable = mtk_dpi_encoder_enable,
>> -	.atomic_check = mtk_dpi_atomic_check,
>> +static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>> +	.attach = mtk_dpi_bridge_attach,
>> +	.mode_set = mtk_dpi_bridge_mode_set,
>> +	.disable = mtk_dpi_bridge_disable,
>> +	.enable = mtk_dpi_bridge_enable,
>>  };
>>  
>>  static void mtk_dpi_start(struct mtk_ddp_comp *comp)
>> @@ -602,16 +597,13 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>>  		goto err_unregister;
>>  	}
>> -	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
>>  
>>  	/* Currently DPI0 is fixed to be driven by OVL1 */
>>  	dpi->encoder.possible_crtcs = BIT(1);
>>  
>> -	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
>> -	if (ret) {
>> -		dev_err(dev, "Failed to attach bridge: %d\n", ret);
> 
> Any reason your decided to drop this error message? If there's one,
> this should probably happen in a separate patch.
> 

Right, I'll maintain the error in next version.

>> +	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
>> +	if (ret)
>>  		goto err_cleanup;
>> -	}
>>  
>>  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>>  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>> @@ -768,8 +760,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>  
>>  	platform_set_drvdata(pdev, dpi);
>>  
>> +	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
>> +	dpi->bridge.of_node = dev->of_node;
>> +	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
>> +
>> +	drm_bridge_add(&dpi->bridge);
> 
> I wonder if it's really useful to add the bridge when it's private (you
> don't want this bridge to be added to external bridge chains).
> 
>> +
>>  	ret = component_add(dev, &mtk_dpi_component_ops);
>>  	if (ret) {
>> +		drm_bridge_remove(&dpi->bridge);
>>  		dev_err(dev, "Failed to add component: %d\n", ret);
>>  		return ret;
>>  	}
>> @@ -779,7 +778,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>  
>>  static int mtk_dpi_remove(struct platform_device *pdev)
>>  {
>> +	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
>> +
>>  	component_del(&pdev->dev, &mtk_dpi_component_ops);
>> +	drm_bridge_remove(&dpi->bridge);
>>  
>>  	return 0;
>>  }
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
