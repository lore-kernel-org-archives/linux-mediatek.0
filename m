Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090CBC388F2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:31:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876EC206C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+QcKmVp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cJmsOmPV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k7tiSTzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876EC206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7t/9B8nOVrUnaLErwumGrTX5faheUdwLlvrXEtRlSLw=; b=r+QcKmVpflJFFNRUKPw2JwPn+
	oozfIeJOOl2y6pnEEyV3PVAOE2xrrtGA2SgJfieSZqjiPWzeQnWJwMtx/AHXCz2uT4zodOIa1sfqh
	FDI1rUUeUwP3wGh/MaKSq/B7ZpyiM8SoyjoYl0106gX+X8xMPX4sxsrgPTbjXeSnW4VMTxKvugYn5
	d8JHSpADDwG4+oZ/N4QimCBUpW1UOv33Slge3EoIAiv6zRGk25EE3DTmtzPFWRdeCrf1m7iYaVSQD
	DuQGVt0cYmNEpSfHFRCk0N45YMsCN2/iE5UYu3+a3xxjZI58yMoN57PcIErDuaRG8QKH4XB5IcFDa
	dS6pgYyjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtb9-0002Fu-Rg; Tue, 03 Nov 2020 10:31:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtaw-000282-Pp
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 10:31:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4YPfyThdfqh+Ek0aAZOjucScX+kZFKAkhTa4zTnlBMU=;
 b=cJmsOmPV8GxzrObsOJzXJvTYMLL9xzFykDdEjxeqVusW8aVOVPJKjwbe7RH/Qi4KGazgb6
 EXRzP0xXM42TRoQIjBOjqlb6E6IJNMg5Uj8mAc5cqfbHJfnhvPpar3uOMOKW8ezN121T8a
 SZhNsRibqapisx5f/5weainDJpjip7on3mdg+F9fcAxJ8oPkKlaYWreRU8WbB5JD6pr4qJ
 F07XA3El6TMzHtEVCrcFtl5Mfsj+eyD8kEiVd6Zd3AuGeEJN8dVA/THmr8KCllF2pe5+Dw
 I2o5pQOvke7qTwY4QNIw/OC1C03cMdbGZqpZ5ly8lJw41X8M2mgMCZ2GC3DoNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4YPfyThdfqh+Ek0aAZOjucScX+kZFKAkhTa4zTnlBMU=;
 b=k7tiSTzpqGHQ8uDde18bylPddN7ucdzaebd1+q9xcVIWj2XjHe6Ebn2vilYBp7//HFtXyS
 9Q9mwA+dO8xE2cDA==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
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
Date: Tue, 03 Nov 2020 11:31:17 +0100
Message-ID: <87k0v27mve.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_053119_048874_A12D56B6 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03 2020 at 09:54, Marc Zyngier wrote:
> On 2020-11-02 22:18, Thomas Gleixner wrote:
>> So we really need some other solution and removing the warning is not 
>> an option. If MSI is enabled then we want to get a warning when a PCI
>> device has no MSI domain associated. Explicitly expressing the PCIE
>> brigde misfeature of not supporting MSI is way better than silently
>> returning an error code which is swallowed anyway.
>
> I don't disagree here, though the PCI_MSI_ARCH_FALLBACKS mechanism
> makes it more difficult to establish.

Only for the few leftovers which implement msi_controller, i.e.

drivers/pci/controller/pci-hyperv.c
drivers/pci/controller/pci-tegra.c
drivers/pci/controller/pcie-rcar-host.c
drivers/pci/controller/pcie-xilinx.c

The architectures which select PCI_MSI_ARCH_FALLBACKS are:

arch/ia64/Kconfig:      select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
arch/mips/Kconfig:      select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
arch/powerpc/Kconfig:   select PCI_MSI_ARCH_FALLBACKS           if PCI_MSI
arch/s390/Kconfig:      select PCI_MSI_ARCH_FALLBACKS   if PCI_MSI
arch/sparc/Kconfig:     select PCI_MSI_ARCH_FALLBACKS if PCI_MSI

implement arch_setup_msi_irq() which makes it magically work :)

>> Whatever the preferred way is via flags at host probe time or flagging
>> it post probe I don't care much as long as it is consistent.
>
> Host probe time is going to require some changes in the core PCI api,
> as everything that checks for a MSI domain is based on the pci_bus
> structure, which is only allocated much later.

Yeah, it's nasty. One possible solution is to add flags or a callback to
pci_ops, but it's not pretty either.

I think we should go with the 'mark it after pci_host_probe()' hack for
5.10-rc. The real fix will be larger and go into 5.11.

Thoughts?

Thanks,

        tglx


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
