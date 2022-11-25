Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAE6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=; b=QstEXHmRnuY0wNpnozdNQhhFy0
	UTHwhBvwvxGl8Egbp66StWOuHVRHSuApx+vCUgyXAx0wO+xcmweCvdW2lNI4GaJkvKms2vxcodNIp
	fgpusN66nqohWnaTas1FQnG6kLAMUVM2XiXBgKHVlcJXONq1WwhiOIx4SDkfAjvNFsFt70xO5mPIW
	6Idsr0H/Jn/68pw0P/V6L+6aNaqvUaNxj2kFYLl+NZbZXYkxTokUrgZOhTOUyrwjBViOWOwmEf2wm
	eNhWfixiLXxrOhWEI4yKoIYK4ewJogt1NM+yosLdWFmYgx+3mzMnamG2Yn+7+thmLhqqHTmP1c79s
	nQWC+U2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaOz-00HOP6-Ra; Fri, 25 Nov 2022 15:14:05 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMZ-00HNTy-9A
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 15:11:36 +0000
Received: by mail-wr1-f50.google.com with SMTP id x5so7203490wrt.7
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=y5RUebrSosy2L8xvLXYFCns40q1ccZYXsrxL96Zdy/w1f8IUjGbcslxtTTAUCw5Zf2
         r0oEVT+9EOdOxceHOhesQ5oaAKvUqCaLSKQuoGcwH6Jw+EGfV+nGPnSH6xTlC1mWf8gy
         yDW4WfBJYb96R3/GYtwHKHOXKheyFVLafNQ0NdY+VwVcc1WmHK7770+jN+oTahL5MQ6b
         tDgh/a/fsFFR+IZpEksOItlBaWIrlzeNyO3t96xVUd+s/r2ytDD7d8KwyM3uehp2Lydj
         QfVHXhD0SaFet0Uu4Wl5SDa9ZZNd+Y/nT4bx1peIYjIRRYEWUX1RHJ1/K/vhIjO3tyMe
         yJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=u6aHLTGwJs/9cwT5p+cVey940MEll71BtutmlgVUFCo6lyqvI/oObxbJ+i/A3DHxNW
         i2ahegWW37PWq6FV8iBaBH5UG+NBeWKI9Txp7gMbTvkUva00PCvDLH4SpbBeMJi1Dnd8
         5R4g3E4OrOcph0p9gqUOVDbidWASrfsn4BEbZDRvKRZHBhKsq4JQbWhjZjPhVxj8NLYD
         5XP57/8bEsvwbwCVop5ri/WdNVLCBziwDxXcjBqYzwDR6Ukjj3DnPI6jdL51Z4XoMNty
         HbV3Q3fzKUDB8ijIPqSyPv8NME4FvYpYte1u/LkUyK2KxGT/eRhjvtP36QraeJGyRf0o
         D+FQ==
X-Gm-Message-State: ANoB5pmNaDjmWM8oxiFYBd0oDVMfWxVdngnG+pcwxuXlQi1cN+jTFWie
	b/lIRhzACadSiHwZz0e2NXqAk22eLzESWKlP
X-Google-Smtp-Source: AA0mqf5Sm1CglF3S+zaxYxLdfuEQZuiRkUPKCtH/xR0EmtMQinXAAzyozKSvPKTZfhFOX8ftLYr1qg==
X-Received: by 2002:a5d:5f04:0:b0:241:e9a6:fb3 with SMTP id cl4-20020a5d5f04000000b00241e9a60fb3mr9087357wrb.462.1669389092434;
        Fri, 25 Nov 2022 07:11:32 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:32 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 25 Nov 2022 16:10:21 +0100
Subject: [PATCH v6 10/10] Input: mtk-pmic-keys: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-10-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=K2/LktiwnSqpYUY/NYDB7cyyBwW4Kzl5Gx1VcVhpHIg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsXQIa1QEIipiruDB9u/aUJuuWuwrFMsam4SPLK
 94W6b/+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFwAKCRArRkmdfjHURavoEA
 CgtRyRJ2qwmMDOSz6ZGwn/ZANcUmntlsG2vnP8PVpIhZSEpmpPaOC9xB/4cyr6clGsvKNMESMH+Fqc
 rJFK0L9bcHTfUlN0fAGTvsyXEReg4k8e93E8QkPUAyLlgxoAM6Qkkxw9GrQyOShb5yXjyq39X1AFKj
 pGHZCnhO7JtRZkzj9ZUpgs+P2tSXss5FUFGbGco/PHUTrLhoIAU5C43uCE/pn3y9m1jGLPjtJuyV9v
 6oCV70JLBrYCph2BNCrQdzD3vr1CzWBRTY0Z8ttPDnvTRWiZRb9/vWs+vb6raYU22UYt08uN8hidp9
 oWT/CUu9l3hbh3i0E0a6aMXDNS5kIQBnLYZmfl478RtbxlzmhDA/94aFTLVRC1vEtICMvkfCc3P1z/
 wIczGve0zj0fMM2Qh2YFcJmLk+T5N+cBGkAskB57Cct+9R8qKKyIhTeRT2Ljh/yIZsJB3O4Pem8nh8
 gnFZ9WAyhkTJXlxv73g71vUG6uPiSKTmMw4P6ONR/Jq6szyRXT+3xUeoqpHX0dwrtBxn9CTl1M4gdM
 GbjY6xdJlez1nPoAXb8Y2LPaBIFeYsbbVjPpWhwOA/BXsy04UxEibIbNEfnSzwTb05A8O812vSsJaU
 u/j++N0Vyr0mINa1MQDkFOP4gs/9WWeaKwK7Tf96ZFi53RIYBcVW5VvsulZg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_071135_327219_B2D7F17D 
X-CRM114-Status: GOOD (  11.12  )
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

