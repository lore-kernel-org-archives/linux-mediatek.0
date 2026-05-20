Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF14CD5BA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od3JjqsxO5DW0D/LfjwnDigdaqm7px/QiBLhicHEbLU=; b=krZSlzsJg07ra7Svdwkzk3cNVa
	I/nP6/xUcFwunrZM0s0uV/jySdhH3XWFZGZbhb/6GMFXFizkzpU7AlrRnAsTehXUFgqvQp77/TlJi
	jgnNB1jBDLMpSA8dT1g90CBgsXY44eVuYD4LXQH3lzqHkVnY3UhCUUV5PcygB1cKFQhIrY0REpLiA
	AHxSHNt/cV/d0SrtPP9pTJfZqKW56FE/6tku5CQsBTet+8XijuiYw3RfUyfaem/3lHOfaKD/D3afE
	lEEty+F7a0QTJLwmRalztTv5SH/akjO+c+qHwLc6gn12lwTLSgDYscXAeA0J9SCXqYkBBSoJeRRgC
	krEp+TPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmQQ-00000005a35-1As4;
	Wed, 20 May 2026 19:17:50 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmQN-00000005a2I-2FKM
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 19:17:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216A243E3CF;
	Wed, 20 May 2026 21:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779304663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Od3JjqsxO5DW0D/LfjwnDigdaqm7px/QiBLhicHEbLU=;
	b=RB3WV9zk8G5mp0x8BMy1t8a6gkk9BQRxFupC2dtg/XF6QQu9c/bWxSo7fQt2hKSDAyF/Ua
	Z/qwz5kGmUcxNhaPCiXT/BYhpDlrdzw+5+836EYyJiqEnRO8xgtJSti0AklsZEu88fBKjh
	jq9Y1veXT5iGetpbMeN3ys8T+hE/s8AmlUqT3lAWr0kxCn7mYxrUH2wpbgZHlszsmCJb35
	7Yxt473IGeTUYIec8EKrXb7G0uAPY8z1zYhuEjdYDhRQJM8c47H6QBITU5O1pF1OqzuIUO
	OqwP7KI6dN11APmdhbPRS2Bm+leh2TQvpeqjeWdWfAWd0Hy0bwUNm1up7s0b8g==
Message-ID: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
Date: Wed, 20 May 2026 21:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address instead
 of virt_to_phys()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260520185534.GA72799@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260520185534.GA72799@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_121747_976019_89740CED 
X-CRM114-Status: GOOD (  23.41  )
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


On 20/05/2026 20:55, Bjorn Helgaas wrote:
> On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>
>> The driver previously used virt_to_phys() on the ioremapped register base
>> (port->base) to compute the MSI message address. Using virt_to_phys() on an
>> IO mapped address is incorrect because it expects a kernel virtual address.
>>
>> To fix it, store the physical start of the I/O register region in
>> mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
>> the incorrect virt_to_phys() usage and ensures MSI addresses are generated
>> correctly.
>>
>> Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
>> index 75722524fe74..c503fbd774d0 100644
>> --- a/drivers/pci/controller/pcie-mediatek.c
>> +++ b/drivers/pci/controller/pcie-mediatek.c
>> @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
>>   /**
>>    * struct mtk_pcie_port - PCIe port information
>>    * @base: IO mapped register base
>> + * @phys_base: Physical address of the I/O register base region
>>    * @list: port list
>>    * @pcie: pointer to PCIe host info
>>    * @reset: pointer to port reset control
>> @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
>>    */
>>   struct mtk_pcie_port {
>>   	void __iomem *base;
>> +	phys_addr_t phys_base;
>>   	struct list_head list;
>>   	struct mtk_pcie *pcie;
>>   	struct reset_control *reset;
>> @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>   	phys_addr_t addr;
>>   
>>   	/* MT2712/MT7622 only support 32-bit MSI addresses */
>> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>> +	addr = port->phys_base + PCIE_MSI_VECTOR;
> This doesn't look right because the MSI address is a PCI bus address,
> and port->phys_base is a CPU physical address.  Often a PCI bus
> address is the same as the CPU physical address, but not always.
> I think the DT 'ranges' property tells you the translation.


This is all still a little over my head here, but my understanding was 
that this is in the middle of the device's register map because the DT 
has the following:

reg = <0x1fb83000 0x1000>;
reg-names = "port1";

Per the manual, that offset (base + 0xc0) is in undocumented area but 
it's in the registers.


The PCI memory is 0x20000000 - 0x2fffffff and we split it between the 
two devices. Here's the one using the upper half:

         ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,  (IO)

              <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;      (MEM)


Hope I'm adding something useful here... Let me know if you want me to 
get or test anything else.

Thanks,

Caleb


>>   	msg->address_hi = 0;
>>   	msg->address_lo = lower_32_bits(addr);
>>   
>> @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>>   	u32 val;
>>   	phys_addr_t msg_addr;
>>   
>> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>> +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
>>   	val = lower_32_bits(msg_addr);
>>   	writel(val, port->base + PCIE_IMSI_ADDR);
>>   
>> @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>>   	struct mtk_pcie_port *port;
>>   	struct device *dev = pcie->dev;
>>   	struct platform_device *pdev = to_platform_device(dev);
>> +	struct resource *res;
>>   	char name[20];
>>   	int err;
>>   
>> @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>>   		return -ENOMEM;
>>   
>>   	snprintf(name, sizeof(name), "port%d", slot);
>> -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>> +	if (!res) {
>> +		dev_err(dev, "failed to get port%d base\n", slot);
>> +		return -EINVAL;
>> +	}
>> +
>> +	port->phys_base = res->start;
>> +	port->base = devm_ioremap_resource(&pdev->dev, res);
>>   	if (IS_ERR(port->base)) {
>>   		dev_err(dev, "failed to map port%d base\n", slot);
>>   		return PTR_ERR(port->base);
>> -- 
>> 2.39.5
>>

