Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC17606A6F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbZL/oLe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ir/8S9j2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tJDoF8q5xHX5XtMKDszAmI7YXrpV48M1qYDKOgmPuoM=; b=EbZL/oLezaFMl7
	xe3MeC2ksFxk7Uq8nOOeAltU8FGIO6w9WS2/FqvlvtwihKd7NCSS+j5NCdfl2yNrEscTPgApApmh+
	QehCkgVQRtsVFqcJ9EGL3LzYJVkM3DLgIVcvg4R/2LFbJMdK4phQyeBJIxicLpZ6jmEJmCcKUmq+T
	JW9+er6Ezftq1Y9zNAMQn5/QExRkbm0awE0MESbAcgEYz9VufzlQLGeGciHTJCkaOobugnY9RcRZd
	FVnzIUyvvtVEjntHAZdeP7bHffy9QWtaOvWx8dPLoBuOgDJk6DujEpLIUGWLbB5jJ6/tuSLRu5vX6
	huX7ur17s26nezNt1KVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3YY-0000000ARzn-4BgW;
	Thu, 05 Nov 2026 19:55:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3YB-0000000ARoZ-22ry
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 19:55:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so25801945e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 11:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908505; x=1794513305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJDoF8q5xHX5XtMKDszAmI7YXrpV48M1qYDKOgmPuoM=;
        b=Ir/8S9j2KUpPCC4OhQxLaUNjWa+zcX4yHdn5XDB15hAw2yWsFMV8MpOWTjzB+MKsS+
         KdDKgY+jcaMFD03pJS3ZGDrwNyeV94uN6PaFAL7T/cbdnIkTnB5iD2dMjqAhgpRJaqNG
         v28QUpFCsA7t5h99xdSdJM+sDRZa53EusBjZfhAdg3LDX88HLzIoAGHaVe9IguPn1LAx
         9P2/2vQOHeHKQxy5ScsMa7LcKZ/piJaqqbQbSQeJYJ4dqs6BSPViUuPyENWTQZbcfe/j
         70sVSv8UZZEAcNIL6Hdd5AhnvMEwbvuEGeFuN9rFF/G4zp8khVseJaxcl6tee2+WBDBS
         umpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908505; x=1794513305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJDoF8q5xHX5XtMKDszAmI7YXrpV48M1qYDKOgmPuoM=;
        b=QFcp2063jCk9uIzF62aZh/4VqJkGqocRXO5mLmx4Ut7twKZZxQsJzANNe3lqFMi0vi
         AjLqhP5PtFwh5WKZYF6cmUlv2yOYbS3N0jHTy+GwonVjzLUggzhvYNJiL3TfNavwl8D3
         54lTV4FOcpJDy9+1AD7A8dxJ8kKR9pDpafnGTwj0fRmiUY69g8Lulq9eIqNakLeXxdwI
         riqWOY/VRoS5lmi+Dgy0LVYsTXWFXWbPtj4BTrDb3MLcM6ytX2uozumbeZWGG3Bl6JzD
         hgf7aGU6P3iRDEGQ6hMBFQ/cLbYtAQ7i8g2jJDunOclOQpgaioYOkhOm39zqrxEgYGIf
         fWQQ==
X-Gm-Message-State: APuU4Z9DfxxO88ukRVfeCEljNL6GgNCo/iuZi/sTKfqFn1V8RCN4CUVg
	AhkV+PpvpEB6kLcUzLwUf4ndRxwJu38yr4dtU+bmqHml+jckBvmDAdPknA128Hww/iM=
X-Gm-Gg: AYBFou14L+ReRtyVPgjc9UEsBFqqEaLSM6z0PHuvuJwTwBn4INccNVZ8SmM7+5L0sD0
	+IZRSdFDEM+zX7tbKPt51wmf9sEPn96q89PnBzcJBIzUCQTjnwW3ZCs685/v9WwxtduI5NPzsPQ
	WkpfmR8NUVbCTB43AXk2MyAZEWvtzNw0ZQXWNqg6kMSa/B41Vn4MjBNFYmSBoPq4H70zwduJzjd
	taNleVzzAzss9x110xGKvQYXUmFtFcRP4ImCJD17RiSYKL9VICN/wetySrSuhL/+vVo/pHkYt9u
	aLU7EBzBt9UEXZoTVqbr0V+80P1g1QbW2BTcXkmDdW8DMHH60XcbF7PmKOoVsUw0MKvYfvHbiNh
	WqD/bWz4BvPNkMKLhWL2jYMEBcvBpvpFq7v9OyeN4s57PyguWvhEidz3Wz+9pejeWRRa7xadoXm
	XKXBo8WJuPjYvf9HYfHFKoQ+0AXEMEMCvqPj/cQfxIZ8lAenAsYrowzuEmAsZpzIKF/c+kj/Ciu
	VHCOHWDkGZKL/GY1or4IErt8kB9fiuBUPK0CJppXZfA83IuwcegZKhb59OLbzeLgQllRxTEY3WJ
	uRX792dT/T1PF8hhSsYAn3Hj1HjYSc8OBI10yodM6hUdAA==
X-Received: by 2002:a05:600c:8b04:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4b6e0170dacmr2827095e9.28.1793908505260;
        Thu, 05 Nov 2026 11:55:05 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:55:04 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 7/8] regulator: Add MediaTek MT6392 regulator
Date: Thu,  5 Nov 2026 20:50:27 +0100
Message-ID: <20261105195206.3440-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115507_850861_D7AA158C 
X-CRM114-Status: GOOD (  21.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fabien Parent <parent.f@gmail.com>

The MT6392 is a regulator found on boards based on the MediaTek
MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
connects as a slave to a SoC using SPI, wrapped inside PWRAP.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Co-developed-by: Val Packett <val@packett.cool>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/Kconfig                  |   9 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6392-regulator.c       | 764 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  42 ++
 4 files changed, 816 insertions(+)
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/regulator/mt6392-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa76f..7f890610cbec 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1012,6 +1012,15 @@ config REGULATOR_MT6380
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6392
+	tristate "MediaTek MT6392 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6392 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6397
 	tristate "MediaTek MT6397 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6aabcc54382a..2a5794dbb636 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
 obj-$(CONFIG_REGULATOR_MT6363) += mt6363-regulator.o
 obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
+obj-$(CONFIG_REGULATOR_MT6392)	+= mt6392-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_NEX10000UB) += nex10000ub-regulator.o
diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6392-regulator.c
new file mode 100644
index 000000000000..3db52268363e
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,764 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2020 BayLibre, SAS.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ * Author: Fabien Parent <fparent@baylibre.com>
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ *
+ * The data sheet for MT6392 regulators is spotty to say the least,
+ * many important registers/fields are missing and the ones that aren't
+ * lack crucial information. Some useful details have been retrieved from
+ * Android sources.
+ * The driver code is mostly based on the MT6397 one.
+ */
+
+#include <linux/module.h>
+#include <linux/linear_range.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6392/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6392-regulator.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+#define MT6392_LDO_MODE_LP		2
+
+/**
+ * MT6392 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi_status_reg: Register to query enable signal status of regulators
+ * @qi_status_mask: Mask to query enable signal status of regulators (RO)
+ * @vselctrl_reg: Vsel control mode selector register
+ * @vselctrl_mask: Vsel control mode selector mask (RO)
+ * @vsel_reg_mode_reg: Vsel register when Vsel control mode selector = 0 (Register mode)
+ * @vsel_reg_mode_mask: Vsel register mask in Register mode (RW)
+ * @vsel_normal_mode_reg: Vsel register when Vsel control mode selector = 1 (Normal mode)
+ * @vsel_normal_mode_mask: Vsel register mask in Register mode (RW)
+ * @pwm_modeset_reg: Register to control buck mode (Auto/Force PWM)
+ * @pwm_modeset_mask: Mask to control buck mode (RW)
+ * @lp_modeget_reg: Register to get LDO low-power mode
+ * @lp_modeget_mask: Mask to get LDO low-power mode (RO)
+ * @lp_modeset_reg: Register to control LDO low-power mode
+ * @lp_modeset_mask: Mask to control LDO low-power mode (WO)
+ */
+struct mt6392_regulator_info {
+	struct regulator_desc desc;
+	u32 qi_status_reg;
+	u32 qi_status_mask;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 vsel_reg_mode_reg;
+	u32 vsel_reg_mode_mask;
+	u32 vsel_normal_mode_reg;
+	u32 vsel_normal_mode_mask;
+	u32 pwm_modeset_reg;
+	u32 pwm_modeset_mask;
+	u32 lp_modeget_reg;
+	u32 lp_modeget_mask;
+	u32 lp_modeset_reg;
+	u32 lp_modeset_mask;
+};
+
+#define MT6392_BUCK(match, vreg, supply, min, max, step, volt_ranges,	\
+	_qi_status_reg, _qi_status_mask, _enable_reg, _enable_mask,	\
+	_vselctrl_reg, _vselctrl_mask,					\
+	_vsel_reg_mode_reg, _vsel_reg_mode_mask,			\
+	_vsel_normal_mode_reg, _vsel_normal_mode_mask,			\
+	_pwm_modeset_reg, _pwm_modeset_mask, _ramp_delay)		\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.of_map_mode = mt6392_map_mode,				\
+		.ramp_delay = _ramp_delay,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.vselctrl_reg = _vselctrl_reg,					\
+	.vselctrl_mask = _vselctrl_mask,				\
+	.vsel_reg_mode_reg = _vsel_reg_mode_reg,			\
+	.vsel_reg_mode_mask = _vsel_reg_mode_mask,			\
+	.vsel_normal_mode_reg = _vsel_normal_mode_reg,			\
+	.vsel_normal_mode_mask = _vsel_normal_mode_mask,		\
+	.pwm_modeset_reg = _pwm_modeset_reg,				\
+	.pwm_modeset_mask = _pwm_modeset_mask,				\
+}
+
+#define MT6392_LDO(match, vreg, supply, ldo_volt_table,			\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_vsel_reg, _vsel_mask,						\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = _vsel_reg,					\
+		.vsel_mask = _vsel_mask,				\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+		.of_map_mode = mt6392_map_mode,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_LDO_LINEAR(match, vreg, supply, min, max, step,		\
+	volt_ranges,							\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_vsel_reg, _vsel_mask,						\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_ldo_range_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = _vsel_reg,					\
+		.vsel_mask = _vsel_mask,				\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+		.of_map_mode = mt6392_map_mode,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_REG_FIXED(match, vreg, supply, volt,			\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+		.of_map_mode = mt6392_map_mode,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_REG_FIXED_NO_MODE(match, vreg, supply, volt,		\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask, _enable_time)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_no_mode_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+}
+
+#define MT6392_REG(match, vreg, supply, volt)				\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_no_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+	},								\
+}
+
+static const struct linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
+};
+
+static const struct linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
+};
+
+static const u32 ldo_volt_table1[] = {
+	1800000, 1900000, 2000000, 2200000,
+};
+
+static const struct linear_range ldo_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(3300000, 0, 3, 100000),
+};
+
+static const u32 ldo_volt_table3[] = {
+	1800000, 3300000,
+};
+
+static const u32 ldo_volt_table4[] = {
+	3000000, 3300000,
+};
+
+static const u32 ldo_volt_table5[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6[] = {
+	1240000, 1390000,
+};
+
+static const u32 ldo_volt_table7[] = {
+	1200000, 1300000, 1500000, 1800000,
+};
+
+static const u32 ldo_volt_table8[] = {
+	1800000, 2000000,
+};
+
+static unsigned int mt6392_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case MT6392_REGULATOR_MODE_NORMAL:
+		return REGULATOR_MODE_NORMAL;
+	case MT6392_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case MT6392_LDO_MODE_LP:
+		return REGULATOR_MODE_STANDBY;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->pwm_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n", info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		val = 1;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->pwm_modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->pwm_modeset_reg,
+				 info->pwm_modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_buck_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->pwm_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n", info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->pwm_modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->pwm_modeset_mask;
+	val >>= ffs(info->pwm_modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_FAST;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->lp_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val = 1;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->lp_modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->lp_modeset_reg,
+				 info->lp_modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_ldo_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->lp_modeget_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->lp_modeget_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->lp_modeget_mask;
+	val >>= ffs(info->lp_modeget_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_get_status(struct regulator_dev *rdev)
+{
+	int ret;
+	u32 regval;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->qi_status_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev, "Failed to read qi_status_reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi_status_mask) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static const struct regulator_ops mt6392_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_buck_set_mode,
+	.get_mode = mt6392_buck_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_ldo_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_no_mode_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+};
+
+static const struct regulator_ops mt6392_volt_no_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+};
+
+/* The array is indexed by id(MT6392_ID_XXX) */
+static struct mt6392_regulator_info mt6392_regulators[] = {
+	MT6392_BUCK("vproc", VPROC, "vproc", 700000, 1493750, 6250,
+		    buck_volt_range1,
+		    MT6392_VPROC_CON7, BIT(13), // Regulator status
+		    MT6392_VPROC_CON7, BIT(0),  // Regulator enable
+		    MT6392_VPROC_CON5, BIT(1),  // Vsel ctrl mode selector,not present in data sheet
+		    MT6392_VPROC_CON9, GENMASK(6, 0),  // Vsel when control mode = register (0)
+		    MT6392_VPROC_CON10, GENMASK(6, 0), // Vsel when control mode = normal (1)
+		    MT6392_VPROC_CON2, BIT(8),  // Auto / Force PWM mode
+		    12500),
+	MT6392_BUCK("vsys", VSYS, "vsys", 1400000, 2987500, 12500,
+		    buck_volt_range2,
+		    MT6392_VSYS_CON7, BIT(13),
+		    MT6392_VSYS_CON7, BIT(0),
+		    MT6392_VSYS_CON5, BIT(1), // Not present in data sheet
+		    MT6392_VSYS_CON9, GENMASK(6, 0),
+		    MT6392_VSYS_CON10, GENMASK(6, 0),
+		    MT6392_VSYS_CON2, BIT(8),
+		    25000),
+	MT6392_BUCK("vcore", VCORE, "vcore", 700000, 1493750, 6250,
+		    buck_volt_range1,
+		    MT6392_VCORE_CON7, BIT(13),
+		    MT6392_VCORE_CON7, BIT(0),
+		    MT6392_VCORE_CON5, BIT(1), // Not present in data sheet
+		    MT6392_VCORE_CON9, GENMASK(6, 0),
+		    MT6392_VCORE_CON10, GENMASK(6, 0),
+		    MT6392_VCORE_CON2, BIT(8),
+		    12500),
+
+	MT6392_REG_FIXED("vxo22", VXO22, "ldo1", 2200000,
+			 MT6392_ANALDO_CON1, BIT(15),
+			 MT6392_ANALDO_CON1, BIT(10), // Not present in data sheet
+			 MT6392_ANALDO_CON1, BIT(7),
+			 MT6392_ANALDO_CON1, BIT(1), // Not present in data sheet
+			 110),
+	MT6392_LDO("vaud22", VAUD22, "ldo1", ldo_volt_table1,
+		   MT6392_ANALDO_CON2, BIT(15),
+		   MT6392_ANALDO_CON2, BIT(14), // Not present in data sheet
+		   MT6392_ANALDO_CON8, GENMASK(6, 5), // Not present in data sheet
+		   MT6392_ANALDO_CON2, BIT(7),
+		   MT6392_ANALDO_CON2, BIT(1),  // Not present in data sheet
+		   264),
+	MT6392_REG_FIXED_NO_MODE("vcama", VCAMA, "ldo1", 2800000,
+				 MT6392_ANALDO_CON4, BIT(15),
+				 MT6392_ANALDO_CON4, BIT(15),
+				 264),
+	MT6392_REG_FIXED("vaud28", VAUD28, "ldo1", 2800000,
+			 MT6392_ANALDO_CON23, BIT(15),
+			 MT6392_ANALDO_CON23, BIT(14), // Not present in data sheet
+			 MT6392_ANALDO_CON23, BIT(7),
+			 MT6392_ANALDO_CON23, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vadc18", VADC18, "ldo1", 1800000,
+			 MT6392_ANALDO_CON25, BIT(15),
+			 MT6392_ANALDO_CON25, BIT(14), // Not present in data sheet
+			 MT6392_ANALDO_CON25, BIT(7),
+			 MT6392_ANALDO_CON25, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO_LINEAR("vcn35", VCN35, "ldo2", 3300000, 3600000, 100000, ldo_volt_range2,
+			  MT6392_ANALDO_CON17, BIT(15), // Not present in data sheet
+			  MT6392_ANALDO_CON21, BIT(12), // Not present in data sheet
+			  MT6392_ANALDO_CON16, GENMASK(4, 3),
+			  MT6392_ANALDO_CON21, BIT(7),
+			  MT6392_ANALDO_CON21, BIT(1), // Not present in data sheet
+			  264),
+	MT6392_REG_FIXED("vio28", VIO28, "ldo2", 2800000,
+			 MT6392_DIGLDO_CON0, BIT(15),
+			 MT6392_DIGLDO_CON0, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON0, BIT(7),
+			 MT6392_DIGLDO_CON0, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vusb", VUSB, "ldo3", 3300000,
+			 MT6392_DIGLDO_CON2, BIT(15),
+			 MT6392_DIGLDO_CON2, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON2, BIT(7),
+			 MT6392_DIGLDO_CON2, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vmc", VMC, "ldo2", ldo_volt_table3,
+		   MT6392_DIGLDO_CON3, BIT(15),
+		   MT6392_DIGLDO_CON3, BIT(12),
+		   MT6392_DIGLDO_CON24, BIT(4),
+		   MT6392_DIGLDO_CON3, BIT(7),
+		   MT6392_DIGLDO_CON3, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vmch", VMCH, "ldo2", ldo_volt_table4,
+		   MT6392_DIGLDO_CON5, BIT(15),
+		   MT6392_DIGLDO_CON5, BIT(14),
+		   MT6392_DIGLDO_CON26, BIT(7),
+		   MT6392_DIGLDO_CON5, BIT(7),
+		   MT6392_DIGLDO_CON5, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vemc3v3", VEMC3V3, "ldo3", ldo_volt_table4,
+		   MT6392_DIGLDO_CON6, BIT(15),
+		   MT6392_DIGLDO_CON6, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON27, BIT(7),
+		   MT6392_DIGLDO_CON6, BIT(7),
+		   MT6392_DIGLDO_CON6, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vgp1", VGP1, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON7, BIT(15),
+		   MT6392_DIGLDO_CON7, BIT(15),
+		   MT6392_DIGLDO_CON28, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON7, BIT(7),
+		   MT6392_DIGLDO_CON7, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vgp2", VGP2, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON8, BIT(15),
+		   MT6392_DIGLDO_CON8, BIT(15),
+		   MT6392_DIGLDO_CON29, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON8, BIT(7),
+		   MT6392_DIGLDO_CON8, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_REG_FIXED("vcn18", VCN18, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON11, BIT(15),
+			 MT6392_DIGLDO_CON11, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON11, BIT(7),
+			 MT6392_DIGLDO_CON11, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vcamaf", VCAMAF, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON31, BIT(15),
+		   MT6392_DIGLDO_CON31, BIT(15),
+		   MT6392_DIGLDO_CON32, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON31, BIT(7),
+		   MT6392_DIGLDO_CON31, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vm", VM, "avddldo", ldo_volt_table6,
+		   MT6392_DIGLDO_CON47, BIT(15),
+		   MT6392_DIGLDO_CON47, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON48, GENMASK(5, 4), // Not present in data sheet
+		   MT6392_DIGLDO_CON47, BIT(7), // Not present in data sheet
+		   MT6392_DIGLDO_CON47, BIT(1),
+		   264),
+	MT6392_REG_FIXED("vio18", VIO18, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON49, BIT(15),
+			 MT6392_DIGLDO_CON49, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON49, BIT(7),
+			 MT6392_DIGLDO_CON49, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vcamd", VCAMD, "avddldo", ldo_volt_table7,
+		   MT6392_DIGLDO_CON51, BIT(15),
+		   MT6392_DIGLDO_CON51, BIT(14),
+		   MT6392_DIGLDO_CON52, GENMASK(6, 5),
+		   MT6392_DIGLDO_CON51, BIT(7),
+		   MT6392_DIGLDO_CON51, BIT(1),
+		   264),
+	MT6392_REG_FIXED("vcamio", VCAMIO, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON53, BIT(15),
+			 MT6392_DIGLDO_CON53, BIT(14),
+			 MT6392_DIGLDO_CON53, BIT(7),
+			 MT6392_DIGLDO_CON53, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vm25", VM25, "ldo3", 2500000,
+			 MT6392_DIGLDO_CON55, BIT(15),
+			 MT6392_DIGLDO_CON55, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON55, BIT(7),
+			 MT6392_DIGLDO_CON55, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vefuse", VEFUSE, "ldo2", ldo_volt_table8,
+		   MT6392_DIGLDO_CON57, BIT(15),
+		   MT6392_DIGLDO_CON57, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON58, BIT(5), // Not present in data sheet
+		   MT6392_DIGLDO_CON57, BIT(7),
+		   MT6392_DIGLDO_CON57, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_REG("vdig18", VDIG18, "ldo2", 1800000), // Internal non changeable regulator
+	MT6392_REG_FIXED_NO_MODE("vrtc", VRTC, "ldo1", 2800000,
+				 MT6392_DIGLDO_CON15, BIT(15),
+				 MT6392_DIGLDO_CON15, BIT(8), // Not present in data sheet
+				 264)
+};
+
+// Buck regulators can be in Register mode or Normal mode.
+// Each mode uses a different register to set the desired voltage.
+static int mt6392_set_buck_vsel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		if (mt6392_regulators[i].vselctrl_reg) {
+			// Read the vselctrl_reg register
+			if (regmap_read(mt6392->regmap,
+					mt6392_regulators[i].vselctrl_reg,
+					&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			// vselctrl_reg[vselctrl_mask] defines the mode
+			if (regval & mt6392_regulators[i].vselctrl_mask) {
+				// Regulator in Normal mode
+				mt6392_regulators[i].desc.vsel_reg =
+					mt6392_regulators[i].vsel_normal_mode_reg;
+				mt6392_regulators[i].desc.vsel_mask =
+					mt6392_regulators[i].vsel_normal_mode_mask;
+			} else {
+				// Regulator in Register mode
+				mt6392_regulators[i].desc.vsel_reg =
+					mt6392_regulators[i].vsel_reg_mode_reg;
+				mt6392_regulators[i].desc.vsel_mask =
+					mt6392_regulators[i].vsel_reg_mode_mask;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6392_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	// Initialize the bucks' vsel_reg and vsel_mask according to current HW state
+	if (mt6392_set_buck_vsel_reg(pdev))
+		return -EIO;
+
+	config.dev = mt6392->dev;
+	config.regmap = mt6392->regmap;
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		config.driver_data = &mt6392_regulators[i];
+
+		rdev = devm_regulator_register(&pdev->dev,
+					       &mt6392_regulators[i].desc,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				mt6392_regulators[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id mt6392_platform_ids[] = {
+	{ .name = "mt6392-regulator" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6392_platform_ids);
+
+static struct platform_driver mt6392_regulator_driver = {
+	.driver = {
+		.name = "mt6392-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = mt6392_regulator_probe,
+	.id_table = mt6392_platform_ids,
+};
+
+module_platform_driver(mt6392_regulator_driver);
+
+MODULE_AUTHOR("Chen Zhong <chen.zhong@mediatek.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6392 PMIC");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/mt6392-regulator.h b/include/linux/regulator/mt6392-regulator.h
new file mode 100644
index 000000000000..0eccd085b062
--- /dev/null
+++ b/include/linux/regulator/mt6392-regulator.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ */
+
+#ifndef __LINUX_REGULATOR_MT6392_H
+#define __LINUX_REGULATOR_MT6392_H
+
+enum {
+	MT6392_ID_VPROC = 0,
+	MT6392_ID_VSYS,
+	MT6392_ID_VCORE,
+	MT6392_ID_VXO22,
+	MT6392_ID_VAUD22,
+	MT6392_ID_VCAMA,
+	MT6392_ID_VAUD28,
+	MT6392_ID_VADC18,
+	MT6392_ID_VCN35,
+	MT6392_ID_VIO28,
+	MT6392_ID_VUSB = 10,
+	MT6392_ID_VMC,
+	MT6392_ID_VMCH,
+	MT6392_ID_VEMC3V3,
+	MT6392_ID_VGP1,
+	MT6392_ID_VGP2,
+	MT6392_ID_VCN18,
+	MT6392_ID_VCAMAF,
+	MT6392_ID_VM,
+	MT6392_ID_VIO18,
+	MT6392_ID_VCAMD,
+	MT6392_ID_VCAMIO,
+	MT6392_ID_VM25,
+	MT6392_ID_VEFUSE,
+	MT6392_ID_VDIG18,
+	MT6392_ID_VRTC,
+	MT6392_ID_RG_MAX,
+};
+
+#define MT6392_MAX_REGULATOR	MT6392_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6392_H */
-- 
2.43.0


