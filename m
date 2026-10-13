Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF9DCC6B03
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2koErh8H97/dPt4DifQK5DJYoWrNT2mAtpnRDTTX3Wo=; b=IXyCuLg3jc6V0Uc6mk61JiWAmL
	hUtmWBORNV/rhKhZReVryT/2iOuHLD8LsHTClbirEFeakoJMJX9Jaca5OEbIFmkIqygBwYomIpAwm
	c8OQGISEBp5XTIkS7WarBqm0J8VgBaSjyiBg1nuuRRpHxKYbRO0XlGf82gSbAXEMTyD47/FulUPDu
	O3ts8zSGAEdv2xujFJ3fMEkP2ukYPsZql1dRsTYPYw3JHui0z3qI42yBjcrBMw+HymvLRWmv7Cy7J
	+rqfNRJ4WHwEZfK+gdQJLCTt8MKyDEzkatQhEfpjnZqD9LlIAMDN2FxCB231nCydXmicTSkBMm8As
	lrSPu9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiX-0000000CJ9F-1bXZ;
	Tue, 13 Oct 2026 08:18:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiV-0000000CJ6v-18gM
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 08:18:36 +0000
X-UUID: ab15bea6c6de11f1afed4741b24580c9-20261013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2koErh8H97/dPt4DifQK5DJYoWrNT2mAtpnRDTTX3Wo=;
	b=dGVDa3zEBVWKAKLgQEUOcub269ePf1Io2CHq2Qvpv9HF0Eom9fpHMLXwKgBrHITQPuRJVq87kXzqvBvNTk1n7jtcmhat14AHvIeZllhZI+LlkUMhIFqzb0aokYQ1gJ2uWmg9Ov5yh7liDu9UaSwZZyrCGrAWVwGKS5ut7PEXXP0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:358baf1e-2e17-41da-be01-37087afc5a48,IP:0,U
	RL:0,TC:0,Content:54,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-META: VersionHash:291e20b,CLOUDID:630bb461-631c-4dbe-b8dd-a62f5130cbf8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:3|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab15bea6c6de11f1afed4741b24580c9-20261013
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1849857652; Tue, 13 Oct 2026 01:18:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH 2/2] Bluetooth: btmtk: size the ISO receive skb to hold header plus payload
Date: Tue, 13 Oct 2026 16:18:23 +0800
Message-ID: <20261013081823.817996-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013081823.817996-1-chris.lu@mediatek.com>
References: <20261013081823.817996-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011835_351944_F874AC0E 
X-CRM114-Status: GOOD (  10.61  )
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

btmtk_recv_isopkt() allocates HCI_MAX_ISO_SIZE (251) bytes and stores the
4-byte HCI ISO header into the same skb, leaving only 247 bytes for the
payload. A Data_Total_Length of 248..251 would fail the skb_tailroom()
check and be dropped with -EILSEQ, taking the rest of the URB transfer
with it.

HCI_MAX_ISO_SIZE is the maximum payload length, not the maximum frame
length, so allocate HCI_MAX_ISO_SIZE + HCI_ISO_HDR_SIZE, matching how the
ACL path uses HCI_MAX_FRAME_SIZE (HCI_MAX_ACL_SIZE + 4).

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Co-developed-by: Hao Qin <hao.qin@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
Co-developed-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Wenlong Tian <ot_wenlong.tian@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 869eb2176379..1b501b64d71f 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1178,7 +1178,8 @@ static int btmtk_recv_isopkt(struct hci_dev *hdev, void *buffer, int count)
 		int len;
 
 		if (!skb) {
-			skb = bt_skb_alloc(HCI_MAX_ISO_SIZE, GFP_ATOMIC);
+			skb = bt_skb_alloc(HCI_MAX_ISO_SIZE + HCI_ISO_HDR_SIZE,
+					   GFP_ATOMIC);
 			if (!skb) {
 				err = -ENOMEM;
 				break;
-- 
2.45.2


