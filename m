Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EF3D1AD39
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ckip+FbQZl7MpPUP/NWg0wcyhivYPwo7uxzAgxM4w8Y=; b=JapjsDTrYp3wXn3zEFyKekgs83
	8if5kUHY821UkBKNO5kiIOyXrGZVmoej/0+w2BQ5h3xvmaahkrmAaelBggzIyWCzTUsYO9MHpRRq5
	n1X8aaPrPILzPLTtFNoqnmiSvK33I54BTQzeP5d5A56J6MwyIEeznmJN1FzIdilpZLlWw0tpkBlN1
	4f3rnnPG/OfzKSYNJOTGLRATZuUSHK2Qejg3z4kVixAlsEAyRmm+CPmQotoyyAfDsiALGWR558oOg
	rFe4Y46Cdx0iQAqvLoEOtwB8XP7MrqT6ngJs3NPdBO/ibTztiuYGKi8jLUm7OD7XZ5v+P2Qrc7odn
	udIdEZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10om-0000000BKxf-1G17;
	Wed, 16 Oct 2024 09:59:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10lf-0000000BK8K-01Bo;
	Wed, 16 Oct 2024 09:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729072592;
	bh=6ya40619Q0mP0kRhqMTzIFdnpoul60EFtxDaQlPSTcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+/nwXoE2mcnVBVpmugqj2QsRMHAgO0yY53AaVhcOObjOpxsKDuf2HGoh2rYfJLNa
	 zbjDU+Gv/79YPAvi1dC0icPmJgB84irlJBwidEt1eIyOsCGQnxnbzm2Io0oPhlIjcQ
	 ZErcA2kQvOF93CFeU7jz1S6hqmFIaahDc9JyXA4aWd2XlyyuFDdlraBqHb+gltn6CL
	 xrZjL9npwmRt0fEE+5zzggxnR4YcZ3kPD+lDHvzcLlSQssnwUw7xaFaVDtKhheLCeZ
	 E9UvKUb1Ftm+XuPtqB53V654/jnpZt3NU6dmkmetWXMII/XHosBH8TO/d41TINLl9J
	 XhLUJ0PRGWfcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4559E17E124E;
	Wed, 16 Oct 2024 11:56:32 +0200 (CEST)
Message-ID: <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
Date: Wed, 16 Oct 2024 11:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_025635_224022_9C9D4D68 
X-CRM114-Status: GOOD (  29.51  )
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

Il 16/10/24 11:26, Yassine Oudjana ha scritto:
> On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
>> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>
>>> Add support for the watchdog timer/top reset generation unit found on MT6735.
>>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
>>> the SYSRST pin instead of issuing an IRQ. This change may be needed in other
>>> SoCs as well.
>>>
>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>> ---
>>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>> index a9c437598e7e..5a7a7b2b3727 100644
>>> --- a/drivers/watchdog/mtk_wdt.c
>>> +++ b/drivers/watchdog/mtk_wdt.c
>>> @@ -10,6 +10,7 @@
>>>    */
>>>   #include <dt-bindings/reset/mt2712-resets.h>
>>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>>   #include <dt-bindings/reset/mt7986-resets.h>
>>>   #include <dt-bindings/reset/mt8183-resets.h>
>>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>   };
>>> +static const struct mtk_wdt_data mt6735_data = {
>>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>>> +};
>>> +
>>>   static const struct mtk_wdt_data mt6795_data = {
>>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>>   };
>>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>>>   {
>>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>       void __iomem *wdt_base;
>>> +    u32 reg;
>>>       wdt_base = mtk_wdt->wdt_base;
>>> +    /* Enable reset in order to issue a system reset instead of an IRQ */
>>> +    reg = readl(wdt_base + WDT_MODE);
>>> +    reg &= ~WDT_MODE_IRQ_EN;
>>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
>>
>> This is unnecessary and already done in mtk_wdt_start().
>> If you think you *require* this snippet, you most likely misconfigured the
>> devicetree node for your device :-)
> 
> Ok so mtk_wdt_start is never called.

mtk_wdt_init() says

	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
	}

Your bootloader starts the watchdog. This driver will set WDOG_HW_RUNNING and
will hence prevent calling the .start() callback - that's why.

> I'm still not quite sure how the watchdog 
> works but it seems to me like it's supposed to be started from userspace.

No, it's not meant to be just only used in userspace.

> I also 
> see some drivers calling it in probe.
> 
> Say I don't want to use the watchdog (which I don't, all I need from TOPRGU is the 
> resets, I don't care about the watchdog). Not starting the watchdog means I can't 
> reset the system because all mtk_wdt_restart will do is make TOPRGU send me an IRQ 
> that I have no use for.

If you don't want to use the watchdog, then you don't need to care about bark
interrupts and you don't need any mtk_wdt_restart() functionality at all :-)

So, no, that's not your case here.

> According to the datasheet, setting WDT_MODE_IRQ_EN 
> configures TOPRGU to send an IRQ on system reset event (either watchdog timeout or 
> software watchdog reset) while clearing it makes it actually issue a system reset. 
> What can I do in this case?

I think that we can try with something like...

static void mtk_wdt_init(struct watchdog_device *wdt_dev)
{
	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
	void __iomem *wdt_base;

	wdt_base = mtk_wdt->wdt_base;

	/*
	 * Even though the watchdog may be running, avoid setting the
	 * WDOG_HW_RUNNING bit: that will ensure that we call the start
	 * callback to setup the hardware with the desired features
	 */
	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN)
		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
}


That should work... and perhaps a better idea would be to just call
mtk_wdt_start(), if WDT_MODE_EN at boot... so...

Okay, I'll stop blathering. You probably got the point anyway :-)

Cheers,
Angelo

