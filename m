Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AFAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSh7eKq20ZA5Cn0IXcIg2KST46OhrnQ9gd0ECyyxbnw=; b=sTKm4AAggnTuBccRZ9Wx+UbJV1
	2tTtxoLE/6C+I47tupI5O0PNgTRnD+5NPpLZItQfrAbuCBWmopbcJrPD2jfxEwS/fIVasPBEcxVJH
	n90qruDXMtcCZtNHs0pvDFUjZTIPw+SiegF+0eRNp05lOrQ4cfZaFjWL96Visb7BJeEa4BxWWn5+k
	2syRqoHj0F8Nt/9XcAlnjsUvbWsTr+PL+3uOnPfNw2jqptTMN3pdR/bNr6U7kVXyWJwZvwfNsrGRd
	2emDuCwzXITis90P8j/Ksoi4JKsWAt7apCNhDeWLviZO1eIiKkfsmEIesRsL2L9CvWOMYHLDsWYa2
	zHxLQylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9P4A-00ES8G-1N; Mon, 17 Jan 2022 10:16:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9P46-00ES7x-Lp
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 10:16:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A9D2A1F4323E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642414599;
 bh=CKGfVkfWRYxqEOEtrRm//5yXNOmofYouJua9JEP+mhY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fVWDq+tfUmorLJncO/fCs8YZqsm1BnG6I+iYmrlH1BG1gaD54g7f6bS6rDjb62jgY
 u2O6BrCHfo6UXI6TrWTXwyVwX8r9kUK2KFOMny3HZtFGMp0ByFZREPpcDXJ5WCJGod
 CFpyiCKiZf3X/69wDT3erruEwTliasFHTieSCbicVeAG+2AO2C/h/Ou/Ti4YC+txeo
 7LhLxMdAGPoWxyr8iNyGtfJPboaX9RhymMLqB9uHc6+RJN3+EF0JUM+sXEcsd3zSCg
 bKUVXY5yCufDCF4P53q5NAvGYRQclzDUEj0BvSDoje/OcXpr1PoX68K/RI6U+OK1cF
 35SiZoqcm8ewA==
Subject: Re: [PATCH v1 2/4] spi: spi-mtk-nor: improve device table for adding
 more capabilities
To: Guochun Mao <guochun.mao@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 Bin Zhang <bin.zhang@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-3-guochun.mao@mediatek.com>
 <698a603b-574c-01ca-9e6b-edecdbc5959e@collabora.com>
 <53b6b78f48728f5a802707375092911ffa407289.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9069e681-6de0-bba2-8cba-194f7d924a4f@collabora.com>
Date: Mon, 17 Jan 2022 11:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <53b6b78f48728f5a802707375092911ffa407289.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_021643_077796_82D4CBC0 
X-CRM114-Status: GOOD (  29.95  )
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

Il 17/01/22 03:30, Guochun Mao ha scritto:
> Hello Angelo,
> 
> Thanks for your comments.
> 
> On Fri, 2022-01-14 at 11:40 +0100, AngeloGioacchino Del Regno wrote:
>> Il 14/01/22 07:24, guochun.mao@mediatek.com ha scritto:
>>> From: Guochun Mao <guochun.mao@mediatek.com>
>>
>> Hello Guochun,
>>
>> thanks for the patch! However, I have some comments...
>>
>>>
>>> Define a structure for adding more capabilities.
>>
>> Please also mention that you're adding the extra_dummy_bit feature
>> in the commit description.
>>
>>>
>>> +struct mtk_nor_caps {
>>> +	u32 dma_bits;
>>
>> dma_bits can be u8: I really don't think that we'll ever see more
>> than
>> 0xff bits...
>>
> 
> I'll fix it next version.
> 
>>> +	u32 extra_dummy_bit;
>>
>> This one looks a bit strange, can you please add a comment explaining
>> the
>> reason why we have this "extra dummy bit"?
>>
> 
> This one is adding for mt8186, which extra_dummy_bit is set to be 1.
> Due to the IP design, it need a extra_dummy bit when reading nor
> flash's register(status/config...).
> 
> Do you think I should move the modification to another patch
> "[PATCH v1 3/4]spi:spi-mtk-nor:add new soc mt8186 sopport" ?
> Or I just add this comment here?
> 

It's more appropriate to keep it in this patch and mentioning it into
the commit description. Also, please add this comment in the code and,
if possible, also explain why this IP design needs an extra dummy bit.
Otherwise, if not possible, the provided explaination would also be fine.

Thanks,
- Angelo

>>>
>>>    	// trigger op
>>> -	writel(prg_len * BITS_PER_BYTE, sp->base +
>>> MTK_NOR_REG_PRG_CNT);
>>> +	if (rx_len)
>>> +		writel(prg_len * BITS_PER_BYTE + sp->caps-
>>>> extra_dummy_bit,
>>> +		       sp->base + MTK_NOR_REG_PRG_CNT);
>>> +	else
>>> +		writel(prg_len * BITS_PER_BYTE, sp->base +
>>> MTK_NOR_REG_PRG_CNT);
>>> +
>>>    	ret = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
>>>    			       prg_len * BITS_PER_BYTE);
>>>    	if (ret)
>>> @@ -743,9 +754,19 @@ static const struct spi_controller_mem_ops
>>> mtk_nor_mem_ops = {
>>>    	.exec_op = mtk_nor_exec_op
>>>    };
>>>    
>>> +const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
>>> +	.dma_bits = 32,
>>> +	.extra_dummy_bit = 0,
>>> +};
>>> +
>>> +const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
>>> +	.dma_bits = 36,
>>> +	.extra_dummy_bit = 0,
>>> +};
>>> +
>>>    static const struct of_device_id mtk_nor_match[] = {
>>> -	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
>>> -	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
>>> +	{ .compatible = "mediatek,mt8173-nor", .data =
>>> &mtk_nor_caps_mt8173 },
>>> +	{ .compatible = "mediatek,mt8192-nor", .data =
>>> &mtk_nor_caps_mt8192 },
>>>    	{ /* sentinel */ }
>>    };
>>>    MODULE_DEVICE_TABLE(of, mtk_nor_match);
>>> @@ -754,10 +775,10 @@ static int mtk_nor_probe(struct
>>> platform_device *pdev)
>>>    {
>>>    	struct spi_controller *ctlr;
>>>    	struct mtk_nor *sp;
>>> +	struct mtk_nor_caps *caps;
>>>    	void __iomem *base;
>>>    	struct clk *spi_clk, *ctlr_clk, *axi_clk;
>>>    	int ret, irq;
>>> -	unsigned long dma_bits;
>>>    
>>>    	base = devm_platform_ioremap_resource(pdev, 0);
>>>    	if (IS_ERR(base))
>>> @@ -775,9 +796,11 @@ static int mtk_nor_probe(struct
>>> platform_device *pdev)
>>>    	if (IS_ERR(axi_clk))
>>>    		return PTR_ERR(axi_clk);
>>    
>>> -	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
>>> -	if (dma_set_mask_and_coherent(&pdev->dev,
>>> DMA_BIT_MASK(dma_bits))) {
>>> -		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n",
>>> dma_bits);
>>> +	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev-
>>>> dev);
>>> +	if (dma_set_mask_and_coherent(&pdev->dev,
>>> +				      DMA_BIT_MASK(caps->dma_bits))) {
>>
>> While you're at it, can you please also make this return the right
>> value?
>> The function dma_set_mask_and_coherent() may return an error code, so
>> it's
>> worth it to just return that.
>>
>> P.S.: 83 columns is ok
>>
> 
> ok, I'll fix it next version.
> Thanks.
> 
> BR,
> Guochun
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
