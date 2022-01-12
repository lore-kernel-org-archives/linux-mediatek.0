Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akOQflKV6pln7yyN5XSPwaVT6KmcLAAq3DIrWUOL+iw=; b=iqn7ufwvaZQH9k
	fnc1JpefP0E84xpc8X18V6EH7nlZo5YGvswNEiSxrxnlZrrj91fIPE8fPC7QKTu8fxzmVgtgjI0oY
	J4XeKFGlyPUAxV9zt+yfY+EyIj9JlEumI7+S4OSgPpW0ZoqJNJCkIEjV373R/0KJWVx1q1+HLvpDk
	Upl6vjq5rugDKnY1fKSQ54A5Q7dzMXlssLrottBZWM6Smh1HDaQfCTciI+aRllmbLqqKvRDZMHmFa
	93BABx0YYQDi/KOTqOiw21Ul0v9LGq0u+jVRQ/EkkgiED/jVDom46LNxFuNJPtEdExPeCmIO8aRho
	h+unp37U7SMpCYiKE1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7YGz-001PhB-QQ; Wed, 12 Jan 2022 07:42:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7YGv-001Pg9-8i
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:42:18 +0000
X-UUID: 21ea71a2a0914e11a50b87e30f370c36-20220112
X-UUID: 21ea71a2a0914e11a50b87e30f370c36-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 692476004; Wed, 12 Jan 2022 00:42:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 23:39:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 15:39:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 15:39:27 +0800
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
Subject: [PATCH 6/7] Bluetooth: btmtksdio: run sleep mode by default
Date: Wed, 12 Jan 2022 15:39:16 +0800
Message-ID: <ed300b791b317f8ee20e22071e0fdcf82656f359.1641972745.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
References: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_234217_333244_40B4065D 
X-CRM114-Status: GOOD (  10.99  )
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

Apply sleep mode by default and a smaller idle time to reduce power
consumption further.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 3e8f19556e2c..491f029452ca 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -31,9 +31,9 @@
 
 #define VERSION "0.1"
 
-#define MTKBTSDIO_AUTOSUSPEND_DELAY	8000
+#define MTKBTSDIO_AUTOSUSPEND_DELAY	1000
 
-static bool enable_autosuspend;
+static bool enable_autosuspend = true;
 
 struct btmtksdio_data {
 	const char *fwname;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
