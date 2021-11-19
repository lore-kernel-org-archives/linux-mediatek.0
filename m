Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C61C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5466C61A7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5466C61A7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0HfHfhu8OswguVTVuvDF74DjOmWQHwHj5sLwQwAqhA=; b=iPJfxJLS/BL8JH
	SCZEcnD/H4RzXe8J5H9AsTx89YBT/oEVXEj4oNs5dxDRiGzjtPPJVtdZRUqPDhGsho8oukjQ+IoEP
	h8n3myt+cPS7fgaVvXlbIe1EOvHTSO0zE5jKtePtBoyBiV9zFJq1l9+SWv02TLXCJ0Dt3cG1fAKq+
	8vrl2EmswxVhJPRxC7OY3xoBfA7d69wUgr+xVGlC/E1L1M1kShPhI8DMCtsYvLJHhr/u04Z7AhIKR
	8d6I63uNYMGLh9oM1fShdC+t8JVyIqQ1CvJtUBT50dhKY/XEeM1VTMg9rJ9EeNVXd3zL9dZAdIeW2
	XlVgi/IX7Inc45EbZhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo1B7-00A7th-08; Fri, 19 Nov 2021 10:31:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo1At-00A7q5-GZ; Fri, 19 Nov 2021 10:31:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id i12so8019145wmq.4;
 Fri, 19 Nov 2021 02:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=8qcNpIruPHOCURb4JPC4y8c/ZrBHmkV4VFdtM1GCETA=;
 b=W3Kulo/fHkMbv97aIBfN6IqZZZXmcgt+wmegf9k/5c4Ual92oePzDiGvmj09fe4La8
 ig2A9HwnkSlKQ7YQhBKpses7douOzDMq58ktoURi6CY/H+Gb5gSkOSuZ38sjzSAfnVig
 q3x1wZxK6YipnY+VeRsxaCMAPp9yC1BTtb6w6WEHPiNLnrsP62BsWSdenSePW7/IOz2j
 N5duvEcPMePXbGv/NmTi3vlI2sN1bWPv2Ft7guCFgBEQKMHeIEf8D5yJZlLXXzb9JROy
 uAOeke4EGOVq4Yc4zNv12at89xu9f9U44XZXkNhH7S8XkjQWTDbsc0xuygv0QV/6WfG+
 ksfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=8qcNpIruPHOCURb4JPC4y8c/ZrBHmkV4VFdtM1GCETA=;
 b=mDgU/qAWBEzohKv09ZXWeTSn4zaGKRtKwGSodwEUo2wM1a+3XzM6WYCnwf4s3IrcgZ
 eY8v80NEbloS3th1dp4fK6y8BCYyVkLUApz9PGy2q5TCGCfc4ivS/gaPqH6dZPscgqrm
 NhUUzZdpA6QTdJZC2CtcI4KnTljvTte2Z2u+EBDEnmow4/nU4RFvrSsuoj2l5qM2SzMn
 EOXbgVj45dhTQIEIK4DmWM5SkR539xITY/NZQlEEr0Go770lprJb2LDaeOyXoE77+3s2
 Y+XyPYdvqxyp/ZtaKrGSRFj8jhcWolKT40XUAMBol4/a20tqmu+GuMY1AzCgF9rYuWLc
 6Qkg==
X-Gm-Message-State: AOAM530u6u+8wLxplPEkg9vyu3NQBB/bmjYWMuMxi0LVAMRW42Erb9bG
 Eo/X/WcHcrMv1VQIKqjWeuE=
X-Google-Smtp-Source: ABdhPJwwKQv4fbKDqpxSYakdfFxL2W7Mh9oHH00GiSJk8QVXtjUQFhLBp0xI1vw7UMTKTzpQynNkbg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr5611132wmq.7.1637317877617; 
 Fri, 19 Nov 2021 02:31:17 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id h22sm2952241wmq.14.2021.11.19.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:31:16 -0800 (PST)
Message-ID: <a4605e32-3af3-5636-6682-475bef8448d1@gmail.com>
Date: Fri, 19 Nov 2021 11:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211018114009.13350-1-sam.shih@mediatek.com>
 <20211018114009.13350-3-sam.shih@mediatek.com>
 <d411aec5-efa8-c71d-8179-54ff52c17039@gmail.com>
 <d299493d8fec0f34f527942f2cdedf15f2136c9a.camel@mediatek.com>
 <c5c0849d-a95a-25a0-11f8-9156770afc10@gmail.com>
 <59963509ec833009f5c10f0a1aee91670224c6c7.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: mediatek: add basic mt7986a support
In-Reply-To: <59963509ec833009f5c10f0a1aee91670224c6c7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_023119_586673_C5731684 
X-CRM114-Status: GOOD (  24.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

	

On 18/11/2021 04:48, Sam Shih wrote:
> Hi
> 
> On Tue, 2021-11-16 at 12:18 +0100, Matthias Brugger wrote:
>>
>> On 16/11/2021 02:39, Sam Shih wrote:
>>> Hi,
>>>
>>> On Mon, 2021-11-15 at 17:27 +0100, Matthias Brugger wrote:
>>>> Hi,
>>>>
>>>> On 18/10/2021 13:40, Sam Shih wrote:
>>>>> Add basic chip support for Mediatek mt7986a, include
>>>>> basic uart nodes, rng node and watchdog node.
>>>>>
>>>>> Add cpu node, timer node, gic node, psci and reserved-memory
>>>>> node
>>>>> for ARM Trusted Firmware.
>>>>>
>>>>
>>>> What is the exact difference between mt7986a and mt7986b? Right
>>>> now,
>>>> it's only
>>>> the compatible, for that it makes no sense to split them.
>>>>
>>>
>>> The difference between mt7986a and mt7986b is pinout which
>>> described
>>> in our pinctrl patch series
>>>
> https://urldefense.com/v3/__https://lore.kernel.org/all/20211022124036.5291-3-sam.shih@mediatek.com/__;!!CTRNKA9wMg0ARbw!0kseU8x1KnHHXDErh6Yj6MKqecufPEfGyeumtTBism47e99UFO2Gs-HfWjL1_jUv$
>>>   
>>>
>>> You are right, in this "basic SoC support" patch series, only show
>>> compatible differences
>>>
>>>> It would be good to see what the exact differences are, so that
>>>> we
>>>> can see if it
>>>> makes sense to have one of the alternatives:
>>>> 1) use a common mt7986.dtsi which get included by
>>>> mt7986[a,b].dtsi
>>>> 2) Use on mt7986.dtsi and only add one mt7986a.dtsi or
>>>> mt7986b.dtsi
>>>> which has
>>>> add-ons.
>>>>
>>>
>>> In this case, can we use solution (1) to create a generic
>>> mt7986.dtsi
>>> in this patch series, and add mt7986[a,b].dtsi to the dts part of
>>> the
>>> pinctrl patch series to separate the difference nodes?
>>>
>>
>> If the only difference is the GPIO controller then why not go with
>> solution 2.
>> Create a mt7986.dtsi which holds e.g. the node for pincontroller
>> mt7986a and
>> then create a mt7986b.dtsi that just changes compatible and gpio-
>> ranges:
>>
>> &pio {
>>      compatible = "mediatek,mt7986b-pinctrl";
>>      gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
>> }
>>
>> What do you think?
> 
> Ok,
> 
> For this basic patch series DTS, I will send the next version:
> - Use "mt7986.dtsi" instead of "mt7986[a,b].dtsi",
>    And make"mt7986.dtsi" get included by "mt7986[a,b]-rfb.dts"
>    (No dedicated uart1/uart2 pinout for mt7986b-rfb, status of dts node
> shoud be set to "disabled")
> 
> 
> For the pinctrl patch series DTS, I will send th next version:
> - Add "mt7986b.dtsi" according to your suggestion,
>    the new include
> chain will be:
>    mt7986a-rfb.dts <-- mt7986.dtsi (mt7986a pinctrl)
>   
> mt7986b-rfb.dts <-- mt7986b.dtsi (mt7986b pinctrl) <-- mt7986.dtsi
> (mt7986a pinctrl)
> 
> Do you agree above proposal?
> 

I mean something like this:
mt7986a.dtsi:
pio: pinctrl@1001f000 {
	compatible = "mediatek,mt7986a-pinctrl";
	reg = <0 0x1001f000 0 0x1000>,
	      <0 0x11c30000 0 0x1000>,
	      <0 0x11c40000 0 0x1000>,
	      <0 0x11e20000 0 0x1000>,
	      <0 0x11e30000 0 0x1000>,
	      <0 0x11f00000 0 0x1000>,
	      <0 0x11f10000 0 0x1000>,
	      <0 0x1000b000 0 0x1000>;
	reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
		    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
	gpio-controller;
	#gpio-cells = <2>;
	gpio-ranges = <&pio 0 0 100>;
	interrupt-controller;
	interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
	interrupt-parent = <&gic>;
	#interrupt-cells = <2>;
};

mt7986b.dtsi:
#include "mt7986a.dtsi"

&pio {
      compatible = "mediatek,mt7986b-pinctrl";
      gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
}

mt7986b-rfb.dts:
#include "mt7986b.dtsi"

&pio {
	uart1_pins: uart1-pins {
		mux { [...]


mt7986a-rfb.dts:
#include "mt7986a.dtsi"

&pio {
	uart1_pins: uart1-pins {
		mux { [...]


Makes sense?

Regards,
Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
