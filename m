Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA2ACCF9E5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Oct 2025 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kUUg7bDoLdltv7gMj6VVQ6B15kLbNGELqY0MsOWmwu0=; b=Zq8PItYeUrMP5GKGw5LA0J25ME
	+uPsKwPf//cXZvXlkDRyyojV3PEegcnWNMyeyDZRnu0G7eLY7rExOrE9MTOMPCiQUaMcmCOTR1OnU
	o6/PcLp6mXI/bUa3zy2Bfcnp7+iKchmYU/ZGkwN6IdYwQ99fC19v2JjlYKWWsf+5OptYLnz6y+2Bh
	R5OL/O+Yr5G1JTBNqunOTBzJql0TPBkVP3YLPyugOxZpOGoS2gryzdHM4JjADuczgPy1gFRpDGwmw
	CVIl0IHM8z1GoQw2EoWmEr1IJ/y3CSLvJqZ76H/F+NW7wd66CH3BEhxnHkNJztF+qZYFRkAnhw/WA
	KT2HGP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Ux-0000000CpPE-0IrO;
	Sun, 26 Oct 2025 22:46:03 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Ut-0000000CpNa-1kIU;
	Sun, 26 Oct 2025 22:45:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] usb: mtu3: fix misspelled words
Date: Sun, 26 Oct 2025 15:45:57 -0700
Message-ID: <20251026224558.826143-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix spelling errors as reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 drivers/usb/mtu3/mtu3.h      |    4 ++--
 drivers/usb/mtu3/mtu3_core.c |    2 +-
 drivers/usb/mtu3/mtu3_qmu.c  |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

--- linux-next.orig/drivers/usb/mtu3/mtu3_core.c
+++ linux-next/drivers/usb/mtu3/mtu3_core.c
@@ -290,7 +290,7 @@ static void mtu3_csr_init(struct mtu3 *m
 
 	/* delay about 0.1us from detecting reset to send chirp-K */
 	mtu3_clrbits(mbase, U3D_LINK_RESET_INFO, WTCHRP_MSK);
-	/* enable automatical HWRW from L1 */
+	/* enable automatic HWRW from L1 */
 	mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
 }
 
--- linux-next.orig/drivers/usb/mtu3/mtu3.h
+++ linux-next/drivers/usb/mtu3/mtu3.h
@@ -76,7 +76,7 @@ struct mtu3_request;
 
 /**
  * Normally the device works on HS or SS, to simplify fifo management,
- * devide fifo into some 512B parts, use bitmap to manage it; And
+ * divide fifo into some 512B parts, use bitmap to manage it; And
  * 128 bits size of bitmap is large enough, that means it can manage
  * up to 64KB fifo size.
  * NOTE: MTU3_EP_FIFO_UNIT should be power of two
@@ -121,7 +121,7 @@ enum mtu3_g_ep0_state {
 };
 
 /**
- * MTU3_DR_FORCE_NONE: automatically switch host and periperal mode
+ * MTU3_DR_FORCE_NONE: automatically switch host and peripheral mode
  *		by IDPIN signal.
  * MTU3_DR_FORCE_HOST: force to enter host mode and override OTG
  *		IDPIN signal.
--- linux-next.orig/drivers/usb/mtu3/mtu3_qmu.c
+++ linux-next/drivers/usb/mtu3/mtu3_qmu.c
@@ -221,7 +221,7 @@ static struct qmu_gpd *advance_deq_gpd(s
 	return ring->dequeue;
 }
 
-/* check if a ring is emtpy */
+/* check if a ring is empty */
 static bool gpd_ring_empty(struct mtu3_gpd_ring *ring)
 {
 	struct qmu_gpd *enq = ring->enqueue;

