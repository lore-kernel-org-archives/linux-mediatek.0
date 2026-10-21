Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDC606A323
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xCbG0L//;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=iegglWyc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chrw1hPEAXslp3rluFtq2rLUShveUHrd6nw3XOyN/VQ=; b=xCbG0L//w29SVVDEFGb0ASrLzn
	vv82DXqEgvAgGuO9BQOar9nCktd1c1BKqPp7+YzuEoLYu+KjT0HmKfPmIJTUBy3VM5qYOg9UJa4rn
	L5akosAWQ15osTvLPfn8JLWsotgzdUNoExAU0Zfe0f3XlM5T28lB/N4JfSKDOkEx9LVjBJzkI1N+u
	DzN8dBb2uQb614F41b4taoTR57rWEBNsQjO6Qn+nshR9n1qalYqXud0L8fLA1I6fZsVbrC8Ot9GSO
	obm2UNSdQUw5b/drkAqp2lnwsvYCYFKYI30gtjMZYCKTNxHv2qkRN7aLmuHBBVgwRkfn6qnWfsh+r
	A+MGXDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQgD-0000000BFVV-2OCy;
	Wed, 21 Oct 2026 07:24:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQgA-0000000BFTM-0tji
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 07:24:07 +0000
X-UUID: 6335e14acd2011f1acbe4559397dec65-20261021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=chrw1hPEAXslp3rluFtq2rLUShveUHrd6nw3XOyN/VQ=;
	b=iegglWycb6azoeEj4m4grN/0cJSAWPhfuJkadCw9M0HOu0aWjU1VSGZ6ln9P+Jxyqv78CVJtf4sg6Gf5uNlg1M1lKZs9xy8xDNta97YA8ZRi4B5bA0JFn0Xd4ju78OJURyb6j4WUytfq0GsBUizqx485qBP4TuzF+OA5kECAnAg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:023414bc-c3b8-4bae-bb21-7966d6a60a8e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:38d343ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6335e14acd2011f1acbe4559397dec65-20261021
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1525267051; Wed, 21 Oct 2026 00:24:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 21 Oct 2026 15:23:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 21 Oct 2026 15:23:58 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 3/3] Bluetooth: btmtk: derive the firmware ISO setting from MTK_ISO_THRESHOLD
Date: Wed, 21 Oct 2026 15:23:55 +0800
Message-ID: <20261021072356.1449539-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261021072356.1449539-1-chris.lu@mediatek.com>
References: <20261021072356.1449539-1-chris.lu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_002406_254550_ACBDD683 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ISO data transfer size is spelled out twice: as a raw byte pair in the
vendor command sent by btmtk_usb_isointf_init(), and as MTK_ISO_THRESHOLD
for the padding in btmtk_isopkt_pad(). Build the command payload from the
macro so the size is stated once, and update the setting for current
MediaTek controllers.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index d60e9db0d463..147db716d538 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -25,7 +25,7 @@
 #define MTK_SEC_MAP_NEED_SEND_SIZE	52
 
 /* It is for mt79xx iso data transmission setting */
-#define MTK_ISO_THRESHOLD	264
+#define MTK_ISO_THRESHOLD	342
 
 struct btmtk_patch_header {
 	u8 datetime[16];
@@ -1354,7 +1354,7 @@ static int btmtk_submit_intr_urb(struct hci_dev *hdev, gfp_t mem_flags)
 static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 {
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
-	u8 iso_param[2] = { 0x08, 0x01 };
+	__le16 iso_param = cpu_to_le16(MTK_ISO_THRESHOLD);
 	struct sk_buff *skb;
 	int err;
 
@@ -1369,7 +1369,7 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 		return err;
 	}
 
-	skb = __hci_cmd_sync(hdev, 0xfd98, sizeof(iso_param), iso_param,
+	skb = __hci_cmd_sync(hdev, 0xfd98, sizeof(iso_param), &iso_param,
 			     HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
 		bt_dev_err(hdev, "Failed to apply iso setting (%ld)", PTR_ERR(skb));
-- 
2.45.2


