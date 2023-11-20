Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED101C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p0WpiZm2A8NelwUk+rR7V+ehCKom9sKbqRbQbLPWBY=; b=XJLUeUAg/JP2f2MRVzsXpPo+Qg
	wfYrs4xXCtFRxGsiVqb0r23Lo4Fk4BFskaCsRtoIn9VwHjYyLdR1+2zpYKpbw1J9cUqiiaFzQAfQ2
	ZZgHws5oZYBIaaq9f4BfhGBNDLLMj9S3tMcQbAVF4sRGAn6ruYGsNAAZqFX3YSaSzSDWRHfGRKLw5
	mXtuGUCIbxvQENUILBGBtt58iGhP5sqOIMcStP7lxRCFk5KubSGm5JzqYFhgIunlb6A/wfJxMBj9k
	g2Nok0GY01lNmLVcaNmdHqaM7JpernNN5XWrzXnQ0Ph5ecJToYZpJKUk7Ca6mY2IlTP7mNz1Yuffq
	mfWuLiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r52N5-00Btjg-2U;
	Mon, 20 Nov 2023 11:23:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r52Mf-00BtfM-2x
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 11:23:17 +0000
X-UUID: 22da783a879711ee86758d4a7c00f3a0-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+p0WpiZm2A8NelwUk+rR7V+ehCKom9sKbqRbQbLPWBY=;
	b=SgdEb5XrNsQmNUZZCKD3RYItoyj2XcesjZfjqqEMwPDyLFOvygP6B9GOgv+RVezuuv3ZkCmTy+70xWvuSz2NXTCpsEUrmYsPbCdJdonF4f7NPXSVa5DabdyHt1rbMldmRYbUOv02SyTedwf9KuaikEh0ZeZS2dwX4zqPimjy5kQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7fcb4c6f-d718-4ee9-9e06-ab351bf2af98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:bc9ebcfc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 22da783a879711ee86758d4a7c00f3a0-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1038763251; Mon, 20 Nov 2023 04:22:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 19:12:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 19:12:14 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7921: fix country count limitation for CLC
Date: Mon, 20 Nov 2023 19:12:10 +0800
Message-ID: <20231120111212.4478-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
References: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_032254_041821_1642FEB6 
X-CRM114-Status: GOOD (  11.74  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Due to the increase in the number of power tables on CLC, the variable
nr_country is no longer sufficient to represent the total quantity.
Therefore, we have switched to calculating the length of clc buf to
obtain the correct power table. Additionally, the version number has
been incremented to 1.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

v2:
 - Convert type of buf_len from "__le16" to "u16"

---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 753a4fc45c70..e4edea1ab3dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1264,6 +1264,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		u8 mtcl_conf;
 		u8 rsvd[62];
 	} __packed req = {
+		.ver = 1,
 		.idx = idx,
 		.env = env_cap,
 		.env_6g = dev->phy.power_type,
@@ -1271,7 +1272,8 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
 	};
 	int ret, valid_cnt = 0;
-	u8 i, *pos;
+	u16 buf_len = 0;
+	u8 *pos;
 
 	if (!clc)
 		return 0;
@@ -1281,12 +1283,15 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	if (mt76_find_power_limits_node(&dev->mt76))
 		req.cap |= CLC_CAP_DTS_EN;
 
+	buf_len = le16_to_cpu(clc->len) - sizeof(*clc);
 	pos = clc->data;
-	for (i = 0; i < clc->nr_country; i++) {
+	while (buf_len > 16) {
 		struct mt7921_clc_rule *rule = (struct mt7921_clc_rule *)pos;
 		u16 len = le16_to_cpu(rule->len);
+		u16 offset = len + sizeof(*rule);
 
-		pos += len + sizeof(*rule);
+		pos += offset;
+		buf_len -= offset;
 		if (rule->alpha2[0] != alpha2[0] ||
 		    rule->alpha2[1] != alpha2[1])
 			continue;
-- 
2.18.0


