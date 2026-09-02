Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A0C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=jZnre+AorjIuW5BvSP+VsZR4u1
	VA1IlzyaUvzcW4BGZMkOmJKqPtD5bctBxKLe8jkuGWarmZpcJ2Ip149B6n9rc0rjngNAePjZdrnXY
	qKH4mGHc6XIG3LzVQR5RrCat/TZFYm0YaLZCJtzfZ7OkjlkT7ArOiptyk13EGGvKp1OrOpHVJV+7P
	hdnXZ78RVM5Wh1HjIj1tKOItv4o/pHc1L14rcdmPxouhHFlsmnlVT1ZtHERooPT7J5b8DKemg2JJm
	hzEmCuLUaaX8gmSJbtyHwHXyD/eHqKd+7rqMUzBQ1YUWVy6Zql5YbBhEs4VRB7nYmjJuBKnwbUkz5
	OGxAt2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkH-0000000Fjcr-2VDp;
	Wed, 02 Sep 2026 19:35:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkC-0000000FjYG-2cMW
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:35:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1129324f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377735; x=1788982535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=AAOgLrlJXUdzaefS614IekAGi3G7LfeJkVNP5LRGdXwumzFm62YV8LGH9rcWPy4PH2
         5gpydaSj/cnMH4/YsWGLiveP4HVxLwZ3lF7sra7XywERB97jmBASZ1Bw5e73nDntUdfq
         nt7D5opyGRssmqqyIm/6MLh2QJSL2ia8S1b/RDHroWa+HpPAf5+H8Qr4uXA9KpyPuUIK
         ZSDqRSBpwVcjW21DQKwiU78CcmC4CRHgcD1kTSKgTaJ+O8bMmv3qejiRRiQfMt+Xsn8j
         4c5lhGscCrYcdkR986x8OU87q40fXFK+cXF1EXEiAdcKR1kMiBTQC6C0VggpLdSW57Nl
         KkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377735; x=1788982535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=rIANwfP1o+FaKVNIfzpdg5N/cbNVXFYWCff1y7c0lzmZYWyRPNdm5xy4PZ+p7b6ifm
         f9WYcAHQsp6SsitkBt5oW9qO4Y0aQGzUOqwLhd9vlKH7NvvO2OVLMFt66SVWAe41VA9V
         BSmXOrHn+0om4b9K1Bx9waxtqoFPCu1Q9OCp12t96GBOKN+kHx/PFKI4vB4Ia3R1TKqQ
         pcnvKEXjki4nbIZ7hJbDzvCyuKsWdh1HxPr4oaO7K6NetMdFZzUH11285u+y4U+artu+
         6biWYP8e0alOhXBeRShFSMLUaQMO+DQwZpgGTR3HLyT4EUN02hco0XuH7JFy4LUqClok
         k/Gw==
X-Gm-Message-State: AFuF++npa2thIc/h4MdJlLDoEKdmEi5qNPdpk94ATXGQSbso3GZx+e5X
	3402qbrSCoVXwurkTGzEwa/XCGzX+uSBJX+QJAXAZA9AvN1UPasn5PBoMpgVp67s
X-Gm-Gg: AYBFou11KyCZRM3/2fINNwYIpvFtM7orTSMiwQvfoaXvq19fa2HLvKmQPbc35X/G7Xb
	WkkBmwwauxF1TrIZvlVvjLDT7ZRZhxC1yyhLm071QiUj9k//jGec7ngjf+Sc2w9HV/9Sh8PoUEh
	P7R4VmdGdm60Kosz2A49bilY+67PwDSW347e/bE0crXlK90ZG+f4DxReEkg59o//32zk0e/r9TH
	lcx3tWD/mK03vxiBZrgvFi3D8e8o6NKIs1dPSZQGAF5noc83glTqwDAi1zCNHzConxqhrdjwKdw
	yV24boTdU8Zdd80tPC02loiszYJ7vwRTctn+yymqCljQmqHm5nepu4TzSEzeKcWXAKCqlxFwXiy
	GdwHZxCFXBK9e6owXneg5zBVaqGd80DlbP8PDhmgSWuqCKLsmHb+SxGKeRGrWZ391I0tRkSRA9u
	RwUQ++22vYIsrPN0v4iDRflkjhtRVEjD5KoGnofLIc2yvkqLeHwxlMyOrl
X-Received: by 2002:adf:e19e:0:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-484913b9852mr14461136f8f.18.1788377734976;
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed,  2 Sep 2026 21:25:42 +0200
Message-ID: <20260902193351.185771-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123536_688867_6AEB67C9 
X-CRM114-Status: GOOD (  12.76  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


