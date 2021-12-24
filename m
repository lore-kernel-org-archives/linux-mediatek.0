Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0880C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WwVX4SRUvRhCqAkZw3SJDSRVMdF2nM8Vu7ikXfCuy4=; b=47oQxU16WTz+na
	Kodx7F+1EvO69J/l3xECtBlEJvOuv/bBPu/EZRauOByleJ0ULHLiNZfdHsbdfgVbtLJv6/cwYRbjU
	v1IxjWH+Hw0GFzMLAEeEIBdt1Dwqi+aTqPM1Ev6wsIg2EZjhoV+5h6ZtHfIqKSenX2OqBoAw1s9tT
	hhp3JZhNKIakzSNnIs4leuOCGsoyYbpI9F0INdKF3hkc6h7va1CcPOBObeRczvelBo7UCDRirQ8tW
	nckO7hThQJZ2pjwN61d/ILf5zFfOhMF0+8Tf25d7JbJX8Jeh7Ue0PyxsYLC98T1+XaXYFjw2FAppa
	FpVq3rBfH6fXN5gvXxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0g24-00Dw8Q-6c; Fri, 24 Dec 2021 08:34:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0g21-00Dw6z-E6
 for linux-mediatek@lists.infradead.org; Fri, 24 Dec 2021 08:34:30 +0000
X-UUID: e26427f5b24d4476ba472a195afbedde-20211224
X-UUID: e26427f5b24d4476ba472a195afbedde-20211224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 944129709; Fri, 24 Dec 2021 01:34:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 00:26:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 24 Dec 2021 16:26:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Dec 2021 16:26:16 +0800
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
Subject: [PATCH v4 3/3] Bluetooth: btmtksdio: move struct reg_read_cmd to
 common file
Date: Fri, 24 Dec 2021 16:26:02 +0800
Message-ID: <068921e3eecab99a66fdf949a2597d4fded0c223.1640334021.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <91dfa736b7629cdb94bd2029f05717eeae77b07d.1640334021.git.sean.wang@kernel.org>
References: <91dfa736b7629cdb94bd2029f05717eeae77b07d.1640334021.git.sean.wang@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_003429_513000_B91A51A0 
X-CRM114-Status: GOOD (  11.28  )
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
v2, v3 and v4: no change
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
index f6fb82b317de..92371be9f4b2 100644
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
