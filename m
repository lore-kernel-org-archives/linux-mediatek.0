Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6352BC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0bRkAcVbfhHNQUTFIPt2rtxEdWKqqC3CxwvxM15R2I=; b=2qEyGq1XcQJZMYhPbfotpSb3rB
	0i7nz9OumDwtl9rw9mB/IdU/6klTBTm3S4cVLvFharRlPW/sT0XuHzHCEe7h2gwfQ7n+b1obDQlz3
	JroHCegA2WHi7FcU2W4qfaBaJN5JgH6EQVqz4YsPLERB8VydPyBCAMvMKQ/i2+A0Fuy3A1oc8TAve
	DBBq2dbtiCkJZs8t+XW6gUMhoKviTuktTPPqpeClSIVVCxkLnBlAwMvgna/PbGbXFPa2X8zS+QrYB
	gcPl4j9mWGfsony6i1lpQoJvVPIQNgzwIDLeftn4B9hVcmg04Qokh9OstT+lRukTCdvZ3t5rp0Phj
	C0qwbWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVou-0000000EHUx-17PP;
	Tue, 18 Jun 2024 10:12:08 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVoq-0000000EHT7-2mvk;
	Tue, 18 Jun 2024 10:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718705522;
	bh=O/EAoVUt9eXyteTRE0f7erLyiFd8Rhykm2y2gRwb5u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BhaMCSSqT8lXNt9j+6vAyZlMWxv07bF70aWz4VUIyxiHK+ylW6jb5in6r1FmCNAKe
	 RW4ywTEjt8Hh1YeKsdAAW42o1x4rtyrC03NzEdRiiKF4//Y+ungSvlS2ftsus+ujV8
	 d3v1z4dgBVBjnE/K/DGwvizQrvimxhqYPVUbG4oOk8lJdLlG2rg6Fo4REI+9COJMBZ
	 y0c3N0i6QFkOUs2Umg6e1mwhXf5Y+U8YzLSwQi/Of+VZmeC88QL78FemYYDlZUVVcA
	 C7ws4NtTG0Zxz1Bng7v4dE1gwMUMZNK7BrxP8XlB2L1dBJCdcH5hQDGINOAbWSlj3q
	 u5u1f248X5q2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 56A4E37811D1;
	Tue, 18 Jun 2024 10:12:01 +0000 (UTC)
Message-ID: <5f4adbb9-d6ae-4dfd-80e0-4d2680a92f59@collabora.com>
Date: Tue, 18 Jun 2024 12:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: Michael Walle <michael@walle.cc>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com, sui.jinfeng@linux.dev,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20240612065634.26569-1-angelogioacchino.delregno@collabora.com>
 <20240612065634.26569-4-angelogioacchino.delregno@collabora.com>
 <D22BQAOFJWVJ.2Y9FKAAR57BHK@walle.cc>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D22BQAOFJWVJ.2Y9FKAAR57BHK@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_031205_043589_D754271B 
X-CRM114-Status: GOOD (  27.32  )
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

Il 17/06/24 15:24, Michael Walle ha scritto:
> Hi Angelo,
> 
>> +/**
>> + * mtk_drm_of_ddp_path_build_one - Build a Display HW Pipeline for a CRTC Path
>> + * @dev:          The mediatek-drm device
>> + * @cpath:        CRTC Path relative to a VDO or MMSYS
>> + * @out_path:     Pointer to an array that will contain the new pipeline
>> + * @out_path_len: Number of entries in the pipeline array
>> + *
>> + * MediaTek SoCs can use different DDP hardware pipelines (or paths) depending
>> + * on the board-specific desired display configuration; this function walks
>> + * through all of the output endpoints starting from a VDO or MMSYS hardware
>> + * instance and builds the right pipeline as specified in device trees.
>> + *
>> + * Return:
>> + * * %0       - Display HW Pipeline successfully built and validated
>> + * * %-ENOENT - Display pipeline was not specified in device tree
>> + * * %-EINVAL - Display pipeline built but validation failed
>> + * * %-ENOMEM - Failure to allocate pipeline array to pass to the caller
>> + */
>> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path cpath,
>> +					 const unsigned int **out_path,
>> +					 unsigned int *out_path_len)
>> +{
>> +	struct device_node *next, *prev, *vdo = dev->parent->of_node;
>> +	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
>> +	unsigned int *final_ddp_path;
>> +	unsigned short int idx = 0;
>> +	bool ovl_adaptor_comp_added = false;
>> +	int ret;
>> +
>> +	/* Get the first entry for the temp_path array */
>> +	ret = mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]);
>> +	if (ret) {
>> +		if (next && temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
>> +			dev_err(dev, "Adding OVL Adaptor for %pOF\n", next);
>> +			ovl_adaptor_comp_added = true;
>> +		} else {
>> +			if (next)
>> +				dev_err(dev, "Invalid component %pOF\n", next);
>> +			else
>> +				dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +	idx++;
>> +
>> +	/*
>> +	 * Walk through port outputs until we reach the last valid mediatek-drm component.
>> +	 * To be valid, this must end with an "invalid" component that is a display node.
>> +	 */
>> +	do {
>> +		prev = next;
>> +		ret = mtk_drm_of_get_ddp_ep_cid(next, 1, cpath, &next, &temp_path[idx]);
>> +		of_node_put(prev);
>> +		if (ret) {
>> +			of_node_put(next);
>> +			break;
>> +		}
>> +
>> +		/*
>> +		 * If this is an OVL adaptor exclusive component and one of those
>> +		 * was already added, don't add another instance of the generic
>> +		 * DDP_COMPONENT_OVL_ADAPTOR, as this is used only to decide whether
>> +		 * to probe that component master driver of which only one instance
>> +		 * is needed and possible.
>> +		 */
>> +		if (temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
>> +			if (!ovl_adaptor_comp_added)
>> +				ovl_adaptor_comp_added = true;
>> +			else
>> +				idx--;
>> +		}
>> +	} while (++idx < DDP_COMPONENT_DRM_ID_MAX);
>> +
>> +	/*
>> +	 * The device component might not be disabled: in that case, don't
> 
> Sorry there was a typo in my proposal, This should either be
> "not be enabled" or "be disabled".
> 

I even noticed the typo and fixed it, then sent the *not* fixed version. Argh.

>> +	 * check the last entry and just report that the device is missing.
>> +	 */
>> +	if (ret == -ENODEV)
>> +		return ret;
>> +
> 
> ..
> 
>> +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *node,
>> +				     struct mtk_mmsys_driver_data *data)
>> +{
>> +	struct device_node *ep_node;
>> +	struct of_endpoint of_ep;
>> +	bool output_present[MAX_CRTC] = { false };
>> +	bool valid_output_found = false;
>> +	int ret;
>> +
>> +	for_each_endpoint_of_node(node, ep_node) {
>> +		ret = of_graph_parse_endpoint(ep_node, &of_ep);
>> +		if (ret) {
>> +			dev_err_probe(dev, ret, "Cannot parse endpoint\n");
>> +			break;
>> +		}
>> +
>> +		if (of_ep.id >= MAX_CRTC) {
>> +			ret = dev_err_probe(dev, -EINVAL,
>> +					    "Invalid endpoint%u number\n", of_ep.port);
>> +			break;
>> +		}
>> +
>> +		output_present[of_ep.id] = true;
>> +	}
>> +
>> +	if (ret) {
>> +		of_node_put(ep_node);
>> +		return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_MAIN]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
>> +						    &data->main_path, &data->main_len);
>> +		if (ret == 0)
>> +			valid_output_found = true;
>> +		else if (ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_EXT]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
>> +						    &data->ext_path, &data->ext_len);
>> +		if (ret == 0)
>> +			valid_output_found = true;
>> +		else if (ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_THIRD]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
>> +						    &data->third_path, &data->third_len);
>> +		if (ret == 0)
>> +			valid_output_found = true;
>> +		else if (ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (!valid_output_found)
>> +		return -ENODEV;
> 
> This doesn't work. My proposal just ignored the ENODEV error. Now
> you'll return ENODEV if there is no output for a given mmsys. In my
> case, that is true for the first mmsys. Subsequent mmsys's doesn't
> get probed in that case, it seems.
> 
> Anyway, you shouldn't return ENODEV here because disabled just
> means not available, i.e. it should be treated the same as
> "output_present[] == false".
> 

Right. Okay, v8 will fix that.

Thanks,
Angelo

