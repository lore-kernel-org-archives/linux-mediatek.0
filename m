Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF8C4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UulzovTZlkfq99/4dwqz+ky3wt4JcbCsZctauX0sz4A=; b=cm2t3ekDrgElsCQlANUUZhpz1f
	sHyLg6vkkXNKnHs1nOT/8b2fjsvNRxykAWtP0KaoMh0C3VQAortp1mit7BnGDBNYaGaOZhyPDfQjT
	514hrw4mesCpTR5nBdmFDIktfvVJYY21lzsOM0PgghHVLO22hpJcLLY7tSeTxLgXfMoHbwSnneeFi
	mbKym27ZvS+N+7DnoLqfvhYdkkrz/rvGyzHohhz7uJ8WgQViRoXVDlsCq/BsD329ppM9NXqVAyjky
	rSzCrIuH94vsPLZ1/yVfYR8kx0p8U2xj5f6FEx03j5083fdEappyL93qR8pAbAJs/rWUiUmeE2AwN
	8FLubXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctJ-00000001OPp-1L0J;
	Fri, 17 Jul 2026 07:21:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctF-00000001OMZ-2yCa
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:21:47 +0000
X-UUID: 265e59b681b011f1acbe4559397dec65-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UulzovTZlkfq99/4dwqz+ky3wt4JcbCsZctauX0sz4A=;
	b=tG04+DtmB+sgQDFKpPxg0G+VGpm2aFsnWNO7fBBWjEolkiBux3XxO3IbR1EAP5vux4mTVbf5ievQyx/g9M2L1uHQ8jigsJUMmCOlCPKddVcp1mZi3E2c183KPPl2tu6mS6pvsWmM8zmShIB3/RosF6G6dUC0p/XTE/A+fPgbQjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:1067c3f9-7d41-4e74-a89c-303ede67920f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:ba0d965f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 265e59b681b011f1acbe4559397dec65-20260717
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 526565837; Fri, 17 Jul 2026 00:21:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 15:21:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 15:21:35 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v14 6/7] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
Date: Fri, 17 Jul 2026 15:21:32 +0800
Message-ID: <20260717072133.2858136-7-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260717072133.2858136-1-chris.lu@mediatek.com>
References: <20260717072133.2858136-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002145_789934_A3F70EB6 
X-CRM114-Status: GOOD (  10.58  )
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
index 0fd6ce09a313..e059e72d9dbe 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -271,12 +271,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
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
@@ -355,7 +355,7 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
 	fw_size -= 30;
 	fw_ptr += 30;
-	flag = 1;
+	flag = BTMTK_WMT_PKT_START;
 
 	wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
 	wmt_params.status = NULL;
@@ -365,9 +365,9 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 
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
index c83c24897c95..c234e5ea27e5 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -66,6 +66,12 @@ enum {
 	BTMTK_WMT_ON_PROGRESS,
 };
 
+enum btmtk_wmt_pkt_flag {
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


