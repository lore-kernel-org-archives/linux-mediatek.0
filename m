Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC67C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0OVfeHC4EQB12+w5a2/NZH9YZPufCTe/TK7F6rvOOMw=; b=SzjaX9nh9hrpD7nmgGsgHnODt3
	oWoQgQW6xCpAoiDOUUDvkanPOK7xSzJhocuySdv5skVh5KQ+Ev95VnryZDVv4X22caxODu0aUSeCO
	RWf2H46XiS6E4flWRICtr80J2FVNLWpexuFrIfhp0a4LPFvxHJu4187SIvLd49vBLXSFS0TCgYLfs
	f533v2IvqSEOvvkJKNmOu8UohCtpAB9QpZKYTSqKhxmeHRbbCAY3qOa4xc2ACRYJKckIwiTFOPW3C
	euWOCUgLjhnyD1ZwYpScDBZNksS/r61OPzlg6wvWfKQGJ7ywdRXdWPSpCcU9XkxXbzKFqn8fGlQMp
	ky/q5hqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owqVi-006fH3-SV; Sun, 20 Nov 2022 20:01:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owqVf-006fDn-Pp
	for linux-mediatek@lists.infradead.org; Sun, 20 Nov 2022 20:01:49 +0000
X-UUID: 3ad2992f488c46d5b733ecf2c2670a09-20221120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0OVfeHC4EQB12+w5a2/NZH9YZPufCTe/TK7F6rvOOMw=;
	b=KnxT/3vqiJ1fA5+qKWbsvJnqavZCSCue9Gj7995xfMlU3MNNyc407NrSu8Zfybv/J/eUMetvCprE47fRL2Cum1eKCibEBRWUBi2LB+G9z1OsLgU/X5XX45n+x6dBgyEfrA6fuTvcVxZSlEV/fLYXMKYzeQq+Ad4EXOi+TkTcITw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:33d24af9-ae49-4894-99cf-de41f1f74a36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:3bdfb4db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3ad2992f488c46d5b733ecf2c2670a09-20221120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 315584003; Sun, 20 Nov 2022 13:01:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 03:51:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 21 Nov 2022 03:51:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7915: add basedband Txpower info into debugfs
Date: Mon, 21 Nov 2022 03:51:28 +0800
Message-ID: <c73db8d9bb03efe8cb403434aeedad25d958e258.1668973479.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_120147_863218_16FD78CB 
X-CRM114-Status: GOOD (  10.43  )
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

This helps user to debug Txpower propagation path easily.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c  | 16 +++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h |  3 +++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 096cb8a4db3d..1244f5c4172b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -967,11 +967,16 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
 	struct mt7915_phy *phy = file->private;
+	struct mt7915_dev *dev = phy->dev;
 	s8 txpower[MT7915_SKU_RATE_NUM], *buf;
-	int i;
+	int i, ret;
+
+	ret = mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
+	if (ret)
+		return ret;
+
+	seq_printf(file, "\nPhy %d\n", phy != &dev->phy);
 
-	seq_printf(file, "\nBand %d\n", phy != &phy->dev->phy);
-	mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
 	for (i = 0, buf = txpower; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
 		u8 mcs_num = mt7915_sku_group_len[i];
 
@@ -982,6 +987,11 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
 		buf += mt7915_sku_group_len[i];
 	}
 
+	/* Txpower propagation path: TMAC -> TXV -> BBP */
+	seq_printf(file, "\nBaseband transmit power %ld\n",
+		   mt76_get_field(dev, MT_WF_PHY_TPC_CTRL_STAT(phy->band_idx),
+				  MT_WF_PHY_TPC_POWER));
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 0c61f1256f3b..00fc31cb7e82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -1179,6 +1179,9 @@ enum offs_rev {
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR		BIT(29)
 
+#define MT_WF_PHY_TPC_CTRL_STAT(_phy)	MT_WF_PHY(0xe7a0 + ((_phy) << 16))
+#define MT_WF_PHY_TPC_POWER		GENMASK(15, 8)
+
 #define MT_MCU_WM_CIRQ_BASE			0x89010000
 #define MT_MCU_WM_CIRQ(ofs)			(MT_MCU_WM_CIRQ_BASE + (ofs))
 #define MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR	MT_MCU_WM_CIRQ(0x80)
-- 
2.36.1


