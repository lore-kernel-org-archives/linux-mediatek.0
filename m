Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B56C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 03:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTQrmF36jYllv3mP9Yybi+HEjaafjrlWHqq19OeW1oU=; b=a0BVnHWI8I89sJ5pEpTLVHIJA3
	Nv5NIQ9hBs75FvFE5PrEX1FrR0qGQG3+dkosc8mel03DEHzS897s9v7aMmq41LH06JYG2RRLpGaw+
	zMw7VRGf8vLNiyI5yUDWJGv8/AuMtY6tly2f9onv0wU6H3VCHaqbNj7e/9PtYPWtCqn/bAXEDcIFq
	QUoT0N1aEzxFx12knE6S5ZDuCUknzY0Dj8TE2i4rA3CSe/zWDesPVgY49z1XlSCowOrdgYGqBq8GD
	9QVnIRxB1HogPbRgMatNfQ6Cu5IVymS03vGz+8oRlL3BYsDp0ftKuSvA57GHJLl7yQIZmZojMsU8G
	LquNx/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCA1i-00000002hP8-3Gml;
	Wed, 29 May 2024 03:30:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCA1f-00000002hOS-0hS2
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 03:30:56 +0000
X-UUID: d5c1164c1d6b11efbf6c7d4f5c147266-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mTQrmF36jYllv3mP9Yybi+HEjaafjrlWHqq19OeW1oU=;
	b=eOTT6iTFDxZ9Bb4MNrDGJ22EQb4yOeUMSFThh/GNL5Hq++A8I/0Hy+RHawK1hAq5SVFX1QmhVv23kdDIduy72QETefZHL5C6lD2sJlKGPn+UmeX4JqFlUWyNyQmuINrFzdoeGI0yURiQpVZej6DBfzaLO4FPBpqybV1dHnBAFPw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:faa6d975-1185-4a63-8649-b5f183b60a24,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:4dc3ee43-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d5c1164c1d6b11efbf6c7d4f5c147266-20240528
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 420185228; Tue, 28 May 2024 20:30:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 May 2024 20:30:43 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 11:30:43 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 1/3] Bluetooth: net: add hci_iso_hdr function for iso data
Date: Wed, 29 May 2024 11:30:36 +0800
Message-ID: <20240529033038.28458-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240529033038.28458-1-chris.lu@mediatek.com>
References: <20240529033038.28458-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_203055_234956_00BC67DE 
X-CRM114-Status: GOOD (  10.13  )
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

Add function hci_iso_hdr to get skb->data when packet type is ISO
which is similar to other packet type.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/net/bluetooth/hci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index e372a88e8c3f..b9f8f91f6c7f 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -2898,6 +2898,11 @@ static inline struct hci_sco_hdr *hci_sco_hdr(const struct sk_buff *skb)
 	return (struct hci_sco_hdr *) skb->data;
 }
 
+static inline struct hci_iso_hdr *hci_iso_hdr(const struct sk_buff *skb)
+{
+	return (struct hci_iso_hdr *) skb->data;
+}
+
 /* Command opcode pack/unpack */
 #define hci_opcode_pack(ogf, ocf)	((__u16) ((ocf & 0x03ff)|(ogf << 10)))
 #define hci_opcode_ogf(op)		(op >> 10)
-- 
2.18.0


