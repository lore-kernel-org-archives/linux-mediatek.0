Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AEDC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRhZ+QxX2jU0GOZcBkO8m/ExiO8iLwpdxBvE5I41E9I=; b=ifs8FAFdORwDBRxmITRYeNPnSI
	zPh46eTIpOn/lqWvI4IQ8gKqVyki7ZcBJGpUeCMrR84LEwcuXKuZORCqoThrSaVDlVDm1HEBR3LJe
	wS/BjqRotoEjCDkknaERZWyX5MkjhoIqPJ6cHjQ+59RoHBxgJw4S6C5NuI+pPJwMAVLhQYU127xLH
	O8BHj1CTcOn/AMDOCC57d+lcLA7TrscxQekpO7aP8zyzBpTCD8CCDqtRx2adcS7+xDE4rxkcS4u1u
	RIeogSxsnR8cxvxMFet9BFbkV0f9u35JtHyZ7XwkQtRgZ9wjvf07pAu45qometpbeU/pglzZOpXPy
	tM4IVZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xvW-00000007NTv-3Nxx;
	Mon, 06 May 2024 12:58:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xvT-00000007NSM-1mud;
	Mon, 06 May 2024 12:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715000315;
	bh=tLmidEw0xvorttT3kpSnB/51l0/SZujW7+7sWnN3BTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O9YxQ8dCW1tqgLW5rA+0n2ArPG6QQFelD3GGiGn1iE3MvfASacacXhC4m6/6738Ti
	 k/V/Ma+/rUbWei5h8Gs7kAAtv5k4CiXrV87IfdqqBH9pFD/I4e9fnTRgANZgxgA2Er
	 YuKt83JuNXixC1NSoRiH2W/I3t3Q3F+oni1Sbj1Xj7L/PJD2WzQ5Vb65aCu5LqEH/R
	 8QJmt3NtrgfLnLC1HR7QZuZWQSLB12fbi79eEanIy9j4bCVumzWB5ek4gl+mDAc7pJ
	 NRa00YWGRzZUciGJQYW20VIAEebikMKu8YzZYlX4GMx7jHPMa+s0JxRr0qjzFI3a0L
	 e9gMJgpPOcHXw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8896437813E3;
	Mon,  6 May 2024 12:58:33 +0000 (UTC)
Message-ID: <01b2e468-e721-4bc5-9149-4e2292eafd42@collabora.com>
Date: Mon, 6 May 2024 14:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: Michael Walle <mwalle@kernel.org>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-4-angelogioacchino.delregno@collabora.com>
 <D12G1NPU2H06.3LBLR19XYUAA6@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D12G1NPU2H06.3LBLR19XYUAA6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_055839_687247_3AAF5F6C 
X-CRM114-Status: GOOD (  13.27  )
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

Il 06/05/24 11:11, Michael Walle ha scritto:
> Hi Angelo,
> 
> On Tue Apr 9, 2024 at 2:02 PM CEST, AngeloGioacchino Del Regno wrote:
>> +static int mtk_drm_of_get_ddp_ep_cid(struct device_node *node,
>> +				     int output_port, enum mtk_drm_crtc_path crtc_path,
> 
> Not sure what's your base branch is, but "enum mtk_drm_crtc_path"
> was renamed to "enum mtk_crtc_path" in commit 9e149879038f5
> ('drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"').
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
>> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_drm_crtc_path cpath,
> 
> likewise
> 
>> +					 const unsigned int **out_path,
>> +					 unsigned int *out_path_len)
> 
> -michael

Yeah, thanks for noticing that, I'll send a new version soon.

Cheers

