Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADBEE7717F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 03:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=obhTzeAbHx2ZiSwSAJdHjfQ1nVeRgUQ/g8ZesBg5PeU=; b=lN2X0X7yj9epLNWX5i7xaseKOf
	+JBE/GJXJOYUjQqoyOfKUqREuc9aT69zYjsIZGWiDkIcjPVYs6Ul9juyDZ6Sxa4q+cOQPHKaWpSHS
	FKB05ti1pPBxAn5mf1PZcK5vEU9oZFbIKIegQuaM3/7fDONZ08g6e9MH0mU7JhJVHbcNSajG45aWf
	B6dEuj1xgfWxA5HaicyXditBB8uYlWyvYqIwA5Qe70QvGs7P37qERvEBQtTMmSUJf4sSJ6ARKwkBc
	N7f7e7/zqctssuRVpKS2cRkoJVdKStgFHZPMp8jgBNHzObKOKvolSQKAAi5mCiAcXdqb1meoSFgJu
	4NdmP0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1km-00000008vbw-2Y6B;
	Mon, 16 Dec 2024 03:26:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1ct-00000008uM2-1aJx
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Dec 2024 03:18:32 +0000
X-UUID: 699599b8bb5c11ef82ff63e91e7eb18c-20241215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=obhTzeAbHx2ZiSwSAJdHjfQ1nVeRgUQ/g8ZesBg5PeU=;
	b=WQZt7toFkP0my/zqHx6CcQQH4OuN4WPH9nsEFaZeY+ttTZFZPidkDTe6ItRiiegaCc14WXqv2ZZuTese7vmaj5mo5xEy/os/krAek0KJ4lcoeuj2vTbIzen1+n9c1u51G3nygCNAYswgB/hYbvAxcLv2TM1pdzds1KBvEl5QtwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a0e44a98-d677-40cc-9755-99272a5ba44b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:24e3043c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 699599b8bb5c11ef82ff63e91e7eb18c-20241215
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 149481153; Sun, 15 Dec 2024 20:18:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Dec 2024 11:18:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Dec 2024 11:18:20 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2] Bluetooth: btmtk: add quirk to support HCI_QUIRK_SIMULTANEOUS_DISCOVERY
Date: Mon, 16 Dec 2024 11:18:18 +0800
Message-ID: <20241216031818.19284-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.032100-8.000000
X-TMASE-MatchedRID: 6pbNFWS8cDtocr5vRHCIao6MisxJraxH5kzxLgNhSimdCqKtxM6bhxdm
	/aPya3SyxiqnR+5LS89/hUfrylyBijcpdZ3fQiLdFEUknJ/kEl5jFT88f69nG/oLR4+zsDTt9xS
	3mVzWUuCMx6OO8+QGvgetIhGhsuhDF7o48gWgv8Miwmhn8iBkjERG86KnAodXqJKPM4GiabiefT
	+TsWHDqcKd7SaEpEvJ8R2g6KTVG2fplTbAbQzJMHmVKZusLp922v9OjYWA2uMMswg45VMfPadst
	5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.032100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8DA7A549AD1C3288F4F0B332D70D5EC6568DC4617637280265C1A1B8B118BB952000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_191831_421559_EC00BF5E 
X-CRM114-Status: UNSURE (   6.93  )
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

Add quirk to support HCI_QUIRK_SIMULTANEOUS_DISCOVERY for MediaTek chipset.
The feature is related to allow controller do both LE scan and BR/EDR at
the same time.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
v2: update commit message
---
 drivers/bluetooth/btmtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 8a3f7c3fcfec..562d6ecf0b71 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1367,6 +1367,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 			return err;
 		}
 
+		/* Apply common HCI quirks for MediaTek chipset */
+		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+
 		hci_set_msft_opcode(hdev, 0xFD30);
 		hci_set_aosp_capable(hdev);
 
-- 
2.18.0


