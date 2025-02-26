Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F6DC021B8
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QySj/3gXBapZsSsI8S6n09GzTe+ASut5dxFZ8ln3oQ=; b=FnQShy5DwCmFIaXDoKwmMNDTKd
	jH5e0e+1IA3ENyNsOMg4k8deHPCrWP7gmePl79K0fHvmjAceOaaMmeq1nEVluJiAK3hUNqEWkDp7V
	Djg+w1RVezQufpJ9ZhyyiEovS7sBFxAmepR/1mALRPEfKuVsde72wMHg1xdDHMB+RtNVv+EFG9UH0
	3ELAcKcqXJCcCLjAPxarnBvIfcEOpIMAT03peOEOVui/MJCnz0AqI2vWawFND4e3CEO8HqwNeLGHz
	uhC+tsbk38nuDtK3W/aCOrOBMryntN2rEOaiKU9ismwxEtOco2JC+Dwhn92pJyF40HfmiJfO3FKKu
	YbfN0Ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHSt-00000003vJW-3Rqj;
	Wed, 26 Feb 2025 13:28:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHGv-00000003oJZ-2caO
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 13:16:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4399deda38cso42187015e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Feb 2025 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740575780; x=1741180580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QySj/3gXBapZsSsI8S6n09GzTe+ASut5dxFZ8ln3oQ=;
        b=NKxokJYsS/7G5AydULC/B8le8NGaFa0XFROlc3P1nM4GRM7pk/BeUWDvEib7x+n2ba
         tbRoLdYt8/2ek50QekPhJfCL748rTRs5cIPJDVCnsaK1QyOk0c0kqPHIKE3pH98xCHVA
         ZxQEoyqFYwbWarz75wRjNC5jWbd9+60uiQ7ygCoZVLfh4FWh8JhvpRFehxl9CnoWJuj8
         GUdJbg9+wcT5CyvSHGYWrYThChkxHNuHcoiOFiq6oxYEDi0xamvwfOoJJnyKDSEL61FN
         LUUaAQIsKnNbxPnIEaKFwUylcKavv3lOtECwpo42eGGPvQFVCtObigRYyDDDvSFKFQ/R
         FDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575780; x=1741180580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QySj/3gXBapZsSsI8S6n09GzTe+ASut5dxFZ8ln3oQ=;
        b=kfPqBcnmm+AZDdbKHkAbcKUJEqSongZen6lP+drRMlo8Ehqo4gwBKhl7Wak/Cr08Da
         etvM/14oh3fh7nyCM1iUAsxkf9PQZxR2P97ucnqA2FG5yDvmWzWgvCh2JY7viEh7HOcX
         pTzf1zH79OsQNPKVru0HJFWd86+1ya420U9p+NhNbz3QnpXAUfvn9Cemer6dEx0IXLrb
         OAG1Z4iQ6kbCCRt6zs3Pd/a8ckENc//2vp7QYNz0E9rezaj3KV2JVt3pZT+w1DJUcVXI
         clzOvXzJY4dHwXe5CyTFcrn1yy4p/HdTAC/96RaY2rEXNaHA1U7sunkaMZt3CEuV7vtd
         gK0A==
X-Forwarded-Encrypted: i=1; AJvYcCU57LztCJv03f/sJnzYww6OusNWxHerM4VwpT9AIo/olxbeY5IEcrrDSExb+/V1av7bodgeF9qJ76cRpQS7UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFPVl5RqsedmCIfz8e6QXUcXhi7f56NsP2Ef3gtYF0Db61cxbs
	ePuOdTZRCutqHRNN8AUmAMTOeynewUYEmrBllmpEmcwOrZ25WiLUZi0wLyCy7v4=
X-Gm-Gg: ASbGncvSuVi5dP2yPbLr/fIuzsl1jlk49peFIVxzurdz5lRS8wNQaN/6kBD7GqGQQXj
	i22KjKuCyB5/sObOKV9OkK/5mG7pNV8kSbvEe+n29mlOE8A5m+x6M0Ml6pKu5dfDt0ayp1+7n8e
	snsEnjPhWcrC9Mg9j4kaELrNaMBfQe7PNRC4jB06qi898xhG5EgiU+UbT20jcIabkiAshUn6mpB
	x9m0SqgLFn4qlNL42WVS5dLbDQMEv6v0ekCIB3jFHwLGcNGwfqG60Ri9X6SuiyyQoFg8A34cLB7
	gTQnC+Lz1k6by94IuH3D2ttWU/JaSoneIV96Wv8EdBhNxoCSNfgb6cKz2bN9SmLAXw==
X-Google-Smtp-Source: AGHT+IHBYfxG0X3yyvWm6nQA9LWy/PfeZqfB8z2wGt61RhxaaQMqUBMKTYu794JfjOFUOpOPcwvA6Q==
X-Received: by 2002:a05:600c:5123:b0:439:88bb:d035 with SMTP id 5b1f17b1804b1-43ab0f2887dmr70381405e9.5.1740575778320;
        Wed, 26 Feb 2025 05:16:18 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc96sm5706491f8f.31.2025.02.26.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:16:17 -0800 (PST)
Message-ID: <8c69314f-b7b9-4ad9-bcf1-6a57645f1335@baylibre.com>
Date: Wed, 26 Feb 2025 14:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
 <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
 <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
 <c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_051621_685842_D6965FD5 
X-CRM114-Status: GOOD (  34.55  )
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



On 26/02/2025 12:45, AngeloGioacchino Del Regno wrote:
> Il 26/02/25 12:35, Alexandre Mergnat ha scritto:
>>
>>
>> On 18/02/2025 09:52, AngeloGioacchino Del Regno wrote:
>>> Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
>>>> Hi CK.
>>>>
>>>> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>>>>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>>>>> External email : Please do not click links or open attachments until you have verified the 
>>>>>> sender or the content.
>>>>>>
>>>>>>
>>>>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>>>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>>>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>>>>> mtk_dsi_poweron.
>>>>>>
>>>>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>>>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>>>>> driver try to communicate, the DSI returns a timeout.
>>>>>>
>>>>>> The solution found here is to put lanes_ready flag to false after the DSI
>>>>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>>>>> setup of the DSI module.
>>>>>
>>>>> I'm not clear about what happen.
>>>>> I think this DSI flow has worked for a long time.
>>>>> So only some panel has problem?
>>>>
>>>> I don't know if it's related to a specific panel or not.
>>>>
>>>>>
>>>>> And another question.
>>>>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?
>>>>
>>>> The workflow should be:
>>>> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
>>>> re-do dsi lanes setup) | ...
>>>>
>>>> I observe (print function name called + dsi->lanes_ready value):
>>>
>>> Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
>>> is internal to the mediatek-drm driver.
>>>
>>> That callback is called by mtk_crtc during setup and during bridge enable(), and
>>> there we go with suboptimal code design backfiring - instead of using what the
>>> DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
>>> this issue.
>>>
>>> Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
>>> there you go, that's your problem here :-)
>>>
>>> Should I go on with describing the next step(s), or is that obvious for everyone?
>>>
>>> :-)
>>>
>>> Cheers,
>>
>> Ok thanks Angelo.
>> Can you let me know if you agree with this change please ? This should be better:
>>
> 
> No, no, I'm saying that we should do the exact opposite of what you're doing here!
> 
> We should drop the MediaTek custom stuff that duplicates the DRM APIs behavior(s),
> and conform to what the DRM APIs provide and want us to do.
> 
> To be really really clear - I'm saying to delete and avoid using:
> - mtk_dsi_ddp_start()
> - mtk_dsi_ddp_stop()

Ok, that what I though first but when I've tried to remove it, the board hung at boot as described 
in this old patch:

https://patchwork.kernel.org/project/linux-mediatek/patch/1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com/

Even if I do some little change that (like remove mtk_dsi_start) allow me to boot and make DRM 
working for HDMI, DSI still not working at all, I need to do more effort to rework the DSI init.

In my previous suggestion I forgot to say "Since the goal of this serie is to add display support 
for genio 350 but not rework/fix DSI driver, is it reasonable to do a soft fix first and then work 
on another serie about legacy stuff issue?"

> 
> The spirit here should be to use kernel provided APIs, and to make custom stuff
> to disappear as much as possible (again, that mtk_crtc .start/.stop).

> 
> I'm not saying that literally all of the start/stop callbacks for all of the
> MTK DRM drivers should disappear *all at once* but... gradually, one by one,
> these should get lost (where/if possible).
> 
> Just one more mention: that custom handling also backfired on me while writing
> the hdmiv2/dpi drivers... and now backfires on dsi, and in the future it will
> backfire again on something else. It's there only to give problems in the end,
> not to solve them :-)

Is that issue fixed for DPI ? I'm asking because the following struct still used in mtk_ddp_comp.c:

static const struct mtk_ddp_comp_funcs ddp_dpi = {
	.start = mtk_dpi_start,
	.stop = mtk_dpi_stop,
	.encoder_index = mtk_dpi_encoder_index,
};

But maybe what you fixed for hdmiv2/dpi isn't related to this.
Can you link me the patch where you fix that please ? I think that can help me.

I'm 100% agree with you to remove MediaTek custom stuff that duplicates the DRM APIs behavior. The 
genio 350 display support patches has already be stopped and reworked for of graph support, now 
stopped by custom framework issue. What do you think about to validate the "DSI hotfix" to merge the 
whole series and open a dedicated series to cleanup custom start/stop from MTK DRM framework ? I'm 
really asking for your deliberation, not trying to force it when I say I prefer merge this in the 
current state :)

-- 
Regards,
Alexandre

