Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E13EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 05:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFjVLrSlHIovITeC28nKCrvDmOrnc0uXGtIt3SR2nPc=; b=jRkDXbVZLR5uwrRT/fL4k9F3WL
	c0Tkhs4snxPLJULXa1eSNw2LYKwOHNlrHJvgIz7mfEDfDos8HaHRNtQl6lheBlsNbX7AnB+E/wIcP
	qf3y6yCtkJi+05PDBZSZ/1CxAPu1msosQohavmOcmR/AVMOErtvvVnxlc5ByRjBEXXNsjABhAE6zb
	+x2yvtPiZo55RAL9X7MO8sRkuvHt1m9H8bwhU5aQZ9SS9FChUf409dJXHToAqkXQtT0zDxxD2OWyx
	NgtpnxneN5x08x+QYCABXzX1jnWCGsW5CpCjhXA4u/BlgwOkN98WLqB70yuQdCLmyYXbCcBrxnFKH
	6KReQczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSG3-00GZTR-20;
	Wed, 12 Jul 2023 05:19:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJSG0-00GZSY-0v
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 05:19:21 +0000
X-UUID: a44e0318207311ee912e1518a6540028-20230711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HFjVLrSlHIovITeC28nKCrvDmOrnc0uXGtIt3SR2nPc=;
	b=Yg1bBEQRniF8y4SsvuJtDogNbDaqCPswW9n2NCkH/waEuXzu84JOa75IZXbuy2FNNXlCbY9QoMZ7v7Ysr2J910+8wLVcVddfWCgB+dswkJuOZRYCB3nBUhDo1sMFZdyXsbVJpJTY1Rtdadh2JxGjwPuhHe7bkWkR3IXZkCx5few=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:7ce111fa-a5ac-420b-b725-66d02b8128f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:eaedd60d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a44e0318207311ee912e1518a6540028-20230711
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1105434551; Tue, 11 Jul 2023 22:19:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jul 2023 13:19:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jul 2023 13:19:12 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3] Bluetooth: btmtk: Fix null pointer when processing coredump
Date: Wed, 12 Jul 2023 13:18:58 +0800
Message-ID: <20230712051857.13812-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_221920_358391_487E440B 
X-CRM114-Status: GOOD (  11.94  )
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

There may be a potential null pointer risk if offset value is
less than 0 when doing memcmp in btmtk_process_coredump().
Checking offset is valid before doing memcmp.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: fix typo
v3: fix bot checking error
---
 drivers/bluetooth/btmtk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 786f775196ae..0f290430ae0e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -370,7 +370,7 @@ EXPORT_SYMBOL_GPL(btmtk_register_coredump);
 int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btmediatek_data *data = hci_get_priv(hdev);
-	int err;
+	int err, offset;
 
 	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
 		return 0;
@@ -392,15 +392,15 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 		if (err < 0)
 			break;
 		data->cd_info.cnt++;
+		offset = skb->len - sizeof(MTK_COREDUMP_END);
 
 		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
-		if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
-		    skb->len > sizeof(MTK_COREDUMP_END) &&
-		    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
-			    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
-			bt_dev_info(hdev, "Mediatek coredump end");
-			hci_devcd_complete(hdev);
-		}
+		if (data->cd_info.cnt > MTK_COREDUMP_NUM && offset > 0)
+			if (!memcmp((char *)&skb->data[offset], MTK_COREDUMP_END,
+				    sizeof(MTK_COREDUMP_END) - 1)) {
+				bt_dev_info(hdev, "Mediatek coredump end");
+				hci_devcd_complete(hdev);
+			}
 
 		break;
 	}
-- 
2.18.0


