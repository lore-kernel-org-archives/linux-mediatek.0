Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08546C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 22:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517CC221FC
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 22:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0PnTd2+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zrhVLZVB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="91YBEhR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517CC221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zrbdh7a4QhfX4DgrYg4QSNdjGRhlGPkJShOdlPnqXho=; b=k0PnTd2+GUiBGqD3PKWagzE2J
	cT353ZbUSSslJZD5SinHcLvcJfehYIPC+ZSdi/+c+T6+8xa/9SxGiB/DKT9gY+f4qgcbSOuD/cgQV
	d8IFfdOYHXozpZAu0WQEqP+2b4cguQ8KZb+Q/idVwpDcBg1ynuHrAHFFSy+VJgiRtgRh4Nqvwdb0L
	lph1nllcZtxtfOJG6iMmAdVvnwmBL0kqM0s000N77Yq/4PS41dmm3HOEz7Qqd23J/pk64CSx96RmQ
	B2O28G7czSzu1uvXBm8Q6gVTe6QI1XQzwgdjuBL2G1rYy2AMBoqEsErsQbJuqW7coUtRODSXmlxIh
	7a6jLCE1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZLp0-000059-A6; Sun, 01 Nov 2020 22:27:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZLon-0008Vw-9p
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 22:27:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604269638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptxTsFp2L6efDZ+NSsWwAuqOWnuRT3+qbc/ppVuKKyc=;
 b=zrhVLZVBFb+q3hwt5X/nvPFMdsf4VVl0ZxIm6E9eDxZYf3tEfrB4GMorHj70CBSscXfA5q
 7tO17wbxtYzyEztnPNpp6pQuRYCAeWfhc7Il6oGoD1aiHBTVutRnmhuHxyiWTlq68VnE58
 w27URJOE8zqC0GDeT+YmTP5UZSmKvsdovTCAcCrGw2yE4gMtVEv+1ZBI/nIQsjtImf17A9
 Z8Ov/wMPndW4hznqwyyx8pNQ/R/xQ/YDb/BcA+2d6aeBZoGbhd5JGWBYCzq/dgNYGItFzD
 kCo8gVDp9I4LV4+AEt6/OCNhbW9bTtWPNdhpo7NJShn3Hlhb+E+zrRbzN8RcLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604269638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptxTsFp2L6efDZ+NSsWwAuqOWnuRT3+qbc/ppVuKKyc=;
 b=91YBEhR4RkDtGn4ekE0bM4GfC1r7cgSSnIrSGBCPZonjdRxEx8D8WPiVKEkZJtgtNmQJ3J
 9Lpp8U5BuAPEbmAw==
To: Marc Zyngier <maz@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87k0v4u4uq.wl-maz@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org>
Date: Sun, 01 Nov 2020 23:27:17 +0100
Message-ID: <87pn4w90hm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_172721_517875_2D9C8283 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01 2020 at 21:47, Marc Zyngier wrote:
> On Sun, 01 Nov 2020 18:27:13 +0000,
> Frank Wunderlich <frank-w@public-files.de> wrote:
> Thinking of it a bit more, I think this is the wrong solution.
>
> PCI MSIs are optional, and not a requirement. I can trivially spin a
> VM with PCI devices and yet no MSI capability (yes, it is more
> difficult with real HW), and this results in a bunch of warning, none
> of which are actually indicative of anything being wrong.

Well. No. 

The problem is that the device enumerates MSI capability, but the host
bridge is not proving support for MSI. 

The host bridge fails to mark the bus with PCI_BUS_FLAGS_NO_MSI. That's
the reason why this runs into this issue.

Something like the uncompiled hack below. I haven't found a way to hand
that down to the probe function.

Thanks,

        tglx
---
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cf4c18f0c25a..d91bdfea7329 100644
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
@@ -1089,6 +1091,9 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	if (!pcie->soc->no_msi)
+		host->bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+
 	return 0;
 
 put_resources:
@@ -1173,6 +1178,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
+	.no_msi = true,
 	.ops = &mtk_pcie_ops,
 	.startup = mtk_pcie_startup_port,
 };




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
