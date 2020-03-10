Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3550AC10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 09:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0570F2467D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 09:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5Ck9kVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0570F2467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/N64ZkC6XLvZ/hD40HA14PrSy11T3kbpN4ytgEuwgI=; b=N5Ck9kVXCR3fr4
	pyZO0/mr234j/bPuJNto/V2r3H4GOp8eRaV3a+M0NJrq3MrGSYmO8q44a7OlIeQEphpbqWEG+fAE4
	MbLNUQzxf2DYLLZnxow1T/ed/M+Yo4zXJPQqkN0aZdZOjvcffLrWI2ORK3HYGxVHUzrZHsmIYbcJ0
	n3eKKWSk2UIc1y1oanUCkKl+kng3YsP5FrWDFQyzrX82sdiiNxmyADx3zJQFHSWuEMhe4u1egv71C
	vD6IZUM8AxvQBqkLkj3EhJ+C7teaqtlGcCXVQHBiVHeT67a4I2+tmD4y4CEBV2XIvmSf4NqPREGm6
	Qg7LhWUWjPG1nb4GgpXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBbXM-0008Ao-PJ; Tue, 10 Mar 2020 09:50:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBbX9-0007xn-Mi; Tue, 10 Mar 2020 09:50:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 54EA929595C
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To: Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
 <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
 <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
 <158379424337.149997.7454036134629466675@swboyd.mtv.corp.google.com>
 <21b43196-230c-5000-546e-b90d4b6b44a3@suse.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <1c726a44-dd8a-d69e-0563-dfbbc455317e@collabora.com>
Date: Tue, 10 Mar 2020 10:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21b43196-230c-5000-546e-b90d4b6b44a3@suse.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_025044_020160_8C2B44D9 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Chen-Yu Tsai <wens@csie.org>, Allison Randal <allison@lohutok.net>,
 CK HU <ck.hu@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, fwll.ch@freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <"houlong.w ei"@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

On 10/3/20 10:40, Matthias Brugger wrote:
> 
> 
> On 09/03/2020 23:50, Stephen Boyd wrote:
>> Quoting Enric Balletbo Serra (2020-03-06 14:09:50)
>>> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dv., 6 de mar
>>> 2020 a les 22:37:
>>>>
>>>> Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
>>>>> On 5/3/20 22:01, Stephen Boyd wrote:
>>>>>> Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
>>>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..473cdf732fb5
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>>> @@ -0,0 +1,154 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>> +/*
>>>>>>> + * Copyright (c) 2014 MediaTek Inc.
>>>>>>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <linux/clk-provider.h>
>>>>>>> +#include <linux/of_device.h>
>>>>>>> +#include <linux/platform_device.h>
>>>>>>> +
>>>>>>> +#include "../../clk/mediatek/clk-gate.h"
>>>>>>> +#include "../../clk/mediatek/clk-mtk.h"
>>>>>>
>>>>>> Why not use include/linux/clk/?
>>>>>>
>>>>>
>>>>> I can move these files to include, this will impact a lot more of drivers but,
>>>>> yes, I think is the right way.
>>>>>
>>>>>> But I also don't understand why the clk driver is moved outside of
>>>>>> drivers/clk/ into drivers/soc/. Commit text saying that it has shared
>>>>>> registers doesn't mean it can't still keep the clk driver part in the
>>>>>> drivers/clk/ area.
>>>>>>
>>>>>
>>>>> Actually moving this to the soc directory has been requested by CK (mediatek) as
>>>>> a change in v8. You can see the discussion in [1]
>>>>>
>>>>
>>>> I can reply there in that thread if necessary, but we shouldn't need to
>>>> force simple-mfd into DT bindings to support this. Match the compatible
>>>> string in drivers/soc/ and register devices in software for the
>>>> different pieces of this overall hardware block. If necessary, pass down
>>>> the ioremapped addresss down through device data to each logical driver
>>>> in the respective subsystem.
>>>>
>>>> So yes, it looks like an MFD, but that doesn't mean we have to change
>>>> the DT binding or put it in drivers/mfd to support that. And we don't
>>>> have to fix any problems with allowing two drivers to probe the same
>>>> compatible string.
>>>>
>>>
>>> That thread maybe has too much information and things evolved since
>>> then. Note that the final solution is not an MFD neither we change the
>>> bindings. I pointed to that thread just because CK (CK please correct
>>> me if I'm wrong) thought that the driver is not a pure clock driver
>>> and he preferred to move to drivers/soc/mediatek (in that thread, he
>>> exposes his opinion on that).  Sorry to introduce more confusion.
>>>
>>> You seem to be fine with the approach (just minor changes), so it
>>> looks to me that the only problem is if this should be in drivers/clk
>>> or drivers/soc. Honestly, this is not something I can't decide and
>>> I'll let you (the soc and clk maintainers) decide. I don't really have
>>> a strong opinion here. I don't mind move again to drivers/clk if that
>>> is what we want but let's come to an agreement.
>>>
>>
>> It's already in drivers/clk, so leave the clk part there and register
>> the clk device and any other devices by matching the compatible in
>> drivers/soc. That is my preferred solution. Can that be done?
>>
> 
> I think we can once again create a platform device in drivers/soc which matches
> the drivers/clk and then do the routing in drivers/soc. Enric any thoughts?
> 

Yes, working already on a new version.

Thanks,
 Enric


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
