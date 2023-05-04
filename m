Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C07C7EE21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGSJAgs8lGVIT1LXUbfcJ/eb8xODmhDRE8bfnB6WoWk=; b=EAQbql5cAN73/ZezS2gNaSlYz4
	xO9TJ2k4AB5QcLns60LR4fbgUMky6k3XNcLyj30Bug6hbl6atc+JBBnSPdKX94iIVlr1FcvhEMyJO
	GPoC3l7kpbxKT4Y8l+xfM9+7eBSJi1JvA2gVE8jAARX8Mi39UvK8od6dUBz1Vs845Bso2KguhJgeo
	snEjF0+IDlzQDsNI0/eUPDi2TVaNlOaqpDfrH9uUogKRze5O3S7GPu4e01nCk8Yv3HWZipikLgDCR
	hwFaHHScMmM8NOT8upjGOpG0Vbpc48EDvHpTVoLXjpo2ffVJ2Wrj5PRqydeaepJw4deynNMS8Ayw7
	EkbWYlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXF9-007ffd-1k;
	Thu, 04 May 2023 11:35:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXF4-007fcz-1O;
	Thu, 04 May 2023 11:35:23 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 981BD66032D1;
	Thu,  4 May 2023 12:35:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683200117;
	bh=oYDe/VXfJGa+IBEXNZZL8Wjnx24xldbrD++GRNp7wf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSY9a5QIjnOdxPA/nZt/sT2nUHh81bauNVLFJmH9cSX+HGZD4TACaot8H0bR8D23L
	 ySp40BxxMq+oXusx1z8QEq56Gcy6IwgsSYbl8bEpH/6dpRebt9lznmGBTTtk5NwX7t
	 Q97j8u24JQfFH/K1/zSpXU+s4RP/+JZxhw8kwvCbM7UbgSaF4yGncb6JdbFCGJeyT4
	 8e5GVRzCvv0KNWKK1hyjwS5jZjNxCCYUbkYdBMXSbjTqoFjyrBF0JuwESQRoU6weIn
	 8ioIlSAUata3gYwRmFZLJMd1FKYksDMex1zYtBGsgfRQruvoPRAy3A1jJ15lIPheG4
	 qcjCPyNSKplQQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ryder.lee@mediatek.com
Cc: jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] PCI: mediatek-gen3: Stop acquiring spinlocks in {suspend,resume}_noirq
Date: Thu,  4 May 2023 13:35:08 +0200
Message-Id: <20230504113509.184633-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504113509.184633-1-angelogioacchino.delregno@collabora.com>
References: <20230504113509.184633-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_043522_603303_5E583190 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_pcie_suspend_noirq() and mtk_pcie_resume_noirq() we are,
respectively, disabling and enabling generation of interrupts and
then saving and restoring the enabled interrupts register: since
we're using noirq PM callbacks, that can be safely done without
holding any spin lock.

That was noticed because of, and solves, the following issue:

<4>[   74.185982] ========================================================
<4>[   74.192629] WARNING: possible irq lock inversion dependency detected
<4>[   74.199276] 6.3.0-next-20230428+ #51 Tainted: G        W
<4>[   74.205664] --------------------------------------------------------
<4>[   74.212309] systemd-sleep/809 just changed the state of lock:
<4>[   74.218347] ffff65a5c34c65a0 (&pcie->irq_lock){+...}-{2:2}, at: mtk_pcie_resume+0x50/0xa8
<4>[   74.226870] but this lock was taken by another, HARDIRQ-safe lock in the past:
<4>[   74.234389]  (&irq_desc_lock_class){-.-.}-{2:2}
<4>[   74.234409]
<4>[   74.234409]
<4>[   74.234409] and interrupts could create inverse lock ordering between them.
<4>[   74.234409]
<4>[   74.251704]
<4>[   74.251704] other info that might help us debug this:
<4>[   74.258785]  Possible interrupt unsafe locking scenario:
<4>[   74.258785]
<4>[   74.266126]        CPU0                    CPU1
<4>[   74.270942]        ----                    ----
<4>[   74.275758]   lock(&pcie->irq_lock);
<4>[   74.279627]                                local_irq_disable();
<4>[   74.285836]                                lock(&irq_desc_lock_class);
<4>[   74.292667]                                lock(&pcie->irq_lock);
<4>[   74.299061]   <Interrupt>
<4>[   74.301960]     lock(&irq_desc_lock_class);
<4>[   74.306438]
<4>[   74.306438]  *** DEADLOCK ***

Fixes: d537dc125f07 ("PCI: mediatek-gen3: Add system PM support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b8612ce5f4d0..52f52ca5db71 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -963,8 +963,6 @@ static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
 {
 	int i;
 
-	raw_spin_lock(&pcie->irq_lock);
-
 	pcie->saved_irq_state = readl_relaxed(pcie->base + PCIE_INT_ENABLE_REG);
 
 	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
@@ -973,16 +971,12 @@ static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
 		msi_set->saved_irq_state = readl_relaxed(msi_set->base +
 					   PCIE_MSI_SET_ENABLE_OFFSET);
 	}
-
-	raw_spin_unlock(&pcie->irq_lock);
 }
 
 static void mtk_pcie_irq_restore(struct mtk_gen3_pcie *pcie)
 {
 	int i;
 
-	raw_spin_lock(&pcie->irq_lock);
-
 	writel_relaxed(pcie->saved_irq_state, pcie->base + PCIE_INT_ENABLE_REG);
 
 	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
@@ -991,8 +985,6 @@ static void mtk_pcie_irq_restore(struct mtk_gen3_pcie *pcie)
 		writel_relaxed(msi_set->saved_irq_state,
 			       msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
 	}
-
-	raw_spin_unlock(&pcie->irq_lock);
 }
 
 static int mtk_pcie_turn_off_link(struct mtk_gen3_pcie *pcie)
-- 
2.40.1


