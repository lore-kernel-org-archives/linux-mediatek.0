Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB26C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 19:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rmUx+Q8qlFwxl+5Rm/kol4BuxJO8hyCXLV9077vTx0=; b=wa/Bt6fQdYvm2Y
	0czOTABpA1OblHsFba+RjrhxHMMiwzecoEK2PgYCsJX0+TxISarTGk1CQSC+k1wK+h1YlhKRaX5M/
	SR+7g64yi7cyr0IwKUpxeg+2Bshxo5SRRRacYVKmeySi3uVVjqdH4tTogMizqQkWv1/2H3Zu1mlAH
	UWvINqGSCRBpelmpcwXTWNrTBJCA6rKikZmhR+PSsGZzh3jEGLW/7d3LAt4iqEc7SfS+ZL5iLbk8j
	0gJiuCPPiFziL9XLg1DAXbDOTnojwdOBNEnZU9inkdHKL/YB5Hqwbwt5rlUJVr6LKrYgs9PB504mC
	L57YX3QRspDg1SrngELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dnu-008IQf-2D; Sun, 09 Jan 2022 19:24:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dnr-008IPh-SO
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 19:24:33 +0000
X-UUID: a0efa738aede4cf086fa707bba05c0bf-20220109
X-UUID: a0efa738aede4cf086fa707bba05c0bf-20220109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2032945943; Sun, 09 Jan 2022 12:24:28 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 11:24:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 03:24:25 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 03:24:25 +0800
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
Subject: [PATCH v5 4/5] Bluetooth: btmtksdio: move struct reg_read_cmd to
 common file
Date: Mon, 10 Jan 2022 03:24:00 +0800
Message-ID: <295c786cf0bd42433aede61195ebd35c78fa4a09.1641755121.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
References: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_112431_945830_011AAEC6 
X-CRM114-Status: GOOD (  11.33  )
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
v2, v3, v4 and v5: no change
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
index a41b5f65e7a9..d82ba9d71fb8 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -800,12 +800,7 @@ static int mt79xx_setup(struct hci_dev *hdev, const char *fwname)
 static int btmtksdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
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
