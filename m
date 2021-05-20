Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2D9C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 09:35:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A5D613F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 09:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A5D613F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+o3s60is+q7U53EnbK9GQh5/sohNqlnpAe1/+MmRqz4=; b=Zb6+vV7jyPpyVoFTNZ4E9ofT1V
	DWVu1k6pxlhMdL4824Yh37nQmS9H/enIUsH2HI567PyvO1QIpiIrUii9aD/DdXBKrnVI8UWSDq60b
	fnWzFiUCC6yYudSMuDJC+qDzb74Ai2+rePB844wRceVWb1L6PdYPLcLDfYfzGy5HMlorMIigJpEXg
	FZ2b6zzH7eDkyyVSBP0Kfk9qaoElARVsxxb5gPRhNBBGdn+kzjZpezrTXb1Fx73dA2cF1m7gJs4Fk
	bw3hbjfqDaIjjgv8HRwOXhvcjr40e/pCc7g/3/+lZ1mrJGlcQA/F0YXpbKaiLOX/Pqv+qILgjMXep
	vfdP34KQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljf4z-0000r2-Mo; Thu, 20 May 2021 09:34:58 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljf4B-0000pR-1S
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 09:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=OVBqHh/Erc927vmNxhOVAfUJVaQP2AACu4QR185+zv4=; b=BbXGTtpH6h0Kwm6d6i8KbRA2VK
 wI3BZMw+lFvtSRzeAH7lyG4MXLui/zDpeDrZG0nuc8ROIDlSHjBjy7JhAikIzcubDiDg7vDAzazGG
 EB6Ynpse4EJiwOzrBVoYv2B/usZ3UppEDf1R7PxdMRDKiw8XhaQWqLwj8oo0o5F6FlrY8tM0y1k24
 3CFjUyleeLeYzbXw+xqE2u/oST1wfZ2Y/i2nqhsbuj8osy+a3se6H9PFnxvrWjT/TmBUC0HXMbfz3
 hYmvC3oU6LJzJDXC1CpqbFAUbU/80IkznMCK6iOqMoYLKvKvmx/9IzeLQwdgKE963KHmlUxfSmK9/
 a6jShJZg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljf46-00G6lt-0m
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 09:34:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC6066145E;
 Thu, 20 May 2021 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621503241;
 bh=Wo6UJarYlLD4jwMqh8qhs8BVvvgDb70kH13z56ZTjSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GaByykTeHiZYlHPkiccpIonW0169TL1fBk83RA1rAT4Kd9fyl6i549v3m/yunU1/D
 JYBEVTbSpfkGI86qsgFVxczotIXjrlwKg0T6cPjkBsj/TGlZM/vhhZ8U5bwQCckvV0
 tWG5YCDoEYARdTtHgdTNsIy++gSvQ00vyEih3mmU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 4.19 132/425] MIPS: pci-mt7620: fix PLL lock check
Date: Thu, 20 May 2021 11:18:21 +0200
Message-Id: <20210520092135.771895768@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520092131.308959589@linuxfoundation.org>
References: <20210520092131.308959589@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_023402_113429_3D5163C4 
X-CRM114-Status: GOOD (  11.06  )
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
@@ -33,6 +33,7 @@
 #define RALINK_GPIOMODE			0x60
 
 #define PPLL_CFG1			0x9c
+#define PPLL_LD				BIT(23)
 
 #define PPLL_DRV			0xa0
 #define PDRV_SW_SET			BIT(31)
@@ -242,8 +243,8 @@ static int mt7620_pci_hw_init(struct pla
 	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
 	mdelay(100);
 
-	if (!(rt_sysc_r32(PPLL_CFG1) & PDRV_SW_SET)) {
-		dev_err(&pdev->dev, "MT7620 PPLL unlock\n");
+	if (!(rt_sysc_r32(PPLL_CFG1) & PPLL_LD)) {
+		dev_err(&pdev->dev, "pcie PLL not locked, aborting init\n");
 		reset_control_assert(rstpcie0);
 		rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
 		return -1;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
