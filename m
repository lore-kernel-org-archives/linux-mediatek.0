Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D088C4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:07:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E223C221F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E223C221F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S1iTB2rC9X3HP/8pnMpkfNFJUNYbLyFbg6K27fKPhxc=; b=H6Yt+cKN7cNgKEF+eTats6V5/
	BhPukwjfgZU3QWMNMFmuhypLcGsWeGriZDgR1LknNPQ6cBFlT0QiZWtqc/5LGFzGDHIVEhZLAcMoH
	3gIOk4k9FUXjwB96e0PKlZVveg2PEnBJIU5dskIgCOHYE1oHxQMWbtmC7V0xXqibILP8p69c3OYmv
	RK4BGwD79GORBd53rG8H/ZFGpFCr+b3suK8ngyKaEAPNM5DdQhtulhveBx43HLbXCIdnObZ6VdNQQ
	ifEkdOM6AricqSQBvgx4WSQkvvzPulsWwMu8gLXjKZJmVS01lUGrh4VZinkR6pXHNU7Wvf4p49+bA
	ZbhUn7L1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkusQ-0003z9-On; Thu, 03 Dec 2020 20:06:54 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkusO-0003yR-QJ; Thu, 03 Dec 2020 20:06:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id e7so3146394wrv.6;
 Thu, 03 Dec 2020 12:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PWPu1GzqV5FHg9xfQEvSGAQ5O7PflnkxSHLUb6RuJyM=;
 b=POS58uipglTVurisya+5rLohAt4eYU71k/c9L9Bltt3/oIrteIkrshnDW0l2ncjz6O
 vTyEq7haqlzshO+n2+++DxdnwTNrTd21393ZbXF2cSGelFOjPNZgr1GWvbBturH2Sz12
 RgQ6CNvxQ5dc/NUe5rdBn5cMP8Xb+40FXWFAEdGuZqBl7YdrQgZ3tt5dl5nxtgxBuO1d
 9PX0cgN8H/q/Sc//z4FEb8csQy5ePxscGBctMZQZPQ7amVIwIcMSh+BgEYRFWGJ6QsFg
 ZxDTa6zdpDuKPMT1h8EMJ6lIRVl7xKIowMfGk+9aAwi2yg7nzpSwFJTVBKfDEjvCcbef
 4u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PWPu1GzqV5FHg9xfQEvSGAQ5O7PflnkxSHLUb6RuJyM=;
 b=XBMIcRwea1I+1Bk3KKPOQigIg9nSM302rURGpUkZFPT+yGjF1mENXdljNFTFIHCKOV
 mHCweAtuChX+D/W2amyyIkxHmic7BSEavjbxUeXZPnuHN8Czb05rb2P7qHj9dqs3I/oA
 dGiCtTgce92Rau0/dt+8jry7RaqDce5HnOgKJu7oA9wf1JoCniPw6qfDwBUUGpRHHup4
 wmne7cxusJc82sLz8YOgS1ZAxMlJseyvM5L3qRfIRAF9hKUUdzTaU5GWfQE3J7WrmRbj
 VB6zU+47vcA/hKg/kbfFNKsflliUd1Uv5zou0Idyvtle/N/PGGeuM8P+lowl5MoTbIh2
 QuUg==
X-Gm-Message-State: AOAM533K0WPsSdOc9SrYDeA1wot1YNXWoC+74LuaPIMl6PdNTfGFV01p
 8U6yqageSY2RF67HNO9r5OU=
X-Google-Smtp-Source: ABdhPJxAioMssVD6ZRb5IlWH5ouH50sbnP5fPPTaWPj9wd/3CdZiufgPuMXWtLmqim46JhmP6mK6+w==
X-Received: by 2002:a5d:530d:: with SMTP id e13mr1018783wrv.92.1607026010695; 
 Thu, 03 Dec 2020 12:06:50 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff?
 ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
 by smtp.gmail.com with ESMTPSA id c2sm741399wrf.68.2020.12.03.12.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 12:06:50 -0800 (PST)
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>, Gene Chen <gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
 <20201203114044.GA9061@duo.ucw.cz>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
Date: Thu, 3 Dec 2020 21:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203114044.GA9061@duo.ucw.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_150652_910995_92F257E4 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Pavel,

On 12/3/20 12:40 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +++ b/include/dt-bindings/leds/common.h
>>>> @@ -78,6 +78,7 @@
>>>>   #define LED_FUNCTION_INDICATOR "indicator"
>>>>   #define LED_FUNCTION_LAN "lan"
>>>>   #define LED_FUNCTION_MAIL "mail"
>>>> +#define LED_FUNCTION_MOONLIGHT "moonlight"
>>>
>>> There's "torch" function that should be used for this. I guess comment
>>> should be added with explanation what exactly that is and how should
>>> the LED be named.
>>>
>>
>> According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
>> LED_COLOR_ID_MOONLIGHT definitions",
>> The Moonlight LED is LED which maximum current more than torch, but
>> less than flash. Such as front camera fill light.
>> I think our channel is moonlight, not torch.
>> I will add this description to comment.
>> We can't exactly define moonlight current level, because every vendor
>> has their own specification.
> 
> So... what is the timelimit on moonlight?
> 
> But if it is used for camera illumination, I believe it should be
> simply called flash.

Let's keep FLASH reserved for LED flash class devices.
This device has already two other flash iouts.

Also iouts amperage gives clue that they have three different
functions.

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
