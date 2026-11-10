Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4C606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8qZ/Txm;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s3DBYvLv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s3WU/ntEM/Qzr62B+Nsjoc7XB3FTBM7MGR2jCmGohMY=; b=X8qZ/TxmDOpEj392lUJZJiFHZ5
	BHdJgNb/f/jV8elMPl0aYZJJSNL/bwa9GWsU0GGR206R6+sA66NVholwZ7dlDO5L1vCCBh/xYh02y
	WPx7R8bzbiXBwjxX8CLIobpv0X+qaIdTRATzZ1HIewhnEXMvs1oPxY0yI2I98PWcOLexiSp/fqYf3
	PPpUtzXH+zeuaDSvZZPtg03wDb+dnVkOna2NQPL3ByWAxOBNi1iOYaNyBxfGMIgWil8i+Ts83CRvl
	Bo/vXnTplxvL+Okq7sPTtSU02KxZnRFs4FqRpu1whWr80m+MxGUEStEP8YsQ3NE2IQVA6ngB7PMur
	F/+UrHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ5-00000002FdF-0Is1;
	Tue, 10 Nov 2026 03:13:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIp-00000002F96-3C4y
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:47 +0000
X-UUID: b80c27e4dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s3WU/ntEM/Qzr62B+Nsjoc7XB3FTBM7MGR2jCmGohMY=;
	b=s3DBYvLvj9zsb6XSBWAZyo3JKaH6IgZw75tKSb7tWge2WXmnW6KFoMrDIVaiWyBtGmf7V60nswTj8dSUyeK4c0Xdh8oNJNQbk+wgArYkRCwE0Cgk3eWGuV4zJrlLNnUjp4Ewu9aURrIOv5d6JJVwkMO5Z7dxf1S95SQdhzr1sc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:579cd43e-0373-4d25-8c5e-e6c587306963,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:022b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b80c27e4dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 735310300; Mon, 09 Nov 2026 20:13:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 11/28] wifi: mt76: mt7925: parse the FW hybrid-MLO third-link band limit
Date: Tue, 10 Nov 2026 11:12:27 +0800
Message-ID: <20261110031244.369014-12-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191343_877985_C1973297 
X-CRM114-Status: GOOD (  12.99  )
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

The EML capability TLV also carries a bitmap of the bands the firmware
forbids as the third (virtual) hybrid-MLO link. Store it so the
multi-link setup can keep those bands off the firmware virtual link.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 557f8d3dea12..1d59c02645c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1127,8 +1127,10 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data, int len)
 static void
 mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data, int len)
 {
+	/* The TLV also carries the third-link band limit for hybrid MLO at offset 3. */
 	struct mt7925_mcu_eml_cap {
-		u8 rsv[4];
+		u8 rsv[3];
+		u8 third_link_band_limit;
 		__le16 eml_cap;
 		u8 rsv2[6];
 	} __packed * cap;
@@ -1139,6 +1141,7 @@ mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data, int len)
 	cap = (struct mt7925_mcu_eml_cap *)data;
 
 	dev->phy.eml_cap = le16_to_cpu(cap->eml_cap);
+	dev->phy.mlo_third_link_band_limit = cap->third_link_band_limit;
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index b9bcc5e1197c..5a501e72baca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -228,6 +228,12 @@ struct mt792x_vif {
 	struct mt792x_nan nan;
 };
 
+/* Bands the firmware forbids as the hybrid-MLO 3rd (virtual) link.
+ * 6 GHz is never restricted, so it has no bit here.
+ */
+#define MT792x_THIRD_LINK_LIMIT_2G	BIT(0)
+#define MT792x_THIRD_LINK_LIMIT_5G	BIT(1)
+
 struct mt792x_phy {
 	struct mt76_phy *mt76;
 	struct mt792x_dev *dev;
@@ -259,6 +265,8 @@ struct mt792x_phy {
 	void *clc[MT792x_CLC_MAX_NUM];
 	u64 chip_cap;
 	u16 eml_cap;
+	/* bands not allowed as the 3rd link */
+	u8 mlo_third_link_band_limit;
 
 	struct work_struct roc_work;
 	struct timer_list roc_timer;
-- 
2.45.2


