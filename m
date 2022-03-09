Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC948C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOQc8KYsAbOgZXFYBJTOSla5CaIdMzeed3BPL037iVU=; b=fHdKgfXRP2265l
	tzTly6l9VpUprCs81QIuAH5jny/U5Y5U4ut62IKs+wXH96n7M4i1MEesg+YTHto+Ta2/MyA4TRn71
	xwPGVKhybC6e5CrT9RKZyLKcB2ob1V0KevGFSGWDlsk1FH0orfK647dMsjlYBFwrWr3Nm2XuaENdS
	cdVYsXMBs4vrnVRjHSRDdY674i6t233ggpgpBiQCElPvKRD9Kcm59cHxdjSgBOzEQwBEJaR4a+1ie
	MsH4nJdibEGaIOzuvXgEZw5LqtSQrfwxGnsQz/oHPDFPvsQ6XG30HF4RgHRRuey2YoC7AgZFGi3IW
	r+vlYU7FzLLNEbjEZITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjxu-006i5d-EI; Wed, 09 Mar 2022 00:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjxr-006i3y-Lr
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 00:14:05 +0000
X-UUID: a1bbc5b2492a483eb23ed41bc9f0cf7e-20220308
X-UUID: a1bbc5b2492a483eb23ed41bc9f0cf7e-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 372071708; Tue, 08 Mar 2022 17:14:00 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 16:03:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 08:03:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 08:03:58 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/3] Bluetooth: btmtkuart: fix the conflict between mtk and
 msft vendor event
Date: Wed, 9 Mar 2022 08:03:54 +0800
Message-ID: <16e90bd42107f67d997fdef8b12430e1efd892ad.1646783737.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
References: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_161403_743209_CE7EB165 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

There is a conflict between MediaTek wmt event and msft vendor extension
logic in the core layer since 145373cb1b1f ("Bluetooth: Add framework for
Microsoft vendor extension") was introduced because we changed the type of
mediatek wmt event to the type of msft vendor event in the driver.

But the purpose we reported mediatek event to the core layer is for the
diagnostic purpose with that we are able to see the full packet trace via
monitoring socket with btmon. Thus, it is harmless we keep the original
type of mediatek vendor event here to avoid breaking the msft extension
function especially they can be supported by Mediatek future devices.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 7d405a16f864..695e1225b08c 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -192,13 +192,6 @@ static int btmtkuart_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	struct hci_event_hdr *hdr = (void *)skb->data;
 	int err;
 
-	/* Fix up the vendor event id with 0xff for vendor specific instead
-	 * of 0xe4 so that event send via monitoring socket can be parsed
-	 * properly.
-	 */
-	if (hdr->evt == 0xe4)
-		hdr->evt = HCI_EV_VENDOR;
-
 	/* When someone waits for the WMT event, the skb is being cloned
 	 * and being processed the events from there then.
 	 */
@@ -214,7 +207,7 @@ static int btmtkuart_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	if (err < 0)
 		goto err_free_skb;
 
-	if (hdr->evt == HCI_EV_VENDOR) {
+	if (hdr->evt == HCI_EV_WMT) {
 		if (test_and_clear_bit(BTMTKUART_TX_WAIT_VND_EVT,
 				       &bdev->tx_state)) {
 			/* Barrier to sync with other CPUs */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
