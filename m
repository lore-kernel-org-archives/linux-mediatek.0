Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46495C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 13:57:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA5F2225B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 13:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBDW9v+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA5F2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ftxnzxh3UNEybxBdFCVlbOwpg+VRLzXuBmuD7xCcHzA=; b=SBDW9v+mLTsO9GDVO2jKqYeqa
	74vkpu5KjhnM7uJiGg/JBJLA5Eh6M9VypwBaDSEUeo4UgEcx6TwqqN2aI0ViJVLcChai5naGo2Dnu
	5ZkJl9xdYNTSey6GrSO2TI5eHKfPuCM74DMMga0F82uCjw/Sw3PMjbwIxJTHn3qsqaThKQXRNpYVU
	EGeNHBR7hk9aW5Xedg1JE5tbuvgfeO28APTz5k6dyg1jmdZ9tJZmMiHc45cSq4sY6cvCEMkOV+W3g
	paaNYUNbufzbG9Ml38wxt/+F6BWRtxYTCyOgJ3SLr0I+jOMS2bJ87/cN/U48kqRY1iZ61dWB9u2Ch
	ZULyhz00Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQstb-0006Tu-Ig; Fri, 09 Oct 2020 13:57:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQstV-0006RC-Pe; Fri, 09 Oct 2020 13:57:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id B941B29DE7B
Subject: Re: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
To: Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <1601028361.1346.38.camel@mtksdaap41>
 <19678952-e354-2067-e619-ffac28b347be@gmail.com>
 <1601967207.8638.4.camel@mtksdaap41>
 <f2185b28-0b1f-8cf9-8717-12e28cf2bbf0@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <181df5c6-9046-5273-879b-ed0d1a59c8b3@collabora.com>
Date: Fri, 9 Oct 2020 15:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f2185b28-0b1f-8cf9-8717-12e28cf2bbf0@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_095713_961067_91796729 
X-CRM114-Status: GOOD (  24.51  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 9/10/20 14:50, Matthias Brugger wrote:
> 
> 
> On 06/10/2020 08:53, Weiyi Lu wrote:
>> On Fri, 2020-09-25 at 16:04 +0200, Matthias Brugger wrote:
>>>
>>> On 25/09/2020 12:06, Weiyi Lu wrote:
>>>> On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
>>>>> Dear all,
>>>>>
>>>>> This is a new driver with the aim to deprecate the mtk-scpsys driver.
>>>>> The problem with that driver is that, in order to support more Mediatek
>>>>> SoCs you need to add some logic to handle properly the power-up
>>>>> sequence of newer Mediatek SoCs, doesn't handle parent-child power
>>>>> domains and need to hardcode all the clocks in the driver itself. The
>>>>> result is that the driver is getting bigger and bigger every time a
>>>>> new SoC needs to be supported.
>>>>>
>>>>
>>>> Hi Enric and Matthias,
>>>>
>>>> First of all, thank you for the patch. But I'm worried the problem you
>>>> mentioned won't be solved even if we work on this new driver in the
>>>> future. My work on the MT8183 scpsys(now v17) is to implement the new
>>>> hardware logic. Here, I also see related patches, which means that these
>>>> new logics are necessary. Why can't we work on the original driver?
>>>
>>> Well the decision was to change the driver in a not compatible way to make
>>> device tree entries better. If we work on the old driver, we would need to find
>>> some creative ways to handle old bindings vs new bindings.
>>>
>>> So I thought it would be better doing a fresh start implementing mt1873 support
>>> for reference and add mt8183 as new SoC. From what I have seen mt8192 and others
>>> fit the driver structure too.
>>>
>>>> Meanwhile, I thought maybe we should separate the driver into general
>>>> control and platform data for each SoC, otherwise it'll keep getting
>>>> bigger and bigger if it need to be support new SoC.
>>>>
>>>
>>> We could in a later series split the SoC depended data structures and put them
>>> in drivers/soc/mediatek/pm-domains-mt8183.h or something like this. Is that what
>>> you mean?
>>>
>>
>> Yes, that is what I want. And I guess it could avoid the collisions in
>> the different defines to the control registers and power status bits you
>> mentioned. Hope this will happen in this series.
>>
> 
> Sounds good to me. Enric could you move the soc specific data to separate
> include files?
> 

Sure, I'll do this in v4.

Thanks,
 Enric

> Regards,
> Matthias
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
