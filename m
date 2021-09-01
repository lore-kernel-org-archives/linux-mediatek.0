Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B55AC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C60601FF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C60601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+BRRWU1b8qoJyQRNIRysDpJC8BZwqvgl2ajzL5sat7k=; b=tO/eR3KNom8A+w
	xtGsLo8JfmYcH+RRx/mu6CAJpCodUAYV4rz0QrVAv4J2mIGp0vj9brTzN8reaf/P6wgOt1Oh/iIcC
	//1IlUs67XC4hD3WiMAqu5g1nVGLe/+wkIECBGp12EXek+60YxWDMYXfASbW+pePC/ETrzucO4K74
	DcSa3Y6E1EfBHb97pLiktgbZ3aiODojLxuRk+ccMkE055l3fRqy7NwHIvmJCqqd94ctghzfkXqfB7
	3TfZ51/GypqiszoIC4FJLy+lKghOfT+i5VZh27254tB09Sf8SkTdRP0RFiG0LmzBx0i0YBfwrp+eK
	KrNc1UfzVkba/Ldwx6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLH8J-003gyF-S7; Wed, 01 Sep 2021 03:41:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLH8E-003gxi-1d
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 03:41:49 +0000
X-UUID: d9f37a30fa7c4a9d93fc11ea444c1e34-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5f6Fdl0SJ0+Om1JDzEepeXOY68i3vsycaLIdaiv+yI0=; 
 b=LzK4aff8a2n7AHYmy7+lKgiPw+rgUtl+D5oz/Y6DDtq/X05QjxRBrxr5mMvnlmXtWBdJqgb2nMtpkMp3XrFs4mrUFifhv0V0ok9z89LDnX24dscPsbdjK8yrZf5LYYuotR7n5ZBsTD82L3yk0Onz9MVPOCnWesu+S1OBCRmZYGs=;
X-UUID: d9f37a30fa7c4a9d93fc11ea444c1e34-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451205350; Tue, 31 Aug 2021 20:41:41 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 20:32:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Sep 2021 11:32:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Sep 2021 11:32:36 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <mcchou@chromium.org>, mark-yw.chen
 <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 1/2] Bluetooth: btusb: Support public address configuration
 for MediaTek Chip.
Date: Wed, 1 Sep 2021 11:32:25 +0800
Message-ID: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_204146_137812_BE86283E 
X-CRM114-Status: GOOD (  11.08  )
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
Chip. After doing a power cycle or MediaTek Bluetooth reset, BD_ADDR
will bring back the original one.

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
