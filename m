Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB2C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGfrSwb7kUfROhwGV7OHlue/a5Pn2gN3pKAVCv80KqY=; b=oLGxhKjjrLWrvx0EPMysgyUW/t
	/Cxs9uA3PbFBJOV7ZhKfiWuFctfGufTirgxdFvYLVyBBP2bkzSX49t+Vq7t0tQ+68SuTrSpjKH4AJ
	Sz0ErV4m+TCgCaAnLEP1AZWB8QN0kQ9rBxCEE5mHliMZgI70yvIE4952t8RRp2T7QSw5O4XS+D+l6
	AMnvHIm1mzAHFbQMt/B/QqVe4cdj99C22eC3ABbSOZPGPkBSUQ7fRFGNGkp4iZiOKIlPKgTldu+qm
	jZpzPj45f+F+LF84naLmtSA6kybX2eEwyoXhdlfYT2Gr+KT42AhiZE80F40IFO7H+qKlSiAvI+Fy6
	7x3UONEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60dC-00000002UtU-0DS5;
	Mon, 14 Sep 2026 06:57:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60d9-00000002UsW-0Pu3
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 06:57:32 +0000
X-UUID: 7ac67ed4b00911f1afed4741b24580c9-20260913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NGfrSwb7kUfROhwGV7OHlue/a5Pn2gN3pKAVCv80KqY=;
	b=QjsUH/4QvL1OsWH7h7+UFLpST3Bb/4s2CoFtym961Zb8r0OPCgfarsLxRyT1Az/P/w8NL6+8x2sGqq1uj0Llg5+6iWLidTZraDVAhGBAd11jByJ9lCBBT7y6xHxzaaOR7uBYBhCOYWfKA4xsm8gpoF8R3oAGC0huB178DF4kwQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ec50defe-c9ce-452a-9a8e-75eec4fb69c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2563cee2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7ac67ed4b00911f1afed4741b24580c9-20260913
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 995098056; Sun, 13 Sep 2026 23:56:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 14:56:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 14:56:55 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 1/3] Bluetooth: btmtk: Route firmware debug event to the diag channel
Date: Mon, 14 Sep 2026 14:56:52 +0800
Message-ID: <20260914065654.102916-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260914065654.102916-1-chris.lu@mediatek.com>
References: <20260914065654.102916-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_235731_149883_71210B7B 
X-CRM114-Status: GOOD (  16.88  )
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

Confirmed with MTK internally that this event's wire format is fixed:
firmware always sends it as a single ACL_START packet and never splits
it into a continuation (ACL_CONT, which would show up as 0x1efd). Add a
comment above the switch spelling that out for this and the other
vendor-reserved handles already handled here (0xfc6f, 0x05ff, 0x05fe),
so review tooling doesn't keep flagging the apparent lack of a matching
continuation case.

Verified on MT7922: under the condition that triggers this firmware
debug event, it is now routed to the diag channel instead of reaching
the host as an unknown ACL packet.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
v2: Confirmed with MTK that this event's wire format is fixed at a
    single ACL_START packet; added a comment above the switch in
    btmtk.c and btmtksdio.c explaining that HCI fragmentation does not
    apply here, addressing review feedback on v1.

 drivers/bluetooth/btmtk.c     | 8 ++++++++
 drivers/bluetooth/btmtksdio.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 660ed5b02841..ddf50ab9533e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1055,6 +1055,13 @@ int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 	struct btmtk_data *data = hci_get_priv(hdev);
 	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);

+	/* The handles below are vendor-reserved values MTK firmware uses to
+	 * tag out-of-band debug/dump data on the ACL channel rather than a
+	 * real connection. Each is always sent as a single, complete
+	 * ACL_START packet, so unlike genuine connection data they never
+	 * arrive fragmented (e.g. 0x2efd is never followed by an ACL_CONT
+	 * continuation, 0x1efd).
+	 */
 	switch (handle) {
 	case 0xfc6f:		/* Firmware dump from device */
 		/* When the firmware hangs, the device can no longer
@@ -1076,6 +1083,7 @@ int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:		/* Firmware debug logging 1 */
 	case 0x05fe:		/* Firmware debug logging 2 */
+	case 0x2efd:		/* Firmware debug event */
 		return hci_recv_diag(hdev, skb);
 	}

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fe4ca9395aa3..46cb143a99c6 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -451,6 +451,13 @@ static int btmtksdio_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
 	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);

+	/* The handles below are vendor-reserved values MTK firmware uses to
+	 * tag out-of-band debug/dump data on the ACL channel rather than a
+	 * real connection. Each is always sent as a single, complete
+	 * ACL_START packet, so unlike genuine connection data they never
+	 * arrive fragmented (e.g. 0x2efd is never followed by an ACL_CONT
+	 * continuation, 0x1efd).
+	 */
 	switch (handle) {
 	case 0xfc6f:
 		/* Firmware dump from device: when the firmware hangs, the
@@ -460,6 +467,7 @@ static int btmtksdio_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:
 	case 0x05fe:
+	case 0x2efd:		/* Firmware debug event */
 		/* Firmware debug logging */
 		return hci_recv_diag(hdev, skb);
 	}
--
2.45.2

