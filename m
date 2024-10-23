Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D0FCDDE6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvzEvHiDHJCSQ9OPPoA+/DQ5g+AxJier5h97qmDMLdE=; b=Jf5bPPAChi7VwS+eGbVQwlnAqZ
	u13k6eB1ibOKiQ7PZSfT9rcyuG+CsFEEnRBNJKuoSb7ncgqtWfR0rvVyAQNLNP65ttu3H1G0+0IyA
	eu4NH2N+lg8vF4xvUUo1cpqlUMGetpGH3HKYVtyodln+BE7r02+bubUM9JSP8Q9tIbVqCZTpqsvil
	W3QsBWR9RihUh1nHmwCYh+98q7MbXJ+2VZpLuYgmSEsilYsqmYLyKSXz710cayrNDZjmC0TvT5AuD
	ESzrT8TvGNeB22jcc5IZ6/66OQ8CCjkv93DhsSqJpjDQzDV0P9Q4W2Sf1gy+9wwpCtqv0td94jvqo
	H48O1rdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqo-0000000EDQZ-3STW;
	Wed, 23 Oct 2024 11:48:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zfo-0000000E9wN-1fBY
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 11:37:09 +0000
X-UUID: 1e746854913311ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mvzEvHiDHJCSQ9OPPoA+/DQ5g+AxJier5h97qmDMLdE=;
	b=bkcZMLmwbHMDE2hb5JlIxG0W4yUtg5Djo6AemnuScBdnl5zseL9BtOG0d8QgBZgtZFxZaZN8ODXHnzW9aAEEwyW7+VbUSVoEewHPAozpCQMRQTiIZ5yIGo3Px87XFDh5WOawvjP4hjmfYtxEADapzh/9rYCklTnBuoqti+pmlV8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:525937e3-9dfa-4067-aeca-8095c38b9521,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7aabb641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1e746854913311ef9048ed6ed365623b-20241023
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1788127344; Wed, 23 Oct 2024 04:37:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 19:36:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 19:36:58 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: adjust the position to init iso data anchor
Date: Wed, 23 Oct 2024 19:36:26 +0800
Message-ID: <20241023113626.12236-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_043708_462917_92D48235 
X-CRM114-Status: GOOD (  11.23  )
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

MediaTek iso data anchor init should be move to where MediaTek
claims iso data interface.
If there is an unexpected usb disconnect during setup flow,
it will cause a NULL pointer crash issue when releasing iso
anchor since the anchor wan't been init yet. Adjust the position
to do iso data anchor init.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 1 -
 drivers/bluetooth/btusb.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index b7fc14aafc74..8a3f7c3fcfec 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1215,7 +1215,6 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 	struct sk_buff *skb;
 	int err;
 
-	init_usb_anchor(&btmtk_data->isopkt_anchor);
 	spin_lock_init(&btmtk_data->isorxlock);
 
 	__set_mtk_intr_interface(hdev);
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 9970470c9d15..15c0885c37cd 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2628,6 +2628,8 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
 	int err;
 
+	init_usb_anchor(&btmtk_data->isopkt_anchor);
+
 	err = usb_driver_claim_interface(&btusb_driver,
 					 btmtk_data->isopkt_intf, data);
 	if (err < 0) {
-- 
2.18.0


