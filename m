Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181CDC44501
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epGXLRCmvcx4nX7CFVTmNreEgf6Ukls0mpRDETc2X1k=; b=Cto7nFWFASdu8jJx+qJ4Bom77M
	nf3RvvtWf28ttjDZOcLYJgVXilgKpgYOwjZFPXolA/8qRBMY7qgBZ75m3uc5Pc4KLjp7jCjCrvHVo
	cwkS5+3QfKpJmhXQBchvEufPGMEujYLzzz1M52ArMVHpmNuEdIX9bYo648M9Shy5uqbqjqKTEmIbf
	veBCOyS0pbJAnxnIU7tRQC/Jv4L2PNPz136D265w+sop6FlzlN9t1mAgIPL5XYKjdmPxAb3likrFj
	Tk3ZIe2/JSOoDumZI6t7diMn5TQO+MhA27sy7Z25jYD/OjhGr1hRT3froB3orNyg1SCeyFmTH2YOj
	7F5YLvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcKG-0000000Bx02-3iiq;
	Tue, 14 Jul 2026 12:33:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcKD-0000000BwwR-3f2n
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 12:33:27 +0000
X-UUID: 31954b787f8011f1afed4741b24580c9-20260714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=epGXLRCmvcx4nX7CFVTmNreEgf6Ukls0mpRDETc2X1k=;
	b=pxWwIITVZyOafVcwkl1huKzusKAFeMfSTgGCP849AJJHvbyUqkpo/ZFBa0VetULbl6beEV/C4WWJ/373XtIYs6m7ssf4R5ReJsmi5xydT94Qo+wGbYsIX46L/a31oLw8iX0LgJJGNqSC1BB2G0tEvYXfvwO7EmwpnkEqbDGhdQc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:7506ff0b-5f6e-4166-bd55-e43c328ba954,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:a1e3af55-f38b-430b-a6f2-741debd53b1f,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31954b787f8011f1afed4741b24580c9-20260714
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 520776644; Tue, 14 Jul 2026 05:33:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Jul 2026 20:33:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Jul 2026 20:33:16 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v10 5/7] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
Date: Tue, 14 Jul 2026 20:33:11 +0800
Message-ID: <20260714123314.814333-6-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260714123314.814333-1-chris.lu@mediatek.com>
References: <20260714123314.814333-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053325_928374_01957C6A 
X-CRM114-Status: GOOD (  10.73  )
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

Add BTMTK_WMT_PKT_* enum to represent WMT download packet sequence flags,
improving code readability. Replace magic numbers (1, 2, 3) in
btmtk_setup_firmware_79xx() and btmtk_setup_firmware() with descriptive
enum values:

- BTMTK_WMT_PKT_START (1): First packet of a sequence
- BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
- BTMTK_WMT_PKT_END (3): Final packet of a sequence

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Assisted-by: Claude:Sonnet-4.5
---
 drivers/bluetooth/btmtk.c | 12 ++++++------
 drivers/bluetooth/btmtk.h |  6 ++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 3491060b3ae9..3fe6b4fdc438 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -269,12 +269,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			while (dl_size > 0) {
 				dlen = min_t(int, 250, dl_size);
 				if (first_block == 1) {
-					flag = 1;
+					flag = BTMTK_WMT_PKT_START;
 					first_block = 0;
 				} else if (dl_size - dlen <= 0) {
-					flag = 3;
+					flag = BTMTK_WMT_PKT_END;
 				} else {
-					flag = 2;
+					flag = BTMTK_WMT_PKT_CONTINUE;
 				}
 
 				wmt_params.flag = flag;
@@ -353,7 +353,7 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
 	fw_size -= 30;
 	fw_ptr += 30;
-	flag = 1;
+	flag = BTMTK_WMT_PKT_START;
 
 	wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
 	wmt_params.status = NULL;
@@ -363,9 +363,9 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
 		/* Tell device the position in sequence */
 		if (fw_size - dlen <= 0)
-			flag = 3;
+			flag = BTMTK_WMT_PKT_END;
 		else if (fw_size < fw->size - 30)
-			flag = 2;
+			flag = BTMTK_WMT_PKT_CONTINUE;
 
 		wmt_params.flag = flag;
 		wmt_params.dlen = dlen;
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..51c18dde0a80 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -66,6 +66,12 @@ enum {
 	BTMTK_WMT_ON_PROGRESS,
 };
 
+enum {
+	BTMTK_WMT_PKT_START = 1,
+	BTMTK_WMT_PKT_CONTINUE = 2,
+	BTMTK_WMT_PKT_END = 3,
+};
+
 struct btmtk_wmt_hdr {
 	u8	dir;
 	u8	op;
-- 
2.45.2


