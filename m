Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E8C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DB4+M7BSa6/O2U9lAaL+dEzWj/6MFpKxRHdK15iehpk=; b=4q63nBH2w6HnamF1H9DjD+2m+R
	AObFjggtjpFcr6qzaRnY5GZoIMlR1hm9lHVetOe+75ChvpjNfLnHIvpv7XHnCab1aDiL63kRBrDZg
	U6sKtcREHUgwG0jVMm/X6MbdZuFRcgpAq/iVmFtQn3YR9RB30dajzGM9LiFa9P2V/PULAAzLejaVG
	Lcert+kX8kXysqfDO9DaBtfDKns9YFpzsUDZLFA0c+GGfEoPvGEjrBmgQ2auSoMwVuOZZBLxH/zcA
	1rVl996DYs90Rnme0GNYBPWWXHGNSJCk64gcu3AtmBLbDX6rpBNykZBLjPNaa7yKWytpSSwYH1JLh
	bmqt7DMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpR9-005mZN-1P;
	Fri, 19 Jan 2024 14:01:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQoP8-005Yqn-20;
	Fri, 19 Jan 2024 12:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DB4+M7BSa6/O2U9lAaL+dEzWj/6MFpKxRHdK15iehpk=; b=g71Qu8iGpwAsM0HDMDwV3xzJHv
	swEAQKryKZlYWBzxscKNYt1Nn/PKvzqRbYkjWoUyn6+yJa93bAJxBJbBxmo6HpzPNz5iIsM3R46wj
	VmKihiMWhjrRvKxhM0DbiqKGZocvSHgwMCDpGxrrfHOGLQ6te09a6+zlk0pQ/ksuJdS/+B+icSMb2
	XPPa7u0MUysPGVrpnma2gFSvSpM8jIs/Pa6bwlQ9VL1sRLWEI/H4Ubtz2R+FGanVqkeyeIAeMXque
	UPt71mUYt3+GIlougRnOnsd8QXs+9fdxmgULB5MOd//n+ZP7i4jk4vRp0koDAopoE6Wz/ftQoVIZt
	cXDIQqcg==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQoP5-00000001YUk-2ROM;
	Fri, 19 Jan 2024 12:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705668918;
	bh=EjVFyi70iDYG2czWyG5owoqc7kRO3Kwh6/BYrb/3DaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gi25NXZozg2EM16pBusHJ8U/66PZA9mP1CBI+PoTceS7c0uK1LlgS86/LDw5NgbjA
	 9rVrgra8maMORZaM6gsp/xxGfsUoqwBbJwCX9XGFUI5z8cb8fp4q1Gbixcj9oXX6MO
	 OiKUG2exK0dBaEwiu1LH6s3es0NnBoc43mpSkO+Ait5tkIkP7JLlYKBOiMy/2HkzP6
	 LSz24OcAeADWbq50K8CPlr/sNIZvtV5AfQsVFp98SrSLQEzyUlAX/V6MUCcXBMDID7
	 k9NhAsBQ8qEpi/sRgMm4rCabeCUOSgzWVP+KVaIRasak67GsGncaBfMfkXCn7Ub4Fg
	 8ICsFEPKfP/3w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B767037803EE;
	Fri, 19 Jan 2024 12:55:17 +0000 (UTC)
Message-ID: <8834d309-19f2-466f-aed4-ab0f9e2df02d@collabora.com>
Date: Fri, 19 Jan 2024 13:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode
 Passive MUX driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
 neil.armstrong@linaro.org, andersson@kernel.org, nathan@kernel.org,
 luca.weiss@fairphone.com, tianping.fang@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240119104550.140061-1-angelogioacchino.delregno@collabora.com>
 <20240119104550.140061-3-angelogioacchino.delregno@collabora.com>
 <CAA8EJprroFtKvCeZtP_FySr5d6v4dogYQKFQvzPJLpwWBuMrKw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAA8EJprroFtKvCeZtP_FySr5d6v4dogYQKFQvzPJLpwWBuMrKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_125523_791389_353145B1 
X-CRM114-Status: GOOD (  24.33  )
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

Il 19/01/24 12:44, Dmitry Baryshkov ha scritto:
> On Fri, 19 Jan 2024 at 12:46, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The ITE IT5202 is a USB Type-C Alternate Mode Passive MUX, used for
>> muxing the SBU lines of a Type-C port with DisplayPort altmode and
>> also providing an orientation switch.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/usb/typec/mux/Kconfig  |  10 ++
>>   drivers/usb/typec/mux/Makefile |   1 +
>>   drivers/usb/typec/mux/it5205.c | 292 +++++++++++++++++++++++++++++++++
>>   3 files changed, 303 insertions(+)
>>   create mode 100644 drivers/usb/typec/mux/it5205.c
>>
>> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
>> index d2cb5e733e57..399c7b0983df 100644
>> --- a/drivers/usb/typec/mux/Kconfig
>> +++ b/drivers/usb/typec/mux/Kconfig
>> @@ -36,6 +36,16 @@ config TYPEC_MUX_INTEL_PMC
>>            control the USB role switch and also the multiplexer/demultiplexer
>>            switches used with USB Type-C Alternate Modes.
>>
>> +config TYPEC_MUX_IT5205
>> +       tristate "ITE IT5205 Type-C USB Alt Mode Passive MUX driver"
>> +       depends on I2C
>> +       select REGMAP_I2C
>> +       help
>> +         Driver for the ITE IT5205 Type-C USB Alternate Mode Passive MUX
>> +         which provides support for muxing DisplayPort and sideband signals
>> +         on a common USB Type-C connector.
>> +         If compiled as a module, the module will be named it5205.
>> +
>>   config TYPEC_MUX_NB7VPQ904M
>>          tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>>          depends on I2C
>> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
>> index 57dc9ac6f8dc..bb96f30267af 100644
>> --- a/drivers/usb/typec/mux/Makefile
>> +++ b/drivers/usb/typec/mux/Makefile
>> @@ -4,6 +4,7 @@ obj-$(CONFIG_TYPEC_MUX_FSA4480)         += fsa4480.o
>>   obj-$(CONFIG_TYPEC_MUX_GPIO_SBU)       += gpio-sbu-mux.o
>>   obj-$(CONFIG_TYPEC_MUX_PI3USB30532)    += pi3usb30532.o
>>   obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)      += intel_pmc_mux.o
>> +obj-$(CONFIG_TYPEC_MUX_IT5205)         += it5205.o
>>   obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)     += nb7vpq904m.o
>>   obj-$(CONFIG_TYPEC_MUX_PTN36502)       += ptn36502.o
>>   obj-$(CONFIG_TYPEC_MUX_WCD939X_USBSS)  += wcd939x-usbss.o
>> diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
>> new file mode 100644
>> index 000000000000..99203b8a086d
>> --- /dev/null
>> +++ b/drivers/usb/typec/mux/it5205.c
>> @@ -0,0 +1,292 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ITE IT5205 Type-C USB alternate mode passive mux
>> + *
>> + * Copyright (c) 2020 MediaTek Inc.
>> + * Copyright (c) 2024 Collabora Ltd.
>> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + *
>> + */
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/regmap.h>
>> +#include <linux/usb/typec.h>
>> +#include <linux/usb/typec_mux.h>
>> +#include <linux/usb/typec_dp.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio.h>
>> +#include <linux/usb/tcpm.h>
> 
> I'd say, it is a usual custom to sort this list.
> 

Oh, whoops. Totally forgot to do that, sorry - thanks for pointing that out!
Done for v2.

> [skipped]
> 
>> +
>> +static int it5205_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
>> +{
>> +       struct it5205 *it = typec_mux_get_drvdata(mux);
>> +       u8 val;
>> +
>> +       switch (state->mode) {
>> +       case TYPEC_STATE_USB:
>> +               val = IT5205_USB;
>> +               break;
>> +       case TYPEC_DP_STATE_C:
>> +               fallthrough;
>> +       case TYPEC_DP_STATE_E:
>> +               val = IT5205_DP;
>> +               break;
>> +       case TYPEC_DP_STATE_D:
>> +               val = IT5205_DP_USB;
>> +               break;
>> +       case TYPEC_STATE_SAFE:
>> +               fallthrough;
>> +       default:
>> +               val = 0;
>> +               break;
>> +       }
> 
> Please add a check for state->altmode. All states at TYPEC_STATE_MODAL
> and above (which includes TYPEC_DP_STATE_[CDE]) are only relevant with
> connection to the particular typec->altmode SVID.
> 

Done for v2.

>> +
>> +       return regmap_update_bits(it->regmap, IT5205_REG_MUXCR,
>> +                                 IT5205_DP_USB_CTRL_MASK, val);
>> +}
>> +
>> +static irqreturn_t it5205_irq_handler(int irq, void *data)
>> +{
>> +       struct it5205 *it = data;
>> +       int ret;
>> +       u32 val;
>> +
>> +       ret = regmap_read(it->regmap, IT5205_REG_ISR, &val);
>> +       if (ret)
>> +               return IRQ_NONE;
>> +
>> +       if (val & IT5205_ISR_CSBU_OVP) {
>> +               dev_warn(&it->client->dev, "Overvoltage detected!\n");
> 
> Will it cut the voltage automatically?
> 

As far as I understand, yes.
Unfortunately, there's no datasheet.

>> +
>> +               /* Reset CSBU */
>> +               regmap_update_bits(it->regmap, IT5205_REG_CSBUSR,
>> +                                  IT5205_CSBUSR_SWITCH, 0);
>> +               regmap_update_bits(it->regmap, IT5205_REG_CSBUSR,
>> +                                  IT5205_CSBUSR_SWITCH, IT5205_CSBUSR_SWITCH);
>> +       }
>> +
>> +       return IRQ_HANDLED;
>> +}
> 
> The rest LGTM
> 
> 




