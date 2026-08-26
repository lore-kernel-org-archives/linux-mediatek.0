Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F508C61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3w6x5i5cNJ44cvxGIR3mU/+8CUnMl13CMX4jUQ9qkts=; b=xM2dLQ5i7wS42Q4Yk1u304fYfZ
	jUV5LvrCCxI8niS810ui7tHFJAijLiKgmBfTtkNlqyGJBgjrTTRZiBTxQzHUCN1fLmo7dPo9bqJct
	oW3svGlooeZEV+ENETFYE4tj6oUAEPOLD33SBxbgeqYOZ44stcv/s96V1v3ycGMbUEeRayxN2Tahf
	F/H21Jn9TWR3ecd0HJljC6CKW2W6BDyxvu0rMqPn8C2N5PIPZcrTYJlH1CTV9YgN40UTfm2aNrCFm
	z+/vrhkBsa2yC6RMkJjXywCFYrCJ8swO6n6ZEfQk867UPYx6HO+QwL/NcFfI4OT72E5aVOAX5gAOh
	Cl5Nbekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBcN-00000002LJ3-3XCt;
	Wed, 26 Aug 2026 11:16:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBcL-00000002LIN-3jvU
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 11:16:31 +0000
X-UUID: 9115f472a13f11f1afed4741b24580c9-20260826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3w6x5i5cNJ44cvxGIR3mU/+8CUnMl13CMX4jUQ9qkts=;
	b=dOXG+q1S6VSW9uv0SBwdL8CLS2sdRfLJtaJU2MGWcKIk4BV/pN+btf0PuiOWamLN/BGQMiNeCCPFHw1A9efruG594BoQWOW3KmyOMKkJCidiDdVuy5hfKr0+roQ7Sqbt5YSL9WK/iBG/ToKBFxuSj7bqQkdr1skDlEyNcoOj+Uc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6bba4b7c-b816-465c-b3b7-9889e702903a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:639b34c3-610e-480f-b463-9bb53aa0aeaf,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9115f472a13f11f1afed4741b24580c9-20260826
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1178808139; Wed, 26 Aug 2026 04:16:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Aug 2026 19:16:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 26 Aug 2026 19:16:18 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: Route firmware debug event to the diag channel
Date: Wed, 26 Aug 2026 19:16:17 +0800
Message-ID: <20260826111617.1175698-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_041629_976843_B291C885 
X-CRM114-Status: GOOD (  11.00  )
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

MediaTek controllers may emit a firmware debug event on the ACL channel
using the reserved handle 0x0efd, which shows up in the ACL header as
0x2efd once the start fragment flag is included.

Neither btmtk_usb_recv_acl() nor btmtksdio_recv_acl() recognizes it, so
the packet is passed to the HCI core, which has no connection with that
handle and complains:

  Bluetooth: hci0: ACL packet for unknown connection handle 3837

Handle it the same way as the existing firmware debug logging packets and
forward it to the diagnostic channel instead.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c     | 1 +
 drivers/bluetooth/btmtksdio.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 73ba4a029e9c..8563ab06a99f 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1006,6 +1006,7 @@ int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:		/* Firmware debug logging 1 */
 	case 0x05fe:		/* Firmware debug logging 2 */
+	case 0x2efd:		/* Firmware debug event */
 		return hci_recv_diag(hdev, skb);
 	}
 
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b7f0be7fc42a..cba52724f867 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -460,6 +460,7 @@ static int btmtksdio_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:
 	case 0x05fe:
+	case 0x2efd:		/* Firmware debug event */
 		/* Firmware debug logging */
 		return hci_recv_diag(hdev, skb);
 	}
-- 
2.45.2


