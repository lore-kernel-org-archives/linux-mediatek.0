Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F17C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aecDRBBI7bdXtD+aN5xGPOj9CCxjVL5QRYuaYsZ85nc=; b=UUM6aSpHq71jHa
	adsAmzGDeliThHBgd8NNnL3zq2yRzxBTor+12afot9tccDK0ItdUSAIaEZvx8HPQvxeConaLkNcUd
	Zq7uwnrwlaAcLmD5uCTW9hPJNtli9C8qqPaLGXGdmhjSn7s+y/f6ekEHQZlFdW0g+nDFctWM0lhqE
	RC5EuMbjDq3JmGZpZg+DG4quCqCwEEQ01E266Y0olqqw2/zRdaB5KHTXllPgJQV0Ioqf5zQoKVryu
	HO9ZQCphEVTynJAzG7p/wenclMa6R+WjwB6QEATzkDaYv+BaARbUVg+l3GQ47tGEIpzMqIku7V1fH
	+kxh7Vj0dA6t+wg7gPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNlr-00000008AUB-28ki;
	Tue, 06 Feb 2024 15:54:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNln-00000008ARy-1FIb;
	Tue, 06 Feb 2024 15:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707234837;
	bh=ocHaZpvDjxc0rwWNi54f+f6bams80D+RxoX1ovTeVl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V7K5QaTFmBBj0jF9OBR5noaRpQTZDw9Xl5i1A050PYI1Pv9NppAiV7yHeTBDp5nEN
	 7LckCp+WWAF8/QJQrikGSGvJydLGMjuSlmFWBQa804UzNxojOI2zARlmeMuiejyzcf
	 Gt8wNMvbT7i5xT5flazIdXjg50s6SaJe6ngZnwVVyF9vZyZ76G+lYlbBHypn5L2f3b
	 E+jvFsHCXt/eiaKk8Dt+Ey6G/tsgL0FR58ISC5cJO9vie0l5n9oGkt0XMDUnBqNuS3
	 gc4WgpIO2qQxYRqTR0yVI2BtKWCjnQnbgqwGiqxAMdTot8z9h/xbKNxZTN9lt+0g1d
	 QsBZ3YcbvWHqQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D92CF37803EE;
	Tue,  6 Feb 2024 15:53:56 +0000 (UTC)
Message-ID: <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
Date: Tue, 6 Feb 2024 16:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
 <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_075359_490913_BC845BA5 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/02/24 15:47, Alexandre Mergnat ha scritto:
> 
> 
> On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
>> Change magic numerical masks with usage of the GENMASK() macro
>> to improve readability.
>>
>> While at it, also fix the DSI_PS_SEL mask to include all bits instead
>> of just a subset of them.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++---------------
>>   1 file changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index a2fdfc8ddb15..3b7392c03b4d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -58,18 +58,18 @@
> 
> ...snip...
> 
>>   #define DSI_PSCTRL        0x1c
>> -#define DSI_PS_WC            0x3fff
>> -#define DSI_PS_SEL            (3 << 16)
>> +#define DSI_PS_WC            GENMASK(14, 0)
>> +#define DSI_PS_SEL            GENMASK(19, 16)
> 
> 0011 0000 0000 0000 0000 => GENMASK(17, 16)

Alexandre, the reason for that is in the commit description :-P

"While at it, also fix the DSI_PS_SEL mask to include all bits instead
of just a subset of them."

Thanks for the reviews, btw!

Cheers!
Angelo

> 
>>   #define PACKED_PS_16BIT_RGB565        (0 << 16)
>>   #define LOOSELY_PS_18BIT_RGB666        (1 << 16)
>>   #define PACKED_PS_18BIT_RGB666        (2 << 16)
>> @@ -109,26 +109,26 @@
>>   #define LD0_WAKEUP_EN            BIT(2)
> 


