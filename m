Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBAEC88E50
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGFTkEwYB6tHniCOU10/jNmsJ6sUyQiWxjI5epJSI60=; b=I6mM913VRhT2WkP1eq3JnPc6JB
	4ZctScA7bAPYwoWICbL8Ej5/p8OgBe8u83HCD2eLpWhqcBcAVW8ehT3Pe3hYyP5VEfy0IFApeG6mO
	hQzvzPIaeamyo8dbb420uq+2UK/PSy60nMWVla+EvhCi6LUtznxdvdqtFh0Sn2PVKVDg5EsEZKxeD
	ZeDSg52UVTX0BFL2n0mDs6C+2j5BIDYZMQNH/adzpo8umTHVAM6VVndbtKLqEXRuFrQlC3ufNhm0R
	s/e8GSLEqbCnc3zjCu+85rq77qW9NYhAmKcXhPLqu++BuwB7czSZucgd4qEyLdy1n+kHQTSUp0VR+
	C2mixsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yij-0000000GPZ3-0h32;
	Fri, 11 Sep 2026 10:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yif-0000000GPY4-3ZtB
	for linux-mediatek@bombadil.infradead.org;
	Fri, 11 Sep 2026 10:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nGFTkEwYB6tHniCOU10/jNmsJ6sUyQiWxjI5epJSI60=; b=F6kcC06kzFB94lDHsHS9ct9p2Z
	+3az7GKPoN1V4SOQq1e7TGcpHKT8CfxKiCdDoQ2W6JEkexpf7nKH0iJREttAer+7o3iPsjZE88Auw
	oUyeedB9LC97w9kaytmqrt6HTAIhVeDemhRhDJsrzjt/G6xwSXetGBRwgUQCKQRAS4ItfSC6DR9iy
	h3J+tAvfqyU090q45+dIFRw5LkSZm92bf9foaI0VoaGujYCQhT9SwNv/mo0taGDhfmn6LF8I7cZ9e
	3eyyszwSESSfYQxFQfOCUHhiW601kJd0xM7EDWen40Sx9KNJgvRxY2ppJcY6q0RGxTRnv2oemqTvq
	H3M9ci5g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4yib-00000003TxR-21ms
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 10:42:56 +0000
X-UUID: 831dfd0cadcd11f1afed4741b24580c9-20260911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nGFTkEwYB6tHniCOU10/jNmsJ6sUyQiWxjI5epJSI60=;
	b=rqZdzF2Y5Uj5NlmNphAVmQrqESrKGOazZFyQ02x6uYArpst/tdixlc5Mb43gmqrzhlyQKLpIoikyqKDMIwk6KWtF7AQ14bo0ydj4uPWM3tuSy0HDizwUH8NgfNHv2lPf2DYtXtMIFYC8aZyPrGT8Lq1NYLZdRqNQ+QwMsNddTWQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:588ec619-f147-4eab-ae75-eb9f3f3a3406,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:e2112f28-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 831dfd0cadcd11f1afed4741b24580c9-20260911
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1535101526; Fri, 11 Sep 2026 03:42:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 11 Sep 2026 18:42:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 11 Sep 2026 18:42:37 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 3/3] Bluetooth: btmtksdio, btmtkuart: validate WMT event length before struct access
Date: Fri, 11 Sep 2026 18:42:34 +0800
Message-ID: <20260911104234.2276126-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260911104234.2276126-1-chris.lu@mediatek.com>
References: <20260911104234.2276126-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114253_877368_3CCACDFB 
X-CRM114-Status: GOOD (  14.66  )
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

btmtksdio.c and btmtkuart.c cast a received WMT event straight to
struct btmtk_hci_wmt_evt and read its op/flag fields without checking
the event is long enough to contain them, unlike btmtk.c. The
FUNC_CTRL case then further casts to struct btmtk_hci_wmt_evt_funcc
and reads its 2-byte status field, again without a length check.
Firmware that sends a short or malformed WMT event makes both drivers
read past the end of the received SKB.

Mirror btmtk.c: validate the base WMT header with skb_pull_data()
before touching any of its fields, and when a FUNC_CTRL event turns
out to be the short, header-only form (a plain enable/disable ack
with no status word), decode the result from the header's own flag
byte instead (0 = success, otherwise failure).

Verified setup on MT7920, MT7921, MT7922 and MT7925: no regression.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Fixes: e0b67035a90b ("Bluetooth: mediatek: update the common setup between MT7622 and other devices")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 20 +++++++++++++++++++-
 drivers/bluetooth/btmtkuart.c | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fe4ca9395aa3..a8ebcd0c005c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -217,7 +217,14 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 	}

 	/* Parse and handle the return WMT event */
-	wmt_evt = (struct btmtk_hci_wmt_evt *)bdev->evt_skb->data;
+	wmt_evt = skb_pull_data(bdev->evt_skb, sizeof(*wmt_evt));
+	if (!wmt_evt) {
+		bt_dev_err(hdev, "WMT event too short (%u bytes)",
+			   bdev->evt_skb->len);
+		err = -EINVAL;
+		goto err_free_skb;
+	}
+
 	if (wmt_evt->whdr.op != hdr->op) {
 		bt_dev_err(hdev, "Wrong op received %d expected %d",
 			   wmt_evt->whdr.op, hdr->op);
@@ -233,6 +240,17 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
+		if (!skb_pull_data(bdev->evt_skb,
+				   sizeof(wmt_evt_funcc->status))) {
+			/* A plain enable/disable request is acked with just
+			 * the WMT header and no trailing status word; the
+			 * result is carried in the header's own flag byte.
+			 */
+			status = wmt_evt->whdr.flag ? BTMTK_WMT_ON_UNDONE :
+						       BTMTK_WMT_ON_DONE;
+			break;
+		}
+
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 27aa48ff3ac2..4af6fbbbd302 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -151,7 +151,14 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 	}

 	/* Parse and handle the return WMT event */
-	wmt_evt = (struct btmtk_hci_wmt_evt *)bdev->evt_skb->data;
+	wmt_evt = skb_pull_data(bdev->evt_skb, sizeof(*wmt_evt));
+	if (!wmt_evt) {
+		bt_dev_err(hdev, "WMT event too short (%u bytes)",
+			   bdev->evt_skb->len);
+		err = -EINVAL;
+		goto err_free_wc;
+	}
+
 	if (wmt_evt->whdr.op != hdr->op) {
 		bt_dev_err(hdev, "Wrong op received %d expected %d",
 			   wmt_evt->whdr.op, hdr->op);
@@ -167,6 +174,17 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
+		if (!skb_pull_data(bdev->evt_skb,
+				   sizeof(wmt_evt_funcc->status))) {
+			/* A plain enable/disable request is acked with just
+			 * the WMT header and no trailing status word; the
+			 * result is carried in the header's own flag byte.
+			 */
+			status = wmt_evt->whdr.flag ? BTMTK_WMT_ON_UNDONE :
+						       BTMTK_WMT_ON_DONE;
+			break;
+		}
+
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
--
2.45.2

