Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694CBC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:44:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D14610A1
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D14610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iAaPkF+DCM6Y+I6JHMcPJboYNtGq0cFOdiji69Ckhn8=; b=DHFgEhJs0abp8VaLf7kkvks9B
	5uuQUQRwPMzo9xm5xWn3qAu6hevmgdCK2Ozv0fAq+krlYRZqqY8Am+6YDknE2NU5JQ1LugrncJA1C
	laUljP3OxwlPrZWCsKijmZ6Z7TnhwPVI0TP3TcZz67EiPJrbse7MyyUpS4tXO64pE6Qoxxj/9oWkR
	eh4SlbJAqIDWbc9IoSCT3xxR78j/LkNTT4+ty1eFNf3x85+4OAWr5YqiHA/4h2SB/3Fs7U30TV4Rl
	2RnoyfthppqQ85mazW0KlSCS3PAaWHPG2tXA7jZl7XSblGKC11ONURpkWKnkXQ43UlvC9lsiXOojB
	oHZdmSR3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmvd-00Bnuy-1g; Tue, 20 Apr 2021 09:44:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmvR-00BntN-Ow; Tue, 20 Apr 2021 09:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=X82l9KPOP5po1pBXMtJfjHaJ3iAzaQqlWL66y/7u28w=; b=wFydCmelgjdA10ZCe2+HmzTX7T
 XWNoucn8uito9Hkn+3pMQwlni/XHAUGHYTxmTZGf27jODRddMdfMB+3ztHzMszEmKfnk1/zawuXbr
 oWXT9Bwr1FuX0ukFvNMWsTwcMz+JTKAFr3SH6CTbC2eO0XPyH61izt7PDqUpQWOeEHZUkssFaHXjY
 u9A1YY8BPic7N4BfLRjT9trZai1FaQgchKjIFxib0btflcjeHhBbTnm+JIJqSKheZSc3ZHInzMOce
 kw4nZ4ZZMOoDFz/Z3eFjbDiDe+974XLLBeol4R0mmR9lLyts1efPAgW5kmckqqCRAEBl1i/SCzmY8
 PIlyT3hQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmvO-00BzmL-QA; Tue, 20 Apr 2021 09:44:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AF81610A1;
 Tue, 20 Apr 2021 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618911845;
 bh=amcldydssZ0SAWDeOp2/A7nVn5OVi/p4nIOw88gtbDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c3faew728/ChhgCkd8dNWeWMB0T1xKZYqaoqNMLcvCxqfDeUfRVR6zNi7N0nMT5ov
 MrRKcW6YiniUq6RIRzGKEMWVooLThhb5HN26QqqsWKEwaJ0FASGRjorxYYiJ65hTEM
 HIKN70JWTC/YekCAqVvRPMOBkqi5Gm4TV7tFDeF8LLQaA3oOcyfXhYVNvXKWUYQe03
 GwfD+mMjjV/W6WZMVT5Dfv3ozFv3/ezvTSipYhKPFYOkym8R64SF7De+TvDp2WK2my
 56Wdp0FOI48/IXJ/wl2q0ridBMq4nx+fT0Ltyl/KpvkoAxmPQQj5iwWNRxFwDZu+A+
 IosE53sPB3P0Q==
Received: by pali.im (Postfix)
 id 849A4A2D; Tue, 20 Apr 2021 11:44:02 +0200 (CEST)
Date: Tue, 20 Apr 2021 11:44:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [PATCH v10 5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <20210420094402.hwdkbspl5wu4rtex@pali>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
 <20210420061723.989-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420061723.989-6-jianjun.wang@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_024406_927301_44E6D17D 
X-CRM114-Status: GOOD (  12.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On Tuesday 20 April 2021 14:17:21 Jianjun Wang wrote:
> +static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> +{
> +	int i;
> +	u32 val;
> +
> +	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
> +		struct mtk_msi_set *msi_set = &port->msi_sets[i];
> +
> +		msi_set->base = port->base + PCIE_MSI_SET_BASE_REG +
> +				i * PCIE_MSI_SET_OFFSET;
> +		msi_set->msg_addr = port->reg_base + PCIE_MSI_SET_BASE_REG +
> +				    i * PCIE_MSI_SET_OFFSET;
> +
> +		/* Configure the MSI capture address */
> +		writel_relaxed(lower_32_bits(msi_set->msg_addr), msi_set->base);
> +		writel_relaxed(upper_32_bits(msi_set->msg_addr),
> +			       port->base + PCIE_MSI_SET_ADDR_HI_BASE +
> +			       i * PCIE_MSI_SET_ADDR_HI_OFFSET);

This looks like as setting MSI doorbell address to MSI doorbell address.

> +static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> +{
> +	struct mtk_msi_set *msi_set = irq_data_get_irq_chip_data(data);
> +	struct mtk_pcie_port *port = data->domain->host_data;
> +	unsigned long hwirq;
> +
> +	hwirq =	data->hwirq % PCIE_MSI_IRQS_PER_SET;
> +
> +	msg->address_hi = upper_32_bits(msi_set->msg_addr);
> +	msg->address_lo = lower_32_bits(msi_set->msg_addr);
> +	msg->data = hwirq;
> +	dev_dbg(port->dev, "msi#%#lx address_hi %#x address_lo %#x data %d\n",
> +		hwirq, msg->address_hi, msg->address_lo, msg->data);

... which is later used in compose_msi_msg().

Marc in some other patches for other pci controller drivers changed this
address to just main "port" structure. It simplified implementations and
also avoided need to declare additional member "msg_addr".

Marc, would it be possible to simplify it also for this driver and just
set msg_addr to virt_to_phys(port)?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
