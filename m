Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E41D2F7F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYcD/jtdAJ+4/L32a30+2vo9k1U4HQBEXCOgxpnG3RM=; b=3BUsQk4vUwOeNDgbqOe1XOXOVH
	1RvBeaMpsjWzyHlmYPV0QdXVdzyis1mNEejAFbUDJ/E7PffEED8hDbdutCU5iSh+/48Nuthu6w1tc
	tdLlv6tWY9r9Bt9LIfBQ2C3PcDO6vXUWvAl/wFMHzSXZt2wiENrSVgGMaMan6NsUgcyOG8dlP5mxZ
	o162l45GRN37DA0sBBm7pG5s28xzvGNild0Gw0NTJnkJHcvUaDJAuj6bVPb6OyNDS5SXF49pHOAw5
	mZ0WE7BLoa/k9ln0IGGah9Kunpc1hzp8LaskDtD90VUs137TpTKxmUlOV2pl5xF4tQTN5dROoGmeS
	Vm15fO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1KHQ-0000000Dtyr-3xo0;
	Thu, 17 Oct 2024 06:46:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1KEm-0000000DtSW-0F74;
	Thu, 17 Oct 2024 06:43:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so88615066b.1;
        Wed, 16 Oct 2024 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729147433; x=1729752233; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYcD/jtdAJ+4/L32a30+2vo9k1U4HQBEXCOgxpnG3RM=;
        b=jbnMigTsoCQyheLZlXZgfC/rispERayvbwfPrG8rfOdbw0MNEffGVbfOeYItdpyZSF
         +3JEg+swS1nh6D0F6zR3nqD2UVy7X02Il0+1T7xcjYWMDfbCYglTc7P/x9q7HZTl0OZG
         fXAlsavq/PdL8QFAO6My0k9QseRPEQhdw2dtarD4BxSPZcOttobz0UqxlxE3zwk04qnm
         E2WCXaJvb9lVdzfbhVlXcNym1/cxiAbH2v8Qes08GLwrdCO5y8mYd6SpHoOgPfQ79Qkx
         dOPQwhaFfE+5zCpIR7/vVXw9hNL4hLQlKP9otVgZoPQnVOIggQ6cQwhF77Ed1uSrLE7/
         7rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729147433; x=1729752233;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYcD/jtdAJ+4/L32a30+2vo9k1U4HQBEXCOgxpnG3RM=;
        b=QuOciQJ1G+p2jiGtHfusW0Fi1/OgG1iknhz2x7pOs3ZiC018MAcpIMdT3j3EdHxGt0
         gpaNY/AoWfCZj+DzBMJZs2ljYpOCrbligf2Sim/tYX1Ql5CIoS4SUSWBGF0De7uo2CXN
         CbvxS0wLXXz6DSRyCVaqMtDYCdU/7ePlt+SxMoG6WsWCSBRjEbJknQduu1RK7L768j10
         URRC+8ArZsd199e2yXRh/i8KPNb1r1NmBd3b8DYvaFwSdIuFT4UlehjhicVOBv1LV4gt
         5JbgCwwAwy/VdYzB8gWlu0GZuo+Zq6UXv6BOxQ92da3nKZ0G7IKdid6jLeR7XaINGmEz
         Yugg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Sk9SX4RkRkZR2LrBEkvu7/vC8K5B0HT4M+x4uEGpf41RPqQmjoAjri7LW+/jeXY531kRysvcTtQ5eRwxpOkL@lists.infradead.org, AJvYcCXCynQr2bqcLOyRaWrK5ezcZc49UPF4neInvj1xmctb+lmutBUon9hAEIL3urglsY1YluK3MB3/1hOuOcecgx8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVAKlvf2eTOKNMc8Er8q6ewPWHEKun8lVPTKYToXyvP+PIa14O
	cLLuiw5Dn64EmwdWbqifZ+VUaUx0HUj6gx4v4L9I1DrorhMtIzFC
X-Google-Smtp-Source: AGHT+IFZsVgs21n7csKGlALlguHVpL+24Dw635J/TiEfmVftcGCaSNRhB5+QSoo3kSsvKr84n2LrXA==
X-Received: by 2002:a17:907:96a7:b0:a9a:6d7:9c4 with SMTP id a640c23a62f3a-a9a34d3b465mr668339966b.12.1729147433207;
        Wed, 16 Oct 2024 23:43:53 -0700 (PDT)
Received: from [10.31.14.61] ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29740e1fsm252028766b.51.2024.10.16.23.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:43:52 -0700 (PDT)
Date: Thu, 17 Oct 2024 09:43:44 +0300
From: yassine.oudjana@gmail.com
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <WOMHLS.HLNVQWWVER5T1@gmail.com>
In-Reply-To: <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
	<20230302124015.75546-3-y.oudjana@protonmail.com>
	<0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
	<f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
	<9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_234356_318418_EE5AA1B3 
X-CRM114-Status: GOOD (  27.81  )
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


On Wed, Oct 16 2024 at 11:56:31 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 16/10/24 11:26, Yassine Oudjana ha scritto:
>> On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
>>> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> 
>>>> Add support for the watchdog timer/top reset generation unit found 
>>>> on MT6735.
>>>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU 
>>>> assert
>>>> the SYSRST pin instead of issuing an IRQ. This change may be 
>>>> needed in other
>>>> SoCs as well.
>>>> 
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> ---
>>>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>> 
>>>> diff --git a/drivers/watchdog/mtk_wdt.c 
>>>> b/drivers/watchdog/mtk_wdt.c
>>>> index a9c437598e7e..5a7a7b2b3727 100644
>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>> @@ -10,6 +10,7 @@
>>>>    */
>>>>   #include <dt-bindings/reset/mt2712-resets.h>
>>>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>>>   #include <dt-bindings/reset/mt7986-resets.h>
>>>>   #include <dt-bindings/reset/mt8183-resets.h>
>>>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> +static const struct mtk_wdt_data mt6735_data = {
>>>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>>>> +};
>>>> +
>>>>   static const struct mtk_wdt_data mt6795_data = {
>>>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct 
>>>> watchdog_device *wdt_dev,
>>>>   {
>>>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>>       void __iomem *wdt_base;
>>>> +    u32 reg;
>>>>       wdt_base = mtk_wdt->wdt_base;
>>>> +    /* Enable reset in order to issue a system reset instead of 
>>>> an IRQ */
>>>> +    reg = readl(wdt_base + WDT_MODE);
>>>> +    reg &= ~WDT_MODE_IRQ_EN;
>>>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
>>> 
>>> This is unnecessary and already done in mtk_wdt_start().
>>> If you think you *require* this snippet, you most likely 
>>> misconfigured the
>>> devicetree node for your device :-)
>> 
>> Ok so mtk_wdt_start is never called.
> 
> mtk_wdt_init() says
> 
> 	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
> 		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> 		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> 	}
> 
> Your bootloader starts the watchdog. This driver will set 
> WDOG_HW_RUNNING and
> will hence prevent calling the .start() callback - that's why.

It doesn't.

WDT_MODE reads 0x5c in mtk_wdt_init if you want to see exactly how the 
bootloader is configuring it.

> 
>> I'm still not quite sure how the watchdog works but it seems to me 
>> like it's supposed to be started from userspace.
> 
> No, it's not meant to be just only used in userspace.
> 
>> I also see some drivers calling it in probe.
>> 
>> Say I don't want to use the watchdog (which I don't, all I need from 
>> TOPRGU is the resets, I don't care about the watchdog). Not 
>> starting the watchdog means I can't reset the system because all 
>> mtk_wdt_restart will do is make TOPRGU send me an IRQ that I have 
>> no use for.
> 
> If you don't want to use the watchdog, then you don't need to care 
> about bark
> interrupts and you don't need any mtk_wdt_restart() functionality at 
> all :-)

I need mtk_wdt_restart to restart my system. I shouldn't need to take 
off my phone's back cover and remove the battery every time :)

> 
I think what Guenter said makes sense. We should make sure the watchdog 
is started when calling mtk_wdt_restart or at least configured in such 
a way that we are sure it will issue a system reset.




