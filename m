Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850BBC43217
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 19:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSzzmYQJXJX85+9Zq6OcE8jFwEaO/OVdbr/pnnuxM+0=; b=XNptsjlWkNV8Zo
	smRtGxbOqH5byzfI1SE2KcyKWfCCwRCOQDNYkYvPg+B3A+bwd6yBrIxJ6+rQMXiH4ruhgWGdMVkPg
	S+3Nf60WIiUTf+yFNJt5D+a0CaSG0XYLeGdnPJ28UkYmpVY8ZKQiyzcTrW8A+Sxa92vMiprqZR1PB
	BeuBB+7wL6m9OrOxLI07ebVXfGyvTAEo3Zenvq8YDt2iDQvTkFfPghyQCqZCWB0k6s7HXKtqD0muv
	EL+QmaJJj84Ttrjv3UODwSLdwv5RhNgQnKOW5Olc7/pI2glrzOuWKaDWCVO0KujwbgGoApL8fBxDQ
	WCZznc9jGJZHArDpFlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dnu-008IR3-Rv; Sun, 09 Jan 2022 19:24:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dns-008IPz-Ga
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 19:24:33 +0000
X-UUID: 290cdcd40c9a4f8d9a5fafe465023e2b-20220109
X-UUID: 290cdcd40c9a4f8d9a5fafe465023e2b-20220109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1476497859; Sun, 09 Jan 2022 12:24:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 11:24:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 03:24:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 03:24:27 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/5] Bluetooth: btmtksdio: clean up inconsistent error
 message in btmtksdio_mtk_reg_read
Date: Mon, 10 Jan 2022 03:24:01 +0800
Message-ID: <7a5491bd4192cbd7423c8769641df9045a565ad4.1641755121.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
References: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_112432_628921_EEAD9E38 
X-CRM114-Status: GOOD (  10.94  )
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

Have "..reg (%d)" to be consistent with the other similar error messages.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v5: new created to make the series better
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d82ba9d71fb8..25fb9c79b1f4 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -816,7 +816,7 @@ static int btmtksdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 
 	err = mtk_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
-		bt_dev_err(hdev, "Failed to read reg(%d)", err);
+		bt_dev_err(hdev, "Failed to read reg (%d)", err);
 		return err;
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
