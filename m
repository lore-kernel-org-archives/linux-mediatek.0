Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472BAC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 08:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4560204EC
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 08:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ac98Qa1x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMPGUbo6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4560204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fExdU9gP9LV0XHqM20LTtryiULPfCjFXAZ2meo4+irI=; b=ac98Qa1xT7Rem+FZPTnPzAXQF
	A+o/PIXXGqXC7Bs2RlJccO8HyQecYlRM3ckmNtZWRxxqXq8eqOHw4SF+8pK894U8eCuIcuVeE2l8m
	eh4h7wxs+XPcvATpMxQtQzgDGUp84bRMQ4o2rekD3PV/bYRQnsqqvdKCFJvcuKsro4nMkTSSzST6L
	bmsyvgEms+E+JQ136YrU89KI6qZHyVfZdbA5rs7QWtpuyz503ThKh/7kbMXnLYFsjsEfEZzs2EzvK
	I0mlM+zzlTv7JUyy7L7jf8/qOw0L/WqfSXiueLEwoHxMyX6ykMQzaS4ccuynwRmPlngc6rqVPRbTD
	Rlb1dL9BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQRYQ-0005bC-PW; Thu, 08 Oct 2020 08:45:38 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQRYO-0005aE-RN; Thu, 08 Oct 2020 08:45:37 +0000
Received: by mail-ej1-x644.google.com with SMTP id a3so6885434ejy.11;
 Thu, 08 Oct 2020 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yerdNa30cunArK/lfyjii+h2kIAREPWliBxh4pOZois=;
 b=WMPGUbo6LJcP07adLzq4qgAIn97+dAGc+MeGkuNsESdoA6KZD3Jkowq7nrpnelefzE
 y/mUxHjTx8vU11NQ0MVJ676j4WYTAgx5R2fnCADj9UB66depOTu7Tv6VCaRBXjv5eYgc
 tC9k5zzvNO0YkVXbcqV1p9Z/MgkxvnOowV7WhU68Uy1EsJ9gESZ1CfbHUM3gTFPv90hX
 Rvfw1zv0wpZfS4Nk620W9IOGtQ16wFR+ag9Fhn7Uj4CCTGL487A5Kqpk+xUoAO68NB0r
 qrQIRciPv1VENX9WN24p2iRy+5YgLvvfMuZ5KMFEMGOSWHUv/LIR6NE+IT5b9n5oy7LE
 9WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yerdNa30cunArK/lfyjii+h2kIAREPWliBxh4pOZois=;
 b=iLH5iThSgViG+ZHGNhJSZtRgYd4KpS1uyTUwfsCnyXjVR5jIFiy/lm74b3aUEkE8Kl
 w0gO+qkwNl1fot47U5d4oSubdNVRuBz4mhyjKK+8Jspi62C7DCgJbAnIjJuhvvCGloCF
 n4rFGO9NZoN66hmKVI09RJCn4q6yo0jfLPU6IWeEMRJth+iisR/fEeYEkeeIG1Qg5tS7
 RC8SuAWWMEHbiZtvPOjNIxhv9g6ueAITFU4yLmg21kJ6DCFKIzkVLgY58AEqvc/f2Zld
 2Sn+AFn7lz8X3f+CmkMKuyppHbVP7h1Gd+WNsZknfr7scJ6yKA8z1TBP01gvgLzodsjR
 sxag==
X-Gm-Message-State: AOAM533f1VkCjPRdscHquRq91dnt9IX2TIMZ/WkKgdwSF7iH8aG3MlTD
 AnF/ChjWMgCsiHgDMSEG9XU=
X-Google-Smtp-Source: ABdhPJyQRJxK2hNbXabMFx3i3n+12Bn//oG8J/KOsq4rzi/RcR/DQB77FxR2FzXbkzxzd1HOh3GPWA==
X-Received: by 2002:a17:906:7d52:: with SMTP id
 l18mr7506780ejp.220.1602146735393; 
 Thu, 08 Oct 2020 01:45:35 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id zk17sm3607554ejb.125.2020.10.08.01.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 01:45:34 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
 <1602124514.28301.17.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d8aec3a3-10b6-8c9e-6b2d-f9d9c0418b33@gmail.com>
Date: Thu, 8 Oct 2020 10:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602124514.28301.17.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_044536_889013_FA563C8C 
X-CRM114-Status: GOOD (  44.31  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/10/2020 04:35, Neal Liu wrote:
> On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
>>
>> On 27/08/2020 05:06, Neal Liu wrote:
>>> MediaTek bus fabric provides TrustZone security support and data
>>> protection to prevent slaves from being accessed by unexpected
>>> masters.
>>> The security violation is logged and sent to the processor for
>>> further analysis or countermeasures.
>>>
>>> Any occurrence of security violation would raise an interrupt, and
>>> it will be handled by mtk-devapc driver. The violation
>>> information is printed in order to find the murderer.
>>
>> "The violation information is printed in order to find the responsible component."
>>
>> Nobody got actually killed, right :)
> 
> Correct !
>>
>>>
>>> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/Kconfig      |    9 ++
>>>    drivers/soc/mediatek/Makefile     |    1 +
>>>    drivers/soc/mediatek/mtk-devapc.c |  305 +++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 315 insertions(+)
>>>    create mode 100644 drivers/soc/mediatek/mtk-devapc.c
>>>
>>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>>> index 59a56cd..1177c98 100644
>>> --- a/drivers/soc/mediatek/Kconfig
>>> +++ b/drivers/soc/mediatek/Kconfig
>>> @@ -17,6 +17,15 @@ config MTK_CMDQ
>>>    	  time limitation, such as updating display configuration during the
>>>    	  vblank.
>>>    
>>> +config MTK_DEVAPC
>>> +	tristate "Mediatek Device APC Support"
>>> +	help
>>> +	  Say yes here to enable support for Mediatek Device APC driver.
>>> +	  This driver is mainly used to handle the violation which catches
>>> +	  unexpected transaction.
>>> +	  The violation information is logged for further analysis or
>>> +	  countermeasures.
>>> +
>>>    config MTK_INFRACFG
>>>    	bool "MediaTek INFRACFG Support"
>>>    	select REGMAP
>>> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
>>> index 01f9f87..abfd4ba 100644
>>> --- a/drivers/soc/mediatek/Makefile
>>> +++ b/drivers/soc/mediatek/Makefile
>>> @@ -1,5 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>>> +obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
>>>    obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>>>    obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>>>    obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>>> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
>>> new file mode 100644
>>> index 0000000..0ba61d7
>>> --- /dev/null
>>> +++ b/drivers/soc/mediatek/mtk-devapc.c
>>> @@ -0,0 +1,305 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2020 MediaTek Inc.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_irq.h>
>>> +#include <linux/of_address.h>
>>> +
>>> +#define VIO_MOD_TO_REG_IND(m)	((m) / 32)
>>> +#define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
>>> +
>>> +struct mtk_devapc_vio_dbgs {
>>> +	union {
>>> +		u32 vio_dbg0;
>>> +		struct {
>>> +			u32 mstid:16;
>>> +			u32 dmnid:6;
>>> +			u32 vio_w:1;
>>> +			u32 vio_r:1;
>>> +			u32 addr_h:4;
>>> +			u32 resv:4;
>>> +		} dbg0_bits;
>>> +	};
>>> +
>>> +	u32 vio_dbg1;
>>> +};
>>> +
>>> +struct mtk_devapc_data {
>>> +	u32 vio_idx_num;
>>> +	u32 vio_mask_offset;
>>> +	u32 vio_sta_offset;
>>> +	u32 vio_dbg0_offset;
>>> +	u32 vio_dbg1_offset;
>>> +	u32 apc_con_offset;
>>> +	u32 vio_shift_sta_offset;
>>> +	u32 vio_shift_sel_offset;
>>> +	u32 vio_shift_con_offset;
>>> +};
>>
>> Please describe the fields of the struct, that will make it easier to understand
>> the driver.
> 
> Okay, I'll try to add more description about this struct. May be like:
> 
> struct mtk_devapc_data {
> 	/* numbers of violation index */
> 	u32 vio_idx_num;
> 
> 	/* reg offset */
> 	u32 vio_mask_offset;
> 	u32 vio_sta_offset;
> 	u32 vio_dbg0_offset;
> 	u32 vio_dbg1_offset;
> 	u32 apc_con_offset;
> 	u32 vio_shift_sta_offset;
> 	u32 vio_shift_sel_offset;
> 	u32 vio_shift_con_offset;
> };
> 
>>
>>> +
>>> +struct mtk_devapc_context {
>>> +	struct device *dev;
>>> +	void __iomem *infra_base;
>>> +	struct clk *infra_clk;
>>> +	const struct mtk_devapc_data *data;
>>> +};
>>> +
>>> +static void clear_vio_status(struct mtk_devapc_context *ctx)
>>> +{
>>> +	void __iomem *reg;
>>> +	int i;
>>> +
>>> +	reg = ctx->infra_base + ctx->data->vio_sta_offset;
>>> +
>>> +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
>>> +		writel(GENMASK(31, 0), reg + 4 * i);
>>> +
>>> +	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1), 0),
>>> +	       reg + 4 * i);
>>> +}
>>> +
>>> +static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
>>> +{
>>> +	void __iomem *reg;
>>> +	u32 val;
>>> +	int i;
>>> +
>>> +	reg = ctx->infra_base + ctx->data->vio_mask_offset;
>>> +
>>> +	if (mask)
>>> +		val = GENMASK(31, 0);
>>> +	else
>>> +		val = 0;
>>> +
>>> +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
>>
>> Do I get that right? We have a number of virtual IO identifier. Their
>> correspondending interrupt are grouped in 32 bit registers. And we want to
>> enable/disable them by writing 0 or 1. We have to take care of the last
>> registers as it could be the case that vio_idx_num is not a multiple of 32, correct?
>>
>> In this case we should traverse VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1
>> registers, which is (vio_idx_num / 32) - 1 and not (vio_idx_num - 1) / 32.
>>
> 
> Yes, your understanding is correct. It should be
> VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1 instead of
> VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1).
> 
>>> +		writel(val, reg + 4 * i);
>>> +
>>> +	val = readl(reg + 4 * i);
>>> +	if (mask)
>>> +		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
>>> +			       0);
>>
>> We have 511 IRQs, which gives us 31 bits in the last register to set/unset.
>> Thats 510..0 bits, so from what I understand, once again we want
>> GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0)
>> which is (vio_idx_num % 32) - 1
>>
>> Correct or do I understand something wrong?
>> If so, same applies to clear_vio_status().
>>
> 
> Correct. I'll fix it on next patch.
> Thanks
> 
>>
>>> +	else
>>> +		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
>>> +				0);
>>> +
>>> +	writel(val, reg + 4 * i);
>>> +}
>>> +
>>> +#define PHY_DEVAPC_TIMEOUT	0x10000
>>> +
>>> +/*
>>> + * devapc_sync_vio_dbg - do "shift" mechansim" to get full violation information.
>>> + *                       shift mechanism is depends on devapc hardware design.
>>> + *                       Mediatek devapc set multiple slaves as a group.
>>> + *                       When violation is triggered, violation info is kept
>>> + *                       inside devapc hardware.
>>> + *                       Driver should do shift mechansim to sync full violation
>>> + *                       info to VIO_DBGs registers.
>>> + *
>>> + */
>>> +static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
>>> +{
>>> +	void __iomem *pd_vio_shift_sta_reg;
>>> +	void __iomem *pd_vio_shift_sel_reg;
>>> +	void __iomem *pd_vio_shift_con_reg;
>>> +	int min_shift_group;
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	pd_vio_shift_sta_reg = ctx->infra_base +
>>> +			       ctx->data->vio_shift_sta_offset;
>>> +	pd_vio_shift_sel_reg = ctx->infra_base +
>>> +			       ctx->data->vio_shift_sel_offset;
>>> +	pd_vio_shift_con_reg = ctx->infra_base +
>>> +			       ctx->data->vio_shift_con_offset;
>>> +
>>> +	/* Find the minimum shift group which has violation */
>>> +	val = readl(pd_vio_shift_sta_reg);
>>> +	if (!val)
>>> +		return false;
>>
>> So bit 0 of selection register (pd_vio_shift_sel_reg) does not represent a
>> violation group?
>> I don't know how the HW works, but is seems odd to me. In case that's bit 0
>> actually doesn't represent anything: how can an interrupt be triggered without
>> any debug information present (means val == 0)?
> 
> This check implies HW status has something wrong. It cannot get any
> debug information for this case.
> It won't happen in normal scenario. Should we remove this check?
> 

No I think the check is fine. I'd add a WARN() message as this is an indicator 
that the HW is not working corretly.

>>
>>> +
>>> +	min_shift_group = __ffs(val);
>>> +
>>> +	/* Assign the group to sync */
>>> +	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
>>> +
>>> +	/* Start syncing */
>>> +	writel(0x1, pd_vio_shift_con_reg);
>>> +
>>> +	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3, 0,
>>> +				 PHY_DEVAPC_TIMEOUT);
>>> +	if (ret) {
>>> +		dev_err(ctx->dev, "%s: Shift violation info failed\n", __func__);
>>
>> In which case this can happen? I'm asking, because we are calling
>> devapc_sync_vio_dbg() in a while loop that could make the kernel hang here.
>>
>> Do I understand correctly, that we are using the while loop, because there can
>> be more then one violation group which got triggered (read, more then one bit is
>> set in pd_vio_shift_sta_reg)? Would it make more sense then to read the register
>> once and do all the shift operation for all groups which bit set to 1 in the
>> shift status register?
> 
> Yes, your understanding is correct.
> This check also implies HW status has something wrong. We return false
> to skip further violation info dump.
> How could this case make the kernel hang?
> 

The kernel can't hang, sorry my fault. In any case I'd add a WARN() here as 
well. I understand that if we error out here, we have a HW/FW bug (my feeling 
is, that behind this is a micro controller of some kind :)

>>
>>> +		return false;
>>> +	}
>>> +
>>> +	/* Stop syncing */
>>> +	writel(0x0, pd_vio_shift_con_reg);
>>> +
>>> +	/* Write clear */
>>> +	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +/*
>>> + * devapc_extract_vio_dbg - extract full violation information after doing
>>> + *                          shift mechanism.
>>> + */
>>> +static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
>>> +{
>>> +	struct mtk_devapc_vio_dbgs vio_dbgs;
>>> +	void __iomem *vio_dbg0_reg;
>>> +	void __iomem *vio_dbg1_reg;
>>> +
>>> +	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
>>> +	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
>>> +
>>> +	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
>>> +	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
>>> +
>>> +	/* Print violation information */
>>> +	if (vio_dbgs.dbg0_bits.vio_w)
>>> +		dev_info(ctx->dev, "Write Violation\n");
>>> +	else if (vio_dbgs.dbg0_bits.vio_r)
>>> +		dev_info(ctx->dev, "Read Violation\n");
>>> +
>>> +	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
>>> +		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
>>> +		 vio_dbgs.vio_dbg1);
>>> +}
>>> +
>>> +/*
>>> + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
>>> + *                        violation information including which master violates
>>> + *                        access slave.
>>> + */
>>> +static irqreturn_t devapc_violation_irq(int irq_number,
>>> +					struct mtk_devapc_context *ctx)
>>
>> static irqreturn_t devapc_violation_irq(int irq_number, void *data)
>> {
>> 	struct mtk_devapc_context *ctx = data;
> 
> Okay, I'll fix it on next patch.
> Thanks
> 
>>
>>> +{
>>> +	while (devapc_sync_vio_dbg(ctx))
>>> +		devapc_extract_vio_dbg(ctx);
>>> +
>>> +	clear_vio_status(ctx);
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>> +/*
>>> + * start_devapc - unmask slave's irq to start receiving devapc violation.
>>> + */
>>> +static void start_devapc(struct mtk_devapc_context *ctx)
>>> +{
>>> +	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
>>> +
>>> +	mask_module_irq(ctx, false);
>>> +}
>>> +
>>> +/*
>>> + * stop_devapc - mask slave's irq to stop service.
>>> + */
>>> +static void stop_devapc(struct mtk_devapc_context *ctx)
>>> +{
>>> +	mask_module_irq(ctx, true);
>>> +
>>> +	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
>>> +}
>>> +
>>> +static const struct mtk_devapc_data devapc_mt6779 = {
>>> +	.vio_idx_num = 511,
>>> +	.vio_mask_offset = 0x0,
>>> +	.vio_sta_offset = 0x400,
>>> +	.vio_dbg0_offset = 0x900,
>>> +	.vio_dbg1_offset = 0x904,
>>> +	.apc_con_offset = 0xF00,
>>> +	.vio_shift_sta_offset = 0xF10,
>>> +	.vio_shift_sel_offset = 0xF14,
>>> +	.vio_shift_con_offset = 0xF20,
>>> +};
>>> +
>>> +static const struct of_device_id mtk_devapc_dt_match[] = {
>>> +	{
>>> +		.compatible = "mediatek,mt6779-devapc",
>>> +		.data = &devapc_mt6779,
>>> +	}, {
>>> +	},
>>> +};
>>> +
>>> +static int mtk_devapc_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device_node *node = pdev->dev.of_node;
>>> +	struct mtk_devapc_context *ctx;
>>> +	u32 devapc_irq;
>>> +	int ret;
>>> +
>>> +	if (IS_ERR(node))
>>> +		return -ENODEV;
>>> +
>>> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>>> +	if (!ctx)
>>> +		return -ENOMEM;
>>> +
>>> +	ctx->data = of_device_get_match_data(&pdev->dev);
>>> +	ctx->dev = &pdev->dev;
>>> +
>>> +	ctx->infra_base = of_iomap(node, 0);
>>
>> Does this mean the device is part of the infracfg block?
>> I wasn't able to find any information about it.
> 
> I'm not sure why you would ask infracfg block. devapc is parts of our
> SoC infra, it's different with infracfg.
> 

I'm asking because I want to understand the HW better. I'm not able to find any 
information in the datasheets. I want to avoid a situation as we had with the 
MMSYS where a clock driver was submitted first and later on we realized that 
MMSYS is much more then that and we had to work hard to get the driver right.

Now it's happening with SCPSYS, where a driver with the scpsys compatible was 
send years ago. But SCPSYS is much more then the driver submitted. In this case 
we opted to write a new driver, but moving from one driver to another one is 
painfull and full of problems. For that I want to make sure we fully understand 
Device APC (by the way, what does APC stands for?). Is it a totally independent 
HW block or is it part of a subsystem, like for example SCP?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
