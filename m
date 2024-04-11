Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D61CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z3qJWORb0OsrTWyxdcnuWNDBtw/eS4irvDABHIBv5s=; b=SqDQLGbi+6+cGe/Xpjkh3+ShVQ
	4Ad8iune3a3x/uWdDAS72wbCfY8vZyKhv5EJ7dZXs9r/Iz+EBBWX97qZBmgXWtF6YgGxbaMYH+mpX
	n1OQrugS5Snr/em1ZhoOaKWXitGeSp3gYCWitvJEmd66zOhUkIT7SAcMJ9t8ELcGDtey3TwvXKctm
	Vyz8Ls6d1st5ynIiCg+dpgsFWS/sK7s3GHyzIpSASr67lS210p/h35TZvx4w9WikefszufHN9mGU2
	f9zkcCXdwmQneaFHAjYby41SrK4J72AXj4z/dDNy4VyS13PZOYy2Hh5BZrT9mAUr90QjG3htGeiV5
	EKVFkwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1runZh-0000000AWu1-2SxC;
	Thu, 11 Apr 2024 06:06:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1runZc-0000000AWsF-37SC;
	Thu, 11 Apr 2024 06:06:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D27FECE1DF5;
	Thu, 11 Apr 2024 06:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF9C433C7;
	Thu, 11 Apr 2024 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712815570;
	bh=vCSO/IPczaOAqHvsW6X71iBblmOF6snz5KBE39VGiBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/HLMtCYzFdGiq1NHLwevQ7ENuRu3WXxXJs9RfKw61NxVairBT3bNCXSKVPXS4QmQ
	 hoVtV8u+02YyrtR0Lw2epyApFdMEU0zKvnKn1y3pCmkzEF5/b8hRFdl8CSh102wDs0
	 T3wUgtRr33eZUTLc56sHKNkHI+7FFOaSlcZD0ap4jO4oj4DXS8bV2WmhtV/Pw86JY5
	 YTSDq5X32YzZkB3KsPMiI55ufm3pev3b9rEud09/0JohwwJwdtS9x5qeWQPKcmHDrf
	 RmANGaYarpAXXZoUA415V4jkU7feikaW1f9jCpoEjWbWICDWgJa/yffgXr7nuwJaS1
	 XvmfwAmS6vAag==
Message-ID: <9e41a61d-3607-4698-b942-78fca235afd2@kernel.org>
Date: Thu, 11 Apr 2024 08:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
 driver
To: =?UTF-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>,
 "conor@kernel.org" <conor@kernel.org>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "yunkec@chromium.org" <yunkec@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
 "paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
 <shengnan.wang@mediatek.com>, =?UTF-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "alain.volmat@foss.st.com"
 <alain.volmat@foss.st.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "10572168@qq.com"
 <10572168@qq.com>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-2-zhi.mao@mediatek.com>
 <20240410-rice-fringe-4ae992217a2f@spud>
 <5317cb9b01cf5668837ad7ccdcb9eb72b95d98d6.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5317cb9b01cf5668837ad7ccdcb9eb72b95d98d6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_230613_194392_3B3EFDFC 
X-CRM114-Status: GOOD (  16.94  )
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

On 11/04/2024 04:04, Zhi Mao (毛智) wrote:
> Hi Conor,
> 
> Thanks for your review.
> 
> On Wed, 2024-04-10 at 12:27 +0100, Conor Dooley wrote:
>>>
>>>
>> Hey,
>>
>> On Wed, Apr 10, 2024 at 06:40:01PM +0800, Zhi Mao wrote:
>>> b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
>>> @@ -0,0 +1,91 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2020 MediaTek Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/giantec,gt97xx.yaml#
>>
>> Filename patching compatible please.
>>
>>
> Sorry, I don't catch this point. 
> Can you explain more details? 

s/patching/matching/
Use compatible as filename.


>>>
>>>
>>> +
>>> +  giantec,aac-mode:
>>> +    description:
>>> +      Indication of AAC mode select.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum:
>>> +      - 1    #  AAC2 mode(operation time# 0.48 x Tvib)
>>> +      - 2    #  AAC3 mode(operation time# 0.70 x Tvib)
>>> +      - 3    #  AAC4 mode(operation time# 0.75 x Tvib)
>>> +      - 5    #  AAC8 mode(operation time# 1.13 x Tvib)
>>
>> I dislike these enum based properties and I would rather this either
>> be
>> the values themselves (0.48, 0.70 etc).
>>
>>> +
>>> +  giantec,aac-timing:
>>> +    description:
>>> +      Number of AAC Timing count that controlled by one 6-bit
>>> period of
>>> +      vibration register AACT[5:0], the unit of which is 100 us.
>>
>> Then the property should be in a standard unit of time, not "random"
>> hex
>> numbers that correspond to register values.
>>
>>>
>>> +  giantec,clock-presc:
>>> +    description:
>>> +      Indication of VCM internal clock dividing rate select, as
>>> one multiple
>>> +      factor to calculate VCM ring periodic time Tvib.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum:
>>> +      - 0    #  Dividing Rate -  2
>>> +      - 1    #  Dividing Rate -  1
>>> +      - 2    #  Dividing Rate -  1/2
>>> +      - 3    #  Dividing Rate -  1/4
>>> +      - 4    #  Dividing Rate -  8
>>> +      - 5    #  Dividing Rate -  4
>>
>> Same here, you should not need these comments explaining the values,
>> use
>> an enum with meaningful values please. 
>>
> About "aac-mode/aac-timing/clock-presc", we test this driver with
> default settings accroding to SPEC and VCM works well, so I will not
> export these property in YMAL and let driver use default settings.
> How do you think about it?

You must remove them from the driver code in such case.

Best regards,
Krzysztof


