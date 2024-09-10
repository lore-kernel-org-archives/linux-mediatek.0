Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364FECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94JeOVhDEj8ROkbsOLxh3nYOiigFlCm7ofZwv2YIogM=; b=JhMlewdXBo/+PwrFhqsPZ4GAFf
	JUiT8wEHDaZjZ5VvU7IK7va+/PsJhvMnfnojyUwbDsbztySIsUFpBqVP5Y3E2sYly0xTDik40Me9v
	MySXbKdqd/2CinIQab5vt98/Q7XT49em6YJMZP/70wH2m8k76HrtRDpqidqzI1QbevUyLYYYhZKtl
	zHBj25LE+ZGdvSuJxb6T3DDstXsX4XJ0+cGaqLbR6NuCNTMn9ubM3YX+Cx3vebUsNDk3JI7HNeUyR
	CRQ0QlfIFbtf4t9wgpCT1+/q4vG7igwTJSz/dsMByo5tg5yabxnQiA7DuTHfP314liQMGANJ/Jd66
	bhbAT9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwON-00000004qNP-3x2f;
	Tue, 10 Sep 2024 08:38:32 +0000
Received: from a7-31.smtp-out.eu-west-1.amazonses.com ([54.240.7.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwOL-00000004qLj-0Qqu;
	Tue, 10 Sep 2024 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725957504;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5r0O453WBmztErQtUlLR0a1dpPzv1lXgS4sYoMKCPcg=;
	b=BSQ+svfIm3CD9z6iunpSP9NPxattYd2Hp3mfh52GBWzezh1RjbQfm7zfbG9Mjx+J
	+okvrk5LkppiBQVonu1+hoWUVOLCxNCsqoomipijXOQmxqM+vQSYUtFBJoTuKrBX+/0
	m620wjlii4sk4zVW6Upo01Q+C/uc0zLeWp5r2M0S2IjV7izaTqxq+kWBzqx/q54RNwq
	TDJaI1v6KcHVyMK5zpWxH/301z7iMMgFdmQCjJKthOUAEKzlfytVAvXQwLSGe+XGWjS
	0FA70qVcOtsr7mT4m3c6hiDwcZ4AMwJVfErMezhnDsd9fkRqHt41kZ8alHqcLfqRtBF
	fhu95KwaQQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725957504;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=5r0O453WBmztErQtUlLR0a1dpPzv1lXgS4sYoMKCPcg=;
	b=P+rChaA+FT24fTpFt3ba+88su2Kd97jw+JdL1LwHKMEovHZmcxzEsT5oJPTj99Q4
	UtNtGg3L4HxnqUYj/BpENrwiI/Z4/v8qDgEkh46bqh2QXIDjMcQKrgCqrwZuuf2rA/P
	FgflllaWgJiW1iv4hAY/2Ecka4InuciUooQ4UsRw=
Message-ID: <01020191db157c68-71e1f1a2-46c3-4c9f-a561-132319742e69-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 08:38:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	=?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>, 
	"michael@walle.cc" <michael@walle.cc>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	=?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <20240618101726.110416-4-angelogioacchino.delregno@collabora.com>
 <1e1b0ff224dfa99041b54408c16633d5885efda9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1e1b0ff224dfa99041b54408c16633d5885efda9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_013829_457704_63D2D56B 
X-CRM114-Status: GOOD (  35.90  )
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

Il 08/08/24 05:48, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-06-18 at 12:17 +0200, AngeloGioacchino Del Regno wrote:
>> It is impossible to add each and every possible DDP path combination
>> for each and every possible combination of SoC and board: right now,
>> this driver hardcodes configuration for 10 SoCs and this is going to
>> grow larger and larger, and with new hacks like the introduction of
>> mtk_drm_route which is anyway not enough for all final routes as the
>> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
>> DSC preventively doesn't work if the display doesn't support it, or
>> others.
>>
>> Since practically all display IPs in MediaTek SoCs support being
>> interconnected with different instances of other, or the same, IPs
>> or with different IPs and in different combinations, the final DDP
>> pipeline is effectively a board specific configuration.
>>
>> Implement OF graphs support to the mediatek-drm drivers, allowing to
>> stop hardcoding the paths, and preventing this driver to get a huge
>> amount of arrays for each board and SoC combination, also paving the
>> way to share the same mtk_mmsys_driver_data between multiple SoCs,
>> making it more straightforward to add support for new chips.
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
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
> 
> This looks not an error.
> 

Thanks for catching that, I used that line for debugging and forgot to change it
back to dev_dbg(). Will fix.

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
>> +	 * The device component might not be enabled: in that case, don't
>> +	 * check the last entry and just report that the device is missing.
>> +	 */
>> +	if (ret == -ENODEV)
>> +		return ret;
>> +
>> +	/* If the last entry is not a final display output, the configuration is wrong */
>> +	switch (temp_path[idx - 1]) {
>> +	case DDP_COMPONENT_DP_INTF0:
>> +	case DDP_COMPONENT_DP_INTF1:
>> +	case DDP_COMPONENT_DPI0:
>> +	case DDP_COMPONENT_DPI1:
>> +	case DDP_COMPONENT_DSI0:
>> +	case DDP_COMPONENT_DSI1:
>> +	case DDP_COMPONENT_DSI2:
>> +	case DDP_COMPONENT_DSI3:
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid display hw pipeline. Last component: %d (ret=%d)\n",
>> +			temp_path[idx - 1], ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	final_ddp_path = devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[0]), GFP_KERNEL);
>> +	if (!final_ddp_path)
>> +		return -ENOMEM;
>> +
>> +	dev_dbg(dev, "Display HW Pipeline built with %d components.\n", idx);
>> +
>> +	/* Pipeline built! */
>> +	*out_path = final_ddp_path;
>> +	*out_path_len = idx;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *node,
>> +				     struct mtk_mmsys_driver_data *data)
>> +{
>> +	struct device_node *ep_node;
>> +	struct of_endpoint of_ep;
>> +	bool output_present[MAX_CRTC] = { false };
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
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_EXT]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
>> +						    &data->ext_path, &data->ext_len);
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	if (output_present[CRTC_THIRD]) {
>> +		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
>> +						    &data->third_path, &data->third_len);
>> +		if (ret && ret != -ENODEV)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int mtk_drm_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct device_node *phandle = dev->parent->of_node;
>>   	const struct of_device_id *of_id;
>>   	struct mtk_drm_private *private;
>> +	struct mtk_mmsys_driver_data *mtk_drm_data;
>>   	struct device_node *node;
>>   	struct component_match *match = NULL;
>>   	struct platform_device *ovl_adaptor;
>> @@ -824,7 +1048,31 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   	if (!of_id)
>>   		return -ENODEV;
>>   
>> -	private->data = of_id->data;
>> +	mtk_drm_data = (struct mtk_mmsys_driver_data *)of_id->data;
>> +	if (!mtk_drm_data)
>> +		return -EINVAL;
>> +
>> +	private->data = kmemdup(mtk_drm_data, sizeof(*mtk_drm_data), GFP_KERNEL);
> 
> This is redundant. You would assign private->data below.
> 

Right. Will remove.

>> +	if (!private->data)
>> +		return -ENOMEM;
>> +
>> +	/* Try to build the display pipeline from devicetree graphs */
>> +	if (of_graph_is_present(phandle)) {
>> +		dev_dbg(dev, "Building display pipeline for MMSYS %u\n",
>> +			mtk_drm_data->mmsys_id);
>> +		private->data = devm_kmemdup(dev, mtk_drm_data,
>> +					     sizeof(*mtk_drm_data), GFP_KERNEL);
>> +		if (!private->data)
>> +			return -ENOMEM;
>> +
>> +		ret = mtk_drm_of_ddp_path_build(dev, phandle, private->data);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		/* No devicetree graphs support: go with hardcoded paths if present */
>> +		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
>> +		private->data = mtk_drm_data;
>> +	};
>>   
>>   	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
>>   						      sizeof(*private->all_drm_private),
>> @@ -846,12 +1094,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   
>>   	/* Iterate over sibling DISP function blocks */
>>   	for_each_child_of_node(phandle->parent, node) {
>> -		const struct of_device_id *of_id;
>>   		enum mtk_ddp_comp_type comp_type;
>>   		int comp_id;
>>   
>> -		of_id = of_match_node(mtk_ddp_comp_dt_ids, node);
>> -		if (!of_id)
>> +		ret = mtk_drm_of_get_ddp_comp_type(node, &comp_type);
>> +		if (ret)
>>   			continue;
>>   
>>   		if (!of_device_is_available(node)) {
>> @@ -860,8 +1107,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   			continue;
>>   		}
>>   
>> -		comp_type = (enum mtk_ddp_comp_type)(uintptr_t)of_id->data;
>> -
>>   		if (comp_type == MTK_DISP_MUTEX) {
>>   			int id;
>>   
>> @@ -890,22 +1135,24 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>   		 * blocks have separate component platform drivers and initialize their own
>>   		 * DDP component structure. The others are initialized here.
>>   		 */
>> -		if (comp_type == MTK_DISP_AAL ||
>> -		    comp_type == MTK_DISP_CCORR ||
>> -		    comp_type == MTK_DISP_COLOR ||
>> -		    comp_type == MTK_DISP_GAMMA ||
>> -		    comp_type == MTK_DISP_MERGE ||
>> -		    comp_type == MTK_DISP_OVL ||
>> -		    comp_type == MTK_DISP_OVL_2L ||
>> -		    comp_type == MTK_DISP_OVL_ADAPTOR ||
>> -		    comp_type == MTK_DISP_RDMA ||
>> -		    comp_type == MTK_DP_INTF ||
>> -		    comp_type == MTK_DPI ||
>> -		    comp_type == MTK_DSI) {
>> -			dev_info(dev, "Adding component match for %pOF\n",
>> -				 node);
>> -			drm_of_component_match_add(dev, &match, component_compare_of,
>> -						   node);
>> +		switch (comp_type) {
>> +		default:
>> +			break;
>> +		case MTK_DISP_AAL:
>> +		case MTK_DISP_CCORR:
>> +		case MTK_DISP_COLOR:
>> +		case MTK_DISP_GAMMA:
>> +		case MTK_DISP_MERGE:
>> +		case MTK_DISP_OVL:
>> +		case MTK_DISP_OVL_2L:
>> +		case MTK_DISP_OVL_ADAPTOR:
>> +		case MTK_DISP_RDMA:
>> +		case MTK_DP_INTF:
>> +		case MTK_DPI:
>> +		case MTK_DSI:
>> +			dev_info(dev, "Adding component match for %pOF\n", node);
>> +			drm_of_component_match_add(dev, &match, component_compare_of, node);
>> +			break;
> 
> This modification seems not related to OF graphs support. If you need this, separate this to another patch.
> 

Will do for v9.

Thanks,
Angelo

>>   		}
>>   
>>   		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> index 78d698ede1bf..7e54d86e25a3 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> @@ -59,7 +59,7 @@ struct mtk_drm_private {
>>   	struct device *mmsys_dev;
>>   	struct device_node *comp_node[DDP_COMPONENT_DRM_ID_MAX];
>>   	struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_DRM_ID_MAX];
>> -	const struct mtk_mmsys_driver_data *data;
>> +	struct mtk_mmsys_driver_data *data;
>>   	struct drm_atomic_state *suspend_state;
>>   	unsigned int mbox_index;
>>   	struct mtk_drm_private **all_drm_private;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index c255559cc56e..880ea37937da 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -904,9 +904,17 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>>   	dsi->lanes = device->lanes;
>>   	dsi->format = device->format;
>>   	dsi->mode_flags = device->mode_flags;
>> -	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> -	if (IS_ERR(dsi->next_bridge))
>> -		return PTR_ERR(dsi->next_bridge);
>> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	if (IS_ERR(dsi->next_bridge)) {
>> +		ret = PTR_ERR(dsi->next_bridge);
>> +		if (ret == -EPROBE_DEFER)
>> +			return ret;
>> +
>> +		/* Old devicetree has only one endpoint */
>> +		dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> +		if (IS_ERR(dsi->next_bridge))
>> +			return PTR_ERR(dsi->next_bridge);
>> +	}
>>   
>>   	drm_bridge_add(&dsi->bridge);
>>   


