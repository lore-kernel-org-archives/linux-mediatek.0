Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF10ACA5508
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdHiqmsycYyIT3/cC+/dOfMKn4pKdIqRmHbcGwVnX5s=; b=rc7Ijlju0vn7uvCWgusj5pvQAL
	slqBJKDO7WIvjYmA+M3Jy3U9LSjkOaKkcfqqLoPUHJE3CPI8sH9ogFZ+LYhsv8z04z7me6rEnHu+6
	3TTfiQRUBgGD9PQaAHbs93XjR7E4P/kDZ9sJGvMrKeXBQW7jDsOGFp/lDp01/qHMirMiue1pqL98T
	YKXqpxYy6cG/gFDa57szGcoDRyoFodQWff9VY+YwdUXhaZtVp9oOtxQFAtdmbtH/sMh3KSKA/j3gF
	FO6sRocT2m+Iq/h6do+lhrygFq8NhPc3wtBQsSJ8txGj+rnE/NxIvNmwY318nrw3oA6+1k+ThOGIa
	B+VRgSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFu-0056JV-38;
	Wed, 13 Sep 2023 08:29:50 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFl-0056CE-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:29:44 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bdcbde9676so4483776a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694593777; x=1695198577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdHiqmsycYyIT3/cC+/dOfMKn4pKdIqRmHbcGwVnX5s=;
        b=ThEFDgwoB6NHOnW01vOOKOSBfPNGPmgOzHCEBXHtOjDbXcPALY7/uv9zYa3qN1bufd
         T6JQk6Sx5r3V940D7f9VpWwv/hlzoHARPyAGUg6FfVBkmLbIXZ9CDq3R7kgTlfmOwj4i
         bnaOVTXg5Ftgo1wD1skOstRc/csJckVUIhPCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593777; x=1695198577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdHiqmsycYyIT3/cC+/dOfMKn4pKdIqRmHbcGwVnX5s=;
        b=K3uJMHDE+gvM9PdIQHYGbfjD0T4UD9FLaBaVv+fqgi6f/F2t9asn4BLlw0AwKvZMVX
         JtvMFdHoVQhmCD2jNXvJSi8ZJYSJxCQk2YEcHSnwzJYi+i5BHx+FpiGms6TZBOmjwfGQ
         RJPVLd5NTJJHrnIBgJwfBM2wJYTEdECcK5mNnUwy2hq7HJCC2/phJnjUk+jB3+uxlKwY
         q0zGOUxSwweRvFOU6jPEm0U2PgDJkxoQxbnjI34qiK3Ipbu626AMkQik9hx/bCIwlDZ1
         /MNhrkYKUMJbfxhkBZMrQJrASiIs7m7olGzJ2vVYxx9RuS6teRb83KhfsZlUyBs37fOs
         YXFg==
X-Gm-Message-State: AOJu0YxPiTAe4Prnjo+dkDhXbVVCG+XjQ78R918M997RngkyxjMqS3+A
	o+dtYlB8t6EnVDVogR001NOi9w==
X-Google-Smtp-Source: AGHT+IEAk04XlqXXsbF3kNq6HWqUzflUESMdvKxSa9IgjgSc+RGUwJ6TTDvbnhxYl19Rn4xSY68iwA==
X-Received: by 2002:a05:6358:42a1:b0:135:4003:7841 with SMTP id s33-20020a05635842a100b0013540037841mr2163234rwc.13.1694593777309;
        Wed, 13 Sep 2023 01:29:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b24c:3be4:d952:d3b1])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006901bd3a9e4sm418781pfo.104.2023.09.13.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:29:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] regulator: mt6358: Add output voltage fine tuning to fixed regulators
Date: Wed, 13 Sep 2023 16:29:17 +0800
Message-ID: <20230913082919.1631287-3-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230913082919.1631287-1-wenst@chromium.org>
References: <20230913082919.1631287-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_012941_214585_8B27A333 
X-CRM114-Status: GOOD (  14.00  )
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

The "fixed" LDO regulators found on the MT6358 and MT6366 PMICs have
either no voltage selection register, or only one valid setting.
However these do have a fine voltage calibration setting that can
slightly boost the output voltage from 0 mV to 100 mV, in 10 mV
increments.

Add support for this by changing these into linear range regulators.
Some register definitions that are missing are also added.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch needs an ack from Lee.

 drivers/regulator/mt6358-regulator.c | 15 +++++++++++++--
 include/linux/mfd/mt6358/registers.h |  6 ++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 935c7ad56c7e..ecb2cd1eb34f 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -123,10 +123,13 @@ struct mt6358_regulator_info {
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,	\
 		.owner = THIS_MODULE,	\
-		.n_voltages = 1,	\
+		.n_voltages = 11,	\
+		.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
+		.vsel_mask = GENMASK(3, 0),	\
 		.enable_reg = enreg,	\
 		.enable_mask = BIT(enbit),	\
 		.min_uV = volt,	\
+		.uV_step = 10000, \
 	},	\
 	.status_reg = MT6358_LDO_##vreg##_CON1,	\
 	.qi = BIT(15),							\
@@ -219,10 +222,13 @@ struct mt6358_regulator_info {
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6366_ID_##vreg,	\
 		.owner = THIS_MODULE,	\
-		.n_voltages = 1,	\
+		.n_voltages = 11,	\
+		.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
+		.vsel_mask = GENMASK(3, 0),	\
 		.enable_reg = enreg,	\
 		.enable_mask = BIT(enbit),	\
 		.min_uV = volt,	\
+		.uV_step = 10000, \
 	},	\
 	.status_reg = MT6358_LDO_##vreg##_CON1,	\
 	.qi = BIT(15),							\
@@ -482,8 +488,13 @@ static const struct regulator_ops mt6358_volt_table_ops = {
 	.get_status = mt6358_get_status,
 };
 
+/* "Fixed" LDOs with output voltage calibration +0 ~ +10 mV */
 static const struct regulator_ops mt6358_volt_fixed_ops = {
 	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = mt6358_get_buck_voltage_sel,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 3d33517f178c..5ea2590be710 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -262,6 +262,12 @@
 #define MT6358_LDO_VBIF28_CON3                0x1db0
 #define MT6358_VCAMA1_ANA_CON0                0x1e08
 #define MT6358_VCAMA2_ANA_CON0                0x1e0c
+#define MT6358_VFE28_ANA_CON0                 0x1e10
+#define MT6358_VCN28_ANA_CON0                 0x1e14
+#define MT6358_VBIF28_ANA_CON0                0x1e18
+#define MT6358_VAUD28_ANA_CON0                0x1e1c
+#define MT6358_VAUX18_ANA_CON0                0x1e20
+#define MT6358_VXO22_ANA_CON0                 0x1e24
 #define MT6358_VCN33_ANA_CON0                 0x1e28
 #define MT6358_VSIM1_ANA_CON0                 0x1e2c
 #define MT6358_VSIM2_ANA_CON0                 0x1e30
-- 
2.42.0.283.g2d96d420d3-goog


