Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA30CDE002
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3PVKUMutfyhwALw0LBzphl2Z8HlsYxmiR2zI3GKJVo=; b=PfnfvnKh3asxjjjB9FqpHayKoU
	Ez+BcnLes+xsxwXuTQ3ki+K229ffS3SIHAvPdkOG/mbr61PlzcQvX7s2mUJstZ66UJy58yb6v6BVB
	jaIcYn+yOEvZLcU33THPUAKGScfkW1fBE0lma4HH+2pA5Vxzh5HmuizXxS3pJLvvYmQgbFeVfjcKb
	U8BJjtrgV4rWG3VGiiko3+pj4Dh3+lfWO3vow5XMmewpNuj5Sb0oX4y9Eei26aGYR97PVFVwkhL2y
	Tth9wbl3mrf2RTVSN/V+0/g+AyXABIF1es4YumERxYE19QM16CaKQYNNEPkF3hcl4I3RnYKHd094y
	L333LQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIS7-00000007MAx-4AwJ;
	Wed, 24 Jun 2026 07:55:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIS3-00000007M7Y-2Dhw
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 07:55:18 +0000
X-UUID: 05a6a86a6fa211f1acbe4559397dec65-20260624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L3PVKUMutfyhwALw0LBzphl2Z8HlsYxmiR2zI3GKJVo=;
	b=AU8Hab0rH+gXtjEXptYOYpvbYkr9g0qUHuk5sZHm2FTNRt32ElzHjdFx4Y8yDaE4ZQF9Pn0cIqawgeRkjVciOJGEChSAP4sQmqdV81KMoK5K40VcIOWplMG/Kahxrr5YCpJGdssagIdrYR01ooaSHIGAvGuClE1/xPMwz62lCg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:d89da11b-92e6-4b6e-a6bc-8326c82c0431,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:9dbb0cee-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 05a6a86a6fa211f1acbe4559397dec65-20260624
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1507212799; Wed, 24 Jun 2026 00:55:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Jun 2026 15:55:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Jun 2026 15:55:06 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>, Paul
 Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v5 1/3] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
Date: Wed, 24 Jun 2026 15:55:02 +0800
Message-ID: <20260624075505.1318804-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260624075505.1318804-1-chris.lu@mediatek.com>
References: <20260624075505.1318804-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_005515_579584_E8A71AD6 
X-CRM114-Status: GOOD (  10.97  )
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
btmtk_setup_firmware_79xx() with descriptive enum values:

- BTMTK_WMT_PKT_START (1): First packet of a sequence
- BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
- BTMTK_WMT_PKT_END (3): Final packet of a sequence

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/bluetooth/btmtk.c | 6 +++---
 drivers/bluetooth/btmtk.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..21c08ee1cdbf 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -230,12 +230,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
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


