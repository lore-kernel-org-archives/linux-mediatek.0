Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AD7C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 04:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3Na9qwd7540dOdP5z5gJIwHoh/0qkxTTF1GjdKpjf0=; b=E4eZeMFd3vfvDZ28/rVIxdOhYn
	zBYz143mGXHpLyh8mz0N6FVqqeGhN0GdCBUtJ6ZLTfT2AYwWJapM2CNbwRmoAlnPQp+8yp8SudBBU
	RFIkaJk4eLjAfv21EXdFT36kj3c+/C5gXcePu0uKYoa/WAP95JSSaZ6JzkrNkvUMKextd2d19LsPn
	hQgLVRgIv9WTzVoyz6WFXAV9frQrEGuXPY8OQ3/91i7cTKkEmOgMfmiA5xtnCM0DhF5Bn+YsynmWD
	PQcaEZBC7wp9gP8EpuppIir54ji8UQlt4Mkjjete/IFeou4T6hPhHzsk2B+gOx3DQp4najzYO+eLh
	Z3ElXNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzUvS-00Bows-38;
	Thu, 18 May 2023 04:07:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzUvP-00BovY-2z;
	Thu, 18 May 2023 04:07:37 +0000
X-UUID: 80841502f53111ed83ed1395ce914268-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y3Na9qwd7540dOdP5z5gJIwHoh/0qkxTTF1GjdKpjf0=;
	b=niwCexI6WupKrfdkVkUdmy3Y2dSXkoHYOIOPxrB9pPAmBuqJxlJL7I+PFKr21FcJr/AUnF+jQjTDgxWgVL+rxLySBV52D0/qdAYeUdDAtJ5eUQbhnj5lPes+StFJ1cjKzacobEhLJaGpFaoHtI9SvIf8CXFIT2eQ0yuYC8i3vQo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:fc129840-fa4d-4edd-bd27-730dea2c0bdc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:82b48b3b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 80841502f53111ed83ed1395ce914268-20230517
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <sen.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1443563094; Wed, 17 May 2023 21:07:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 May 2023 12:06:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 12:06:49 +0800
From: Sen Chu <sen.chu@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Sen Chu <sen.chu@mediatek.com>
Subject: [PATCH v2] regulator: mt6359: add read check for PMIC MT6359
Date: Thu, 18 May 2023 12:06:46 +0800
Message-ID: <20230518040646.8730-1-sen.chu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_210736_107853_21AE98E2 
X-CRM114-Status: GOOD (  12.37  )
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

Add hardware version read check for PMIC MT6359

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
---
Change in v1:
    Fix: this should be if (ret)
    [Sen Chu <sen.chu@mediatek.com>]
---
---
 drivers/regulator/mt6359-regulator.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 1849566784ab..3eb86ec21d08 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -951,9 +951,12 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	struct mt6359_regulator_info *mt6359_info;
-	int i, hw_ver;
+	int i, hw_ver, ret;
+
+	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
+	if (ret)
+		return ret;
 
-	regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
 	if (hw_ver >= MT6359P_CHIP_VER)
 		mt6359_info = mt6359p_regulators;
 	else
-- 
2.18.0


