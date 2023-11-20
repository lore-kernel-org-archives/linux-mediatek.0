Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDCBC197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQxfV4jO6ePUHsnT7XPjjP6N7wmLBNar3vK44FxCzRk=; b=Qts6DzqWi8vEY6C/B4tf6H45/C
	ywcdC0bEDivxFYL11AeXLj8sFyafyEjTH25xYXO8W59vN8s7Micdx0Gev2MJ08FYMRsxH6ihHuld1
	1N8Ti7SmTLwIazzRgeiP7mHp2emo3Lx8wR/D+O7Clxrc843wh2yodLxc82ElxHIvfYGdSrYdJ9VHP
	16Kl7oJ+yDm0DECqfQAq6vGWNCbSmm0/ZbMRnyV3Zs5lNV29muoZHYVqfTaWzyievG5G+RXRdql1c
	8y6WwbVuLmp434A1JFj0aPLL35911xaoLPqaVSF6hY8WZ81V/hVWIF/m+OHW5Zr3ZwjFBHE8yeMHP
	wkqD7UWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r53sm-00C3wK-20;
	Mon, 20 Nov 2023 13:00:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r53sZ-00C3uZ-1U
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 13:00:07 +0000
X-UUID: b09c1d9c87a411ee9b7791016c24628a-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dQxfV4jO6ePUHsnT7XPjjP6N7wmLBNar3vK44FxCzRk=;
	b=gG7XFOosyGmoQcO1bMG/iKdDKPAPs8Fc1EEILOCkXounJwaPWJkti8SFRK04wCd9Qinp5fBb6/JGBe9XJrtPwCBVoXL2OAPn4R56dIy0gqZ+KDtmJe4M7PuBnpB2k1YkcsSHvzPyplWOm25DNiEphPE081aDygupQ0RoxeJQOCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:65a4367f-d037-406f-b42b-172b2d7516d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:0628dc72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b09c1d9c87a411ee9b7791016c24628a-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 402887313; Mon, 20 Nov 2023 05:59:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 20:39:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 20:39:46 +0800
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
Subject: [PATCH v3 1/3] wifi: mt76: mt7921: fix country count limitation for CLC
Date: Mon, 20 Nov 2023 20:39:38 +0800
Message-ID: <20231120123940.5788-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231120123940.5788-1-mingyen.hsieh@mediatek.com>
References: <20231120123940.5788-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.822100-8.000000
X-TMASE-MatchedRID: zfURmU8ZpfHhF8fPoBwQ4Eg5Iem1vm3HEjUQ5RU6WJKctWHPLT5Fff/v
	iojdMcFdjBmhBLd6Ukoug5h4T/oO1R1YpEPWJiyzuTzanbzb2FdNfj9Qwj2ifVxOQqP2lG9go8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgjMejjvPkBr4Oct/PJ9l2ogToywNhINescFtg7YF5bTviY6
	CZjKIlg6TDmahaxtMqWHFJjGhOqKpumnS3/t4RXKlH6V73nngOnuL8Gnx9ALN5lSmbrC6fdtr/T
	o2FgNrjDLMIOOVTHz2nbLeYgH6K31Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.822100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C04D2D3096E42D5C88866C5FABD927ABA518B963E3949FF4A0F820632C9DFBC12000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_045955_553931_51A05EF7 
X-CRM114-Status: GOOD (  11.34  )
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
  - Convert type of buf_len from "__le16" to "u16".

---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 753a4fc45c70..36ac004e1ec9 100644
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


