Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF0C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKjKCz6MWko6tQGKhAEekON+68KMgjRQz4EtM95IYls=; b=EuE8bZ4sEYOP0fhsuSMdbZKAhw
	Xtl+9vJQE6FeCUZfsTUifIRfhF3ZavXWvc7TvjK7yl4BC6ouI0schgubKmIBlzA2pJcgcTIiJKeK6
	+j4+J+V9jvkejWdtrTGEJtFk+KfMAiElnwnR7iqjnjxepIGDj/VCFqqLluHkDw6B/NmZxfkMh9I0P
	CGyhGzgG1reRFfS6fQB6YEA8cHnlRx5BVGe6pG6x0okDFgvcONyGin4e9WW+N2e9+DeLqhv4W2C9Q
	vLTP6Iuk9m9Wci92gSgk9B4uC72BSIj6cf5qTx4DSH/ExwTSZvF2CpKgiQpfhzNezqT2np8tUxiXi
	VZYHq5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBWp-00000009Zfs-19Sr;
	Thu, 06 Jun 2024 11:43:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBWl-00000009ZeT-47zm
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 11:43:33 +0000
X-UUID: fdb0acc823f911efaf04eb0598667787-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LKjKCz6MWko6tQGKhAEekON+68KMgjRQz4EtM95IYls=;
	b=RgbthJy/nW5FOn4xqiMRzLTBUw+EERs6rpYKRRroiHGvd9TH/Y/2wDp0RCOyzmpGKtnNbIpAl5pTBJ7zQz9vxnJUhoWPNes+Tg98sNme1pddDWY7QhfNp4kYq0oictJGZQKSITlMzaSzAv1e1Jkouswkd2d74V5jezlXuoYgTP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:00225681-faa7-4e67-a906-dfa54f9a7075,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:53e2b193-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fdb0acc823f911efaf04eb0598667787-20240606
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1051694478; Thu, 06 Jun 2024 04:43:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 19:43:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 19:43:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v4 3/4] Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
Date: Thu, 6 Jun 2024 19:43:20 +0800
Message-ID: <20240606114321.30515-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606114321.30515-1-chris.lu@mediatek.com>
References: <20240606114321.30515-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_044332_064959_3E868741 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define a enumeration to store MediaTek specific flags and
macro function to set/test/clear the flags in data structure.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtk.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index e76b8a358be8..6a0697a22b16 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -128,6 +128,10 @@ struct btmtk_hci_wmt_params {
 
 typedef int (*btmtk_reset_sync_func_t)(struct hci_dev *, void *);
 
+enum {
+	__BTMTK_NUM_FLAGS,
+};
+
 struct btmtk_coredump_info {
 	const char *driver_name;
 	u32 fw_version;
@@ -136,11 +140,30 @@ struct btmtk_coredump_info {
 };
 
 struct btmediatek_data {
+	DECLARE_BITMAP(flags, __BTMTK_NUM_FLAGS);
+
 	u32 dev_id;
 	btmtk_reset_sync_func_t reset_sync;
 	struct btmtk_coredump_info cd_info;
 };
 
+#define btmtk_set_flag(hdev, nr)						\
+	do {									\
+		struct btmediatek_data *mediatek = hci_get_priv((hdev));	\
+		set_bit((nr), mediatek->flags);					\
+	} while (0)
+
+#define btmtk_clear_flag(hdev, nr)						\
+	do {									\
+		struct btmediatek_data *mediatek = hci_get_priv((hdev));	\
+		clear_bit((nr), mediatek->flags);				\
+	} while (0)
+
+#define btmtk_get_flag(hdev)							\
+	(((struct btmediatek_data *)hci_get_priv(hdev))->flags)
+
+#define btmtk_test_flag(hdev, nr)	test_bit((nr), btmtk_get_flag(hdev))
+
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
-- 
2.18.0


