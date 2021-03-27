Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AFBC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 19:29:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA1561974
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 19:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA1561974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E1OFmm67q3EQBYnS5erfC8nWP35MxlLe9/qfDzi0SD4=; b=Fq9Yp1+cS/qqP4jEDsTH+oEiB
	gcSH9q7c8jOjcJzTW7WovDF1QQB76vVEO82Ypz/OsGCN6ApvYMxo9z5XjK2Qihs4Zt3qKT/13/fLn
	Bbr3cOOxWymJ/Y3ND0eQTRkwComyYtVKSQRZYsXlFZqHzByeIRUWCNSZ776huQ1ddbq/qoneKxgNc
	GT6xtFkeRtyy7PCPW3kKuMBboKdqW7+6hqsni7MpDvfrJ0dFIV3DwwV2MBhA0uEn0dkxoaGgScstA
	VkuurDxPAAx3dZYMMRlmrpdkVr21v6CM/cy+FLbVLX6EIIebQC1xyHixdxl1tjNY/iEELuTTWPrIM
	vRjcZJRNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQEcC-005SCd-5F; Sat, 27 Mar 2021 19:28:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQEc1-005SBi-Ei; Sat, 27 Mar 2021 19:28:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6761761984;
 Sat, 27 Mar 2021 19:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616873320;
 bh=wCnLXRJnoXnToeP+RQYUH5Bypi+1WeuwPi/OXoLDisw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TVt6NCGU0mQHdwaDTQY1PSp+lqJUSv1OwY+d4C+y3QlmblU9TtG29gRg5JMPqK24u
 S/AtJDE2VVPrXSV4vFM/kXzYz1c0pXLtN/D4Z6RAmq9Y0Q5dWezInkNygT+IxqbfHB
 pD3/4qRipDqUXJGz2HxSh12Od1NU20nsNh1v/jIVkwwdLzJ02PMJnZSZ0d9MAXs90u
 bIfeqKa55tVHueKBRfvJA4DN8nofrM8e0baSkHXYNXoDl1qi+vqB8Hdngcxr2RV9PI
 Uce+puhZytHYpzlMEi1NecafV1NGQtrX8yT+5p5nza2+NdkW/YvzXfPStqvbqHYwPn
 Lu4gKr5j5wBDw==
Received: by pali.im (Postfix)
 id B5EFE95D; Sat, 27 Mar 2021 20:28:37 +0100 (CET)
Date: Sat, 27 Mar 2021 20:28:37 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [v9,5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <20210327192837.4rr46oeiuokritlc@pali>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210324030510.29177-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324030510.29177-6-jianjun.wang@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_192845_729318_7149296F 
X-CRM114-Status: GOOD (  13.31  )
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

On Wednesday 24 March 2021 11:05:08 Jianjun Wang wrote:
> +static void mtk_pcie_msi_handler(struct mtk_pcie_port *port, int set_idx)
> +{
> +	struct mtk_msi_set *msi_set = &port->msi_sets[set_idx];
> +	unsigned long msi_enable, msi_status;
> +	unsigned int virq;
> +	irq_hw_number_t bit, hwirq;
> +
> +	msi_enable = readl_relaxed(msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
> +
> +	do {
> +		msi_status = readl_relaxed(msi_set->base +
> +					   PCIE_MSI_SET_STATUS_OFFSET);
> +		msi_status &= msi_enable;
> +		if (!msi_status)
> +			break;
> +
> +		for_each_set_bit(bit, &msi_status, PCIE_MSI_IRQS_PER_SET) {
> +			hwirq = bit + set_idx * PCIE_MSI_IRQS_PER_SET;
> +			virq = irq_find_mapping(port->msi_bottom_domain, hwirq);
> +			generic_handle_irq(virq);
> +		}
> +	} while (true);

Hello!

Just a question, cannot this while-loop cause block of processing other
interrupts?

I have done tests with different HW (aardvark) but with same while(true)
loop logic. One XHCI PCIe controller was sending MSI interrupts too fast
and interrupt handler with this while(true) logic was in infinite loop.
During one IRQ it was calling infinite many times generic_handle_irq()
as HW was feeding new and new MSI hwirq into status register.

But this is different HW, so it can have different behavior and does not
have to cause above issue.

I have just spotted same code pattern for processing MSI interrupts...

> +}
> +
>  static void mtk_pcie_irq_handler(struct irq_desc *desc)
>  {
>  	struct mtk_pcie_port *port = irq_desc_get_handler_data(desc);
> @@ -405,6 +673,14 @@ static void mtk_pcie_irq_handler(struct irq_desc *desc)
>  		generic_handle_irq(virq);
>  	}
>  
> +	irq_bit = PCIE_MSI_SHIFT;
> +	for_each_set_bit_from(irq_bit, &status, PCIE_MSI_SET_NUM +
> +			      PCIE_MSI_SHIFT) {
> +		mtk_pcie_msi_handler(port, irq_bit - PCIE_MSI_SHIFT);
> +
> +		writel_relaxed(BIT(irq_bit), port->base + PCIE_INT_STATUS_REG);
> +	}
> +
>  	chained_irq_exit(irqchip, desc);
>  }
>  
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
