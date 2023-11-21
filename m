Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7167EC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXs9aA28Fb/zI3HoK+Y5RpS9a5/sxHENqTOcKG51emk=; b=eUWGxTJTJpOfKnJxT2TFye3qhX
	zisjH2cw0ZFv9wpwqsRxa8wIWIDhX6iQ81XPtdrlSvtQMHEN+JjbwQeaselA7+xLxwuyRr9eGiTbA
	T0xxL2sBMOD7bm5TLUWrLm0MkMf43Klnc7NLd4G8RHs2FLhqVr+n+pCTd+yjRf2N2UcVPuIeZMhqO
	3XZM50JnnfAcdZkkBjhA5yuUWZGlt9BJtTFO8cvwNadKAGhuZJu1KzYvBEfb21cu7O8jVzIqqJpG/
	V9gVHD8q2VOdBMki+oohq9PXxoFH3zD+h/W1tvWPsn1JwC/EPHwxFUdyqU7pRg7k4yXVKFVhCspTB
	+eJA/flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDc-00Gk1l-06;
	Tue, 21 Nov 2023 12:51:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDO-00Gjqt-1a;
	Tue, 21 Nov 2023 12:50:56 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F86F660731B;
	Tue, 21 Nov 2023 12:50:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571053;
	bh=N42OlgtNsTN3hPgxRyKN1KLxCwyU6QyhLsWFXT5/rjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3yC6uUj28WfIhgoUfzT29/Zzy2yxGMeJyePbi04yGzRTSzNkWYwUVZM7bDwZLnmp
	 b+kKOcIOqAUa4rqcuR+atOblgacwvANZY9VIUhZ7wFOsoO3SU3AEPU6mQFL9LzAVWy
	 3RO3PHwW39VUgrJXFa9bRXQVemjvm/s9SZC2rqYVAF3Mxp53ZH/yFZz1fbCoI7zBe2
	 P4kAbX8OEz6BjAPsGwYK69ByTcZryU6AUrYir7l4yTBD9v7rPsxBS6QcURNuwQ3v1A
	 irGIVqSYKFNqycFoHlRjslL9v7Af1S8ZI0Pg6+x4DyDquM5bOB1X6DdHOY+Sj9mInn
	 QXrFZv+ij4+6A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 02/20] soc: mediatek: mtk-svs: Subtract offset from regs_v2 to avoid conflict
Date: Tue, 21 Nov 2023 13:50:26 +0100
Message-ID: <20231121125044.78642-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045054_777623_D9087181 
X-CRM114-Status: GOOD (  11.48  )
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

The svs_regs_v2 array of registers was offsetted by 0xc00 because the
SVS node was supposed to have the same iostart as the thermal sensors.
That's wrong for two reasons:
 1. Two different devices cannot have the same iostart in devicetree,
    as those would technically be the same device otherwise; and
 2. SVS and Thermal Sensor (be it LVTS or AUXADC thermal) are not the
    same IP, and those two do obviously have a different iospace.

Even though there already are users of this register array, the only
one that declares a devicetree node for SVS is MT8183 - but it never
actually worked because the "tzts1" thermal zone missed thermal trips,
hence this driver's probe always failed on that SoC.

Knowing this - it is safe to say that keeping compatibility with older
device trees is pointless, hence simply subtract the 0xc00 offset from
the register offset array.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 108 ++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0f7cfbe5630b..416e9b313c0a 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -256,60 +256,60 @@ enum svs_reg_index {
 };
 
 static const u32 svs_regs_v2[] = {
-	[DESCHAR]		= 0xc00,
-	[TEMPCHAR]		= 0xc04,
-	[DETCHAR]		= 0xc08,
-	[AGECHAR]		= 0xc0c,
-	[DCCONFIG]		= 0xc10,
-	[AGECONFIG]		= 0xc14,
-	[FREQPCT30]		= 0xc18,
-	[FREQPCT74]		= 0xc1c,
-	[LIMITVALS]		= 0xc20,
-	[VBOOT]			= 0xc24,
-	[DETWINDOW]		= 0xc28,
-	[CONFIG]		= 0xc2c,
-	[TSCALCS]		= 0xc30,
-	[RUNCONFIG]		= 0xc34,
-	[SVSEN]			= 0xc38,
-	[INIT2VALS]		= 0xc3c,
-	[DCVALUES]		= 0xc40,
-	[AGEVALUES]		= 0xc44,
-	[VOP30]			= 0xc48,
-	[VOP74]			= 0xc4c,
-	[TEMP]			= 0xc50,
-	[INTSTS]		= 0xc54,
-	[INTSTSRAW]		= 0xc58,
-	[INTEN]			= 0xc5c,
-	[CHKINT]		= 0xc60,
-	[CHKSHIFT]		= 0xc64,
-	[STATUS]		= 0xc68,
-	[VDESIGN30]		= 0xc6c,
-	[VDESIGN74]		= 0xc70,
-	[DVT30]			= 0xc74,
-	[DVT74]			= 0xc78,
-	[AGECOUNT]		= 0xc7c,
-	[SMSTATE0]		= 0xc80,
-	[SMSTATE1]		= 0xc84,
-	[CTL0]			= 0xc88,
-	[DESDETSEC]		= 0xce0,
-	[TEMPAGESEC]		= 0xce4,
-	[CTRLSPARE0]		= 0xcf0,
-	[CTRLSPARE1]		= 0xcf4,
-	[CTRLSPARE2]		= 0xcf8,
-	[CTRLSPARE3]		= 0xcfc,
-	[CORESEL]		= 0xf00,
-	[THERMINTST]		= 0xf04,
-	[INTST]			= 0xf08,
-	[THSTAGE0ST]		= 0xf0c,
-	[THSTAGE1ST]		= 0xf10,
-	[THSTAGE2ST]		= 0xf14,
-	[THAHBST0]		= 0xf18,
-	[THAHBST1]		= 0xf1c,
-	[SPARE0]		= 0xf20,
-	[SPARE1]		= 0xf24,
-	[SPARE2]		= 0xf28,
-	[SPARE3]		= 0xf2c,
-	[THSLPEVEB]		= 0xf30,
+	[DESCHAR]		= 0x00,
+	[TEMPCHAR]		= 0x04,
+	[DETCHAR]		= 0x08,
+	[AGECHAR]		= 0x0c,
+	[DCCONFIG]		= 0x10,
+	[AGECONFIG]		= 0x14,
+	[FREQPCT30]		= 0x18,
+	[FREQPCT74]		= 0x1c,
+	[LIMITVALS]		= 0x20,
+	[VBOOT]			= 0x24,
+	[DETWINDOW]		= 0x28,
+	[CONFIG]		= 0x2c,
+	[TSCALCS]		= 0x30,
+	[RUNCONFIG]		= 0x34,
+	[SVSEN]			= 0x38,
+	[INIT2VALS]		= 0x3c,
+	[DCVALUES]		= 0x40,
+	[AGEVALUES]		= 0x44,
+	[VOP30]			= 0x48,
+	[VOP74]			= 0x4c,
+	[TEMP]			= 0x50,
+	[INTSTS]		= 0x54,
+	[INTSTSRAW]		= 0x58,
+	[INTEN]			= 0x5c,
+	[CHKINT]		= 0x60,
+	[CHKSHIFT]		= 0x64,
+	[STATUS]		= 0x68,
+	[VDESIGN30]		= 0x6c,
+	[VDESIGN74]		= 0x70,
+	[DVT30]			= 0x74,
+	[DVT74]			= 0x78,
+	[AGECOUNT]		= 0x7c,
+	[SMSTATE0]		= 0x80,
+	[SMSTATE1]		= 0x84,
+	[CTL0]			= 0x88,
+	[DESDETSEC]		= 0xe0,
+	[TEMPAGESEC]		= 0xe4,
+	[CTRLSPARE0]		= 0xf0,
+	[CTRLSPARE1]		= 0xf4,
+	[CTRLSPARE2]		= 0xf8,
+	[CTRLSPARE3]		= 0xfc,
+	[CORESEL]		= 0x300,
+	[THERMINTST]		= 0x304,
+	[INTST]			= 0x308,
+	[THSTAGE0ST]		= 0x30c,
+	[THSTAGE1ST]		= 0x310,
+	[THSTAGE2ST]		= 0x314,
+	[THAHBST0]		= 0x318,
+	[THAHBST1]		= 0x31c,
+	[SPARE0]		= 0x320,
+	[SPARE1]		= 0x324,
+	[SPARE2]		= 0x328,
+	[SPARE3]		= 0x32c,
+	[THSLPEVEB]		= 0x330,
 };
 
 /**
-- 
2.42.0


