Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2971CCF9C69
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=527+gNj6/7kG6iWl5vMiDX1gCmoLNC5rPDUms4KQv5w=; b=TadGK4AIr5o+HvOafP3iKvM5ww
	Qkx95EWGgOMFqauT8+AC+x+wZw5wpEQyChR03xQEDgt+ZJnWZeOGl60PnEP8k/SqPr/B9VPXlFrh5
	1shPt4KiQQpPhBiM5iz1TEzBLd9t3c/jSZscDXkuMI3BOmzgoZpKZoFjqAsck4st26XbLLpKvVo5R
	Se/X5Q6THK7OxVwHVqnXVo9SzI9ER0JAfTd7eun9lrW4+zvFPk4aiNNA9Ad2zaDj0Zdo7FjPPSLml
	Bx/6dHnuy5InQ8holBXKUCUf33FPdV5rj6sG5FeRYhrKLlA2dqRSbv9nHEltiNMyiQso+0USsAloQ
	UMQ0OLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sshFt-0000000H4YB-0eHG;
	Mon, 23 Sep 2024 11:29:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sshEj-0000000H4Uv-3VXv;
	Mon, 23 Sep 2024 11:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727090891;
	bh=ZYIUJSJHY0X6GASbH43baRFil7lffT/IRTBTSaj1FZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E2qmDCYswf1FlpWFMUZ/DCi5wig/Bwqt7JMBv8rOE/4QnZLYWrQ5+A6hOk/uzjAgo
	 AG24Hw62qmCCNQCMtA3iDs+xzBas9dKNSGYv4d0Qswhr+2TTxyGv7XqxIrV3LYepGn
	 6Se8+juJ6TgRD/VZPKryU/It/bkFBwk4U0jNC7nrCvnhSJp4eHSF5VzQf3vjUVkJHG
	 ts+2Vw6+jyiG87iV9gkjhMRHX+2iLOTlee7fLIcX/LLs3cSOQemLELLIZqCr8xkl9N
	 UYVcjP+bc41dFQ4jDA5lMRvOnDUtVrMCv1SUBc2fgsdYByHVru7UH0CAYi8yNKtbJu
	 TjBHgqbx78WRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92D4D17E121F;
	Mon, 23 Sep 2024 13:28:10 +0200 (CEST)
Message-ID: <05ec0016-09e8-4e84-92d1-698b3c195ec8@collabora.com>
Date: Mon, 23 Sep 2024 13:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBQQ0k6IG1lZGlhdGVrLWdlbjM6IEF2?=
 =?UTF-8?Q?oid_PCIe_resetting_for_Airoha_EN7581_SoC?=
To: =?UTF-8?B?SHVpIE1hICjpqazmhacp?= <Hui.Ma@airoha.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
 =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, upstream <upstream@airoha.com>
References: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
 <d8941149-9125-4fe2-a1c0-ab29223a0c87@collabora.com>
 <SG2PR03MB6341D9B41B5742BD45E09B46FF6F2@SG2PR03MB6341.apcprd03.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <SG2PR03MB6341D9B41B5742BD45E09B46FF6F2@SG2PR03MB6341.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_042814_055664_47C5DBC1 
X-CRM114-Status: GOOD (  25.04  )
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

Il 23/09/24 12:06, Hui Ma (马慧) ha scritto:
> Hi Angelo，
> 
>           EN7581 doesn't support pulling up/down PERST by bit3 of PCIe MAC register 0x148(PCIE_RST_CTRL_REG).
> 
>           EN7581 toggle PERST in clk_bulk_enable function called by mtk_pcie_en7581_power_up function.
> 

Hello Hui,
please don't top post.

Anyway, are those bits unexistant on EN7581, or are those used for different
functions?

If those do not exist, and setting those bits will not produce adverse effects,
it'd be possible to avoid creating a different codepath and just add a comment
saying that the setting has no effect on Airoha EN7581.

Regards,
Angelo

> 
> 
> 
> 
> 
> 
> 
> -----邮件原件-----
> 发件人: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 发送时间: 2024年9月23日 17:42
> 收件人: Lorenzo Bianconi <lorenzo@kernel.org>; Ryder Lee <Ryder.Lee@mediatek.com>; Jianjun Wang (王建军) <Jianjun.Wang@mediatek.com>; Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof Wilczyński <kw@linux.com>; Rob Herring <robh@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>; Matthias Brugger <matthias.bgg@gmail.com>
> 抄送: Christian Marangi <ansuelsmth@gmail.com>; linux-pci@vger.kernel.org; linux-mediatek@lists.infradead.org; linux-arm-kernel@lists.infradead.org; upstream <upstream@airoha.com>; Hui Ma (马慧) <Hui.Ma@airoha.com>
> 主题: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha EN7581 SoC
> 
> 
> 
> Il 20/09/24 10:26, Lorenzo Bianconi ha scritto:
> 
>> The PCIe controller available on the EN7581 SoC does not support reset
> 
>> via the following lines:
> 
>> - PCIE_MAC_RSTB
> 
>> - PCIE_PHY_RSTB
> 
>> - PCIE_BRG_RSTB
> 
>> - PCIE_PE_RSTB
> 
>>
> 
>> Introduce the reset callback in order to avoid resetting the PCIe port
> 
>> for Airoha EN7581 SoC.
> 
>>
> 
> 
> 
> EN7581 doesn't support pulling up/down PERST#?!
> 
> That looks definitely odd, as that signal is part of the PCI-Express CEM spec.
> 
> 
> 
> Besides, there's another PERST# assertion at mtk_pcie_suspend_noirq()...
> 
> 
> 
> Cheers,
> 
> Angelo
> 
> 
> 
>> Tested-by: Hui Ma <hui.ma@airoha.com<mailto:hui.ma@airoha.com>>
> 
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org<mailto:lorenzo@kernel.org>>
> 
>> ---
> 
>>    drivers/pci/controller/pcie-mediatek-gen3.c | 44 ++++++++++++++++++-----------
> 
>>    1 file changed, 28 insertions(+), 16 deletions(-)
> 
>>
> 
>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> 
>> b/drivers/pci/controller/pcie-mediatek-gen3.c
> 
>> index 5c19abac74e8..9cea67e92d98 100644
> 
>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> 
>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> 
>> @@ -128,10 +128,12 @@ struct mtk_gen3_pcie;
> 
>>    /**
> 
>>     * struct mtk_gen3_pcie_pdata - differentiate between host generations
> 
>>     * @power_up: pcie power_up callback
> 
>> + * @reset: pcie reset callback
> 
>>     * @phy_resets: phy reset lines SoC data.
> 
>>     */
> 
>>    struct mtk_gen3_pcie_pdata {
> 
>>             int (*power_up)(struct mtk_gen3_pcie *pcie);
> 
>> +    void (*reset)(struct mtk_gen3_pcie *pcie);
> 
>>             struct {
> 
>>                       const char *id[MAX_NUM_PHY_RESETS];
> 
>>                       int num_resets;
> 
>> @@ -373,6 +375,28 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
> 
>>             writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
> 
>>    }
> 
>>
> 
>> +static void mtk_pcie_reset(struct mtk_gen3_pcie *pcie) {
> 
>> +    u32 val;
> 
>> +
> 
>> +    /* Assert all reset signals */
> 
>> +    val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> 
>> +    val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> 
>> +    writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> 
>> +
> 
>> +    /*
> 
>> +    * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> 
>> +    * and 2.2.1 (Initial Power-Up (G3 to S0)).
> 
>> +    * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> 
>> +    * for the power and clock to become stable.
> 
>> +    */
> 
>> +    msleep(100);
> 
>> +
> 
>> +    /* De-assert reset signals */
> 
>> +    val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> 
>> +    writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG); }
> 
>> +
> 
>>    static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
> 
>>    {
> 
>>             struct resource_entry *entry;
> 
>> @@ -402,22 +426,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
> 
>>             val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> 
>>             writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> 
>>
> 
>> -     /* Assert all reset signals */
> 
>> -     val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> 
>> -     val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> 
>> -     writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> 
>> -
> 
>> -     /*
> 
>> -     * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> 
>> -     * and 2.2.1 (Initial Power-Up (G3 to S0)).
> 
>> -     * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> 
>> -     * for the power and clock to become stable.
> 
>> -     */
> 
>> -     msleep(100);
> 
>> -
> 
>> -     /* De-assert reset signals */
> 
>> -     val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> 
>> -     writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> 
>> +    /* Reset the PCIe port if requested by the hw */
> 
>> +    if (pcie->soc->reset)
> 
>> +             pcie->soc->reset(pcie);
> 
>>
> 
>>             /* Check if the link is up or not */
> 
>>             err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val, @@
> 
>> -1207,6 +1218,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
> 
>>
> 
>>    static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
> 
>>             .power_up = mtk_pcie_power_up,
> 
>> +    .reset = mtk_pcie_reset,
> 
>>             .phy_resets = {
> 
>>                       .id[0] = "phy",
> 
>>                       .num_resets = 1,
> 
>>
> 
>> ---
> 
>> base-commit: f2024903cb387971abdbc6398a430e735a9b394c
> 
>> change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> 
>>
> 
>> Best regards,
> 
> 


