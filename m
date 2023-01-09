Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B13C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBtyWl3xBwubYwNLRwUnjRtwq/o0DZ3qA2MNE7i/b0c=; b=f2pqgVaH5Yq+35sUDUehxGlAcJ
	cyH++n84nxb5FmDH/YHZ2CRAi9lP6lZOjg08IPfIh+5+yL8pT+0kUbMdoG2s6AtV58EOnvl+QfRPg
	8TH0wUUvPKY33t5IUCOAQ2QnFrnMyWYK/cEdzPKjtE6AcEOWX0LAOlcHVJn8Pa0rPPdP+jNF9Y/fB
	wNtcJ9YMMI48hmdMOi2z7+JjjsF3uXwv3/wpPhA95bsD3AmZSaSyUCHaPXKP39jDGV0ARE1PmiOVn
	ibf1Xp9v/RB+tKSloLjKRMan0T7A5da0YWc02OUd3iUbOFMFb1XY1Vw5kwwgOLQzV1zniJLydWpuz
	aCTNzLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTs-002jif-1P; Mon, 09 Jan 2023 16:58:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTr-002jgq-1j
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LBtyWl3xBwubYwNLRwUnjRtwq/o0DZ3qA2MNE7i/b0c=; b=LY9jdpcDIFSvX50F4Z3N0YoVaS
	aoAI06DfceWitGHJq0kozagR2T67dgr8R2OUmWbHWXOhKKORJa/TMpkVMs4qCjm0LPzQup5UaDHTp
	8DMIG3syFnPPazBkV2Auz9dUR+i0jrqeYRG3/DZ3qzzY19oPATk36Q5T1jfYwQMQ+IsJdkW1TuUw7
	vXcZ+DEMV2mjrJcBtuHws6v5AcievaPCjxRb1iLhvOnwLB9Z28qAFBRYoznOkE5moQA6XO+CyTM72
	ngE2dt0mVD3DZKo8b5BgVdN1/iJLkJTfmJIdjZV6gr5aWhT1SYeukAP3NvbuGZd37pREstz8RpeIa
	HlMmxHUQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTZ-002ml1-1y
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:24 +0000
X-UUID: 4e77c65434174219b6b5fcbd4b955d86-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LBtyWl3xBwubYwNLRwUnjRtwq/o0DZ3qA2MNE7i/b0c=;
	b=f3MdgkJInwk8LNUwWtI7Ub8GrU3TapiPLrJzCaEAJmERyGnEdU724XMAnZCzdkMepxeNqUgEaw2CX2GlNjeLwLJF8+KMTWvkkodngmqwpsNBUcWBxVKMtF7Ko/WDwGz4XjWLm8M3z+TIsVY72IaCU8eXfY3GPVuFsB8U/Qn5d9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:059d5f35-559d-41c1-a63f-bcbadf9c4767,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:059d5f35-559d-41c1-a63f-bcbadf9c4767,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:48012154-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230110005808ZCIL87UO,BulkQuantity:1,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0
X-CID-BVR: 0
X-UUID: 4e77c65434174219b6b5fcbd4b955d86-20230109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1268474581; Mon, 09 Jan 2023 09:58:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 06/13] wifi: mt76: add EHT rate stats for ethtool
Date: Tue, 10 Jan 2023 00:57:24 +0800
Message-ID: <20230109165731.682-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165822_070108_6AE163B1 
X-CRM114-Status: GOOD (  10.62  )
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

Add support to get EHT rate stats from ethtool.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index b3fd3abfdd9f..3d3c68b9e1cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -272,7 +272,7 @@ enum mt76_phy_type {
 
 struct mt76_sta_stats {
 	u64 tx_mode[__MT_PHY_TYPE_MAX];
-	u64 tx_bw[4];		/* 20, 40, 80, 160 */
+	u64 tx_bw[5];		/* 20, 40, 80, 160, 320 */
 	u64 tx_nss[4];		/* 1, 2, 3, 4 */
 	u64 tx_mcs[16];		/* mcs idx */
 	u64 tx_bytes;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c423b052e4f4..9ea2e1198477 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1084,10 +1084,14 @@ static const char mt7996_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_mode_he_ext_su",
 	"v_tx_mode_he_tb",
 	"v_tx_mode_he_mu",
+	"v_tx_mode_eht_su",
+	"v_tx_mode_eht_trig",
+	"v_tx_mode_eht_mu",
 	"v_tx_bw_20",
 	"v_tx_bw_40",
 	"v_tx_bw_80",
 	"v_tx_bw_160",
+	"v_tx_bw_320",
 	"v_tx_mcs_0",
 	"v_tx_mcs_1",
 	"v_tx_mcs_2",
@@ -1100,6 +1104,8 @@ static const char mt7996_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_mcs_9",
 	"v_tx_mcs_10",
 	"v_tx_mcs_11",
+	"v_tx_mcs_12",
+	"v_tx_mcs_13",
 };
 
 #define MT7996_SSTATS_LEN ARRAY_SIZE(mt7996_gstrings_stats)
-- 
2.25.1


