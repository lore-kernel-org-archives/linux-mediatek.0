Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47327C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j3gssqpamwVPINxlyQtLb57s1xKFMi9YNYYa36A9GTc=; b=RTHNRkzSeifxHYiwEH+EFPG+up
	vmrKtE3w1/NAU3XicgkkOqQfq0W3N9TiAUqskZdtGgMavZuUmg3G7MMIAeBu8v0mXwc2VV8+IIBFJ
	FhdPjaEpAKxFVtAI9XQHqSzoDcnVkSV6WohIHmWeWiB9zrLHVNN8ba5Owpiy/PQ9E9hkSnI74OEb1
	Jx6zQ+8ewjsapDd3vhMDF3jenxRA7DzzEqVnnEwWDp3BwCtzVJ+bjRpOuhPHmgl0T9x8mkV3q5IM2
	Vnbs5TrtpO1IxeW2P6zL14L7b4T0AsaFtBulwZhmQrew5Q4cDI33CQau+RiCeczBl5ojqZbLpjlrc
	OLUn9Lrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImZZ-00GTKB-0m;
	Thu, 28 Dec 2023 09:21:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImZX-00GTJp-0b
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 09:21:00 +0000
X-UUID: 664957cea56211ee9a662f17bb45267e-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=j3gssqpamwVPINxlyQtLb57s1xKFMi9YNYYa36A9GTc=;
	b=HRFKcLfpYpbEOnq6iJ5vg00qcFDCOt8Kt2Cg4f7fcZgEFqdPp22CBXwnfO7sSdE/WS/yqyBhd8DWpDTOwLSHiXBxax0CkpMYTz1D9a4+fICcMAsRnN8u6IrSNDWPC69EWmzWAR47+6ABxR1CsydQ2bUz1jWxjgJN3gygHxo4sRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7e4b55e2-7645-42fa-98d7-ddafaf0a53ac,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:1407942e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 664957cea56211ee9a662f17bb45267e-20231228
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <peter.tsao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802048419; Thu, 28 Dec 2023 02:20:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Dec 2023 17:20:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Dec 2023 17:20:51 +0800
From: Peter Tsao <peter.tsao@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, Steve
 Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Tsao <peter.tsao@mediatek.com>
Subject: [PATCH] Bluetooth: btusb: Fix MT7925 fail to send download patch command
Date: Thu, 28 Dec 2023 17:20:14 +0800
Message-ID: <20231228092014.23184-1-peter.tsao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_012059_236774_69E6573A 
X-CRM114-Status: GOOD (  10.33  )
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

Write the register 0x18011100[1] = 1 to avoid the device enter sleep
state during download patch flow on specific platform.

Error log:
Bluetooth: hci0: Execution of wmt command timed out
Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
Bluetooth: hci0: Failed to set up firmware (-110)

Signed-off-by: Peter Tsao <peter.tsao@mediatek.com>
---
 drivers/bluetooth/btmtk.h | 3 +++
 drivers/bluetooth/btusb.c | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 56f5502baadf..8b582077a01f 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -22,6 +22,9 @@
 #define MT7921_DLSTATUS 0x7c053c10
 #define BT_DL_STATE BIT(1)
 
+#define MT7925_SLPPROT 0x18011100
+#define SLPPROT_BYPASS BIT(1)
+
 #define MTK_COREDUMP_SIZE		(1024 * 1000)
 #define MTK_COREDUMP_END		"coredump end"
 #define MTK_COREDUMP_END_LEN		(sizeof(MTK_COREDUMP_END))
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 7835170b1d66..842fda0527db 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3120,9 +3120,13 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7925:
+		btusb_mtk_uhw_reg_read(data, MT7925_SLPPROT, &val);
+		val |= SLPPROT_BYPASS;
+		btusb_mtk_uhw_reg_write(data, MT7925_SLPPROT, val);
+		fallthrough;
 	case 0x7922:
 	case 0x7961:
-	case 0x7925:
 		if (dev_id == 0x7925)
 			snprintf(fw_bin_name, sizeof(fw_bin_name),
 				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-- 
2.18.0


