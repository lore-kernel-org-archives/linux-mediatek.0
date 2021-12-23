Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E659EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 02:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOBqEzjzQjCvfAxsdeTjdugwGZd6ZBluLwHeW9exm3A=; b=1ptp/JppqS2zSa
	ogQCrZHptdOUaltNg986zwUgjEvMNukN+B/kDG/hU+QOP+6zkdS+2LsWyV0NQ6KxgLy2au/+mzD+X
	DBbGP9n9gOaAYmag6L6czLuU9G0Qoo/EjHhWtgYNstiAFpRhiE536nq4QOtRIEc9fWqMzdPaRhGq9
	cQG9V/SLZmwnnA7fAveiuiNglSiuav0xbDJmL8pkvKFMiwxjSU+P+X6dJ1n5FFbQrHo2CeOA6mMa+
	U8MEcvCkM5iEdnr1Kk80+HBNqTo3TsvVAbBXdfnlAh0g8Cj1Y4EfH2lUYz1C7xGj1UcYWYlk5vQTz
	UNhU6Ji7nfthE1QsaAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0EIt-00Bmne-0B; Thu, 23 Dec 2021 02:58:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0EIq-00Bmmb-SC
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 02:58:02 +0000
X-UUID: b9c1fbefab5745daa62ac6f29e267dbd-20211222
X-UUID: b9c1fbefab5745daa62ac6f29e267dbd-20211222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 59459212; Wed, 22 Dec 2021 19:57:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Dec 2021 18:56:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 23 Dec 2021 10:56:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Dec 2021 10:56:15 +0800
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
Subject: [PATCH v3 3/3] Bluetooth: btmtksdio: move struct reg_read_cmd to
 common file
Date: Thu, 23 Dec 2021 10:56:09 +0800
Message-ID: <89332d124e194aebce13e7a1efdd9fd38c493550.1640165092.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
References: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_185800_941340_A93CF10F 
X-CRM114-Status: GOOD (  11.06  )
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
v2, v3: no change
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
index 322a4367f0f6..4ef4fe263bbc 100644
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
