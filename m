Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A1CCA482
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djHJLO2rAfqTF5NPK1h/3uk46j3KXh+Yj+nFcselmiw=; b=iI5cWiYOBJeXabz6f1l2urkOhm
	ndIZk/W99fneEy3374n6jDLtX3lrV/AVsokg7KDzsDqZ/RgT/ZBWcHPBLzG/GGfCaVKFl/HbxcxX4
	FCf9CMFFxFxNWXPZrhmI6OCpOygMvKwnReA/s4V2To5NDeHQwThlrfk3wjg4JYpt1qeoCTtxhOd+o
	khsYB2LkgcgxcwcBmWRlGPljwNlj9rAh24UYMZ8N3Vpbfd14Om9YC75ieJoXFtr2yBP2tiLr89o7c
	ta6th4fetxN4CD3rRaNlfrrptoTQGn+o1mdiN8wGPcDnhy98pngxGN6bK2QJEPHUPVMcMY9QWaNYj
	c9DMgo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTU-009zxm-IX; Fri, 15 Jul 2022 19:59:44 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTP-009zvS-H4
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 19:59:41 +0000
Received: by mail-pl1-f172.google.com with SMTP id r1so4044436plo.10
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 12:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=djHJLO2rAfqTF5NPK1h/3uk46j3KXh+Yj+nFcselmiw=;
        b=hjsN1EKY1RbTeoymvfFzB1J0RRMBSnZovgwRJa2rRDQiayTLD9C0IMWTpStA75oZrd
         7rEA4flrFAoOiawTrH6UZuYz3vj7fL2sRBrOFtv9M4EuMCZwLsgGbJGlKoTV+M1wY/P6
         mCKs2US4+TOl5sV81S0iaFDP57l/JntJmPCKER4cPpEc67EJSZhCT2wRZfhrVw3dxRWQ
         /yHjDtFtZqen5V2XjOUF01rkB/OimTNouLQyy9MVor71B//Cnah2bPGL99un8tiAzgh1
         WIOYlFWeen1Sua/DxcAOobNglnvPe9KY0EAoOWCw4iFSPhFlSCezti3qQ9fEBoQ49rQw
         wj3w==
X-Gm-Message-State: AJIora9Yn6HHi7CrIM4rERV50b2pM293gKSULJ2gX5c/Foc4C4h3dSF0
	EpJH1HGPLIKsik6lq1SpTVs=
X-Google-Smtp-Source: AGRyM1tepTeM21WNGS+Z7IxSVplVBFmMj0L1mHkH1s3XqPtHXwGgAwiwPdC+iaUIsRGOb7jp3OVSOQ==
X-Received: by 2002:a17:90a:de12:b0:1f0:f213:cb9d with SMTP id m18-20020a17090ade1200b001f0f213cb9dmr8410640pjv.207.1657915178404;
        Fri, 15 Jul 2022 12:59:38 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan (c-73-71-21-1.hsd1.ca.comcast.net. [73.71.21.1])
        by smtp.gmail.com with ESMTPSA id y1-20020a62ce01000000b00528bc6d8939sm4224629pfg.157.2022.07.15.12.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 12:59:37 -0700 (PDT)
From: sean.wang@kernel.org
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 5.15 3/5] mt76: mt7921: use physical addr to unify register access
Date: Fri, 15 Jul 2022 12:59:24 -0700
Message-Id: <9d5fc43fcb15c75cd988fa5caac8fb0f0564d6cc.1657915079.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
References: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_125939_619887_23B9272F 
X-CRM114-Status: GOOD (  12.50  )
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

From: Sean Wang <sean.wang@mediatek.com>

commit f1e2eef111018a4f0d280656be4351c37e9e554b upstream.

Use physical address to unify the register access and reorder the
entries in fixed_map table to accelerate the address lookup for
MT7921e. Cosmetics the patch with adding an extra space to make all
entries in the array style consistent.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
v2: fix the incorrect corresponding commit id in Linus's tree
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 27 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7921/regs.h  | 22 +++++++--------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 7d7d43a5422f..f74c385ec80f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -125,36 +125,37 @@ static u32 __mt7921_reg_addr(struct mt7921_dev *dev, u32 addr)
 		u32 mapped;
 		u32 size;
 	} fixed_map[] = {
-		{ 0x00400000, 0x80000, 0x10000}, /* WF_MCU_SYSRAM */
-		{ 0x00410000, 0x90000, 0x10000}, /* WF_MCU_SYSRAM (configure register) */
-		{ 0x40000000, 0x70000, 0x10000}, /* WF_UMAC_SYSRAM */
+		{ 0x820d0000, 0x30000, 0x10000 }, /* WF_LMAC_TOP (WF_WTBLON) */
+		{ 0x820ed000, 0x24800, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_MIB) */
+		{ 0x820e4000, 0x21000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_TMAC) */
+		{ 0x820e7000, 0x21e00, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_DMA) */
+		{ 0x820eb000, 0x24200, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_LPON) */
+		{ 0x820e2000, 0x20800, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_AGG) */
+		{ 0x820e3000, 0x20c00, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_ARB) */
+		{ 0x820e5000, 0x21400, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_RMAC) */
+		{ 0x00400000, 0x80000, 0x10000 }, /* WF_MCU_SYSRAM */
+		{ 0x00410000, 0x90000, 0x10000 }, /* WF_MCU_SYSRAM (configure register) */
+		{ 0x40000000, 0x70000, 0x10000 }, /* WF_UMAC_SYSRAM */
 		{ 0x54000000, 0x02000, 0x1000 }, /* WFDMA PCIE0 MCU DMA0 */
 		{ 0x55000000, 0x03000, 0x1000 }, /* WFDMA PCIE0 MCU DMA1 */
 		{ 0x58000000, 0x06000, 0x1000 }, /* WFDMA PCIE1 MCU DMA0 (MEM_DMA) */
 		{ 0x59000000, 0x07000, 0x1000 }, /* WFDMA PCIE1 MCU DMA1 */
 		{ 0x7c000000, 0xf0000, 0x10000 }, /* CONN_INFRA */
 		{ 0x7c020000, 0xd0000, 0x10000 }, /* CONN_INFRA, WFDMA */
-		{ 0x7c060000, 0xe0000, 0x10000}, /* CONN_INFRA, conn_host_csr_top */
+		{ 0x7c060000, 0xe0000, 0x10000 }, /* CONN_INFRA, conn_host_csr_top */
 		{ 0x80020000, 0xb0000, 0x10000 }, /* WF_TOP_MISC_OFF */
 		{ 0x81020000, 0xc0000, 0x10000 }, /* WF_TOP_MISC_ON */
 		{ 0x820c0000, 0x08000, 0x4000 }, /* WF_UMAC_TOP (PLE) */
 		{ 0x820c8000, 0x0c000, 0x2000 }, /* WF_UMAC_TOP (PSE) */
-		{ 0x820cc000, 0x0e000, 0x2000 }, /* WF_UMAC_TOP (PP) */
+		{ 0x820cc000, 0x0e000, 0x1000 }, /* WF_UMAC_TOP (PP) */
+		{ 0x820cd000, 0x0f000, 0x1000 }, /* WF_MDP_TOP */
 		{ 0x820ce000, 0x21c00, 0x0200 }, /* WF_LMAC_TOP (WF_SEC) */
 		{ 0x820cf000, 0x22000, 0x1000 }, /* WF_LMAC_TOP (WF_PF) */
-		{ 0x820d0000, 0x30000, 0x10000 }, /* WF_LMAC_TOP (WF_WTBLON) */
 		{ 0x820e0000, 0x20000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_CFG) */
 		{ 0x820e1000, 0x20400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_TRB) */
-		{ 0x820e2000, 0x20800, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_AGG) */
-		{ 0x820e3000, 0x20c00, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_ARB) */
-		{ 0x820e4000, 0x21000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_TMAC) */
-		{ 0x820e5000, 0x21400, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_RMAC) */
-		{ 0x820e7000, 0x21e00, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_DMA) */
 		{ 0x820e9000, 0x23400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_WTBLOFF) */
 		{ 0x820ea000, 0x24000, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_ETBF) */
-		{ 0x820eb000, 0x24200, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_LPON) */
 		{ 0x820ec000, 0x24600, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_INT) */
-		{ 0x820ed000, 0x24800, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_MIB) */
 		{ 0x820f0000, 0xa0000, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_CFG) */
 		{ 0x820f1000, 0xa0600, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_TRB) */
 		{ 0x820f2000, 0xa0800, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_AGG) */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index 41c2855e7a3d..9266fb3909ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -14,7 +14,7 @@
 #define MT_MCU_INT_EVENT_SER_TRIGGER	BIT(2)
 #define MT_MCU_INT_EVENT_RESET_DONE	BIT(3)
 
-#define MT_PLE_BASE			0x8000
+#define MT_PLE_BASE			0x820c0000
 #define MT_PLE(ofs)			(MT_PLE_BASE + (ofs))
 
 #define MT_PLE_FL_Q0_CTRL		MT_PLE(0x3e0)
@@ -25,7 +25,7 @@
 #define MT_PLE_AC_QEMPTY(_n)		MT_PLE(0x500 + 0x40 * (_n))
 #define MT_PLE_AMSDU_PACK_MSDU_CNT(n)	MT_PLE(0x10e0 + ((n) << 2))
 
-#define MT_MDP_BASE			0xf000
+#define MT_MDP_BASE			0x820cd000
 #define MT_MDP(ofs)			(MT_MDP_BASE + (ofs))
 
 #define MT_MDP_DCR0			MT_MDP(0x000)
@@ -48,7 +48,7 @@
 #define MT_MDP_TO_WM			1
 
 /* TMAC: band 0(0x21000), band 1(0xa1000) */
-#define MT_WF_TMAC_BASE(_band)		((_band) ? 0xa1000 : 0x21000)
+#define MT_WF_TMAC_BASE(_band)		((_band) ? 0x820f4000 : 0x820e4000)
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
 
 #define MT_TMAC_TCR0(_band)		MT_WF_TMAC(_band, 0)
@@ -73,7 +73,7 @@
 #define MT_TMAC_TRCR0(_band)		MT_WF_TMAC(_band, 0x09c)
 #define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
 
-#define MT_WF_DMA_BASE(_band)		((_band) ? 0xa1e00 : 0x21e00)
+#define MT_WF_DMA_BASE(_band)		((_band) ? 0x820f7000 : 0x820e7000)
 #define MT_WF_DMA(_band, ofs)		(MT_WF_DMA_BASE(_band) + (ofs))
 
 #define MT_DMA_DCR0(_band)		MT_WF_DMA(_band, 0x000)
@@ -81,7 +81,7 @@
 #define MT_DMA_DCR0_RXD_G5_EN		BIT(23)
 
 /* LPON: band 0(0x24200), band 1(0xa4200) */
-#define MT_WF_LPON_BASE(_band)		((_band) ? 0xa4200 : 0x24200)
+#define MT_WF_LPON_BASE(_band)		((_band) ? 0x820fb000 : 0x820eb000)
 #define MT_WF_LPON(_band, ofs)		(MT_WF_LPON_BASE(_band) + (ofs))
 
 #define MT_LPON_UTTR0(_band)		MT_WF_LPON(_band, 0x080)
@@ -92,7 +92,7 @@
 #define MT_LPON_TCR_SW_WRITE		BIT(0)
 
 /* MIB: band 0(0x24800), band 1(0xa4800) */
-#define MT_WF_MIB_BASE(_band)		((_band) ? 0xa4800 : 0x24800)
+#define MT_WF_MIB_BASE(_band)		((_band) ? 0x820fd000 : 0x820ed000)
 #define MT_WF_MIB(_band, ofs)		(MT_WF_MIB_BASE(_band) + (ofs))
 
 #define MT_MIB_SCR1(_band)		MT_WF_MIB(_band, 0x004)
@@ -141,7 +141,7 @@
 #define MT_MIB_ARNG(_band, n)		MT_WF_MIB(_band, 0x0b0 + ((n) << 2))
 #define MT_MIB_ARNCR_RANGE(val, n)	(((val) >> ((n) << 3)) & GENMASK(7, 0))
 
-#define MT_WTBLON_TOP_BASE		0x34000
+#define MT_WTBLON_TOP_BASE		0x820d4000
 #define MT_WTBLON_TOP(ofs)		(MT_WTBLON_TOP_BASE + (ofs))
 #define MT_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x200)
 #define MT_WTBLON_TOP_WDUCR_GROUP	GENMASK(2, 0)
@@ -151,7 +151,7 @@
 #define MT_WTBL_UPDATE_ADM_COUNT_CLEAR	BIT(12)
 #define MT_WTBL_UPDATE_BUSY		BIT(31)
 
-#define MT_WTBL_BASE			0x38000
+#define MT_WTBL_BASE			0x820d8000
 #define MT_WTBL_LMAC_ID			GENMASK(14, 8)
 #define MT_WTBL_LMAC_DW			GENMASK(7, 2)
 #define MT_WTBL_LMAC_OFFS(_id, _dw)	(MT_WTBL_BASE | \
@@ -159,7 +159,7 @@
 					FIELD_PREP(MT_WTBL_LMAC_DW, _dw))
 
 /* AGG: band 0(0x20800), band 1(0xa0800) */
-#define MT_WF_AGG_BASE(_band)		((_band) ? 0xa0800 : 0x20800)
+#define MT_WF_AGG_BASE(_band)		((_band) ? 0x820f2000 : 0x820e2000)
 #define MT_WF_AGG(_band, ofs)		(MT_WF_AGG_BASE(_band) + (ofs))
 
 #define MT_AGG_AWSCR0(_band, _n)	MT_WF_AGG(_band, 0x05c + (_n) * 4)
@@ -190,7 +190,7 @@
 #define MT_AGG_ATCR3(_band)		MT_WF_AGG(_band, 0x0f4)
 
 /* ARB: band 0(0x20c00), band 1(0xa0c00) */
-#define MT_WF_ARB_BASE(_band)		((_band) ? 0xa0c00 : 0x20c00)
+#define MT_WF_ARB_BASE(_band)		((_band) ? 0x820f3000 : 0x820e3000)
 #define MT_WF_ARB(_band, ofs)		(MT_WF_ARB_BASE(_band) + (ofs))
 
 #define MT_ARB_SCR(_band)		MT_WF_ARB(_band, 0x080)
@@ -200,7 +200,7 @@
 #define MT_ARB_DRNGR0(_band, _n)	MT_WF_ARB(_band, 0x194 + (_n) * 4)
 
 /* RMAC: band 0(0x21400), band 1(0xa1400) */
-#define MT_WF_RMAC_BASE(_band)		((_band) ? 0xa1400 : 0x21400)
+#define MT_WF_RMAC_BASE(_band)		((_band) ? 0x820f5000 : 0x820e5000)
 #define MT_WF_RMAC(_band, ofs)		(MT_WF_RMAC_BASE(_band) + (ofs))
 
 #define MT_WF_RFCR(_band)		MT_WF_RMAC(_band, 0x000)
-- 
2.25.1


