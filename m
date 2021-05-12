Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A24C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:01:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F0561417
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F0561417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWFRPubKnXmiIYpzwWNEN2uqICqO9UmjP1I/xORRUuI=; b=fogXrS/jFqg46UP5RNJsDE/5Nl
	GqunC0/jvdOGuPg7AXRmC+OJFq87/RKBO10p2Ees27WZOk+/SEyAYFnkspszUW4idJryB1IEJc09o
	VfDJC0QAbHXTFW8S0HF4o1xWnRtgevzTgT/GOLpUL4vwqvkObkfe+7/nTGaB1QCw3GehdLcWsW2Pw
	ihk8wsRFdHx2ehhbilPIqQ2IF73hYNnsoOgW9YV3245ANv+2mzrZhK9Ucyh7e+Zm3+nW4XccLgKdy
	e2W0DPyS/qB74iytvJAM2YW9lbpAD3hv4j+z0+gFUoSfHzzQ4RObrfWtFOicwOPsQhcOb2hRWvonh
	50q4LlyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgkkI-002O23-Go; Wed, 12 May 2021 09:01:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkkG-002O1p-Ls
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 09:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=XRh8DBuFsdI64SvvJXJZTgr1aPDj2Ap2L96RwKJSdCs=; b=QczqahFolqoXBjVDfzV4cYKt0p
 gO5RmPG0BCuh0TFiX7kwjbkXTr6VSsPABGeC1BLvjC+vK/xtkWswUrONyWvuiBCL8tZdX2qZkzbqx
 EdC7cuOkVN1GWsQqRXYs1WFVTkfK/QH9n5Q+DvsJRB9G+tq9DER0S/0eqPRG9Kz1XU4RTRUi8D7TL
 EidA3JLjC3Pvb6hkpbSd0mG7oZwYOFPMya0X/nDCac/MSm+D6F6klfxepSI9DHaRvjMuj0QvMCBgU
 shlDDCdMrri+2enGtRWbmCdS1ZI/7S54F3oz6wmTmJRCvVhU7BvkslvjnqLRKkpCHwhjDR7aqdPDr
 xKv9G1Dw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkkD-00AEeN-Do
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 09:01:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF2361403;
 Wed, 12 May 2021 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620810089;
 bh=LrJfcvYmwNPVG5K756hAp+n6HVtvRBSzV4I71YDecc0=;
 h=Subject:To:Cc:From:Date:From;
 b=Y1QRGKVHASEwfuAJBIH0s1G2qIQG55JWLd93RvOGO62MDoPAQvT7aruSvn2b+x3BP
 yo2MSS8y24PfdjU8W+VDOtG8Np2SHQjva6Gz7N7DM9fxSRmfG6GcmZjXWi8CUnFUJp
 7PjoqQDpR1CA9wGCsbmdOqKErdWsHrIkhJhmx1a0=
Subject: Patch "MIPS: pci-mt7620: fix PLL lock check" has been added to the
 5.12-stable tree
To: gregkh@linuxfoundation.org, ilya.lipnitskiy@gmail.com, john@phrozen.org,
 linux-mediatek@lists.infradead.org, tsbogend@alpha.franken.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 May 2021 10:58:29 +0200
Message-ID: <162080990912714@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_020129_537105_3AEC98B0 
X-CRM114-Status: GOOD (  14.59  )
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


This is a note to let you know that I've just added the patch titled

    MIPS: pci-mt7620: fix PLL lock check

to the 5.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-pci-mt7620-fix-pll-lock-check.patch
and it can be found in the queue-5.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c15b99ae2ba9ea30da3c7cd4765b8a4707e530a6 Mon Sep 17 00:00:00 2001
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Sat, 6 Mar 2021 20:17:24 -0800
Subject: MIPS: pci-mt7620: fix PLL lock check

From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

commit c15b99ae2ba9ea30da3c7cd4765b8a4707e530a6 upstream.

Upstream a long-standing OpenWrt patch [0] that fixes MT7620 PCIe PLL
lock check. The existing code checks the wrong register bit: PPLL_SW_SET
is not defined in PPLL_CFG1 and bit 31 of PPLL_CFG1 is marked as reserved
in the MT7620 Programming Guide. The correct bit to check for PLL lock
is PPLL_LD (bit 23).

Also reword the error message for clarity.

Without this change it is unlikely that this driver ever worked with
mainline kernel.

[0]: https://lists.infradead.org/pipermail/lede-commits/2017-July/004441.html

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/pci/pci-mt7620.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -30,6 +30,7 @@
 #define RALINK_GPIOMODE			0x60
 
 #define PPLL_CFG1			0x9c
+#define PPLL_LD				BIT(23)
 
 #define PPLL_DRV			0xa0
 #define PDRV_SW_SET			BIT(31)
@@ -239,8 +240,8 @@ static int mt7620_pci_hw_init(struct pla
 	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
 	mdelay(100);
 
-	if (!(rt_sysc_r32(PPLL_CFG1) & PDRV_SW_SET)) {
-		dev_err(&pdev->dev, "MT7620 PPLL unlock\n");
+	if (!(rt_sysc_r32(PPLL_CFG1) & PPLL_LD)) {
+		dev_err(&pdev->dev, "pcie PLL not locked, aborting init\n");
 		reset_control_assert(rstpcie0);
 		rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
 		return -1;


Patches currently in stable-queue which might be from ilya.lipnitskiy@gmail.com are

queue-5.12/mips-pci-mt7620-fix-pll-lock-check.patch
queue-5.12/mips-pci-rt2880-fix-slot-0-configuration.patch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
