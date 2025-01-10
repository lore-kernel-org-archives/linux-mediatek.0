Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC23E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJHn1hIuDy3wpzxn0d+QeBZ3v7dLeGqCXQL2jcmbX3E=; b=bYFtLLYABrXSs6MBirsqlsPtQI
	KHkyIoX0ILOA21vMrN0QgLU56iGOFpB38jZCdH1khLPd+y/E5VgTp+kv4mWtxqu7wWRSdo/R+9ZwZ
	mNN80HuK5zpUPzdB8NCSS7X20Z9VnjGHIAnAZNQvaOjIHF6bERIb+5YRfYZJjJ5O8M1s1OT8tpHHX
	m4YHiDOP+xqy/4N1oR07OYbpzhMzk10hR2jeRtC92CPVKqlkMompXqIcDu/MS6sMgnIwE6MDpbvCu
	Yokct7sZ8MJrq5q19Ail9GVaoKUVJMkqKGupeCQIjN5GJJ806Q7SdrnSHanmXCvD9eV2+glCFWdbY
	ac6Z7r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBoS-0000000EqtH-0rrd;
	Fri, 10 Jan 2025 10:00:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBkF-0000000Eq5N-3tSt
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jan 2025 09:56:01 +0000
X-UUID: 1605df10cf3911ef82ff63e91e7eb18c-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rJHn1hIuDy3wpzxn0d+QeBZ3v7dLeGqCXQL2jcmbX3E=;
	b=JGFMbeWWXEmYnUCh3grrjlt3IZdNAh+ft1A7ctyvYXZuwhPkPoNTgxSJXtA2gkjWkJzpa4EtzGeS1tcas6cBp0r7RYtthnRgM2xYCo7YkPZCGQQfCWt7+VOXvPbnxEBxpcJDFhbu3RUhFSGaP/T/uhezb/tYFkmfbD8u1Vu1oUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:41324678-e758-4eb2-b10d-d8c4ec1525d8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:ebeb4c13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1605df10cf3911ef82ff63e91e7eb18c-20250110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <hao.qin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1214896024; Fri, 10 Jan 2025 02:55:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 17:55:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 17:55:52 +0800
From: Hao Qin <hao.qin@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Steve
 Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Hao Qin <hao.qin@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
Date: Fri, 10 Jan 2025 17:55:48 +0800
Message-ID: <20250110095548.12761-1-hao.qin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015559_969590_D01169B6 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Remove resetting mt7921 before downloading the fw, as it may cause
command timeout when performing the reset.

Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 224eafc27dbe..68846c5bd4f7 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1329,7 +1329,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		fwname = FIRMWARE_MT7668;
 		break;
 	case 0x7922:
-	case 0x7961:
 	case 0x7925:
 		/* Reset the device to ensure it's in the initial state before
 		 * downloading the firmware to ensure.
@@ -1337,7 +1336,8 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 
 		if (!test_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags))
 			btmtk_usb_subsys_reset(hdev, dev_id);
-
+		fallthrough;
+	case 0x7961:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
 
-- 
2.18.0


