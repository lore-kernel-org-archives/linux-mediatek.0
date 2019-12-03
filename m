Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD99C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 05:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C5C206E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 05:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fst+mvb8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P72HkHNE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C5C206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yaHgmy0woqNLIC2Hw8ZPKrz77kY0Al08SSWhbmSJz9Y=; b=fst+mvb824VdqYUz5ISBdjUEm
	wx7392Hv/W970MUGKX/Dz2GP51euMeTVqPOrPl/x9lVH4U2O7QeFNamY56oHuaP+IRqUlmIpumASe
	+y1M1tZin/oUETsyT43vUP44flskMYTEnGqynTRbrp6GZN66+8WWugEDcJF4dGYxJ0HGMu0vYAe6m
	Zg0Z47ShOKhSwjd+z10+hZqFfN6IuJscGvh+J0TlUUwuliGEp8hX98Ad+929SIXDjJgDTpndbMdUm
	zHBrea7pnCxJNLh4cG6UL3ZeUbQDpkJK9WK9FR9+iK8uPemJYTwMzDIFaawvNAwAv3v2nb7uGRyHO
	KqRBpdbrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic0Ni-00058S-23; Tue, 03 Dec 2019 05:05:50 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic0Na-000517-Dv; Tue, 03 Dec 2019 05:05:44 +0000
Received: by mail-pg1-x542.google.com with SMTP id k1so1078473pgg.12;
 Mon, 02 Dec 2019 21:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eyhijRr/YQI/e+nakiYV1XQUenXP3bUm+J4bO1NawYU=;
 b=P72HkHNEdTVxL582N76mLhFt/aJgUyPBDfr8x48oFP/rsd60PaSZ8xPVUthbIexaYw
 QkzBOCoaHvWZ2etMK9YFs9IBqHECv4Q/nmZ8TbvBMJBM1Aog4STvGOCmrk0bOQ9JhrpP
 wFiH0gaIEFuEPb2jbaNv3ZqWxkQxw8Aa1c1YoUAWLt6fq5+REO1l0xdvDRoSo5g+JYVm
 lYFA6F0tk2eq5YFuwNFN3HqGBSELuPKxrxjMnoqPo5kTl0moJ3A1X0K5SIpZHCcjzl1t
 ebIK9zXhKVT9vQ+moUbJQdZAIurf6MqdVb8Td6Ie8/TXrUE5RCbG/RmvvNgZ5W/uv2tM
 heoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyhijRr/YQI/e+nakiYV1XQUenXP3bUm+J4bO1NawYU=;
 b=kkP+VWInCAPz64ozTlJuUPPNseu6IuZZ+984Qc+yk+Y2jVDt5TmralHmNm6HxzZ0Pg
 Rdb6Hi5pd9dDA25crxVTLkOwNFFh5uBT5WcrwV8bb1wKl+evY22s38T3c6/CySGO643u
 2mE++UKmVNkvfIWODrcjLJMzQzCO32xoKXQMNuluZtPYAgSTg+GAJYfY7iVUkopfHZBM
 Uac5xTtRRIPfJV0K+4trXxPvRGz3d/ZxpRzoz0baYf/b5IxooyPhx6VgmVoZ4mDRZnLJ
 OdTHP6wJU/lSOop362vpgRxQPelW28dO4z0c00zuIbgDGxuPwtDuInhT+sdy1McWG6jU
 hXMA==
X-Gm-Message-State: APjAAAUftSdcfqoNberpaoatuT+QX16/ECrPoFdv6UNKmW+nt/F69Gmi
 Ivnl5RJeaUOkCL2Kfwx3Xwo=
X-Google-Smtp-Source: APXvYqyfI2axwjuybif7oNpVQ4sCIgYVs/mOpWhuPqRWpM/uK3ySjzI3swZw55nmmNBtgQmn63CC7g==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr2812758pfp.65.1575349540517; 
 Mon, 02 Dec 2019 21:05:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 67sm1393499pfw.82.2019.12.02.21.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 21:05:38 -0800 (PST)
Subject: Re: [PATCH v5 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
To: Yong Liang <yong.liang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20191125061627.GA7313@roeck-us.net>
 <e138b69efad563822da1db8e160d43458c21eae1.camel@pengutronix.de>
 <1575016588.7013.8.camel@mhfsdcap03>
 <88994e7445df8b2d98f3548e2043eb29bf5fa95f.camel@pengutronix.de>
 <1575342124.7013.13.camel@mhfsdcap03>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f9628c90-4c9b-ff4b-b3dd-887dbc987d46@roeck-us.net>
Date: Mon, 2 Dec 2019 21:05:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1575342124.7013.13.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_210542_495047_D144B39E 
X-CRM114-Status: GOOD (  21.82  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tzungbi@google.com" <tzungbi@google.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?RWFzb24gWWVuICjpoY/lu7fku7sp?= <Eason.Yen@mediatek.com>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/2/19 7:02 PM, Yong Liang wrote:
> On Mon, 2019-12-02 at 21:02 +0800, Philipp Zabel wrote:
>> On Fri, 2019-11-29 at 16:36 +0800, Yong Liang wrote:
>>> On Mon, 2019-11-25 at 17:51 +0800, Philipp Zabel wrote:
>>>> On Sun, 2019-11-24 at 22:16 -0800, Guenter Roeck wrote:
>>>>> On Mon, Nov 25, 2019 at 11:03:50AM +0800, Jiaxin Yu wrote:
>>>>>> From: "yong.liang" <yong.liang@mediatek.com>
>>>>>>
>>>>>> Add reset controller API in watchdog driver.
>>>>>> Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
>>>>>> camera, codec and connectivity) software reset functionality.
>>>>>>
>>>>>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
>>>>>> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
>>>>>> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
>>>>>> ---
>>>>>>   drivers/watchdog/Kconfig   |   1 +
>>>>>>   drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
>>>>>>   2 files changed, 111 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>>>> index 2e07caab9db2..629249fe5305 100644
>>>>>> --- a/drivers/watchdog/Kconfig
>>>>>> +++ b/drivers/watchdog/Kconfig
>>>>>> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>>>>>>   	tristate "Mediatek SoCs watchdog support"
>>>>>>   	depends on ARCH_MEDIATEK || COMPILE_TEST
>>>>>>   	select WATCHDOG_CORE
>>>>>> +	select RESET_CONTROLLER
>>>>>>   	help
>>>>>>   	  Say Y here to include support for the watchdog timer
>>>>>>   	  in Mediatek SoCs.
>>>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>>>> index 9c3d0033260d..d29484c7940a 100644
>>>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>>>> @@ -9,6 +9,9 @@
>>>>>>    * Based on sunxi_wdt.c
>>>>>>    */
>>>>>>   
>>>>>> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>>>>>> +#include <dt-bindings/reset-controller/mt8183-resets.h>
>>>>>> +#include <linux/delay.h>
>>>>>>   #include <linux/err.h>
>>>>>>   #include <linux/init.h>
>>>>>>   #include <linux/io.h>
>>>>>> @@ -16,10 +19,12 @@
>>>>>>   #include <linux/module.h>
>>>>>>   #include <linux/moduleparam.h>
>>>>>>   #include <linux/of.h>
>>>>>> +#include <linux/of_device.h>
>>>>>>   #include <linux/platform_device.h>
>>>>>> +#include <linux/reset-controller.h>
>>>>>> +#include <linux/slab.h>
>>>>>>   #include <linux/types.h>
>>>>>>   #include <linux/watchdog.h>
>>>>>> -#include <linux/delay.h>
>>>>>>   
>>>>>>   #define WDT_MAX_TIMEOUT		31
>>>>>>   #define WDT_MIN_TIMEOUT		1
>>>>>> @@ -44,6 +49,9 @@
>>>>>>   #define WDT_SWRST		0x14
>>>>>>   #define WDT_SWRST_KEY		0x1209
>>>>>>   
>>>>>> +#define WDT_SWSYSRST		0x18U
>>>>>> +#define WDT_SWSYS_RST_KEY	0x88000000
>>>>>> +
>>>>>>   #define DRV_NAME		"mtk-wdt"
>>>>>>   #define DRV_VERSION		"1.0"
>>>>>>   
>>>>>> @@ -53,8 +61,99 @@ static unsigned int timeout;
>>>>>>   struct mtk_wdt_dev {
>>>>>>   	struct watchdog_device wdt_dev;
>>>>>>   	void __iomem *wdt_base;
>>>>>> +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>>>>>> +	struct reset_controller_dev rcdev;
>>>>>> +};
>>>>>> +
>>>>>> +struct mtk_wdt_data {
>>>>>> +	int sw_rst_num;
>>>>>>   };
>>>>>>   
>>>>>> +static const struct mtk_wdt_data mt2712_data = {
>>>>>> +	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct mtk_wdt_data mt8183_data = {
>>>>>> +	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>>>>>> +};
>>>>>
>>>>> The number of resets can be set in .data directly; there is no need
>>>>> for the structures.
>>>
>>>      We want to put all properities in mtxxxx-resets.h and it easy to
>>> manager. If there are new properity in the feture, we can put it in
>>> mtk_wdt_data mtxxxx_data
>>
>> Do you expect there will be more properties in the future?
> 
>    Yes, We may put some infra reset bit and max number in mtxxxx-resets.h

Please either do that now or introduce the complexity when needed.

Thanks,
Guenter

>>
>>>>>> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
>>>>>> +				 unsigned long id)
>>>>>> +{
>>>>>> +	unsigned int tmp;
>>>>>> +	unsigned long flags;
>>>>>> +	struct mtk_wdt_dev *data =
>>>>>> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
>>>>>> +
>>>>>> +	spin_lock_irqsave(&data->lock, flags);
>>>>>> +
>>>>>> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
>>>>>> +	tmp &= ~BIT(id);
>>>>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>>>>> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
>>>>>> +
>>>>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>
>>>>> There is a lot of duplication in those functions. Only one line
>>>>> is different. I think this is a good example where a helper function
>>>>> with an additional argument indicating set or reset would be helpful.
>>>>>
>>>      .assert and .dessert are two numbers of struct reset_control_ops.
>>>       I think it's better to define both of them.
>>
>> The suggestion was to have two very short _assert and _deassert
>> functions that only contain a single call to a common helper function.
>> See the reset-a10sr.c driver for an example.
> 
>    OK. I will modify it as reset-a10sr.c do.
>>
>> regards
>> Philipp
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
