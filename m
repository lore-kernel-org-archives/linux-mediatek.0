Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EB3C388F7
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 21:49:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B81820729
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 21:49:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcbtFWGH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vsliVRnt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ng5hsa/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B81820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnpD4ltYH5GuxrMTKj4srOE49NmxiMIrbil/vKyruPc=; b=pcbtFWGH9q3zEvKtV8ORh69Qd
	iSYLWi6ANQf0JpKl2c+eqggbk/tzabBDSQRNMu+KcaOgnak33CI177XX+wjWWI2YwCj9o6f2/Ezzb
	wgzDJZXQw8clXIDfo+ZBThxrf1qSm6mB+8Q7XBxdIWRli4Yl9dYw+faxoMrh3tGmbTVDaY+dDd1tw
	LorVTF1Rw7aLnHy7/F/wKlwjgEs+idPn7bccmJA3DrPkAW1X11kHXAEvll/O7QxWNEbd2E48yj85/
	74pg3mLMZUErNivfsjm3z/3WXvkuU2isKFN8mKDifotdwDYymJbXs4eENhm/YUbGhfeaCB4BZjld1
	5pPtvbIYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYykS-0006jk-2c; Sat, 31 Oct 2020 21:49:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYykP-0006j8-9F
 for linux-mediatek@lists.infradead.org; Sat, 31 Oct 2020 21:49:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604180955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkyGG23d8Oju/T6dnuYTqANlxTDymnqLTSvkubtS9gg=;
 b=vsliVRntutM0GOE3hoVVmu/ViFK7VmgZQP2wNyCzCpGdrt0qNofOwIMEPXaJ8iQodzXlSk
 HEjRYOxuR3Bc8odVZRARR9iZng+XdMVQ09CbkALJBnfTGAVpGC/SW6BRY591pzGCoSCS6j
 XT8wZRRpGZRtFlWTr2roNQTditYoerX6nw0yjimKlqMwicO6Od1wxUxKeL+qsUtpCKybJ0
 ckRRqM6s7y5PbyYodgT4K9CxJFKft0VtbF/oXj1I07SVDdLwG5lNv+aoCpW0+oBhc976d6
 OpGPIXkyYsKi9E7in3lwwHurMXjvcVivPjnIXWQYSN3nHhiXatva6m7Gv31S8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604180955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkyGG23d8Oju/T6dnuYTqANlxTDymnqLTSvkubtS9gg=;
 b=ng5hsa/ui4rhHNPKLXo4Fp1L0eC1dpYDz4IzhYF9wy/FkMRl6UZ8zDMPm11TZFcaoAbz4Q
 izrr+3daBzIRU/Dg==
To: Frank Wunderlich <linux@fw-web.de>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <20201031140330.83768-1-linux@fw-web.de>
References: <20201031140330.83768-1-linux@fw-web.de>
Date: Sat, 31 Oct 2020 22:49:14 +0100
Message-ID: <878sbm9icl.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_174917_459557_81497FFC 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
 Frank Wunderlich <frank-w@public-files.de>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Frank,

On Sat, Oct 31 2020 at 15:03, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>
> 5.10 shows these warnings on bootup while enabling pcie
> at least on bananapi-r2:
>
> [    6.161730] WARNING: CPU: 2 PID: 73 at include/linux/msi.h:213 pci_msi_setup_
> msi_irqs.constprop.0+0x78/0x80
> ....
> [    6.724607] WARNING: CPU: 2 PID: 73 at include/linux/msi.h:219 free_msi_irqs+
>
> fix this by selecting PCI_MSI_ARCH_FALLBACKS for MTK PCIe driver

That's not a fix. It's just supressing the warning.

PCI_MSI_ARCH_FALLBACKS is only valid for

  1) Architectures which implement the fallbacks

  2) Outdated PCI controller drivers on architectures without #1 which
     implement the deprecated msi_controller mechanism. That is handled
     in the weak arch fallback implementation.

The mediatek PCIE driver does not qualify for #2. It's purely irq domain
based.

So there is something else going wrong. The PCI device which tries to
allocate MSIs does not have an irq domain associated which makes it run
into that warning.

If you enable PCI_MSI_ARCH_FALLBACKS then the MSI allocation fails
silently. So it's just papering over the underlying problem.

So it needs to be figured out why the domain association is not there.

Thanks,

        tglx






_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
