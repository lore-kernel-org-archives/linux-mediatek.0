Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015F8C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSWtu7QGZlDy2U9rpLeluhtBrJ5IhbOXU4hBNtyp7lE=; b=x/663FbCRsh7EjCuSiDoBcWxUg
	KTAhYYBHnbAQ46wEMZRFjEETeqENTuTPljQKyQP/D100MEWpc8Xs7uakfYgV0FJRVcVD6mZALb97W
	++p+c9derX9BxTUkWfO6xuMqcIfUxU6VMQedgH7KHrJWOTi6Sx/kpqY0WjfUQRP6K9LYhAJc+YmNa
	e7lOLnN5s+7PoYg2JPWgCZVsXFr1ksVHAQl0RoEtyhMsZK3gnggvRgoKk8soNT2WDrWHSgYYQAAp6
	SiPkOpaeAgvwHkGz1whXrRWT1K4HfvF98EEPzgysVa196rm2d2B4/AKbVMh3bNtrZ1Uq6HTwL/yor
	KvbCTmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsmG-00Gj35-34;
	Wed, 20 Dec 2023 09:22:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsmF-00Gj18-0T
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 09:22:08 +0000
X-UUID: 375ae1489f1911ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uSWtu7QGZlDy2U9rpLeluhtBrJ5IhbOXU4hBNtyp7lE=;
	b=tlL76cFczcSxEsgED4EO+ieAL/VqlziSVII3RfjslOAveYFlVMaboyH6f25ZUTaWCwzgEJoP2uzkQQIRuIxIHjpWc8/wfDy4QPLEt1c69WJ46p8adzutlT5n0bzQP8yKk1mu1sFl1dupFjQaAimW4xBOt9Qjngx85sWmfKxayh0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:f5431b17-724e-4754-9863-3935748956b4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:da08fa81-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 375ae1489f1911ee958cff29c719f35b-20231220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 373029811; Wed, 20 Dec 2023 02:21:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 17:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 17:21:44 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH 3/4] wifi: mt76: mt792x: fix a potential loading failure of the 6Ghz channel config from ACPI
Date: Wed, 20 Dec 2023 17:21:37 +0800
Message-ID: <20231220092138.12830-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
References: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.013300-8.000000
X-TMASE-MatchedRID: PwZ81m9fkLbZK1rQqyNiGR3EEAbn+GRbI9yVcHNDU7a5ZjHyzYrpGt6M
	yUV+2+DZ+tt/G7x8wM7kQHSm+HqcuqPzznyWrbXqQpxiLlDD9FV9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO0gCYMnfcK3PF5UWE0xOO8BLkvWsDkhjDg8nmtjrcR7Xbvmmn0nKMw9bk8+unopmQA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.013300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 33029EDED434522F11257E9B5B4B8735E34F5EACBA369F0BEA4EE4EB05AC578E2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_012207_188388_A1CE2E44 
X-CRM114-Status: GOOD (  12.20  )
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

In some case, the MTCL table will exist, but MTDS table will not.
So the SAR will init fail. This patch make MTCL and MTDS can exist
with no dependence.

Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index e7afea87e82e..8fee3d481df0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -66,13 +66,15 @@ mt792x_acpi_read(struct mt792x_dev *dev, u8 *method, u8 **tbl, u32 *len)
 }
 
 /* MTCL : Country List Table for 6G band */
-static void
+static int
 mt792x_asar_acpi_read_mtcl(struct mt792x_dev *dev, u8 **table, u8 *version)
 {
-	if (mt792x_acpi_read(dev, MT792x_ACPI_MTCL, table, NULL) < 0)
-		*version = 1;
-	else
-		*version = 2;
+	int ret;
+
+	*version = ((ret = mt792x_acpi_read(dev, MT792x_ACPI_MTCL, table, NULL)) < 0)
+		   ? 1 : 2;
+
+	return ret;
 }
 
 /* MTDS : Dynamic SAR Power Table */
@@ -166,16 +168,16 @@ int mt792x_init_acpi_sar(struct mt792x_dev *dev)
 	if (!asar)
 		return -ENOMEM;
 
-	mt792x_asar_acpi_read_mtcl(dev, (u8 **)&asar->countrylist, &asar->ver);
+	ret = mt792x_asar_acpi_read_mtcl(dev, (u8 **)&asar->countrylist, &asar->ver);
+	if (ret) {
+		devm_kfree(dev->mt76.dev, asar->countrylist);
+		asar->countrylist = NULL;
+	}
 
-	/* MTDS is mandatory. Return error if table is invalid */
 	ret = mt792x_asar_acpi_read_mtds(dev, (u8 **)&asar->dyn, asar->ver);
 	if (ret) {
 		devm_kfree(dev->mt76.dev, asar->dyn);
-		devm_kfree(dev->mt76.dev, asar->countrylist);
-		devm_kfree(dev->mt76.dev, asar);
-
-		return ret;
+		asar->dyn = NULL;
 	}
 
 	/* MTGS is optional */
@@ -290,7 +292,7 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
 	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
 	int i;
 
-	if (!phy->acpisar)
+	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
 		return 0;
 
 	/* When ACPI SAR enabled in HW, we should apply rules for .frp
-- 
2.18.0


