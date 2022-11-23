Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B53DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/0BMCPy6m8yKLdjCg4skZhWokMIGCxPSqARFEp24O8=; b=4HjZQ79isoVKw4AWI48+DUj0J7
	rQs5i5LnPsojwU6J8KHRk41TZr5JlR00Mq6hvYyzLylBNIC3mRvMx/dvMBslk8DMFcHBXBhxYRC4S
	rT0t/GnO9U6pMZP3mm6+cF5rLC+ARzxUk59pDwbSRBvpBDPqMd8GA91zsL2ayfYKNDrOEyFBR5d3t
	P61UUgpIGbhNYokqIyBvLp30uxjsPWPnduRQkT8q92+AeHPBdoin79Q5Tx/V/tV0+dJzHKazapMCe
	UFYmCpyE5tK3TYUJHnArDfR76KLKkITE75XYLQdo7FVb9s1Fsuqp4za39oh3FV3LGATjmLfxuv3E5
	+AVV1GSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlh8-00FmV7-Sa; Wed, 23 Nov 2022 09:05:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlgf-00FmH8-OX; Wed, 23 Nov 2022 09:04:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF4E86602A65;
	Wed, 23 Nov 2022 09:04:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669194294;
	bh=zG135kRe8+iItmvKrsgi+crsZCaDW2dydm76wVwCcwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RypeNJ4pvfaBL1Sz9otgZ0HjwnQTEZ60pw7YMU4oFwKbLLbDu7bGf5CVPp/urRfgg
	 IzIvcjt+W+ToY6+E1oXhkKLPQwEKkFNo6H76cT3cFYBDYBr6dNaEhKu72IjRRH5irf
	 vaZ4eWdDq6eSMRLC1UcmaALRKyfVGmXs2RF2ecMjyNcQwCVhKGJltwwG+Jvgb9EyLU
	 Erx9r/hEKZReSh+3kZYpyjfO9kFWD7iOblNsvFANII4T3kDwZlUowLmxca9kjVFCCg
	 GbZIYxxQcgBs3TJzl/kNCIryb+3PHIM43/1bvOcFVBa0eipG+RE3IGMQjkscIywojR
	 iT2akcAxuuP3A==
Message-ID: <15b502b0-517b-5380-77ae-f6c23b025a85@collabora.com>
Date: Wed, 23 Nov 2022 10:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/4] irqchip: irq-mtk-cirq: Move register offsets to
 const array
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 youlin.pei@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
 <20221118100639.33704-4-angelogioacchino.delregno@collabora.com>
 <86pmdfnntg.wl-maz@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <86pmdfnntg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_010458_177151_851D1BA9 
X-CRM114-Status: GOOD (  27.05  )
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

Il 22/11/22 14:03, Marc Zyngier ha scritto:
> On Fri, 18 Nov 2022 10:06:38 +0000,
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
>>
>> In preparation to add support for new SoCs having different register
>> offsets, add an enumeration that documents registers and move the
>> register offsets definitions to a u32 array.
>>
>> Of course, every usage of the definitions was changed to use the
>> newly introduced register offsets array.
>>
>> This change brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/irqchip/irq-mtk-cirq.c | 62 ++++++++++++++++++++++++----------
>>   1 file changed, 44 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
>> index 9bca0918078e..affbc0f48550 100644
>> --- a/drivers/irqchip/irq-mtk-cirq.c
>> +++ b/drivers/irqchip/irq-mtk-cirq.c
>> @@ -15,14 +15,30 @@
>>   #include <linux/slab.h>
>>   #include <linux/syscore_ops.h>
>>   
>> -#define CIRQ_ACK	0x40
>> -#define CIRQ_MASK_SET	0xc0
>> -#define CIRQ_MASK_CLR	0x100
>> -#define CIRQ_SENS_SET	0x180
>> -#define CIRQ_SENS_CLR	0x1c0
>> -#define CIRQ_POL_SET	0x240
>> -#define CIRQ_POL_CLR	0x280
>> -#define CIRQ_CONTROL	0x300
>> +enum mtk_cirq_reg_index {
>> +	CIRQ_STA = 0,
> 
> Enums starting from 0 are the default.
> 
>> +	CIRQ_ACK,
>> +	CIRQ_MASK_SET,
>> +	CIRQ_MASK_CLR,
>> +	CIRQ_SENS_SET,
>> +	CIRQ_SENS_CLR,
>> +	CIRQ_POL_SET,
>> +	CIRQ_POL_CLR,
>> +	CIRQ_CONTROL,
>> +	CIRQ_MAX
> 
> What's the use of this last constant?
> 

None, was commodity for loops - will remove, thanks.

>> +};
>> +
>> +static const u32 mtk_cirq_regs_v1[] = {
>> +	[CIRQ_STA]	= 0x0,
>> +	[CIRQ_ACK]	= 0x40,
>> +	[CIRQ_MASK_SET]	= 0xc0,
>> +	[CIRQ_MASK_CLR]	= 0x100,
>> +	[CIRQ_SENS_SET]	= 0x180,
>> +	[CIRQ_SENS_CLR]	= 0x1c0,
>> +	[CIRQ_POL_SET]	= 0x240,
>> +	[CIRQ_POL_CLR]	= 0x280,
>> +	[CIRQ_CONTROL]	= 0x300,
>> +};
>>   
>>   #define CIRQ_EN	0x1
>>   #define CIRQ_EDGE	0x2
>> @@ -32,18 +48,20 @@ struct mtk_cirq_chip_data {
>>   	void __iomem *base;
>>   	unsigned int ext_irq_start;
>>   	unsigned int ext_irq_end;
>> +	const u32 *regs;
> 
> This is an array of *offsets*, not registers. Please name it accordingly.
> 

Will do

>>   	struct irq_domain *domain;
>>   };
>>   
>>   static struct mtk_cirq_chip_data *cirq_data;
>>   
>> -static void mtk_cirq_write_mask(struct irq_data *data, unsigned int offset)
>> +static void mtk_cirq_write_mask(struct irq_data *data, enum mtk_cirq_reg_index idx)
>>   {
>>   	struct mtk_cirq_chip_data *chip_data = data->chip_data;
>>   	unsigned int cirq_num = data->hwirq;
>>   	u32 mask = 1 << (cirq_num % 32);
>> +	u32 reg = chip_data->regs[idx] + (cirq_num / 32) * 4;
> 
> Please provide an accessor that takes chip_data and an index, and
> returns an address.
> 

Ack.

>>   
>> -	writel_relaxed(mask, chip_data->base + offset + (cirq_num / 32) * 4);
>> +	writel_relaxed(mask, chip_data->base + reg);
>>   }
>>   
>>   static void mtk_cirq_mask(struct irq_data *data)
>> @@ -160,7 +178,7 @@ static const struct irq_domain_ops cirq_domain_ops = {
>>   #ifdef CONFIG_PM_SLEEP
>>   static int mtk_cirq_suspend(void)
>>   {
>> -	u32 value, mask;
>> +	u32 value, mask, reg;
>>   	unsigned int irq, hwirq_num;
>>   	bool pending, masked;
>>   	int i, pendret, maskret;
>> @@ -200,31 +218,34 @@ static int mtk_cirq_suspend(void)
>>   				continue;
>>   		}
>>   
>> +		reg = cirq_data->regs[CIRQ_ACK] + (i / 32) * 4;
>>   		mask = 1 << (i % 32);
>> -		writel_relaxed(mask, cirq_data->base + CIRQ_ACK + (i / 32) * 4);
>> +		writel_relaxed(mask, cirq_data->base + reg);
>>   	}
>>   
>>   	/* set edge_only mode, record edge-triggerd interrupts */
>>   	/* enable cirq */
>> -	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
>> +	reg = cirq_data->regs[CIRQ_CONTROL];
>> +	value = readl_relaxed(cirq_data->base + reg);
>>   	value |= (CIRQ_EDGE | CIRQ_EN);
>> -	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
>> +	writel_relaxed(value, cirq_data->base + reg);
>>   
>>   	return 0;
>>   }
>>   
>>   static void mtk_cirq_resume(void)
>>   {
>> +	u32 reg = cirq_data->regs[CIRQ_CONTROL];
>>   	u32 value;
>>   
>>   	/* flush recorded interrupts, will send signals to parent controller */
>> -	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
>> -	writel_relaxed(value | CIRQ_FLUSH, cirq_data->base + CIRQ_CONTROL);
>> +	value = readl_relaxed(cirq_data->base + reg);
>> +	writel_relaxed(value | CIRQ_FLUSH, cirq_data->base + reg);
>>   
>>   	/* disable cirq */
>> -	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
>> +	value = readl_relaxed(cirq_data->base + reg);
>>   	value &= ~(CIRQ_EDGE | CIRQ_EN);
>> -	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
>> +	writel_relaxed(value, cirq_data->base + reg);
>>   }
>>   
>>   static struct syscore_ops mtk_cirq_syscore_ops = {
>> @@ -240,6 +261,9 @@ static void mtk_cirq_syscore_init(void)
>>   static inline void mtk_cirq_syscore_init(void) {}
>>   #endif
>>   
>> +static const struct of_device_id mtk_cirq_of_match[] = {
>> +	{ .compatible = "mediatek,
>> +
> 
> I can tell by this hunk the quality of testing this patch has
> received.
> 

Actually, the testing was performed on multiple SoCs.

As for why this is there, check below...

>>   static int __init mtk_cirq_of_init(struct device_node *node,
>>   				   struct device_node *parent)
>>   {
>> @@ -274,6 +298,8 @@ static int __init mtk_cirq_of_init(struct device_node *node,
>>   	if (ret)
>>   		goto out_unmap;
>>   
>> +	cirq_data->regs = mtk_cirq_regs_v1;
> 
> Why isn't this obtained from the matching array?
> 

.... I'm truly sorry for what happened, I've just checked - the right patchset
was in a different folder and I've somehow sent the wrong one.

Sorry again - will send a v2 ASAP.

Best regards,
Angelo

