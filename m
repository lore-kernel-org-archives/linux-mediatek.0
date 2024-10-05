Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF9ACF8871
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7vLbW0akK7YwOkc2P66r1P01ycwp/GvBI6sSzlZ6JE=; b=LeXShysTQLgA3ofJX94vwLRzG9
	Jk6xXmm4BYT6hrkISNP06rL5ZBEQcRqknPAi0KNI9OI0gNQQGZtxMatAM71ToCH7LKNvx1w+fuhn7
	CSlzz32fAoWAErJrKx8IWDObz5pQvrSEtVd6kNicYsStdrFhmkizSP/fpQ5WjzQqo0ph+19ZflTCv
	n485yDwlA7YtL5zAFUlrDL3QLQR8vv1xwWrRp7XN7YjiNFxr62bVJjXy7vkuVbVs6FiRVq2NpBqjY
	MYWTcp+AM07G+XPCTYjMSsXaUONKG+rH7B75Uj9dNpI5klXbZd5/PHJUDOZi1PyQSOR6IOEDmiI3e
	IIZm128A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swyLs-0000000EsRS-2kyD;
	Sat, 05 Oct 2024 06:33:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swyLq-0000000EsQr-1g4x;
	Sat, 05 Oct 2024 06:33:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso537562466b.1;
        Fri, 04 Oct 2024 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728109992; x=1728714792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7vLbW0akK7YwOkc2P66r1P01ycwp/GvBI6sSzlZ6JE=;
        b=XMLBGTs9CRy0lrXmDi/MS1I6zWBBtDK+/7D3BmC92VynHEhjJRCEWydAak65m9cJwd
         s9QK82mRtLSvMqGEvF0Hxrcl70ELh+K36CQYpIDVS/137NOXdYosp9bP2k35EyiOgLyq
         dT+2NBa18kKaHubQFz3WUUAaoinqQLxcPrOche5oylFMXhQbFeb2KrW/TVJJDXkH37Fx
         xZKc+Q0W9GqhjF77AAi9N2ciEkTbwUKzW5Be5AXUMLurS6K7rPVCbcpQ2J59akU3MtVF
         civaFisHdsyoE8tWAon75ykhemIpZUZv3/1xjK056e+aynqbK6QSxIZcZDxpFRxgzbnT
         T/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728109992; x=1728714792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7vLbW0akK7YwOkc2P66r1P01ycwp/GvBI6sSzlZ6JE=;
        b=YOUzcFZbjKW60VSnaNha+7LyOYAUzFFKpSoua04qEH/1x3uje/qFuD9UfScLkc4U74
         LTnoFkieFHBuPSWZZ+iD14vExeP99NMGGLEqBoAgH4sUjeaBfViGXbzTG2fuvxFrqvsN
         O3K4dd72htq0fGWOBw6tUJWyjwkHYGWumaM39JRLwxIxVHJKIbJndEDkC7AWdqyVGBv2
         ZddSbsjGBuvZ/b1QiZ5V2Sizu66Ddip7obEgObIUkvwKYIv63OCjx/R/aW5lubZvIQdO
         NUxnJwCvApOGJttqu9KY6H5mk98Xgs7CyPeW+gaVm/3OZ6I1sbGpWwDU1HTssXnxdQ70
         pucA==
X-Forwarded-Encrypted: i=1; AJvYcCWb9idqdfCmeQdxYqZY4gLCteLB3XGG7nIleVjIZG+vOwGAJ09WYe927lRRWFIjf872VrTGNNGPDNodDBSj1maf@lists.infradead.org, AJvYcCXCgQCxAdbHZ0Ag6EJj/f8j4jwPvMDpT5Tqju3PVNL3eekLc7tPdggceTSFwQq5kIZJrvA0YqZeyIxWeT6j+nQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw39D/6qO8gquj6VIJ9ZCxjcz8OTIA/sr79WKMHAvTq+1GscHp4
	2AQTL6uX8fZV+5AN9AEAyM83jn784cKGiroRb7nSrDDbzz5Ib761
X-Google-Smtp-Source: AGHT+IH0HMdNMIZNdd2tNWTbK109LRw4fSWdIqpNDF3pp7Isnqrwz4ZYVRbRjl5UYq7cqGlP3Qy/CA==
X-Received: by 2002:a17:907:3f9d:b0:a98:f6dc:6cf3 with SMTP id a640c23a62f3a-a990a21d55emr982162566b.21.1728109991523;
        Fri, 04 Oct 2024 23:33:11 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e5bbc20sm92337066b.41.2024.10.04.23.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 23:33:10 -0700 (PDT)
Message-ID: <d820e8be-c525-4435-99a3-b0eb076b3282@gmail.com>
Date: Sat, 5 Oct 2024 09:33:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "me@adamthiede.com" <me@adamthiede.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_233314_467802_0A986B3E 
X-CRM114-Status: GOOD (  24.77  )
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


On 03/10/2024 8:17 am, Jason-JH Lin (林睿祥) wrote:
>> Jason:
>> That is a lot of information, and quite above my head! Thank you
>> though.
>>
>> I should note that the log items I sent you are from the "good"
>> kernel -
>> 6.11 with the commit reverted. Here is a much longer set of logs:
>> https://termbin.com/co6v
>>
>> I've rebuild 6.11 with the log statement enabled and the "bad"
>> behavior.
>> Here is a dmesg from that: https://termbin.com/xiev
>>
> Hi Adam,
> 
> I think something wrong with your dmesg links, both logs look the same.
> We should see this log in the "bad" one:
> fmt:0x34325258, has_alpha:0x0, alpha:0xffff, con:0x2000
> 
> But anyway, I think the reason for the downgrade is clear enough to me.
> So let's try to figure out the solution.
> 
>> These logs are both from `dmesg`.
>>
>> I'm fairly certain I've built with the patch you referenced enabled.
>> The
>> kernels I run are just release kernels, not RCs or git branches or
>> anything. The mainline v6.11 kernel is the one that has this problem.
>> If
>> that patch has been merged into 6.11 (which, looks like it has) then
>> it's in the kernel I'm building.
> 
> Got it.
> Then OVL_CONST_BLEND might be the unsupported configuration in MT8173,
> I think we should remove the XRGB8888 format for MT8173.
> 
> Could you please try this modification and see if it'll change to use
> others supported format to show the text?
> 
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -102,12 +102,9 @@ static inline bool is_10bit_rgb(u32 fmt)
>   }
> 
>   static const u32 mt8173_formats[] = {
> -       DRM_FORMAT_XRGB8888,
>          DRM_FORMAT_ARGB8888,
> -       DRM_FORMAT_BGRX8888,
>          DRM_FORMAT_BGRA8888,
>          DRM_FORMAT_ABGR8888,
> -       DRM_FORMAT_XBGR8888,
>          DRM_FORMAT_RGB888,
>          DRM_FORMAT_BGR888,
>          DRM_FORMAT_RGB565,

This is what I get on MT6735:

[    1.729467] mediatek-drm mediatek-drm.1.auto: [drm] bpp/depth value 
of 32/24 not supported
[    1.737777] mediatek-drm mediatek-drm.1.auto: [drm] No compatible 
format found
[    1.745943] mediatek-drm mediatek-drm.1.auto: [drm] *ERROR* 
fbdev-dma: Failed to setup generic emulation (ret=-22)

> 
> Regards,
> Jason-JH.Lin
> 
>>
>> - Adam Thiede

