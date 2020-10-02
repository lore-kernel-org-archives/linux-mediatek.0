Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD810C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:51:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A9E20665
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OaLerSc1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0qTRfWz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A9E20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ld3u3ClmuReIjRcBduqwN259lJKiHUBcOC4y3evUBJ8=; b=OaLerSc15rh/dz6hWAer9aiyO
	cLiSehBHuL7bui/sl8F8agBG7gFBGLv4+21s9JAzw4rrhR/b5DhX6Uc/DtNevojbUMETxQZPde1Hk
	pJl8v1i/6p+laRGVv2yrsIPGq9LpnM0XDi7qRHL4KOS20X389/2w51j+6XKrQNx3YT4MHEGpThiI0
	Er4fdYOtd7JDorrBq1JvFiDfA7L08heHd/CpVKRHhk9L8pVrwiEOwO19d1k5YUU5Ww+6V2ThAOCuy
	DcpUyC/DXyP4jIc3qFvYGskv2iEepodQSMvv5TJ8RTvlj29d8Xo5sP+NIZ9zVhPYVZhDQpqut8F4N
	8Rj/+eNEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHiz-0008Py-Af; Fri, 02 Oct 2020 09:51:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHiv-0008Ox-2E; Fri, 02 Oct 2020 09:51:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id e2so1064927wme.1;
 Fri, 02 Oct 2020 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JsKpxIiLUITlisbV8j9skikAqGMR95uSktowmIHgutA=;
 b=A0qTRfWz7cq1fco4qQLSV+miarttvfkt3vP+GSiw70hT9BCOt+wSdPs899qcCx2xKN
 cDuAUC8HQLYYH2w3wdCpmhbizZ15YFzyl294yfbq47OA3qXwB6ol/UCrlwsQXEddBDgm
 RADxIyK/CoWlcf5XfFKgLfmKqkFiSVA2BIq1+7j4uQpJQQFXFx2VF87JB7VlwnOwdI12
 MypAY7IfvebVTJhqfTvCVCGPBK7E/nKNNR4oEdS+uSHZmu9CcsopgdCYgmdI1HrZnFIH
 P+f5oD0xwWv9GXoqlTV7uVp3abzcQig12WqxZG1G/cPQH97YOOgD1ZxzxFC5JUsRsRM+
 8pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JsKpxIiLUITlisbV8j9skikAqGMR95uSktowmIHgutA=;
 b=TAGjq+Fox/Bu1S2fuwl5Ku4gk7A/o9nF71NBoIxOITwS1JG0NPhkVYGCJU/gK1Znt5
 JKKX0lggtGLRRfQh0HGmJD6fgQ5vSEfxuGhnN8xrfXtmd1qz7MH0psW8yajXOfgTGrUV
 OgzjI6cWoRmSaKYFXyz8w4l2GiR2bttQxCQElrl1BuYz/oxcILIOVHvNlgfjPCc/2YIg
 oodsjlTMHZuOprfGjUjzsGpyVOa9Vh0qXAYdON8KaSVoIZB13QZYC2qUYM4P/8B77iXN
 KgX+4UgirsxAblqrA2Kl/OBgfYoCwjeL+nAs8n6plM8COHowtqQ5qyu2vY47uSWlSFtq
 J/bw==
X-Gm-Message-State: AOAM532z87PFaURx4JJKnR2VItz5gY6v8XlFGEnaTCZLEQsP50XqSVvt
 jYAEKeStezY1B1eQYgx4jZg=
X-Google-Smtp-Source: ABdhPJwNDnpt/0BeWbOMzXzen90CR12CPrbzs6M71xmRuxcdAaZr3YP6i5A4dN7kg7kt5841P7JjYQ==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr1821738wmh.166.1601632291761; 
 Fri, 02 Oct 2020 02:51:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id c4sm1129964wrp.85.2020.10.02.02.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:51:31 -0700 (PDT)
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
To: Guenter Roeck <linux@roeck-us.net>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
 <20201001151639.GC64648@roeck-us.net>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
Date: Fri, 2 Oct 2020 11:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001151639.GC64648@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_055133_231276_58D4CA9E 
X-CRM114-Status: GOOD (  29.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/10/2020 17:16, Guenter Roeck wrote:
> On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
>> Hi Crystal,
>>
>> It seems you forgot to send the email to one of the maintainers, Wim.
>> Please make sure you add all the maintainers from get_maintainers.pl when
>> you send a series.
>>
>> Regards,
>> Matthias
>>
>> On 29/09/2020 05:20, Crystal Guo wrote:
>>> v5 changes:
>>> fix typos on:
>>> https://patchwork.kernel.org/patch/11697493/
>>>
>>> v4 changes:
>>> revise commit messages.
>>>
>>> v3 changes:
>>> https://patchwork.kernel.org/patch/11692731/
>>> https://patchwork.kernel.org/patch/11692767/
>>> https://patchwork.kernel.org/patch/11692729/
>>> https://patchwork.kernel.org/patch/11692771/
>>> https://patchwork.kernel.org/patch/11692733/
> 
> This is less than helpful. It doesn't tell me anything. It expects me to
> go back to the earlier versions, download them, and run a diff, to figure
> out what changed. That means the patch or patch series ends at the bottom
> of my pile of patches to review. Which, as it happens, is quite deep.
> 
> I will review this and similar patches without change log after (and only
> after) I have reviewed all other patches in my queue.
> 

I understand your comments on hard to understand change log. But I think you 
acted to quick to put this series to the end of your queue. I'll try to explain:

In v4 you gave your Acked-by and Reviewed-by for the patches that in this series 
are 3/4 [1] and 4/4 [2] respectively. You also gave your Reviewed-by for 1/4 [3].

In v4 you stated that you wanted to wait for a review from Rob for the binding 
changes. Obviously it's up to you to handle that the way you want. From my point 
of view these are rather trivial changes.

In 1/4 are deleting compatible fallbacks in the bindings, as the driver provides 
SoC specific platform data, which you reviewed.

One can argue that this will break older devicetree bindings because the driver 
using the fallback would work except for the topgru reset controller. But I 
think this is the job of the maintainer of the driver as Rob won't be able to 
look into all the driver code to decide if any change to the bindings is 
backward compatible. With your Reviewed-by I understand that you are OK with 
this change. As SoC maintainer I'm fine with the change. MT2701 is a SoC that's 
not available to the general public. MT8183 is available, but only on 
chromebooks and I don't expect anybody to use an older kernel without watchdog 
driver support for mt8183 (enablement is still ongoing). Actually I took the DTS 
counter part already through my tree, which was an error, as we now have a DTS 
which does not hold to the binding description (until and if you accept 1/4).

The only patch missing patch is now 2/4, where Crystal added your Reviewed-by 
which you never gave. But it just adds the compatible to the binding for a 
driver you already gave your Reviewed-by. So I think this the series actually 
just fall through the cracks.

Sorry for the long mail, but if you got until here, I hope I was able to 
convince you to just merge the series :)

Best regards,
Matthias

[1] https://patchwork.kernel.org/patch/11697493/
[2] https://patchwork.kernel.org/patch/11697483/
[3] https://patchwork.kernel.org/patch/11697477/

> Guenter
> 
>>>
>>> Crystal Guo (4):
>>>     dt-binding: mediatek: watchdog: fix the description of compatible
>>>     dt-binding: mediatek: mt8192: update mtk-wdt document
>>>     dt-binding: mt8192: add toprgu reset-controller head file
>>>     watchdog: mt8192: add wdt support
>>>
>>>    .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
>>>    drivers/watchdog/mtk_wdt.c                         |  6 +++++
>>>    .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>>>    3 files changed, 39 insertions(+), 2 deletions(-)
>>>    create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
