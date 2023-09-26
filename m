Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B1EE8181B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 04:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQhU1RkcH7MjgUWyE/kqZPIAnN+PPGh4wt2Rdh5pkv0=; b=iVb8YTsqdq8qgYkMdRPjD+ikF7
	gDB2OQxasCr6XjQZjn0PLdNM8Cfnud1HbTEf47PpWMFSNJwyoy1VkDROXb4Y0eeKOtTHBH2LC0obR
	73WB91iKmbraGfUka2lOW5WfSc9daKj59oGYXDkkJ1LBBEXzOCWQN7GRQxqO0TxRTywG/SnYjHrKE
	Y15UFjY0adKlCAt0TZY7WnvAMwWDsQSxAW5oqdCRKNLmnzFrvtJJ3I6VGQP0ob+H6LRBFCcc5jYr2
	2HPo6RRf4S5csDNFF9+Xnt7H0eviT+p8e34EyQaA8yE2D372VK+KeQe2MRJ8s3nyMn9swGONhkmvo
	rmKTURhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzs9-00FZHb-23;
	Tue, 26 Sep 2023 04:40:33 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzrs-00FZBC-3A
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 04:40:19 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1d598ba1b74so4483103fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 21:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695703214; x=1696308014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQhU1RkcH7MjgUWyE/kqZPIAnN+PPGh4wt2Rdh5pkv0=;
        b=ezsPNhT9fHvK5KQj1KVKKxIl1uJxAx6R+27qHktMsdjNZa4JQXGyNo2YFStgpHkpzE
         6jTBAeJaNqhBES/5NslJo4A5m63Ts+xKFRdYdnEipFpJYEIP4MRXFn4NIgI1wWIPl52c
         q2zPydl0oGR6uTkaiH5QgtnN9kIoe6Zrz4A1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695703214; x=1696308014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQhU1RkcH7MjgUWyE/kqZPIAnN+PPGh4wt2Rdh5pkv0=;
        b=n7f1we1ehH/In9VvYhJYFSG3KT4zvYjwrjcMW8d/H4XMQz3ghMISqz2NDGEEkE1eyr
         GJBPzc9fkBqCE60F/W0McvKtmQ+e3egVZ6AM9GLe4+uOrOBkNyrqw2oHoU8za0JdOG/+
         7JHsPl+/q08jT2+swY8Hb9kU/mQ1wrOCzWW39xy51JKJZVb46K2Bz8mvCSa9QBbTl4Cy
         x8Zeuy+NuOTQ8L4QUP2ReAERsXD4uipPc0vPAmYJklEmeMm9hwGB1bcln5AGlVFtP9Yv
         DJj60BmffqFQ6rHWIiHf5WQs6WN7LbQmveRK7cK/sKFP0hskdhMRDeFq/kjsBHznWatC
         u6Bg==
X-Gm-Message-State: AOJu0YyqlvoOvoYuN+piQ2OL29QGCiWJy4ujRZb/mYxVSilnpuJNOBb+
	DTG/EoBTjNmLZz93NKrHOg10dw==
X-Google-Smtp-Source: AGHT+IEWSTLXw8RQzEFqN1UX9tizE2LvrNAvvFmqQcPF3kAdf+Kqd7mBd/0Vf+yCuYgkkHfxWZqQ9g==
X-Received: by 2002:a05:6870:17a7:b0:1bb:4606:5be with SMTP id r39-20020a05687017a700b001bb460605bemr11235714oae.9.1695703214656;
        Mon, 25 Sep 2023 21:40:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ba86:87c4:df1a:be60])
        by smtp.gmail.com with ESMTPSA id p11-20020a63ab0b000000b00563590be25esm8667210pgf.29.2023.09.25.21.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:40:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v3 2/3] regulator: mt6358: Add output voltage fine tuning to fixed regulators
Date: Tue, 26 Sep 2023 12:34:47 +0800
Message-ID: <20230926043450.2353320-3-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230926043450.2353320-1-wenst@chromium.org>
References: <20230926043450.2353320-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_214017_027988_72E685E7 
X-CRM114-Status: GOOD (  13.46  )
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
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/regulator/mt6358-regulator.c | 15 +++++++++++++--
 include/linux/mfd/mt6358/registers.h |  6 ++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 4ca8fbf4b3e2..f2eb0c14d1ed 100644
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
@@ -488,8 +494,13 @@ static const struct regulator_ops mt6358_volt_table_ops = {
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
2.42.0.515.g380fc7ccd1-goog


