Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AABC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:06:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3B464F8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3B464F8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rwbFc5S8Rc653BWGEfERR7S6QTTqbArn1FGuilVZ8ro=; b=OgnRzIGUL+yaqAWgnDEyPO9T/
	Pm2wo8vbKN+QTFhufPTRP7RD+l1VEGjVAS5TV5q3Vp6m5Lqo8TE1Ubvnv/PZoSOR1H3b0tV+RqLPn
	ZP1/8iZEY3c+F71Th5abzZpZpxI8ZocFL/CAuzz5LH/TuvD4qcVhatk0opAHaBv1s71CSC0b8yO2Z
	VEAU3yTlsqGjCSK1CH/LLUxMIdMzx0K8B/MRU/0/kceRzRDAOSuwIaWlNPdAy6Vz5XABlMqZP7vti
	Nt+63yTy9Ep7fZvKgJbO8HnKTigM+wVWvWnuRfjldyZAWqV1/oQnTPPfA6Q2A/VcsndK/sMvVuwdx
	KDVjgvPuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK8qB-0082gf-BU; Thu, 11 Mar 2021 00:06:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK8q1-0082fI-Ad; Thu, 11 Mar 2021 00:06:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EC3064E33;
 Thu, 11 Mar 2021 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615421158;
 bh=iFxVJgMoDpJ44jsE4Fuo7YkLXTeRvt9qHwXirR8S6SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pHbUatCvju/H17C/5K/sXqE3GC74q+fVaVWePgzCGPEelm8i6fAHWz7kps59DplLz
 rl8g4mlo7ESlnxn/xVc/ow7B1sTyAa92MPRjY/MNPbjODF0ndY5jAMoWs9UhvruzzF
 pbRgOgVPXwajI2R6qhkbtG469UMo5Vt3Conr7vGybjMfgOyMsHqGydidarB/nUqtte
 x4bln9KOuq+PyFRDgZ1vH3TCOzJ92D9mEtph5qIxTfFsaDe9ZqyixECTwwRCaB0ise
 0Vc2O5Xib/wPG/mDsEVfXTteHQGUWLD2sx6M0MVavI3kUxpsoSFPiecKAXA5hEMwgY
 qOpr7+u2Ha48Q==
Received: by pali.im (Postfix)
 id 00BD9A83; Thu, 11 Mar 2021 01:05:55 +0100 (CET)
Date: Thu, 11 Mar 2021 01:05:55 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sj Huang <sj.huang@mediatek.com>, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <20210311000555.epypouwxdbql2aqx@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-6-jianjun.wang@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_000601_568562_E089361B 
X-CRM114-Status: GOOD (  11.81  )
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

On Wednesday 24 February 2021 14:11:30 Jianjun Wang wrote:
> +static int mtk_msi_bottom_domain_alloc(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs,
> +				       void *arg)
> +{
> +	struct mtk_pcie_port *port = domain->host_data;
> +	struct mtk_msi_set *msi_set;
> +	int i, hwirq, set_idx;
> +
> +	mutex_lock(&port->lock);
> +
> +	hwirq = bitmap_find_free_region(port->msi_irq_in_use, PCIE_MSI_IRQS_NUM,
> +					order_base_2(nr_irqs));
> +
> +	mutex_unlock(&port->lock);
> +
> +	if (hwirq < 0)
> +		return -ENOSPC;
> +
> +	set_idx = hwirq / PCIE_MSI_IRQS_PER_SET;
> +	msi_set = &port->msi_sets[set_idx];
> +
> +	for (i = 0; i < nr_irqs; i++)
> +		irq_domain_set_info(domain, virq + i, hwirq + i,
> +				    &mtk_msi_bottom_irq_chip, msi_set,
> +				    handle_edge_irq, NULL, NULL);
> +
> +	return 0;
> +}
> +
> +static void mtk_msi_bottom_domain_free(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct mtk_pcie_port *port = domain->host_data;
> +	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
> +
> +	mutex_lock(&port->lock);
> +
> +	bitmap_clear(port->msi_irq_in_use, data->hwirq, nr_irqs);

Marc, should not be there bitmap_release_region() with order_base_2()?

bitmap_release_region(port->msi_irq_in_use, data->hwirq, order_base_2(nr_irqs));

Because mtk_msi_bottom_domain_alloc() is allocating
order_base_2(nr_irqs) interrupts, not only nr_irqs.

> +
> +	mutex_unlock(&port->lock);
> +
> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
