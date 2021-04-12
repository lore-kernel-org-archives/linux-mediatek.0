Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB74C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:07:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3876054E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3876054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mnwKW5cdC5s+aGUTO5wu4RRap+ppKEhmPYOb0GxhASY=; b=NlIXmbzqFJaJz/+6+xAd6E9OkY
	Cq5fikAmXgdNx8XxMGHSvzRW5rRge/20rCDcLnxIhb7zTH0oj8IcCQgCCocsDG6nnaJP05ckKRKEq
	Q+oF7+AleUNINnHrKLjQ/J8tJ0yMb1Gvvmer/1G9hQhGDJVNqYWDcqp3hIGUIZopf7t4VfeCPtJNZ
	yk0fXsMDdmvI5AtMpJEoDsj2ndvs6rbzNKlOnO31Hv8ki9l7/s8OpeG7osPgGnXkwGO633uMHvQF+
	qSLSh8Kj1UC9RCIRqhhEC3Q6sVmMNBqDf/zAPB5PzKbaiYAnr6OL1g/uAQhTQ4BNPLNcR5D1afns4
	32qqYQFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVy9L-0071w8-1l; Mon, 12 Apr 2021 15:06:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVy9H-0071vW-GF
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 15:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ZAlcBmy6WAHzCQSGDLq+K0FjzK3hh0Eq5RejTtxRx9E=; b=DAUpr4/D2QxnidBy0T61gp5b/Y
 mWSWJM3yCVuhku0pn+TK0OHmXDFll8PrqacMU74yE9r5l9/1E4kVnJ1tbqfh4nAg1ElJpt8QJTPlD
 e9KWFo20OeB2/E71Exw/TpNTFc0bddixjuPQtoKRm5FyclfvVmFezD6vEt4FZyu08AD2+pZxvC62W
 NRlC+jdzmQdPiIVt5qaicu8egQjNYYezBjthOWWIY3PS80NvlmaR++eUUUt1AubyitPLzyeAE7nDy
 64hd30La01lmJm2EK0drqr1uCcO2P3hcE/A8li0eohP7rU4zkyjasUC0u9q0SsangQbcTVqWLYVzh
 bxtmfiAg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVy9E-006KWk-EQ
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 15:06:45 +0000
X-UUID: b35d03c551d54c18a86bf6d1cf563534-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZAlcBmy6WAHzCQSGDLq+K0FjzK3hh0Eq5RejTtxRx9E=; 
 b=MZRo09Op/2gP8lAoPQ102oLGSOYMz062KnwbIQ1RWUZNgz291Yp8yJAqMnKj+S0OCvnTuH9gQcR3vo1zSE8yUsng5IiOWNdTSf8SB1fsrUwpm7V/ZImU4QOoEYSUYzE7ADxBBG2GBzufBfMS7DPSq1JcxNdzzv6Z04SknktDUlc=;
X-UUID: b35d03c551d54c18a86bf6d1cf563534-20210412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 733833765; Mon, 12 Apr 2021 08:06:38 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 08:06:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 23:06:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Apr 2021 23:06:34 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btusb: Fixed too many in-token issue for
 Mediatek Chip.
Date: Mon, 12 Apr 2021 23:06:26 +0800
Message-ID: <20210412150627.31913-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_080644_511719_9B193B7E 
X-CRM114-Status: GOOD (  11.81  )
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

This patch reduce in-token during download patch procedure.
Don't submit urb for polling event before sending hci command.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5d603ef39bad..ae36d7dc60db 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3291,11 +3291,6 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 	struct btmtk_wmt_hdr *hdr;
 	int err;
 
-	/* Submit control IN URB on demand to process the WMT event */
-	err = btusb_mtk_submit_wmt_recv_urb(hdev);
-	if (err < 0)
-		return err;
-
 	/* Send the WMT command and wait until the WMT event returns */
 	hlen = sizeof(*hdr) + wmt_params->dlen;
 	if (hlen > 255)
@@ -3321,6 +3316,11 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 		goto err_free_wc;
 	}
 
+	/* Submit control IN URB on demand to process the WMT event */
+	err = btusb_mtk_submit_wmt_recv_urb(hdev);
+	if (err < 0)
+		return err;
+
 	/* The vendor specific WMT commands are all answered by a vendor
 	 * specific event and will have the Command Status or Command
 	 * Complete as with usual HCI command flow control.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
