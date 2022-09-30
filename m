Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N0vI1OqZfdfsJZl6IwWDIAz3rwTaNgNrLU6ZaDRJutQ=; b=ZzFhee1wPyhIxJS82zhAIJMI3B
	fkehnFftrSG+vZlca+/XWfMC6k0gadrD+B8OVcIFxeBlYuKF+eCDeoS/zm4C4cbqSKmWV2TbVPWR4
	lyv65ZQPPOlJ/DmkujbDzSh39F1HUsZsclY/UOXD5nx5SDfHMcHhmEUwDgWsfwH9VGqjOHc3KpsvD
	1Ehw4HDR8x1EEOi5WEqms4t6Z9G3PCAVuyMnocX6V128JJtbP6zyFVsPTgc3Ktp2JeHQ9fFFJ17+E
	6JKSZVdVC9VEQnZ5zcI6coLsRiiMOZsLw5dCuClUAqQcw7agm4xYgIVdpz5d2wNde0xO0zbs68+1Z
	R/wYlONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHQi-009xMb-SP; Fri, 30 Sep 2022 14:55:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHQf-009xHw-Tl
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 14:55:55 +0000
X-UUID: e7532296d45b438eac3e61f084dd069f-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=N0vI1OqZfdfsJZl6IwWDIAz3rwTaNgNrLU6ZaDRJutQ=;
	b=q7uOL9vQCzFY3YaVJtGViPsRo74z0VW2KFaxL5aop9Ls+Mc5OE1TiYxJLV/S1bP6a/fr7hLvHdgqUikQv+DH0wiM6LtYF2Y41xI52Ca1iwwTvP3AnYlRbhc3YaM831+bXalQ7CcjmIARWIjFyOOYvBSM8c9uUCGBYAYqiTXd6ec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e5e2fffd-48b3-483c-9703-a245e495c559,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b630a6a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e7532296d45b438eac3e61f084dd069f-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 492203602; Fri, 30 Sep 2022 07:55:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:15:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:15:02 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: reserve 8 bits for the index of rf registers
Date: Fri, 30 Sep 2022 22:14:41 +0800
Message-ID: <20220930141441.16314-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_075554_010526_77F4C9EB 
X-CRM114-Status: GOOD (  10.38  )
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

From: Evelyn Tsai <evelyn.tsai@mediatek.com>

The value of regidx of rf registers is combined with WF selection and
offset. Extend the WF selection field from 4 to 8 bits since the
adie index should also be specified.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 6ef3431cad64..e1d15394a621 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -963,7 +963,7 @@ mt7915_twt_stats(struct seq_file *s, void *data)
 }
 
 /* The index of RF registers use the generic regidx, combined with two parts:
- * WF selection [31:28] and offset [27:0].
+ * WF selection [31:24] and offset [23:0].
  */
 static int
 mt7915_rf_regval_get(void *data, u64 *val)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8d297e4aa7d4..1b9f3da8ae96 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3447,8 +3447,8 @@ int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
 		__le32 ofs;
 		__le32 data;
 	} __packed req = {
-		.idx = cpu_to_le32(u32_get_bits(regidx, GENMASK(31, 28))),
-		.ofs = cpu_to_le32(u32_get_bits(regidx, GENMASK(27, 0))),
+		.idx = cpu_to_le32(u32_get_bits(regidx, GENMASK(31, 24))),
+		.ofs = cpu_to_le32(u32_get_bits(regidx, GENMASK(23, 0))),
 		.data = set ? cpu_to_le32(*val) : 0,
 	};
 	struct sk_buff *skb;
-- 
2.25.1


