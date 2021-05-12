Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22662C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:00:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CD661413
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CD661413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C24fNWH3rOjfX260HO6UyNdhWwZxH+5v4egM1Qx2f5I=; b=OpLYm6HTOLKOTAnH+O48R8kDdp
	QdwVJ2Bx+7uxbSlAXZKXWvebLnjV8hLqlfybricU0XbskXQ3qmGX4J1Q6CpAo7TIQyqs/Cy/eUcQo
	wnOVXydkLES2u1g8iK2Q0VPKgxrkOyxHU4E6UUDMEiffZruCMs2eiMgwEvQ2BLe0POTItQPdkpzgO
	bg3+1nBnZbXR9xNdWi8zrb9lJVx25I3ea8f2Xh9Eb/Wxai8dgKERH/mxC4xCi5zlMuMSfYB47Evey
	pxY5rQQjE1LCGD0sRE66WvNHFWouAweks2LR3XPIViHkLjQqqgf/KlwxOVQIz6Ug70ogIhlHjE0u2
	OdnCdDgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgkjN-002Nvs-Fh; Wed, 12 May 2021 09:00:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkjL-002NvD-Qy
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 09:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=8eBhNBE31ADoyqG/GfhAFRgaQgr/vMmsdgoDpFDzopg=; b=Vh7y4lmdosxt9pXQ6kDF91Mj00
 MPhl/LUFt6C8w4KNbQ2bn3kmbsJeF4WPjfFpnlenPguvnE4YF+h3xfmOLh9wTCFIShNheHwfcLipV
 +Jib73JTIS1qqWXvyzW2P1MEC8CwQ1GqZFDRTlJuf7wb+k2QEpvW434wlEkTQSX+/ELdddabu1QrZ
 7Kowa/WY721t2xwpz7WpDhxt4Svawn/cxtOqOw4un81oUWUoEHlqxMfGLAT0POxfu3+O4Dpbo90FH
 YYvOeDPQQVslSxuVVlaeZQ8iN+unHm6JWxEqwR/FgoTfLQazuSmrVFLLwuq8llsTKNAefJoCdjBPy
 dnHVYMVg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkjI-00AEbd-VO
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 09:00:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED4A361413;
 Wed, 12 May 2021 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620810032;
 bh=1B5AKL/u95HDbijahWP3DI8OcmwzLINR/7xIulHtPuI=;
 h=Subject:To:Cc:From:Date:From;
 b=mBmka5L6mEEFiXAEjJL7SHfc8evN7NPNbWkk1Di/0/U5RM1//VF59UfzxdIcuKvbt
 5CFL2YSROxdLJBaW4lNJeLA3hiQFYqkOJA4Ps8In6GQHPf9tO091HD9eHSDy78YYsH
 s2Vv0gAyacAQyJ57SMN8QNfbJHTVWp32ZKGxk26A=
Subject: Patch "MIPS: pci-mt7620: fix PLL lock check" has been added to the
 5.11-stable tree
To: gregkh@linuxfoundation.org, ilya.lipnitskiy@gmail.com, john@phrozen.org,
 linux-mediatek@lists.infradead.org, tsbogend@alpha.franken.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 May 2021 10:58:11 +0200
Message-ID: <162080989198136@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_020033_086428_6B17E555 
X-CRM114-Status: GOOD (  14.48  )
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

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-pci-mt7620-fix-pll-lock-check.patch
and it can be found in the queue-5.11 subdirectory.

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

queue-5.11/mips-pci-mt7620-fix-pll-lock-check.patch
queue-5.11/mips-pci-rt2880-fix-slot-0-configuration.patch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
