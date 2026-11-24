Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C9606A332
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 02:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IixjzJyg;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Nya9iYFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P0xXakZdv0vwsCXEeKqDEArbRa7wMVxfx0H1jm89ElQ=; b=IixjzJygnvY5hYjJhEKtyE6uOT
	UdEo7vfDNRnP1zbi8a/r5kdX6QHkrBcc0rXVNFqejhp2OnCQNvPtS+h+b+lO4lPU5Z9vUs95BJwwi
	huSYY3GzSloHKwffp/TdXWnW41u2za1nV9TJg/DfSGE0c/26WsS/P/4Nm7X0NlLfNiafWfw1PepYn
	lg2wV3g3ESbyNm9popDzDfY+debvvytd6z7DPG9pwlP2g1qAoZIA2NrVQuNSyu4P9IVLNCgHW31Ct
	G7497Mrz+JL/uBFSpum5/ahg5+LfZx3UIwczrQSwWKItiA/+WUCx35/h9AQUUJrqnf0y++AL4W+fM
	4PEVeGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgBy-00000005MTo-12eo;
	Tue, 24 Nov 2026 02:23:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgBu-00000005MT2-3u2G
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 02:23:32 +0000
X-UUID: 062012dee7ae11f1acbe4559397dec65-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P0xXakZdv0vwsCXEeKqDEArbRa7wMVxfx0H1jm89ElQ=;
	b=Nya9iYFgjGqPP5bRvKamH4giYGWR9BFuhmSwlVIberVDNi2Lsl05Ekcg9C/h2jE+RYj+VwQsyUcR4Wq2vW+4JN0LN2s5pfdbuUvtJ5vaL+zV+vBHZSBRW8pGHXcogKI+iAv2fZcYePsiEy4Cm/T2QMUMMic1lNAEDDyymGeVro0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d232bee5-76ce-4c6f-a46f-310774dc961b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:882816ea-4eb9-4755-ac2a-8e95ba251d29,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 062012dee7ae11f1acbe4559397dec65-20261123
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881699784; Mon, 23 Nov 2026 19:23:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:23:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Tue, 24 Nov 2026 10:23:21 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will
 Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH] Bluetooth: btusb: Do not set BROKEN_ENHANCED_SETUP_SYNC_CONN for newer MediaTek chips
Date: Tue, 24 Nov 2026 10:23:18 +0800
Message-ID: <20261124022318.663787-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124022318.663787-1-chris.lu@mediatek.com>
References: <20261124022318.663787-1-chris.lu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_182330_995187_CD7FD819 
X-CRM114-Status: GOOD (  13.26  )
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

HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN was set for every MediaTek
controller, which makes the host fall back to HCI_OP_SETUP_SYNC_CONN
for SCO connections. MT7921/MT7920 and the older MT7663/MT7668 need
this fallback, but the chips released after MT7921 are expected to
handle HCI_OP_ENHANCED_SETUP_SYNC_CONN properly. Note that the chip
model number does not follow the release order.

Set the quirk in btusb_mtk_setup() only when the chip ID read from the
controller is 0x7663, 0x7668 or 0x7961, so the behavior of these chips
is unchanged. MT7920 reports the same chip ID (0x7961) as MT7921, so it
keeps the quirk as well.

For MT7922 and MT7925, verified that with the quirk removed the host
uses HCI_OP_ENHANCED_SETUP_SYNC_CONN to set up SCO connections and no
problem was observed. The chips released after them are not expected to
need the quirk either.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.c
index 95398e2ca098..f0ced6e3192f 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -3205,6 +3205,12 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		if (platform_is_ryzen() && is_direct_child_of_root_hub(data->udev))
 			set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
 		break;
+	case 0x7663:
+	case 0x7668:
+	case 0x7961:
+		/* SCO does not work with HCI_OP_ENHANCED_SETUP_SYNC_CONN */
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN);
+		break;
 	}
 
 	return 0;
@@ -4621,7 +4627,6 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->reset = btmtk_reset_sync;
 		hdev->set_bdaddr = btmtk_set_bdaddr;
 		hdev->send = btusb_send_frame_mtk;
-		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN);
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		data->recv_acl = btmtk_usb_recv_acl;
 		data->recv_event = btmtk_recv_event;
-- 
2.45.2


