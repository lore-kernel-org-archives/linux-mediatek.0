Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28769CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxV5pge1BJ/dVMZ6yUHtpXjI3/llaXu9a6kZIGM8aPE=; b=RNykzF3QYRZOl0Rn862xGHHy21
	DRCAgIl4s8b3UHyBRUo6AD5dMs1NRUBH8e4NNgJzMQbQRS6+ATMN6Nf7dddJuPybrz9YdTnMjFp3L
	SZdV+ojwMWayRxhBCYfKvMPpJ927YeYnYQit4UBnaUdkBz9YWnE294x8kOdxsznHbLzsT9VTYDS2z
	6JtENX8+707QKj0cuvyy93X4kObmDRFOLev4U2ao8in7pyQNQscZIeNtWsCSUUqGwLe4cp96XZTi/
	esCWVDodxvjAg28V4Mr7g1SBaJ5Kha5UvKuDGREyZbwrkQbHy09KcDNf+0aCQM8LRBvRUYBCrRv7p
	ACr7Sqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3g2-00EQiK-04;
	Wed, 18 Oct 2023 10:21:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3fy-00EQhR-0B;
	Wed, 18 Oct 2023 10:21:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D95E366072F7;
	Wed, 18 Oct 2023 11:21:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697624474;
	bh=kH1jXtunBlMIflxPq7hLuLyoVuwUNlJfO0y0ePDVEoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jhZdfnzBeekyyVBkDSPRwP3lhZX9sgWCjRuT9AeuqEMyzTIun7LOmijs9oz07+gzl
	 4Oj/4DMmMbEHy5CVUx8gn0tEqghbRMbZH61iqT2aS1h4EvUkadcSe9N63zBDZm1jMz
	 Y4k9ifoHnRJxlxqDz/fU1MuNtOcMJdNiIo1605gcolbcX1dPRjn7Z7UzgwK9ZzM3Ic
	 e0cHpgS6ENEf/KJphA4HFeL5+zPD3ghEFe9mhPoYZ0LjcabnB6C6KAyN3aFp9nQG+N
	 75kARIavOnmZPfjstH9PvR+2uHBAU5TyKuOEbwKAozmUftEjsGnVZ05PnRr1mq5HTP
	 ++oKz7SDHQUAg==
Message-ID: <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
Date: Wed, 18 Oct 2023 12:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: airlied@gmail.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, jitao.shi@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, shaoming.chen@mediatek.com, yt.shen@mediatek.com
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <20230915101124.283232-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915101124.283232-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_032118_239240_B49264CF 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Il 15/09/23 12:11, Michael Walle ha scritto:
>> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
>> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
>> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
>> later calculation for horizontal sync-active (HSA), back (HBP) and
>> front (HFP) porches got incorrect due to the logic being inverted.
>>
>> This means that a number of settings were wrong because....:
>>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>>     set in order to disable the End of Transmission packet;
>>   - Horizontal Sync and Back/Front porches: The delta used to
>>     calculate all of HSA, HBP and HFP should account for the
>>     additional EOT packet.
>>
>> Before this change...
>>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>>     added when EOT disabled, instead of when EOT packet enabled!
>>
>> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
>> MediaTek DSI driver to fix the aforementioned issues.
>>
>> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
>> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Hello CK,

can you please pick this fix?

Thanks,
Angelo


