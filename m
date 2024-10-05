Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407ABCF8851
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqhjtJL2VH9Qi85YDoBXvJqfb6N4tZMSUhtI6I9yzkc=; b=IlszLMMgylB9PchTQhXmT89+kL
	tgHl9RhN/IsCExlZLVtmZPmRkCzyLpgesJcE4ZLWUE6GF9uzyr6Ygvb9OdV/S4SyxMuzSFOyOtklh
	BsbjN3IolhkrLuJqzqFdNv2IT0BVl4LYMhcKM7d5lqpbeVOfBdUFTSrrt4phPRFT97wP5QHQSRac8
	gEQ/nqVO9kg9BDko+/TW3vf7D6kXth0WQBBXGcujJG+KW1iEwXPyEmIJ1jSJhD4HTKBmHFTUzRJvK
	ano3zz9Gz0UmP6/GQvgY5ISDRemhWM0KjZaXMAqcozG1GBmMpzrGPxlzobsQqr+mK8rP8Mh1luPT0
	gzbhc+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swxkL-0000000Eq9h-17JV;
	Sat, 05 Oct 2024 05:54:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swxkH-0000000Eq94-2thk;
	Sat, 05 Oct 2024 05:54:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbddso3299314a12.2;
        Fri, 04 Oct 2024 22:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728107663; x=1728712463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqhjtJL2VH9Qi85YDoBXvJqfb6N4tZMSUhtI6I9yzkc=;
        b=kBUTWuJEI2WXXZlrriPDVX0tetB9QUQYM6T+lFFpUEnYXnK9V7ptX/vShjWpcS9NGz
         meXKt/2v274C2PQpxequqfaqnCdb72oKDFNBnaE+HiqA42oBRt4+6JxX0nSa/B5J66f+
         5TH0YHnOumxeSmSfkAbEiFAQdQYyYDse3u/2MZg1o5jIsaFYwi/+6jPje0aTTmeQqYN0
         9zKW6OOGDwIzzMo1rfKlvOyVfiJUlDUL+vPR8f/mfE0LY/i6eOlGI73aGBe6bhcgeDpV
         linT5ed1Gqcae4JG5I6kcihL4QcE1f5A00QJ7eeOGIrsUJt1NfJHChNsmY6tcKpDHRsv
         17qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728107663; x=1728712463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqhjtJL2VH9Qi85YDoBXvJqfb6N4tZMSUhtI6I9yzkc=;
        b=lm+XVDg2t4hnjWlEaHYtJ2VJBos/TjWB9+wiucNoBBxbScOKQl82t99+OGvDioONKy
         Qb1bjujs9x/l6LQkvcgZTac98JEe8L6hNlR0EMkthDVI1QZHT7Qv9+Yj068fH0FD64D+
         S3nWKubW7vOtOfpYHJhYInx4V4Zjk5+157NRqgM1/7IKtY/fqKDjMl5f16Xpcb9saXv9
         6ndZo1J+N+mLMUaum5eoFiM/JQKdxMBjsIFrzwqE/26IyTRxKUcN7I+cetXrtCb72AI0
         N+3GH0c2+906y3udF4mU4W+TH6B1/CfSvIUFhbjSc/nWi05BmX0sbh0/BOWxLuYIHPcU
         5BIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX8Ph8G2kpCf+aSLrS0kZfFLMxTcLaCDSHoClD/c7bBkRNh7hRcF3Cu+SyrUZO4hzgyOTO3W1xugP8MCjRCY8=@lists.infradead.org, AJvYcCWHzHIFpDUaFI/htymEyw3d/WIROhLNNXlir7b5v4sBU//Fw5agP1eS+EqrTLTCj4i6aEVHS3LtEIub1jsrOBXl@lists.infradead.org
X-Gm-Message-State: AOJu0YwQLdNBE4DXBetgIS4+Oic6AO/iGarPpR4xtloA+PIQEb30nfJN
	y5ftzn3K0iyKf2JuwXT+zpd25t2/ucVTglgxew/mh0Nfq506XBpl
X-Google-Smtp-Source: AGHT+IHsJ8wr3XwH1w8eyfs5MO/C+1coYSi6NdpkwFhI5qIBKYCJ789h1+Y8C3OE5KMxygJ3vog3PA==
X-Received: by 2002:a05:6402:354e:b0:5c8:7a0b:2848 with SMTP id 4fb4d7f45d1cf-5c8d2ee1d08mr3790977a12.36.1728107663248;
        Fri, 04 Oct 2024 22:54:23 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05acccbsm655755a12.32.2024.10.04.22.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 22:54:22 -0700 (PDT)
Message-ID: <885f3994-49a9-4aff-bbea-11e8a4383719@gmail.com>
Date: Sat, 5 Oct 2024 08:54:17 +0300
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
X-CRM114-CacheID: sfid-20241004_225425_761236_9A5C3A3D 
X-CRM114-Status: GOOD (  24.92  )
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

I've carried patches that add MT6735 support in my tree for a while and 
MT6735 broke as well with this patch. Turns out MT6735's OVL doesn't 
have the CONST_BLEND bit. It's highly likely MT8173 also doesn't since 
MT8173's DISPSYS is very similar to MT6735's.

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
> 
> 
> Regards,
> Jason-JH.Lin
> 
>>
>> - Adam Thiede

