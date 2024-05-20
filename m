Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8968FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5fhRvRNdkY76LZ7BQ6I+6ho5RPNKmpKNx7+rIS4bQg=; b=OkNmogdqOdfH+wFpLfQMN3DHUp
	p2PeWS/iDplKBefUOQZDKA08CfGaiDfvNlU/6w40Il5oV5TYiJilKv3/b1E/Ml/+OtuWKDtZfqVpO
	0dChzKoRag1ZSPydH4udAfbz8JnG+YdGHcHEZaQR7G+edYe1Nu5GPTldf52l3SsmM3E7+AvVevyg+
	BfjE0OtLxGYkUgdFUvFqAiXsh4lldnvPR6ltYG0M0SKT91jSvDEEcC9nFzQFBAd4/+I/dv5CyZ/qR
	eHBPaRRTVfeiDZwC0ErEYAE7YiT8maWf0+OI31AvCObO37hHhHhpb8buM6A/0qRqNOV+j2w6SrZ+g
	z8sUrepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s951Y-0000000Er0d-3nsN;
	Mon, 20 May 2024 15:34:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s951U-0000000EqxS-1sQW
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:34:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso1426865f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219238; x=1716824038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5fhRvRNdkY76LZ7BQ6I+6ho5RPNKmpKNx7+rIS4bQg=;
        b=hV30z/spuwIPwsvCjwt91debfYxlTsMXdho9BMN54b97Z5SXeY8ky1n+gonR0BYvKc
         ENIjIMhnco6jNZpPg6iQtu1CgHT2HVhNBKcozfsU4Nfli3PJFy90+jtJxaM2MYYwIEgm
         4K2zC9CG443Y86BB4BiDomb0OaW6heCyKU5UBO26MCmAMcFQbQiCwqvKvZdi7iv/4l9o
         /Y/epr+ko9zOzWO1fAZMljmwKHnOQe32mU2fabjK/D3hHHdaZWaFBH/YQ7lnXphD4C+R
         0F5aqqpqA7uaXlCPXZyqh3Dz8OAFgYVZ8wQ4rHMu/EHzekMuBzQEDPOx8bB3NqFpjUP/
         C1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219238; x=1716824038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5fhRvRNdkY76LZ7BQ6I+6ho5RPNKmpKNx7+rIS4bQg=;
        b=Y448b/Aag8YbVA8fY7CWoEfMBdwikEzuLQZpD8lLqJm8Ejwfb0gCXuOgl0ljeRDmV5
         ynRupZiGK8aT7XOksaxvvjJYfNNzxAhhfiTOZ5R88HoHwFa0rAuKTR9Iq828Awb8ncgH
         TI/CNZUar7DkvVj26v6mFl47nW9eOQhH5Mm5mpY6TOOO6vQ0nqr5tFXC403Vp1DB7Dbk
         3S7gzjZviOHeCFeV2LBLbdh47uPsXlIdCn23gpjWQIeQ3L+jvFFDUMuhU54YvHwZW5B9
         XtNXFJCy1IYwT3tGLwRTdXQGeN5TrLHSI0FGmFVzOWwTjlbFRJQA162eEsY9YTrWNeN2
         Dpig==
X-Forwarded-Encrypted: i=1; AJvYcCWTcfYkQFTp6H4aeBqwjtSVREqLHQCQ06ZgJC8wXvlbgOmDUgu9UeXoY8Z7DGzuI8V6N/GFxVSdTF5xluBVamxCSyOCva82ew0LsTHF1ZAnCv/c
X-Gm-Message-State: AOJu0Yw/aLifdaudLe8KZm+NxiAdNU5xW8mT0KAIgDSmz/0FrZYERt6Y
	wdiacjqsTE42eNGVoP8KenHBIqPyR1dTX0zSpAJ2LlQN9xaFxPRvhP/IqZ0Mpr8=
X-Google-Smtp-Source: AGHT+IEtcFamuSVknEh6ha0edbY5+ZLvvrbIWav+4DvwqNfed2/74eqCifL094D8HWPsho7WfwN9cg==
X-Received: by 2002:a5d:4852:0:b0:33e:6ef3:b68e with SMTP id ffacd0b85a97d-354b8e4ee8dmr5666430f8f.34.1716219237520;
        Mon, 20 May 2024 08:33:57 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad04dsm29474972f8f.81.2024.05.20.08.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 08:33:57 -0700 (PDT)
Message-ID: <9e2cf6c9-d74a-49f3-bc3f-cdbe83e01015@baylibre.com>
Date: Mon, 20 May 2024 17:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
 <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
 <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
 <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_083400_527930_14D96BC2 
X-CRM114-Status: UNSURE (   7.88  )
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



On 20/05/2024 13:55, AngeloGioacchino Del Regno wrote:
> Il 20/05/24 13:49, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>>>> So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
>>>> - removing the current "oneOf".
>>>
>>> ...eh I think this should be anyOf instead :-)
>>>
>>> I'll check later and send a v5.
>>
>> "anyOf" behavior works as expected on my side, dt-validate pass ;)
>>
> 
> Hey, thanks for the test, buys me some important time.

You're welcome, after that:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

