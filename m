Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D4C4708D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=; b=lFgyFwYi+3SfoXJ4USLA8fAEhw
	tv6u0jhQsTz35JEBfTzEjJZ0aR/8/X1jbENs79LAKjpL5zqEjBRgPwJOSccLRX1utQcUBIwUvWxew
	C4CJbfHZq1/wRnhhG9MeZ8MdZM1IYJnRzmxoc8RXAyBWfT6LOjgVYJrH8Rg3jlEJuQCHrCjRPCBnK
	FZfKaA2jPTbgmWZuRS94ye2JzMaUtNfkPXJL8jsNT7ExIIepPondh2K88kTtg5h6Rr3IT9sCRgQLW
	QysMMcb+W+EkH4PyIo1Vgl6bKvJOGQGuFLSBBviJLUJ4/jJJaJ5i9fZ2U28+QJLtKHI20JdPj5jBg
	VPDTeKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNO5-00CcZV-7u; Mon, 02 Jan 2023 16:10:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNKa-00CbBt-6q
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:06:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z10so26672178wrh.10
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=KyUrTchZmLg7jkQR10chpfJ9gQLM9EMAIksN6ELqwAXW8aT8mKff8eT71q0LPhBURn
         owZeL1GD2Kz0xumb+Qbg1wxLr+PZAXNR3og74TvzGgoahXRhq3DOfoxBgXSnSsneSmDA
         46Oqq+UM7U5a/OIR0of2xMu60b0l/gJi1/79y5lLM5wT6GqOxQLNpszs1JOkCwXLepbU
         Nm3pqNg4Xv+Y1EtxADOfHa7ayif+3ADkHZP468dT2unNSDGxLDQ/FlHsI4xw61cGfUS+
         CI+enEsLVq0ifT5wof0sDaZvVk8f8aeisjA7hC/DYNBLkOk9iQte29d5nVSQBty1xK+v
         xPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=z5KuCnvv4YEO5Fqmwv/c+WAiBfN+eNumxPHFLAF0lGGo0jkIoJ5bGCTmX+kNXHx+e1
         +AP45Ics+ZdA8JkhHQbeIg0rG0BEEojCrKIGYCRV/b3bcZm+qR3RQnN0W7u0T/LwU+3Q
         yLYlcZp25udfRCDBu4+Jwqe/TWB2Q0Kg2EBsZlcdgFShoqCYFqKkXVnSl+qD43sQOXIa
         NQ3vIIwGHZrxqjdf15IFrEB1Q8osmflb7Ma78il6zH1rT2z55E5u2Jhd71z2P1lOSD4n
         WjwejyGTbxQSp05d/p8ATqSU8S72aTCFExz6f6HzVkCrbGDCu1SNdIWtnoBPtSiPiSDo
         nKuQ==
X-Gm-Message-State: AFqh2kpCGOFDmjV+7s/3cjb+3o6oZ+PHiDDBGoagRy95x7y7ZSyCS1HX
	e0Y3d0W9u/THv4aeIAdaBwTLEQ==
X-Google-Smtp-Source: AMrXdXuYl53gcSszUzUfLiSf1h5NihwXzZfU0D6s12CBv1mCJ7OOmdiZZjUdfgUdey5wzxb5V+aVkw==
X-Received: by 2002:a05:6000:1812:b0:238:3d56:f061 with SMTP id m18-20020a056000181200b002383d56f061mr23943850wrh.63.1672675590986;
        Mon, 02 Jan 2023 08:06:30 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm11868020wrs.33.2023.01.02.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:06:30 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Jan 2023 17:06:07 +0100
Subject: [PATCH v8 6/6] Input: mtk-pmic-keys: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v8-6-560caaafee53@baylibre.com>
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabien Parent <fabien.parent@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=K2/LktiwnSqpYUY/NYDB7cyyBwW4Kzl5Gx1VcVhpHIg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjswD9VViN/i8FL25jhETD5m0ZS3rt7zH3DcWuuMdd
 jvJvgpSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY7MA/QAKCRArRkmdfjHURcEaEA
 CM2nq2csWKuTEK9bxbJtJ+UOZJm0Q/HMn/a+C5qw35Tcuh9Ekn/8BlOkWqDFY7a9zdrbPir/6ZaxvV
 Wl1DPGw8WLXZk0zQ9ah6bt8bCs8XQsW65ANxsGEL2BbL/rdlWpotmCHuKt6Dcf93/JgaThDb35Oepa
 3CmyLH2zbaYJdbJN6RWQFnLmfpPQ8w6MvFWSVxn9pEayV4XUp2RqykkZF0dAQEXU2M47aTUse/IULJ
 kAxVNafVS840EM/e/jRtl2j5gLT7G2NHQdMVm6+PJlodxcaGagW2rwsX2pwKhEv5/oxsaB5LeueeLo
 hmb2xObbGbY2MBFQJRwo5oQiNIgA/sONLT3FGA6Q6YEXrUFIjhQpWr+f/rK6Zo42yxtRl4visNGwgr
 bn8P9YzY/sER+k0CRS6xlK3zVu45fOMwnKYcfIXD4VieIiGDqZmn0wQdixjpixjwTbhHzct4nUFIlj
 tBRLcO4aAVNqrfM49ENZ2x10qW2+uXhv1n8cxty2DsZxw+/g7kTPZ5lh/lxkVGgRx8IlxC7G/2/ag3
 hX9t8NW00F9rGn38H/f7udJ4EHCQdOSneRfAlPxGJTuS4S0xwA27YgfQGcMv41AwKTtFRfl14SvwM9
 cAdZkGV2my/8L+iuAw5UQMfu7XrCxELII6xM0eHT7+bKWdNIkxKNVgetMvPg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080632_574033_F912EF05 
X-CRM114-Status: GOOD (  11.68  )
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

From: Fabien Parent <fparent@baylibre.com>

Add PMIC Keys support on MT6357 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 9b34da0ec260..2a63e0718eb6 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6331/registers.h>
+#include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -90,6 +91,19 @@ static const struct mtk_pmic_regs mt6331_regs = {
 	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6357_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+				   0x2, MT6357_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+				   0x8, MT6357_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_HOMEKEY_INDEX),
+	.pmic_rst_reg = MT6357_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
@@ -276,6 +290,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6331-keys",
 		.data = &mt6331_regs,
+	}, {
+		.compatible = "mediatek,mt6357-keys",
+		.data = &mt6357_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,

-- 
b4 0.10.1

