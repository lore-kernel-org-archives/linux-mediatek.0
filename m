Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7279C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAkLPQNLKIJOaC707Ao5hQ7CgDBQQqizoFld4z4K7ME=; b=VxeenVayNzYDL0F35vmeC/hF+m
	HYcKyjD0vkpticj9GK1AzeKiZkgetoonuqUxG5H6TBYzzVtOBYNbvqnp63eOwZV2crV7n98U+U8jc
	QJu7y1UWWjRkjuXfCPtaEP8LYKCnF3/o10vhci9okX5IkVIGr5LIOG9Nuolm8etoeZyvCL2rXbU3c
	XIge5sjnLsrO7cWV81Wut6t/DhwBZQeZjSQ/pOiBAC1O/YnJurKoi56wpWruxGDG69mj5qiHK8Ive
	fCMWDCBChPNs52YmvClyWHKZGiD4LpQdHR0UZMLCX2LZ8g1GoQjRvKBQuRSiiRoowDtTDGKw8/qzQ
	eNn4HcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1mt-00676m-1v;
	Wed, 19 Jul 2023 07:39:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1mp-00675b-2p;
	Wed, 19 Jul 2023 07:39:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 762EB660704A;
	Wed, 19 Jul 2023 08:39:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689752389;
	bh=rNVjWyGyb4/QZCXHyXWf5MRLedoD5uQC2pGcS2nQLJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXAnIw+qjtq/TVA5eamsTuqS52g5ZYSbnDDs6DVc9VL/h9OMKBeFUUOoaNERSSpeV
	 u1iFRJZg59z7AUj8yplJ80OnLpIUBGZ0EdYaO29XIB+ZMEf3f1yHGV3VfzkWA0mTFA
	 IWnJwDSjAdrErnMtvJkaKkiTnBil+eBYIsnBgvU17ETesA9N1A76livi2XS6bwsneT
	 krC2W+oSTYwET1WjqEeJRAp7nDKZ+ngg193F2j24GMpCm/WfJvSlGmo0z+l6XQVpIU
	 ntX7vGSmW6rVD3taA6mIJowkm7Ppt588Jlw/74A+v3YLXlxCwZwORhaLSC+bNkWvND
	 WM6Oz3TI9R6pg==
Message-ID: <07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com>
Date: Wed, 19 Jul 2023 09:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Content-Language: en-US
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 shaoming.chen@mediatek.com, yt.shen@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <735623c5-3eeb-bda3-db87-2b33d9ad3446@collabora.com>
 <2f1d4e6b-bf03-25d1-dac2-83e0dbd5734f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2f1d4e6b-bf03-25d1-dac2-83e0dbd5734f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_003952_064946_7A37253C 
X-CRM114-Status: GOOD (  14.93  )
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

Il 23/06/23 13:29, Alexandre Mergnat ha scritto:
> 
> 
> On 23/06/2023 11:47, AngeloGioacchino Del Regno wrote:
>> Il 23/05/23 12:42, AngeloGioacchino Del Regno ha scritto:
>>> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
>>> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
>>> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
>>> later calculation for horizontal sync-active (HSA), back (HBP) and
>>> front (HFP) porches got incorrect due to the logic being inverted.
>>>
>>> This means that a number of settings were wrong because....:
>>>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>>>     set in order to disable the End of Transmission packet;
>>>   - Horizontal Sync and Back/Front porches: The delta used to
>>>     calculate all of HSA, HBP and HFP should account for the
>>>     additional EOT packet.
>>>
>>> Before this change...
>>>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>>>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>>>     added when EOT disabled, instead of when EOT packet enabled!
>>>
>>> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
>>> MediaTek DSI driver to fix the aforementioned issues.
>>>
>>> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
>>> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet 
>>> control")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Gentle ping for an important fix.
>>
>> Regards,
>> Angelo
>>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c 
>>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 7d5250351193..b0ab38e59db9 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>>       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>>>           tmp_reg |= HSTX_CKLP_EN;
>>> -    if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>>> +    if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>>>           tmp_reg |= DIS_EOT;
>>>       writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>>> @@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>>>                 timing->da_hs_zero + timing->da_hs_exit + 3;
>>>       delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
>>> -    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
>>> +    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
>>>       horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
>>>       horizontal_front_back_byte = horizontal_frontporch_byte + 
>>> horizontal_backporch_byte;
>>
>>
> 
> Sounds logic
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 

Ping again.

Regards,
Angelo

