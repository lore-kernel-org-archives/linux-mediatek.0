Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D41EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7U3K5BetsMaXVC+c3t7ld6KY1jelscWxbnMwrO5o6g=; b=B2k216FyRNV8Zm95EtvaiWY4PE
	4ZmkB6H6cqRmTxGY8jXTwFclF5OwUbIL07lTnfU8Wx0N4t1ic7vKEdMGh2hcly5RjIAVJIeaV0/NR
	yDnTwm4ZVZhe+OR8ERueuway3Ds0Rx47oEvuaoRsqglWAImsrAL2nPR6UPJ1a0lnnfPUO0klutj7B
	/aUSHZDbS0GtXXJOVkpqVXDzPgnGlzA1d4yFMX26cVnpyNbm3Bq6ywZF074uKoKO0UoqXwhYRhdyu
	eXTkNC+Np0hb17mXOJTXaiLznHaJr0qxTL5ZsWypY0cikB3xe7JNspPZ1EInky7sg3vw+QonlAYz9
	2PqSFCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYJn-00DCmL-9P; Mon, 31 Oct 2022 17:11:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opYJl-00DCla-9p
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 17:11:22 +0000
X-UUID: 2b1bfec49ac74ffb8dde8f1b9bbd4530-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t7U3K5BetsMaXVC+c3t7ld6KY1jelscWxbnMwrO5o6g=;
	b=gUiC40M92GC50SdI7Sxm0W03/LspmoVU7OXYU3QACfZqWRsCZsWI/vmzdp2eXYhCMUWmzalcsCwG1uNrJKGkwF1F7srVJFMoPXt2R1zXxpQuILFlS5EjPaqJ+h2E9Pyq+l8Tff7/eyQiVF7QX7BIhPZGvxERoRaJpzxMS5N3igI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:74b6bd5b-cf7f-43ce-ba83-2ea3dbba4b97,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:f6542490-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2b1bfec49ac74ffb8dde8f1b9bbd4530-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 273865293; Mon, 31 Oct 2022 10:11:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 00:40:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:12 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 06/10] wifi: mt76: connac: introduce unified event table
Date: Tue, 1 Nov 2022 00:39:56 +0800
Message-ID: <20221031164000.17063-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_101121_362501_B2CEE3E3 
X-CRM114-Status: UNSURE (   7.94  )
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

Add event IDs and related bit fields for unified event support.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 7f97d4b70e95..909b2ba67c11 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -993,6 +993,17 @@ enum {
 	MCU_EXT_EVENT_MURU_CTRL = 0x9f,
 };
 
+/* unified event table */
+enum {
+	MCU_UNI_EVENT_RESULT = 0x01,
+	MCU_UNI_EVENT_FW_LOG_2_HOST = 0x04,
+	MCU_UNI_EVENT_IE_COUNTDOWN = 0x09,
+	MCU_UNI_EVENT_RDD_REPORT = 0x11,
+};
+
+#define MCU_UNI_CMD_EVENT			BIT(1)
+#define MCU_UNI_CMD_UNSOLICITED_EVENT		BIT(2)
+
 enum {
 	MCU_Q_QUERY,
 	MCU_Q_SET,
-- 
2.25.1


