Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CE7C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 18:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B8064DF6
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B8064DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5C1olsMgsszw2yxu00FCwUpu/Oi559btG02w8l95XPk=; b=NYIeL1tZ7TU9L5yRTEn5iuHte
	ktPv5YB5KR3YXTt6c6QVfoWZBjp+Vc2MHWWN8M5v08X5RVsJqIRDGwypOSOCo7C/fdi5gpTOxqA1A
	eOrftScr3e8J3KgRVRpQx2JITUJ9X3cYWnQDx7u5YCQcfOOeTuRcw8EsMXB7AF5IuYNw7eWLSVp9t
	kQ5rJXfo1mVA2BeLlNkADn+qn7yDmK8ov73I/4+aG5wdc21UouIXs89YjtNdkGcMePJn6DjeQ1pln
	f4xCMGzpU7VlTFb1S6t6Y7BzPAJ3hVBZZEg5Z41gi1FXhIBRmH2cz49S1UqiEoRhzBZBeuY5HvucW
	hnYwq5ahA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8p6w-0002b2-4R; Sun, 07 Feb 2021 18:48:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8p6t-0002Zl-Gs; Sun, 07 Feb 2021 18:48:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id t5so15599230eds.12;
 Sun, 07 Feb 2021 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EGUleL2eUhQNkqgdSNGHaB4lMTeXgM8GYS8mqXoep18=;
 b=ToR10LHsn60YUDp2DP0hDjaXCyVzc8zWU/NGOLWEgKHS6gMxtdfHAMZ6v3cS6X0/iY
 aZwv5NRsuqKhCHL0rJMZX+249h0GhfVmma5wrykmnWvvGkZA1mHvIEORbNp5IKyPx1R7
 47IGQ16ETe9b+F4QIb+C5P/JwoY+vv0K3Vzn1umWLIBVY+eKNZSTJIkzD89xhjqn+mF3
 UeY+vdZsEvvSLhf5zMl3eweZVvJ8gQ/AZEVlLre/YN1LNTwHJE9ErIpyR1+rmASTrOnV
 mDbZaSTdvK4AdIeqguB8QY/JDaKUe1YwXadFwDC0rB684zoN3pZTw5ABoJWssinMRv9Y
 GUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EGUleL2eUhQNkqgdSNGHaB4lMTeXgM8GYS8mqXoep18=;
 b=BH+O/ZhHbTfVjuG8V4+CihNvjp8UaSj9+brvLDln6bIR4Ec/pQcabO90vj/KQO3TAS
 ySWB3mwSLx8F0pGhTvhx31RUL05cPwEaZojfE3g5h2+KOHyiNfjvhTZzfCGS/kryvU2z
 nNldf+KlaTUO6rFGv+PSt1LQawVFVGf7Ue9fANrs2ebs8wWDQuJ2UyH87TT2dCL9pLIE
 eFmX94gpA90IMeqGGReXp1AKKzAnTXyvQ6eDmP7b2iNJvHXkElHFaqTEBmSzCA6tcKRE
 FbhxlH/WRZkZgk2kPMA05kEfnHUiY3cjZRd0bUAKINnVxzzixgx2p1SC4uoNlODoMu0H
 D1Iw==
X-Gm-Message-State: AOAM531nqypXUGT6CQksQK5vcRMu/E6Hmb7E4YlThgvhQA/yjJ4uiTSR
 QSiy0l0CFHAJNseZIFMLoWY=
X-Google-Smtp-Source: ABdhPJw0mfAfPKKjiEL+LasOhxLInAfCF/IyAaxDCVbPW22DiVvyPcta0oxPzyEwqia1eDWJFUublw==
X-Received: by 2002:a50:d6c1:: with SMTP id l1mr13873785edj.336.1612723716670; 
 Sun, 07 Feb 2021 10:48:36 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id bz20sm7383803ejc.38.2021.02.07.10.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 10:48:35 -0800 (PST)
Subject: Re: [PATCH RESEND v5 8/8] arm64: dts: mt6359: add PMIC MT6359 related
 nodes
To: Tzung-Bi Shih <tzungbi@google.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-9-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1cbf58f1-376c-fa93-98a2-53a41fa24273@gmail.com>
 <CA+Px+wXP2vrFbou+SCRZuXYr4XPPxYHZfk+oSM7_GPXZSD24UQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f0ed6a53-d2ee-4699-10c9-e2d937f0ff60@gmail.com>
Date: Sun, 7 Feb 2021 19:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXP2vrFbou+SCRZuXYr4XPPxYHZfk+oSM7_GPXZSD24UQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_134839_605827_B90D58B3 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Fei Shao <fshao@chromium.org>,
 Ran Bi <ran.bi@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Eddie Huang <eddie.huang@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, Yuchen Huang <yuchen.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/02/2021 04:51, Tzung-Bi Shih wrote:
> On Sun, Jan 31, 2021 at 7:06 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>> On 29/01/2021 10:49, Hsin-Hsiung Wang wrote:
>>> +             mt6359codec: mt6359codec {
>>> +             };
>>
>> I understand that the dmic-mode and mic-type-X depends on the actual board on
>> which it is used. In that case I think we should add mt6359codec node in the dts
>> instead of dtsi file. I'd advise to set these properties as well as otherwise we
>> get a (slightly misleading) warning in the driver.
> 
> I feel it is better to include the node in dtsi to represent the whole
> MT6359 PMIC.
> 
> We could either:
> - Set default values of these properties in the dtsi to avoid the
> warning message.
> - Or https://patchwork.kernel.org/project/alsa-devel/patch/20210202033557.1621029-1-tzungbi@google.com/
> 

As this got accpeted upstream, you don't need to do anything about it.

Thanks for the pointer.
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
