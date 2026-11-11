Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D02606A331
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E+lZmHDB;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=c+6m413h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1Tkux7y6hn7HPIM0D5nWIk4scaTqerCbT6lSrk552GQ=; b=E+lZmHDB+Ku2KFGbOXmrgoCJiT
	uSh03AZtuJskeL9qmaPcIRWp/8HGfWpU+5ueecTs9yeoqTIgDXbK6XtzOEl9Fsnqp0RUYv8Beb/lj
	UVElM0fC0biAWoq3eDOYnEiL0cAGC2HeukmGe5TqhqmJku7EUF4vmmGie8U6NjsRh444KxF52ZapK
	7Ego59POHcDKlewx7GEy6hpKhurXrke01MEwG70dvcZlrcjobnBuWR3s6IsYDN61gbc2zfmuAh7IT
	TxKvZRcKs95TEr9MIyniHwjJP5eBiLI4e6Uqz6NWLmKVccnJVFKRaLbEItlGMlhAuIBh2cKquNCtV
	/yS31yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy3z-00000005Rp8-0Ikw;
	Wed, 11 Nov 2026 02:27:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy3x-00000005Ro2-1NeC
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:27:50 +0000
X-UUID: 7a74c21add7711f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1Tkux7y6hn7HPIM0D5nWIk4scaTqerCbT6lSrk552GQ=;
	b=c+6m413h+SuAy4F8oNtfSxwtNbM4d4Zo8vUtV89mlq/mXMZVUHM1Oclaz2aKxzJ1CMCDXReicHGMATUlZND8mbrJ4eTSASzQTJKofIrjeEmmeEQmAPbv4Dc/IiNpE1PN9/16yRCCTdmjguH26HvoEqAV+77grwo6ys11mgF34NE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1e2b2a0e-23f7-4a38-adb6-be3bb945d4a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:4f15af30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a74c21add7711f1acbe4559397dec65-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 262724328; Tue, 10 Nov 2026 19:27:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:27:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:27:42 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Yung-lun.Chien@mediatek.com>,
	<jb.tsai@mediatek.com>, allen.chien <yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: program the fixed rate table via MCU on MT7928
Date: Wed, 11 Nov 2026 10:27:41 +0800
Message-ID: <20261111022741.783970-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_182749_386634_9CEEFE72 
X-CRM114-Status: GOOD (  11.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "allen.chien" <yung-lun.chien@mediatek.com>

MT7928 drops host MMIO writes to the WTBLON CRs, so the legacy rates
written by mt7925_mac_set_fixed_rate_table() never reach the FR table
and the firmware falls back to defaults.

Program the table through the MCU REG_ACCESS command instead, using
mt7925_mcu_regval(), and log an error if any of the writes is rejected.

Signed-off-by: allen.chien <yung-lun.chien@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe294..9dcd65725d0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -167,10 +167,29 @@ void mt7925_mac_set_fixed_rate_table(struct mt792x_dev *dev,
 	u32 ctrl = MT_WTBL_ITCR_WR | MT_WTBL_ITCR_EXEC | tbl_idx;
 
 	if (is_mt7928(&dev->mt76)) {
-		mt76_wr(dev, MT7928_WTBL_ITDR0, rate_idx);
+		/* MT7928 drops host writes to the WTBLON CRs (reads still
+		 * work), so program the table through MCU REG_ACCESS.
+		 */
+		u32 spe = MT_WTBL_SPE_IDX_SEL;
+		u32 rate = rate_idx;
+		int ret;
+
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITDR0, &rate, true);
+		if (ret)
+			goto out;
 		/* use wtbl spe idx */
-		mt76_wr(dev, MT7928_WTBL_ITDR1, MT_WTBL_SPE_IDX_SEL);
-		mt76_wr(dev, MT7928_WTBL_ITCR, ctrl);
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITDR1, &spe, true);
+		if (ret)
+			goto out;
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITCR, &ctrl, true);
+		if (ret)
+			goto out;
+
+		return;
+out:
+		dev_err(dev->mt76.dev,
+			"failed to set fixed rate table idx %u: %d\n",
+			tbl_idx, ret);
 	} else {
 		mt76_wr(dev, MT_WTBL_ITDR0, rate_idx);
 		/* use wtbl spe idx */
-- 
2.45.2


