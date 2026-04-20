Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C16F5A8C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=eOir4uRZwk4Y+EEw6f0d+h4+K5
	BoIrH25c9g9vBTNNsfAv8kc5mISeXGipZXKOLf+pFyGiaBAsXeVVTvvLzHeyjttjSy7MeiL1SCAwW
	WkfeZGoLrK24xw6Fm2p36C795tPI9AyPj+Poqr46YQEyh/r+Zr8snvcCCdZ3i5iTj4OMOw6Qi5iHs
	kpChAzSxDgAWUpVE1j1AMCcSrIfbfO1nPRzSkFPBlpffsVXYMctBq2iHztggx6+MjYv8ncPHeDJ3p
	9zTnOjytZgflTNcicN3QlfqCv7FdrKpOATlaHKKrxh+y8HHz4khzaVLWZ9wFJLa7h04mGk7ClS9mU
	k4wi64mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKQ-00000007kJ1-2Bzf;
	Mon, 20 Apr 2026 21:38:50 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKN-00000007kI8-129j
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:38:49 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so2379252f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721124; x=1777325924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=ZDJ1F92dydHpDVNtO0OEr13F/gxMWlzNWGx54KjqWqDZ+mYyJ8VRszjaARaetiwB1w
         3MzufJkrE9y7ljYT51m3KlgTaH4+NOWNmSGBcdn2gz9fkclwyCoEP1WDQqe1YfOzdK+E
         zb76SAUQFxlKL+aGAdJLw5RwQCKCLMIyUDnUhDIjmfT8xqybHTCJFFlyi3Oi60m52ZJt
         Lq6eo9UKjmq+gkXJmTUQmJXys+N/vOcB0sJZ08zT7drbyWIVje7ChCdA50CznoGdCroX
         smy4u0Dgi9LMhB7ssCE0JMNTiMFcE+g3/iygWRiOKpGbZbTHUyA4pD36UZRyP57Rxuoa
         S8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721124; x=1777325924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=jlIFmt5NaYWOx23Qe+7WfqkPVVVRW/Ta+aFV3indvJD8pPf5BhFgiYXInRtBF/iCxQ
         qmAohRIHr/XRguuSOEB0vYPc3aNYFCFjJ5pMfX73OQ6ILD8yoqBcgWW1j5pQaEXnrHY7
         1CHleu0VZBXprbx2pI24g4fn9cj3LH7yVF63Q9yqZTQDNPsLgzKy5ucuITI4hDMkm7aR
         tyMF4bHfsgb/3J9e01A3r7TilHhdFmvH9vQWHLOY0JcQHiMCZqF9auCu3BqAkYnFsI2V
         tqwfUYuE0rSTytzpmhvYDVZU+MYrAlkV/1vIEf88NCAjO99xaHcUQWfD+pNL3aHEO3ud
         N/+Q==
X-Gm-Message-State: AOJu0Yz4RSoHZeDB3RKDR+Fc9FlBCuJcfGvVLgLQaTaU48EjV9Dkxzi3
	npuHan7M5lnIWy5RS72vWudEwtpeS+W+u8ZKwULVin2luXeuH53ooGz5v7ApkM9Y
X-Gm-Gg: AeBDieuch7pFVUqcvzMGVfjXkr68R34KZOsrDk2qBvSjG3xmVmCFGwoJxrr3cFTDRdc
	xjBmJPOa1Tpo3gtQIus4+sj2M/qqiaX67IUYYQBUPim/DRWsaZ+LdjB3qWBTsCl6y85eHtUfy1Q
	SGSnGq4p55qkwYlmrsdV7ObsFd/dTDLsxxVJ3b8iRYnGHFjoFHGMiaq5/bzFWHdRpI4/zArF5SZ
	Qn5sRTSN/AGDiDp5+9VeKgoJi2tGOa1u040OiYmfq8cYJ1C05QqDjxTi/i3L+rrcPhLuW7guOAZ
	pcnGFQA0wgNMnhmWwGGVmftIetxdZGF1BbTssWcjnQLrVTrhADywYqFXcNBlMf2Ce+E0prsWck5
	1LR3ftLHtu+nl8yfb6to2Zx6egN9WQIynYYF+vkhXd4yA9/34M2/uX4RSlqOpNFXCMao3G1ZKHK
	E9SxtCrIQ1U9/NkrSpDWWh72x3kzRIkA==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a53ea14d3mr22358675e9.25.1776721124372;
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 20 Apr 2026 22:30:05 +0100
Message-ID: <20260420213529.1645560-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143847_314902_45AED59D 
X-CRM114-Status: GOOD (  11.87  )
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
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
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
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
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
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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


