Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC65C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:23:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505B4207FB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nrqvK09Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYMm1Op3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505B4207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CxD6yF01iv6AViLIpR5yPNpQ8bMq8VY7MoHztm9eEHc=; b=nrqvK09YyKWY0Wp/Y7EUOsPt/
	esmkLX3eomSE+33DYRYnyjMCUcbmfS3AN/geUuYqhAi0hzD31E1ZquZkOVqm1pJCM46C9ZDInxV3I
	3DNAe6do7DoycxL1P0fkolBTHuWNKSACZi6vMxZHWikFU1UOdhb24Ye07Ln3xV3QBRTwMa7RxwYot
	YJlHhaJq+ylnrfRSwBaseqrDbSONHkIxUpIMQL8Jh3QtucX29T/wLeyWiFkVoyLvMl/lZrYWmt1oh
	VAwWmhPkudRh+mExLiV1BkCCHsnwZEMKjoRScv2qbXkTER+ryWwwf7KvkNk2kNP/R82Mixf5whE2W
	az59G3B2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzUG-0005e6-Hk; Thu, 01 Oct 2020 14:23:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzUA-0005d0-So; Thu, 01 Oct 2020 14:23:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id e2so3326749wme.1;
 Thu, 01 Oct 2020 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y+2B+pcV3Fu1pu4NHRwm3CYjaljlBcFBr4Ni3eTuikI=;
 b=nYMm1Op3IOaM0KSqxAndzKiQ2vv4rjVjHEh/864/SCK9F16+Pt8E5v/wGWZZr77J13
 ayJZlaADkprcKI0XJ3s3YX1s1/EZ3yRumDT4l4nRkBE6UED7kRIjhpBJFw9yMOp8xnWf
 gHSKSgorAlAW/+gP7ryrZ6ZfCDLWc4jNOJ34d7wBHxeJLIamBYyc18rVR4+GrbLxJype
 c4hqbHNw1Ys6OaS5/QE1V6JAB1nJtD8Glt3JmlNWJwFpMUNI8qVx8e6MqIECwhN/2m41
 +WON1Oq1B7DxmbK6Yb0QAVjf+b1eQVYIQutxJlg5ySL179W8LvzaYgdZ3GrBTZ5mXhgO
 N9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y+2B+pcV3Fu1pu4NHRwm3CYjaljlBcFBr4Ni3eTuikI=;
 b=pRxbfhAEqcz62c8qAP4G5eSI1mMsN8mQIZzmlKKNLo3oN9fFwvADnLleSl79PKlbow
 wzpW+Tl5SaSA2dpeUpqIWBrarPizdtLwUkdb7c7QX1vyTwztHoOJlGks/OglaTJTuDQb
 YjErzKq1L2eTm6tiZ7bAFDM9NN8o6Q7lK0evzmhe2EToYdPwE+nJIOfboMJOMWsfueNS
 TPEgy7fdKVKes9a/1MMrpk2TJ2F0VWJTtCoVfD/e+m2+ZYFTvLuj6H9gYh1Z8hJxHptf
 5Km9a0mdWFtbVsHVXvSamkKsgu495vhWnbdVjF0Q2N0A3PvN3D3uh2iOX2xcb/S7wzmo
 Qx5w==
X-Gm-Message-State: AOAM530+82Xk1XIJ6gZDcrAvPsaWU55yJ6OeXXQhe0Jas6r4+z99MDdC
 P85dLUQhPZpfn/6jbEgS6Bc=
X-Google-Smtp-Source: ABdhPJxAPZCu4b1u8/joIZ2OxrpgS4eOuWo0l3x+CSD4FISYIxtkNNsR8R87Q8NjR9im+QOocPgHXg==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr243842wmf.159.1601562185789; 
 Thu, 01 Oct 2020 07:23:05 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id h4sm10880906wrm.54.2020.10.01.07.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 07:23:03 -0700 (PDT)
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
Date: Thu, 1 Oct 2020 16:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_102306_981449_DA486334 
X-CRM114-Status: GOOD (  15.36  )
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
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal,

It seems you forgot to send the email to one of the maintainers, Wim.
Please make sure you add all the maintainers from get_maintainers.pl when you 
send a series.

Regards,
Matthias

On 29/09/2020 05:20, Crystal Guo wrote:
> v5 changes:
> fix typos on:
> https://patchwork.kernel.org/patch/11697493/
> 
> v4 changes:
> revise commit messages.
> 
> v3 changes:
> https://patchwork.kernel.org/patch/11692731/
> https://patchwork.kernel.org/patch/11692767/
> https://patchwork.kernel.org/patch/11692729/
> https://patchwork.kernel.org/patch/11692771/
> https://patchwork.kernel.org/patch/11692733/
> 
> Crystal Guo (4):
>    dt-binding: mediatek: watchdog: fix the description of compatible
>    dt-binding: mediatek: mt8192: update mtk-wdt document
>    dt-binding: mt8192: add toprgu reset-controller head file
>    watchdog: mt8192: add wdt support
> 
>   .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
>   drivers/watchdog/mtk_wdt.c                         |  6 +++++
>   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>   3 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
