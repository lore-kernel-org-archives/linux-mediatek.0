Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F5FED2FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K19GaqUpapvZu4p2oYRo+83CgK9hKV6x66IFjailb3s=; b=fFFnuDxwpv6R1jaqJfCHQZCI4X
	u2IugSgUBTw/7IJ4U8v9dl9fW42tnH3fNdLtLe+WI9nLRhUFV/r9hUQNDuUu1zNZoX73mS8ajb6wL
	o/6WYKC/TGUZQA+6ldm7Zi9jw+NjSYmeOBDMgv1/p7MXn27IrmSHai8Eempkf1SdX+lGcVI/ZEhht
	fgdzMLxn5r97FECiiWA+JhofKRZGCrQtVNPtggjjqX2dfuQaJUADS/RHV7tVLJeGFo1psE6R2QdfN
	d4NwTI7neLye8a40S0tSEBA1yWtH+hqc6WSH9AqoYmLwywrqukwWwymbbM5qJebjxdkONFz0oaa54
	o9tljgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coZ-0000000DoaD-3yrr;
	Thu, 12 Mar 2026 09:58:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0coX-0000000DoYW-0m70
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 09:58:46 +0000
X-UUID: 0a9c1ff21dfa11f19e7563141e833ce8-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=K19GaqUpapvZu4p2oYRo+83CgK9hKV6x66IFjailb3s=;
	b=X3nIMKfpLolo2NZuwpom30IS9cDUTxYqRXDBh73mJcA6PcigbcWhHWtmMBSwEWW8sqj5IF2W42UeJ9r3yW30xVcldNGqaEgEzZHo+2eKpVswRBjGlQxwZh3pm+pmleVuUPDwbGndCwXXvBCkACNX14cXkElMJSoG+52KNiLBoRc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:20027a1d-4ef9-4c11-97c8-9c9501772e51,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:6a9784eb-3b42-43ec-801b-62c7b12ba70e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a9c1ff21dfa11f19e7563141e833ce8-20260312
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1519224187; Thu, 12 Mar 2026 02:58:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 3/6] wifi: mt76: mt7996: update WFSYS reset flow for MT7990 chipsets
Date: Thu, 12 Mar 2026 17:57:21 +0800
Message-ID: <20260312095724.2117448-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_025845_229393_EF019064 
X-CRM114-Status: GOOD (  10.53  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Skip WFSYS reset during bootup for MT7990 chipsets; only reset if L0.5
recovery is triggered.
Without this fix, the following kernel error may occur:
Internal error: synchronous external abort.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 29 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  8 +++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f3239f530aea..8dfb81eabc9a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -791,11 +791,34 @@ static void mt7996_init_work(struct work_struct *work)
 
 void mt7996_wfsys_reset(struct mt7996_dev *dev)
 {
-	mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
-	msleep(20);
+	if (!is_mt7990(&dev->mt76)) {
+		mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
+		msleep(20);
+
+		mt76_clear(dev, MT_WF_SUBSYS_RST, 0x1);
+		msleep(20);
+
+		return;
+	}
 
-	mt76_clear(dev, MT_WF_SUBSYS_RST, 0x1);
+	if (!dev->recovery.hw_full_reset)
+		return;
+
+	mt76_set(dev, MT_WF_SUBSYS_RST,
+		 MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT |
+		 MT_WF_SUBSYS_RST_BYPASS_WFDMA_SLP_PROT |
+		 MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT);
+	mt76_rmw(dev, MT_WF_SUBSYS_RST,
+		 MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE,
+		 u32_encode_bits(0x20, MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE));
+	mt76_clear(dev, MT_WF_L05_RST, MT_WF_L05_RST_WF_RST_MASK);
+	mt76_set(dev, MT_WF_SUBSYS_RST, MT_WF_SUBSYS_RST_WHOLE_PATH_RST);
 	msleep(20);
+
+	if (mt76_poll(dev, MT_WF_L05_RST, MT_WF_L05_RST_WF_RST_MASK, 0x1a, 1000))
+		return;
+
+	dev_err(dev->mt76.dev, "wfsys reset fail\n");
 }
 
 static void mt7996_rro_hw_init_v3(struct mt7996_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index 393faae2d52b..c6379933b6c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -736,7 +736,15 @@ enum offs_rev {
 #define MT_HW_REV				0x70010204
 #define MT_HW_REV1				0x8a00
 
+#define MT_WF_L05_RST				0x70028550
+#define MT_WF_L05_RST_WF_RST_MASK		GENMASK(4, 0)
+
 #define MT_WF_SUBSYS_RST			0x70028600
+#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST		BIT(0)
+#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT	BIT(5)
+#define MT_WF_SUBSYS_RST_BYPASS_WFDMA_SLP_PROT	BIT(6)
+#define MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT	BIT(16)
+#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE	GENMASK(15, 8)
 
 /* PCIE MAC */
 #define MT_PCIE_MAC_BASE			0x74030000
-- 
2.51.0


