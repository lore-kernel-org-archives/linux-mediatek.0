Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C4CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 03:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDmDb8k9ZJ+VszMvw0wkSIItrR8bziUh9Il7lMmx2CE=; b=aaBqLjD9+Kq4R4
	DBLF6hpCkiMdj9fVCSi1tc5+db93LpT6Vs23NCGufBiFukbe56Sbc+hjg9K+M9ixnsCY8zu6MHJed
	TstQZ9E6mvIGcvkR1TTeMJYp0GDDUQGvKjxunY6Tz+Mm5DbPejnIkBRal146OCy4DNLmN78hrsmKR
	82JRamVwqbz0veg98drGR84He50RLDvtuCbLLJLpp5nUtteUSSATviZHNPIyBzNp+rWTomy+XPXfd
	i6otowZJo/5WDO2fYddzN7jxnWE+Ti6ORuIw1BVH197caZY9zIF2kDON6bhiWftWXLSSBS1qSXDU3
	q8pASca7bjwsTPIIateA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzs2w-00942w-94; Wed, 22 Dec 2021 03:12:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzs2r-00940l-Qc
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 03:12:04 +0000
X-UUID: 25a0d158511a45f6b2f1d9db2853ce38-20211221
X-UUID: 25a0d158511a45f6b2f1d9db2853ce38-20211221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 798225814; Tue, 21 Dec 2021 20:11:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 19:11:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 22 Dec 2021 11:11:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Dec 2021 11:11:53 +0800
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
Subject: [PATCH v2 3/3] Bluetooth: btmtksdio: move struct reg_read_cmd to
 common file
Date: Wed, 22 Dec 2021 11:11:47 +0800
Message-ID: <7fea13fab5a203ed4f373ec250fd4426cb8afff1.1640141813.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
References: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_191201_898040_271A1FCD 
X-CRM114-Status: GOOD (  11.58  )
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

move struct reg_read_cmd to btmtk.h to allow other mtk drivers refer to.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: no change
---
 drivers/bluetooth/btmtk.h     | 7 +++++++
 drivers/bluetooth/btmtksdio.c | 7 +------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index fc57ef09d132..fb76d9765ce0 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -87,6 +87,13 @@ struct btmtk_sco {
 	u8 channel_select_config;
 } __packed;
 
+struct reg_read_cmd {
+	u8 type;
+	u8 rsv;
+	u8 num;
+	__le32 addr;
+} __packed;
+
 struct reg_write_cmd {
 	u8 type;
 	u8 rsv;
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c9120bd755d3..3f6b3f84077a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -800,12 +800,7 @@ static int mt79xx_setup(struct hci_dev *hdev, const char *fwname)
 static int btsdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 {
 	struct btmtk_hci_wmt_params wmt_params;
-	struct reg_read_cmd {
-		u8 type;
-		u8 rsv;
-		u8 num;
-		__le32 addr;
-	} __packed reg_read = {
+	struct reg_read_cmd reg_read = {
 		.type = 1,
 		.num = 1,
 	};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
