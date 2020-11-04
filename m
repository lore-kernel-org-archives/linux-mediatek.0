Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3F8C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:54:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9A12083B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2q1dJ8L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cxjx0u7D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zxQWjZ8/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dOfXSMPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9A12083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGhodhtNo+Mdm/vmOYrO8IxacpgVx04/PtzLMPUIJKM=; b=l2q1dJ8Lqq6xCL2yOILYTlR95
	MupH7bTzv7Qwmj7jDRIAdCxDoIscc9gG/vnFtN2kquRVwranAc8P33/9ITYxF/Zhb2D5pga375ABh
	lcfrt5DdNuN7GlodtZcg3y5JF2EHojWTQzn6iTnF/ylkY5crwmQk3PA5Kjx4e/+DrzHfgEtI0R+Vk
	MHFkh2Iwo0pKqAm4RUb4hmoKzvr8WZq62jIkg4cQqMiK5DQ5QKqzgXmwhgCOIrd3SR/PwmzcNq6GQ
	EdWRT+HC9/q+PMcSV6dZ8vxb5v3zHbKqezJqaLAOnYlpZzJYbdsNV7GHGuPEjkEB9o9Qr5zwNVVTc
	frfHMW2pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXID-0001Sx-Iz; Thu, 05 Nov 2020 04:54:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW5T-00016k-QY
 for linux-mediatek@merlin.infradead.org; Thu, 05 Nov 2020 03:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S1uT/ory2tJYYKprq7tpAtg+6JYjWTDzAvdKLuSxFsE=; b=cxjx0u7DiLzg4g/gTzBoSNkpFp
 r5JRy2eYPV8Zr4eQFYghOa8z8KpoAbD6IUbD4aznhE9fEdxjPzcExsxX4unEFE3TB7ieMawhdFTA1
 Z9Lt3hgi26yZVPiNganzdwBZES3C6fx5dMS6je16zMHuNeX0N0Ghkkp/5u3VSEFAKJgqOPQixdm0K
 B+3dUFrYVtikv3laK/AfBtQ5khsIq022SgueiTYdkuPMQywiNgpQ9q6O6xjn76tv0SQXkzkxMZ9ka
 Awnf2n6PjAKOMxnpkBWG3d+BT/tgDytyjNXiCGMo+oms4dybFiQez0sQoCcNxNwowUMmGYg9FVHnV
 VGteAIeg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaRz2-0003SF-J7
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 23:14:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604531661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S1uT/ory2tJYYKprq7tpAtg+6JYjWTDzAvdKLuSxFsE=;
 b=zxQWjZ8/AB2Lwf78tMX7LeYKasG61OYcb90cptjPXIebDsJSwRhcNkMrSTvCJZ1yGDbEyR
 NXEA+Vo57Iybw8eFxlOuM68KL7Mi0R/iV8SC3tl2QcbA2cBdwTwHuTmLnaLY46yIjK0jcH
 WaJZ2/ttNxTf6dWOU4hw1IngCDCEAkqQpPqpP2a+7GQo7YMxgEDijLuI1udRtf9YcEv8JO
 0NfuyhdFKs83wvb7TEl8omLUTe51wXqvi9Qihu6s8PkMBSwCejhj1c12Z6bu1RuWADWH29
 15zj/t5AAwE3kJaF4wJ1SZWXdESIff94YI3z7nMPCgOHNZDBM5bKymokk/CZmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604531661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S1uT/ory2tJYYKprq7tpAtg+6JYjWTDzAvdKLuSxFsE=;
 b=dOfXSMPz5OxVxeZ5HDfZvfWqs8tGpBO9c7pDG6DteaqHiILOmLTr2FhW29AGAczpj5iDdb
 PrIdVoFXFH/Z+1AQ==
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Aw: Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
 <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
Date: Thu, 05 Nov 2020 00:14:20 +0100
Message-ID: <87h7q4lnoz.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_231428_817055_98B51BD0 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Frank,

On Wed, Nov 04 2020 at 17:49, Frank Wunderlich wrote:
>> Von: "Thomas Gleixner" <tglx@linutronix.de>
>> Any architecture which selects PCI_MSI_ARCH_FALLBACKS and does not have
>> irqdomain support runs into:
>>
>> 	if (!d)
>> 		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>>
>> which in turn makes pci_msi_supported() return 0 and consequently makes
>> pci_enable_msi[x]() fail.
>
> i'm not that deep into this, but just my thoughts...you are the experts :)
>
> checking for PCI_MSI_ARCH_FALLBACKS here does not help?
>
> something like this:
>
> #ifndef PCI_MSI_ARCH_FALLBACKS
> 	if (!d)
> 		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
> #endif

TBH, that's butt ugly. So after staring long enough into the PCI code I
came up with a way to transport that information to the probe code.

That allows a particular device to say 'I can't do MSI' and at the same
time keeps the warning machinery intact which tells us that a particular
host controller driver is broken.

Uncompiled and untested as usual :)

Thanks,

        tglx
---
 drivers/pci/controller/pcie-mediatek.c |    4 ++++
 drivers/pci/probe.c                    |    3 +++
 include/linux/pci.h                    |    1 +
 3 files changed, 8 insertions(+)

--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -143,6 +143,7 @@ struct mtk_pcie_port;
  * struct mtk_pcie_soc - differentiate between host generations
  * @need_fix_class_id: whether this host's class ID needed to be fixed or not
  * @need_fix_device_id: whether this host's device ID needed to be fixed or not
+ * @no_msi: Bridge has no MSI support
  * @device_id: device ID which this host need to be fixed
  * @ops: pointer to configuration access functions
  * @startup: pointer to controller setting functions
@@ -151,6 +152,7 @@ struct mtk_pcie_port;
 struct mtk_pcie_soc {
 	bool need_fix_class_id;
 	bool need_fix_device_id;
+	bool no_msi;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
@@ -1084,6 +1086,7 @@ static int mtk_pcie_probe(struct platfor
 
 	host->ops = pcie->soc->ops;
 	host->sysdata = pcie;
+	host->no_msi = pcie->soc->no_msi;
 
 	err = pci_host_probe(host);
 	if (err)
@@ -1173,6 +1176,7 @@ static const struct dev_pm_ops mtk_pcie_
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
+	.no_msi = true,
 	.ops = &mtk_pcie_ops,
 	.startup = mtk_pcie_startup_port,
 };
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -889,6 +889,9 @@ static int pci_register_host_bridge(stru
 	if (!bus)
 		return -ENOMEM;
 
+	if (bridge->no_msi)
+		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+
 	bridge->bus = bus;
 
 	/* Temporarily move resources off the list */
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -545,6 +545,7 @@ struct pci_host_bridge {
 	unsigned int	native_dpc:1;		/* OS may use PCIe DPC */
 	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
 	unsigned int	size_windows:1;		/* Enable root bus sizing */
+	unsigned int	no_msi:1;		/* Bridge has no MSI support */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
