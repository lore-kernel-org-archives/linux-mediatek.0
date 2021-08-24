Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EE6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105EE6135F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 105EE6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAGeXs6eJE8tG0Mk39HTc90xTHhk9BNVtoDAwVuC8V0=; b=byEhh+OEsxyz26
	GkarO1Q6mCYjWlK/R6zZ/zauxClp67tTbZX5jydwXbmt/GHJ8pkvU/TZMk2234MaJu6SEXQoKXX1Q
	A9TiqzAFjVmG/pwdxhSndE+hrCyeFcsi3ylZNnIL37yry6jeKXQw/or2wqv6X28tItC7X+Ou0YFCy
	qXaYOwn6+FpFi6Q4RFSITptZzh7cvUWBmgYJrYjP1ZBDBz00TDEK43Nl4ul/FGSq/5fiC+G9rS/kA
	0jKeinaa2AnSBbK5skI/5z+12sbPKh0JqMerBFEQCttUgSAyRUE4ZRWit2Meo1CTL+C5JmxaSRSqW
	qp6Be2nIZ4SEWn/lzCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYbd-003mkn-Qo; Tue, 24 Aug 2021 15:44:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYbW-003miY-Fa
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 15:44:51 +0000
X-UUID: 2b2fc1303668490982a2a2f9a8b5636f-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MTWq3GQtnf6nnNytaeWuSejSLW0uqgnzRy0DvAoGyvo=; 
 b=Ar4CwIadU5F0Vf47j2QIkw4JXUQvYJQLXuyNtF6P7engaAHKm2ZMziKwlGXG9bwj91YVcYFEFQaP29zG02X2gMe74rTlq5ffYvmOnjggbDLBB42j10jh8n26qvo+zc9NTT+fBZWpMjGYQJHpX2tzsoKujRbCNWrb6/G3UBsxJSk=;
X-UUID: 2b2fc1303668490982a2a2f9a8b5636f-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1822653651; Tue, 24 Aug 2021 08:44:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 08:44:41 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 Aug 2021 23:44:41 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <mcchou@chromium.org>, mark-yw.chen
 <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btusb: Support public address configuration
 for MediaTek Chip.
Date: Tue, 24 Aug 2021 23:44:29 +0800
Message-ID: <20210824154430.27689-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_084447_998858_8AEF7199 
X-CRM114-Status: GOOD (  10.55  )
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

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

The MediaTek chip support vendor specific HCI command(0xfc1a) to
change the public address. Add hdev->set_bdaddr handler for MediaTek
Chip.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 60d2fce59a71..41e7c9f28d82 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2200,6 +2200,23 @@ struct btmtk_section_map {
 	};
 } __packed;
 
+static int btusb_set_bdaddr_mtk(struct hci_dev *hdev, const bdaddr_t *bdaddr)
+{
+	struct sk_buff *skb;
+	long ret;
+
+	skb = __hci_cmd_sync(hdev, 0xfc1a, sizeof(bdaddr), bdaddr, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		ret = PTR_ERR(skb);
+		bt_dev_err(hdev, "changing Mediatek device address failed (%ld)",
+			   ret);
+		return ret;
+	}
+	kfree_skb(skb);
+
+	return 0;
+}
+
 static void btusb_mtk_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
@@ -3819,6 +3836,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
 		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
+		hdev->set_bdaddr = btusb_set_bdaddr_mtk;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		data->recv_acl = btusb_recv_acl_mtk;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
