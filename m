Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WsJ0K3ycmeFnfDgWNcOE8ZHRRc2nrQGDlBBOlFXtNE=; b=KHJKJmd5q7DYqgNqfsxe5nR/ct
	lj6RTNVjD4mtePuQV5AaF7sGzBADDbrUXv5yCbvfE+b1aYl891whqgpLXCXtKDgtBy9GtsmMl37+V
	R21kYlivRNoAGaESPrG5WCtu8iEDKI2QYpJSiK1Lu/x5TVb1YVosbcqFjqaaXauE7/rWwsKPe8oTp
	rLOvh20/DWeDVWEnT/cuHvoGH6KIsHOGg8uVuJNexlS/skxjntciRUHWtF1DPId7O26nAnuN/GvBr
	VSdv5bmNhZyzaQmOxgSe9czXYqEJ1zNwy7GKZiQ3evKWJi9HRDCz62zptOvqieyu3aHe8bN40/zqo
	N3exg7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jtO-006yCG-BQ; Sun, 04 Dec 2022 07:58:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jtL-006yAz-HG
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 07:58:28 +0000
X-UUID: 6ba6ef3ebb27403fac5897e6649786be-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3WsJ0K3ycmeFnfDgWNcOE8ZHRRc2nrQGDlBBOlFXtNE=;
	b=b5RYeBO/aBH0/3a35QyLB62ZSeOZxuqMvJHByyrUzLOzzah9Zovr/xWHKYr746MKZSzPAnlV2t9iUVOEh+5a2ppKb7BQm5IvyZt1G0qBvXvEjxQoFaWgXWyc9YmX09/aOIvOYxObpgrxBVu/5xCaXJiN9+NjaoMMIq5ZnjMOLHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:68559b7b-37f7-4edc-b165-aa4af75b8fcd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:6cf7131f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ba6ef3ebb27403fac5897e6649786be-20221204
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1151457879; Sun, 04 Dec 2022 00:58:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 4 Dec 2022 15:18:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 15:18:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7996: drop always true condition of __mt7996_reg_addr()
Date: Sun, 4 Dec 2022 15:18:15 +0800
Message-ID: <50f23916e9ec9082ab209fbb7ded9e211ad50384.1670137513.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c7a43d2a715d0ed911780712edc60c7adbee806d.1670137513.git.ryder.lee@mediatek.com>
References: <c7a43d2a715d0ed911780712edc60c7adbee806d.1670137513.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_235827_623202_43567AE2 
X-CRM114-Status: GOOD (  10.08  )
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

addr <= MT_CBTOP2_PHY_END(0xffffffff) is always true (<= u32max),
so drop it.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 521769eb6b0e..60781d046216 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -149,7 +149,7 @@ static u32 __mt7996_reg_addr(struct mt7996_dev *dev, u32 addr)
 
 	if (dev_is_pci(dev->mt76.dev) &&
 	    ((addr >= MT_CBTOP1_PHY_START && addr <= MT_CBTOP1_PHY_END) ||
-	     (addr >= MT_CBTOP2_PHY_START && addr <= MT_CBTOP2_PHY_END)))
+	    addr >= MT_CBTOP2_PHY_START))
 		return mt7996_reg_map_l1(dev, addr);
 
 	/* CONN_INFRA: covert to phyiscal addr and use layer 1 remap */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index 794f61b93a46..42980b97b4d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -463,7 +463,6 @@ enum base_rev {
 #define MT_CBTOP1_PHY_START			0x70000000
 #define MT_CBTOP1_PHY_END			0x77ffffff
 #define MT_CBTOP2_PHY_START			0xf0000000
-#define MT_CBTOP2_PHY_END			0xffffffff
 #define MT_INFRA_MCU_START			0x7c000000
 #define MT_INFRA_MCU_END			0x7c3fffff
 
-- 
2.18.0


