Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E66CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M+6YRfMNY+0ECvIUo2haTqwMfsnHsigkBlfpT0Km0M=; b=fECvGYLHHOl/3Mbqnh/R2w7ruY
	VMGpPfQb3inA7OtBIA0hX44oyYLMu6R7UkxCvV8OjOBD51SXWpDz4EQSMIwTa09FvlBspy18oQotN
	gpusYbUT1yQhzhJgWkNGqCewxgUpOeMfMYAzlUqTqXFn5wQhcAKqT9jHyZh/erJgo4EsopsMjHrtb
	Rk2wDp/GH2l0E5nbqZb40G0ZH/jsLRLJFIYffbNFacT00MdXh6SYY/KlH03akt37ztcQNuWgGwstW
	oA7V2UDkO7EWBNc9FC4fpMUAs3Vtc3/2cWDr2O/Xz4LNJUu/IP3BNaSiIUPmGNSqFenGYMaREV+It
	HyjDxqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiX-0000000CJ97-1Flq;
	Tue, 13 Oct 2026 08:18:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiV-0000000CJ79-19RP
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 08:18:36 +0000
X-UUID: aaffd244c6de11f1acbe4559397dec65-20261013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2M+6YRfMNY+0ECvIUo2haTqwMfsnHsigkBlfpT0Km0M=;
	b=QS4ceZSeBZrLNksdLCpMveSNh0tCMJo+0FUiUuNov2kw4t7xCNIxpPmA/53j/W5wINOgUOl2nP2WmfXkvFtMTwletzJjmYR4PF/G7rbrk+eGRYEJY9qITCJklkFCWV3ZvWSXx/m5RVJHvP+oY+L3ZwwOZOH0XSXhDM+0VrhYd80=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:93b17fdf-9d25-4ed3-ae49-0fdc0c8d20eb,IP:0,U
	RL:0,TC:0,Content:47,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:47
X-CID-META: VersionHash:291e20b,CLOUDID:670bb461-631c-4dbe-b8dd-a62f5130cbf8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:3|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aaffd244c6de11f1acbe4559397dec65-20261013
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 553858544; Tue, 13 Oct 2026 01:18:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Oct 2026 16:18:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Oct 2026 16:18:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
Date: Tue, 13 Oct 2026 16:18:22 +0800
Message-ID: <20261013081823.817996-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013081823.817996-1-chris.lu@mediatek.com>
References: <20261013081823.817996-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011835_354356_367D7BDA 
X-CRM114-Status: GOOD (  13.19  )
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

The ISO interrupt IN endpoint delivers one HCI ISO packet per 264-byte
transfer and zero-fills the remainder. btmtk_recv_isopkt() keeps parsing
that padding: every four zero bytes look like an ISO header with handle 0
and Data_Total_Length 0, and are passed to hci_recv_frame() as a complete
frame. A single transfer can inject up to 64 of them, which is what fills
the HCI log with malformed ISO packets. If handle 0 belongs to a live
CIS/BIS, iso_recv() also drops the SDU it is reassembling.

A zero Data_Total_Length carries no ISO Data Load at all, and the
controller never emits one -- these are produced purely by parsing the
padding. The padding always runs to the end of the transfer, so stop
parsing once one is seen.

This was observed on MT7925, but btmtk_recv_isopkt() is shared by every
MediaTek USB controller that supports ISO data.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Co-developed-by: Hao Qin <hao.qin@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
Co-developed-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index bdc85147b97f..869eb2176379 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1201,6 +1201,19 @@ static int btmtk_recv_isopkt(struct hci_dev *hdev, void *buffer, int count)
 			/* Complete ISO header */
 			hci_skb_expect(skb) = __le16_to_cpu(dlen);
 
+			/* The interrupt endpoint zero-fills the remainder of
+			 * each transfer, and that padding parses as a header
+			 * with a zero Data_Total_Length. Such a packet carries
+			 * no ISO Data Load at all and is never emitted by the
+			 * controller, so stop parsing here rather than hand a
+			 * bogus handle 0 packet to the stack.
+			 */
+			if (!hci_skb_expect(skb)) {
+				kfree_skb(skb);
+				skb = NULL;
+				break;
+			}
+
 			if (skb_tailroom(skb) < hci_skb_expect(skb)) {
 				kfree_skb(skb);
 				skb = NULL;
-- 
2.45.2


