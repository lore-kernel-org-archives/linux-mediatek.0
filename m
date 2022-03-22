Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60539C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 23:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ehcTDka5A/V5zlOR9mTAQu8xdQduZZ3wWR0YaSAoP7o=; b=Z3sdS1BFJtOsHR
	zkxZ26hC12oRm+rWtq72xAnngASZhFj6tJXfiJQ8q8gNcphwTlBNtViH+WK9UrJAk36OPRxhzItH7
	Gi09QEb5a3OpmYKB1/DwAEFZqHbnW0FXbPKyN358wr7M5HIDdlZ9ZesgONMKU33FOrUyAOc303a1P
	9hP6Z7pRiLGgK0zPcl5pBT3vZapljcR6OddnlCOGdaoIpwIBjAYR35vbAX82B2CBKpNCMoGMvggOl
	pfZrBESU89m8L4RPYt9OjGZTq32QPRVrUAY72cPqxJe+n7Y76gCwJs4tgR+1zB/bGIn5eaMmjPEOn
	xShs+4h+EnY3gWogLPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWnxx-00CR6I-In; Tue, 22 Mar 2022 23:31:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWnxt-00CR4u-H2
 for linux-mediatek@lists.infradead.org; Tue, 22 Mar 2022 23:31:04 +0000
X-UUID: 9ed809dcd35245408d801d84750bd4f3-20220322
X-UUID: 9ed809dcd35245408d801d84750bd4f3-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128261628; Tue, 22 Mar 2022 16:30:57 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 16:30:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Mar 2022 07:30:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 07:30:41 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>, 
 <shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yake
 Yang" <yake.yang@mediatek.com>
Subject: [PATCH] Bluetooth: mt7921s: Fix the incorrect pointer check
Date: Wed, 23 Mar 2022 07:30:40 +0800
Message-ID: <5d56b2a23e6e793c64ed98890329ce1beb010ce0.1647991506.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_163101_594898_693723A4 
X-CRM114-Status: GOOD (  11.87  )
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

Fix the incorrect pointer check on ven_data.

Fixes: f41b91fa1783 ("Bluetooth: mt7921s: Add .btmtk_get_codec_config_data")
Co-developed-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index f3dc5881fff7..b6d77e04240c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -961,7 +961,7 @@ static int btmtksdio_get_codec_config_data(struct hci_dev *hdev,
 	}
 
 	*ven_data = kmalloc(sizeof(__u8), GFP_KERNEL);
-	if (!ven_data) {
+	if (!*ven_data) {
 		err = -ENOMEM;
 		goto error;
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
