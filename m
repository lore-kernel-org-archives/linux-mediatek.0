Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A2F3D61F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=2bx3Cwb2378RJEBMvsUO99gUqr
	cRVVFPL3fKfxR7tcWN1hYCnU0YRUyudX4BYknVDnzvZasjyA4FcuI8dFxQ1q4Kb/H9TcGRMoSSAeM
	Mnw81cWiJSMLZFEUR2pkTsRSlCcR1tOk6nNiJfm1c7L4wxQSW1l1F+auWlzGX2ocn9KjKf/S3Btqs
	akbMbwG2PGhMr7y1XeSkef+AifxeQ27/iyICE2QfCPACLq8dj6mCNG0yeUVgxIMWw0HpCeH0/19IN
	b5kG8pBdrzo3tCMBHwQ6bEoxtmTVAIBf95pbLkFXdDXf7N9msp6rm0/5bYFIicziKP1cxEvp3Vo8R
	tWs2sCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786L-0000000As9X-0ayO;
	Mon, 30 Mar 2026 08:36:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786I-0000000As6k-2QBo
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48704db565eso55264525e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859756; x=1775464556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=GVFfPTvFHevi0Xd1DzxX288NVcneDiQ01i2uXbGH47H1GIz5qkyz+G/RvVHdWz/nU4
         bP7fWvPQBdIpqTyCYJAeGQcwYBRPFIVXpNWfvarikz116j5ESyBd/6YS1rCEcuv9MY6c
         elNqI1JCS/xIRN3auL6KNj/84CJv1TTTHQT4UnayNAzpZYWbCRx5YfhfitbMfYxbA+t0
         sc4G3svSE2ZvxvfXvNsJN+QJ6pZMTB53GyVQ6gjrL5JmnvxDURt0B/z62fkalHlA0JPu
         HBjazi+bFaBxHGVtCu7P+8Aku/mhxhnyCuUKwUbXAqQxZ18CVGg4Xt6EelOm3Y6nxJ27
         ltvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859756; x=1775464556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=AhjDSc/6ZyZgOuUj32ErRoQ0lIap+mbEZav94q6LE8ntW69qSiwMWMjSvX4cp5I73O
         0qaXUyGUChsy8PNpzn/wu0qq+qpQq9Ku3lu1b+yu//XtVCuotIgZCtsSTa4wL9NxoSfA
         7PRIB1Qpp9jr3YcQZaim67kGeK2LT59b7AdlAukDfCPaFg/fi08jbkCX6Zf2FBTfoTDT
         3PmwPuDjUeFV5CTOhnf4DopyDfTMGDkfOQKJiHu9JcEaqKhQ22+Ez30a6ip/i6zLfWbS
         AsSHnbvLIQ2ZW7hvq5D5Pgz1v3Yj34efyVDKIpz/R0HJq9t2TgXXKR/UdyTUQQH+Yzf8
         Ff9g==
X-Gm-Message-State: AOJu0YxQ/lV5cCGeZXp1joFbaYS2me6r5L/8UvriMEue7eeC441wDbal
	SS0dhzioka7qoZncAz+MlF8sNiimNcOcoem73CQKy9laWGkC4T+OMG5xYZ08YAmO
X-Gm-Gg: ATEYQzzSvmZ5y3tSyOPi5Z+z2BXJb2JaHv+1o/+G9LbZyoLwmSXvKJ0yoDe8lkOi4Sr
	AMQDpe1YWf9Tz4pZ+2YzM6nNrmOdY7leaXDillGmuyxX6va1YpVFzuuiOUiu4UuD999vCaOcjuw
	M0NfIS68cMaPki532UJaGzfh5cXU7u1YmoWx/0EV5WZsrJmWVSDWUa2MZmQ4UmOZCE2qJMoXu74
	Y95yQTUF/VQeRMPz9oibsuhYwqIgdHoUYV4ppmiigd7XuImzZ9JLXI6apItrcy28W01b6w/9m+N
	a/WHXm9TLd3KyzjyM1qrdlgeYg7IlGtEz7be6LQz0Y8FT++dNshqjHLZ1oXElHXOwCESI6SEohJ
	RuJ4zHjehTeh89jOOmS7Ci/MTxAZTbo99ZRr4oewDpuxxevShz/lhp65UBnyYbrxCjBy/hxXJna
	qE8PzVpD8fG9WQW8aBvou1eiURni7p0w==
X-Received: by 2002:a05:600c:4e15:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48727d4583dmr192614775e9.6.1774859756104;
        Mon, 30 Mar 2026 01:35:56 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:55 -0700 (PDT)
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
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 30 Mar 2026 09:29:40 +0100
Message-ID: <20260330083429.359819-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013558_631292_6540C92F 
X-CRM114-Status: GOOD (  12.10  )
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


