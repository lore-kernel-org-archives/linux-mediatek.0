Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78552D2502E
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIKMKN6QFHr6EqY/ECHzWAxzBkTh2Ff/RJPfOUt5Dro=; b=wyQTIv+amlU85g/guhCWq9eOvB
	UPSqKHhAZY5ozm6Zm3DJnVKbsg5wWSthEy4bRfXZ1Hwz4V/aLoLHD5kFQk+mWiQqse3/NIS9LRqNo
	R6QarvTq+LWpKv03yUhGS9oZtSrpfmI8+RSq8WEDng9ixw5c0ev/CNwuRd99q1wN9q97UMY0tM19W
	+euYzieBkTEaAk8lMiVhtVpaxEQhnulB7cBNc9UUOsded/WocCcFpeXewZfInFfqhSvxe3o0aNYq1
	YDLZoZAnh5LVThK+KO5aVP9/evYve08rmlxVfS8jgcDASRQ2iuWFY7RU52EGmJ88JTnXmWOFTqn1m
	PbsHTjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verkh-0000000440x-05L2;
	Sun, 11 Jan 2026 09:28:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verke-0000000440W-41CG
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Jan 2026 09:28:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0833b5aeeso55844285ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768123728; x=1768728528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIKMKN6QFHr6EqY/ECHzWAxzBkTh2Ff/RJPfOUt5Dro=;
        b=BvHzOjD6fB250Tgg+HZ+ZM0Lk7I5+PqYLOGPmXVss1DKl7/UEYV2+DJc1HhK/BnrSO
         lJt5ZIVseRMO1xSQNBGa3BNdyhk/duirpVEezW77WtsN3ILLTeVYQP5j3XfiJ2ogb8v9
         GyNS3BaTH+wlLBcFh2BRiaI5yQJmLgdc41Z48HRq0KsjEmHLPXqHyFLeBAGTPN1sfxtS
         vM36kGf78syaiG7KwDtej8ZWC/DNrvi6RS7ofuxy1bAHHO+jfUYsJh/Nton7Fq5MaSel
         zB6rk+3d20JxHJpKHLWVUYOEf4nvE2FDl1poBJHp+rizRuMfE3Lk7H2AMupPRGdGJg3F
         mjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768123728; x=1768728528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIKMKN6QFHr6EqY/ECHzWAxzBkTh2Ff/RJPfOUt5Dro=;
        b=Lb0J1rfcHVjg4k9ocD5YdKwDnJPoU61doqDdSMb5F6Ntok5D0y+lXax6rfbYLsz6/p
         Wj202i7wZHIH9azj9+x4MmYZ4WtZ7L3bOetMwDSCULUeh577/FbWhgDOe1MlBDdPi+6X
         udZr+XzY0W6UyMpAge4uyCVADxE362HVJoIbP730sFncwduUHLn6PUFMDROhPqUqJoX4
         YKm+b//3J8mzkNmT7zmdAaos+FUnnhCx408Nfd1q9Bc5FK78AEqbi3gI8BXQxFSNksRH
         k3J5PNUofidEP33k+yrg0fu1hjfwYd181B6jAV6OI8qQkbAb0BCqxArnHWNeMgGRs4rO
         NzdA==
X-Forwarded-Encrypted: i=1; AJvYcCVHzoMQwo3a/2iDU++DbA/+MNKchcHjSzzIXiQJaNGHq16YKzyRJhvcZJx22L6z3NqbeoAWjuLVtoJQladrEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBBw6A7PZa5oAyep/gTIWHnC+YH5FYr8dTvDWDgay+W+3pAJ55
	tKsMhK/+wraOnm1ga9H8gifZIEH0Upga24zxDN6usgwswRlHfiIn41ca
X-Gm-Gg: AY/fxX5XRiYDhmdhbLSAVwEkewDMxaPi2k/+W4N49S2P7Yb25meBWadSIz2pvWgJrAc
	zIdYaJVyuTrPT8V+5OzHyZmwDBUD8HlDK08jPID7HJEks47NrijFkLby/1ic+IRT7+c1Sxwsd0t
	d5HAAYHKkhv5D66040hAcgZB/7wyZzEwtpKd0EIkVNG9MCnemn46SnSwOWNTDiVV8c4Z/5KSsuM
	HYYJmlggLE7u2tTJObuutflb0BBcPJgmGMHfJ0m9Eqyo8rPlY/p9FpKE577xTIz+gQ9+zmr3zWS
	RoIofhdPjaKhBbh2K7iqugCW/vVaK5cBpadUFqlIEBB1ki4lyj5QavdOZo/IfoxBRTNPblmCvpu
	x+7lPvKjSzrlRdtsfpAgWZFX1qjIYbeWHV/z6efgRUL+96VdUQMXTMlpRyauY90gijrX8732l5x
	X5Z7gx5pECwm/JYwU4BNfJbruTGkRWpS6mjti+CeNJhA==
X-Google-Smtp-Source: AGHT+IEJ/FbXXc/W91Nm3epFjERPTqN9veRIMdbS0ijFvD1zFZobV8UDkKuLZAuLycyGes9TjI0tpQ==
X-Received: by 2002:a17:903:238a:b0:2a0:8358:88f8 with SMTP id d9443c01a7336-2a3ee444a0bmr134655055ad.22.1768123727669;
        Sun, 11 Jan 2026 01:28:47 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm143851625ad.88.2026.01.11.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 01:28:47 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org (moderated list:PIN CONTROLLER - MEDIATEK),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] pinctrl: mediatek: common-v1: introduce per-function multibase control
Date: Sun, 11 Jan 2026 18:28:31 +0900
Message-ID: <20260111092833.466263-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_012849_110774_C3046687 
X-CRM114-Status: GOOD (  21.04  )
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

The current common-v1 framework implicitly assumes that certain
register operations might span across multiple base addresses. This
logic is currently hardcoded in mtk_get_regmap, where any pin falling
within the [type1_start, type1_end) range is redirected to regmap2.

This approach is suboptimal for two reasons:
1. It forces all SoCs except MT8135 to define dummy type1_start/end values
   (set to the last pin number + 1) to avoid unintended regmap switching,
   which is non-intuitive and cluttering the SoC data.
2. It assumes most register types (DRV, IES, SMT, etc.) follow the same
   splitting rule, even though hardware design might only require it for
   specific functional registers.

Refactor the framework by introducing explicit '[func]_multibase' flags
for each register category in struct mtk_pinctrl_devdata. This allows
each SoC to explicitly declare which operations require multiple bases.

For MT8135, which is currently the only multipre regmap user, enable
needed multibase flags to keep existing behavior.

For other SoCs, multibase flags will default to false, removing the need
for fragile range-based workarounds and making the regmap selection logic
more robust and explicit. Also, delete type1_start and type1_end, which
are no longer needed by this refactor, from struct mtk_pinctrl_devdata.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  8 +++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  2 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 62 ++++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  9 +++
 11 files changed, 57 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
index 6b1c7122b0fb..30bec29de9bd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
@@ -504,8 +504,6 @@ static const struct mtk_pinctrl_devdata mt2701_pinctrl_data = {
 	.dout_offset = 0x0500,
 	.din_offset = 0x0630,
 	.pinmux_offset = 0x0760,
-	.type1_start = 280,
-	.type1_end = 280,
 	.port_shf = 4,
 	.port_mask = 0x1f,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
index bb7394ae252b..eb6ecaa72679 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
@@ -553,8 +553,6 @@ static const struct mtk_pinctrl_devdata mt2712_pinctrl_data = {
 	.dout_offset = 0x0300,
 	.din_offset = 0x0400,
 	.pinmux_offset = 0x0500,
-	.type1_start = 210,
-	.type1_end = 210,
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 03d0f65d7bcc..af5f48039895 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -27,8 +27,6 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
 	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
 	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
-	.type1_start = 41,
-	.type1_end = 41,
 	.port_shf = 3,
 	.port_mask = 0x3,
 	.port_align = 2,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index f5030a9ea40b..1ec1ddb317c3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -272,8 +272,6 @@ static const struct mtk_pinctrl_devdata mt8127_pinctrl_data = {
 	.dout_offset = 0x0400,
 	.din_offset = 0x0500,
 	.pinmux_offset = 0x0600,
-	.type1_start = 143,
-	.type1_end = 143,
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 77c6ac464e86..9c9689be33be 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -292,15 +292,23 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
 	.n_grp_cls = ARRAY_SIZE(mt8135_drv_grp),
 	.pin_drv_grp = mt8135_pin_drv,
 	.n_pin_drv_grps = ARRAY_SIZE(mt8135_pin_drv),
+	.drv_multibase = true,
 	.spec_pull_set = spec_pull_set,
 	.dir_offset = 0x0000,
+	.dir_multibase = true,
 	.ies_offset = 0x0100,
+	.ies_multibase = true,
 	.pullen_offset = 0x0200,
+	.pullen_multibase = true,
 	.smt_offset = 0x0300,
+	.smt_multibase = true,
 	.pullsel_offset = 0x0400,
+	.pullsel_multibase = true,
 	.dout_offset = 0x0800,
+	.dout_multibase = true,
 	.din_offset = 0x0A00,
 	.pinmux_offset = 0x0C00,
+	.pinmux_multibase = true,
 	.type1_start = 34,
 	.type1_end = 149,
 	.port_shf = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index 143c26622272..27dfaabbf41e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -305,8 +305,6 @@ static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
 	.dout_offset = 0x0100,
 	.din_offset = 0x0200,
 	.pinmux_offset = 0x0300,
-	.type1_start = 125,
-	.type1_end = 125,
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index b214deeafbf1..cc1ad8963502 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -313,8 +313,6 @@ static const struct mtk_pinctrl_devdata mt8173_pinctrl_data = {
 	.dout_offset = 0x0400,
 	.din_offset = 0x0500,
 	.pinmux_offset = 0x0600,
-	.type1_start = 135,
-	.type1_end = 135,
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index e3e0d66cfbbf..b793caac5773 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -457,8 +457,6 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.pullen_offset = 0x0860,
 	.pullsel_offset = 0x0900,
 	.drv_offset = 0x0710,
-	.type1_start = 145,
-	.type1_end = 145,
 	.port_shf = 4,
 	.port_mask = 0x1f,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index abda75d4354e..c91e5f001c10 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -305,8 +305,6 @@ static const struct mtk_pinctrl_devdata mt8516_pinctrl_data = {
 	.dout_offset = 0x0100,
 	.din_offset = 0x0200,
 	.pinmux_offset = 0x0300,
-	.type1_start = 125,
-	.type1_end = 125,
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d6a46fe0cda8..032944184a07 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -42,14 +42,15 @@ static const char * const mtk_gpio_functions[] = {
 };
 
 /*
- * There are two base address for pull related configuration
- * in mt8135, and different GPIO pins use different base address.
- * When pin number greater than type1_start and less than type1_end,
- * should use the second base address.
+ * Some chips (e.g., mt8135) have multiple base addresses for pin configuration.
+ * When multibase is true and the pin number falls within the specified range
+ * [type1_start, type1_end), the second base address should be used.
  */
 static struct regmap *mtk_get_regmap(struct mtk_pinctrl *pctl,
-		unsigned long pin)
+		unsigned long pin, bool multibase)
 {
+	if (!multibase)
+		return pctl->regmap1;
 	if (pin >= pctl->devdata->type1_start && pin < pctl->devdata->type1_end)
 		return pctl->regmap2;
 	return pctl->regmap1;
@@ -82,7 +83,8 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	else
 		reg_addr = SET_ADDR(reg_addr, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	regmap_write(mtk_get_regmap(pctl, offset, pctl->devdata->dir_multibase),
+		     reg_addr, bit);
 	return 0;
 }
 
@@ -100,7 +102,8 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		reg_addr = CLR_ADDR(reg_addr, pctl);
 
-	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	return regmap_write(mtk_get_regmap(pctl, offset, pctl->devdata->dout_multibase),
+			    reg_addr, bit);
 }
 
 static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
@@ -108,6 +111,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 {
 	unsigned int reg_addr, offset;
 	unsigned int bit;
+	bool multibase;
 
 	/**
 	 * Due to some soc are not support ies/smt config, add this special
@@ -123,12 +127,18 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			arg == PIN_CONFIG_INPUT_SCHMITT_ENABLE)
 		return -EINVAL;
 
+	if (arg == PIN_CONFIG_INPUT_ENABLE)
+		multibase = pctl->devdata->ies_multibase;
+	else
+		multibase = pctl->devdata->smt_multibase;
+
 	/*
 	 * Due to some pins are irregular, their input enable and smt
 	 * control register are discontinuous, so we need this special handle.
 	 */
 	if (pctl->devdata->spec_ies_smt_set) {
-		return pctl->devdata->spec_ies_smt_set(mtk_get_regmap(pctl, pin),
+		return pctl->devdata->spec_ies_smt_set(
+			mtk_get_regmap(pctl, pin, multibase),
 			pctl->devdata, pin, value, arg);
 	}
 
@@ -144,7 +154,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 	else
 		reg_addr = CLR_ADDR(mtk_get_port(pctl, pin) + offset, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, pin), reg_addr, bit);
+	regmap_write(mtk_get_regmap(pctl, pin, multibase), reg_addr, bit);
 	return 0;
 }
 
@@ -229,7 +239,8 @@ static int mtk_pconf_set_driving(struct mtk_pinctrl *pctl,
 		shift = pin_drv->bit + drv_grp->low_bit;
 		mask <<= shift;
 		val <<= shift;
-		return regmap_update_bits(mtk_get_regmap(pctl, pin),
+		return regmap_update_bits(
+				mtk_get_regmap(pctl, pin, pctl->devdata->drv_multibase),
 				pin_drv->offset, mask, val);
 	}
 
@@ -314,9 +325,9 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		 * the parameter should be "MTK_PUPD_SET_R1R0_00".
 		 */
 		r1r0 = enable ? arg : MTK_PUPD_SET_R1R0_00;
-		ret = pctl->devdata->spec_pull_set(mtk_get_regmap(pctl, pin),
-						   pctl->devdata, pin, isup,
-						   r1r0);
+		ret = pctl->devdata->spec_pull_set(
+			mtk_get_regmap(pctl, pin, pctl->devdata->pullsel_multibase),
+			pctl->devdata, pin, isup, r1r0);
 		if (!ret)
 			return 0;
 	}
@@ -334,7 +345,8 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 			pctl->devdata->pullen_offset;
 		reg_pullsel = mtk_get_port(pctl, pin) +
 			pctl->devdata->pullsel_offset;
-		ret = pctl->devdata->mt8365_set_clr_mode(mtk_get_regmap(pctl, pin),
+		/* MT8365 do not use multibase. */
+		ret = pctl->devdata->mt8365_set_clr_mode(pctl->regmap1,
 			bit, reg_pullen, reg_pullsel,
 			enable, isup);
 		if (ret)
@@ -358,8 +370,10 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		reg_pullsel = CLR_ADDR(mtk_get_port(pctl, pin) +
 			pctl->devdata->pullsel_offset, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, pin), reg_pullen, bit);
-	regmap_write(mtk_get_regmap(pctl, pin), reg_pullsel, bit);
+	regmap_write(mtk_get_regmap(pctl, pin, pctl->devdata->pullen_multibase),
+		     reg_pullen, bit);
+	regmap_write(mtk_get_regmap(pctl, pin, pctl->devdata->pullsel_multibase),
+		     reg_pullsel, bit);
 	return 0;
 }
 
@@ -710,8 +724,9 @@ static int mtk_pmx_set_mode(struct pinctrl_dev *pctldev,
 	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
 	if (pctl->devdata->spec_pinmux_set)
-		pctl->devdata->spec_pinmux_set(mtk_get_regmap(pctl, pin),
-					pin, mode);
+		pctl->devdata->spec_pinmux_set(
+			mtk_get_regmap(pctl, pin, pctl->devdata->pinmux_multibase),
+			pin, mode);
 
 	reg_addr = ((pin / pctl->devdata->mode_per_reg) << pctl->devdata->port_shf)
 			+ pctl->devdata->pinmux_offset;
@@ -720,8 +735,9 @@ static int mtk_pmx_set_mode(struct pinctrl_dev *pctldev,
 	bit = pin % pctl->devdata->mode_per_reg;
 	mask <<= (GPIO_MODE_BITS * bit);
 	val = (mode << (GPIO_MODE_BITS * bit));
-	return regmap_update_bits(mtk_get_regmap(pctl, pin),
-			reg_addr, mask, val);
+	return regmap_update_bits(
+		mtk_get_regmap(pctl, pin, pctl->devdata->pinmux_multibase),
+		reg_addr, mask, val);
 }
 
 static const struct mtk_desc_pin *
@@ -832,7 +848,8 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	if (pctl->devdata->spec_dir_set)
 		pctl->devdata->spec_dir_set(&reg_addr, offset);
 
-	regmap_read(pctl->regmap1, reg_addr, &read_val);
+	regmap_read(mtk_get_regmap(pctl, offset, pctl->devdata->dir_multibase),
+		    reg_addr, &read_val);
 	if (read_val & bit)
 		return GPIO_LINE_DIRECTION_OUT;
 
@@ -850,7 +867,8 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
 		pctl->devdata->din_offset;
 
 	bit = BIT(offset & pctl->devdata->mode_mask);
-	regmap_read(pctl->regmap1, reg_addr, &read_val);
+	regmap_read(mtk_get_regmap(pctl, offset, pctl->devdata->din_multibase),
+		    reg_addr, &read_val);
 	return !!(read_val & bit);
 }
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 11afa12a96cb..1c5c956ff33b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -277,6 +277,15 @@ struct mtk_pinctrl_devdata {
 	unsigned int mode_mask;
 	unsigned int mode_per_reg;
 	unsigned int mode_shf;
+	bool dir_multibase;
+	bool ies_multibase;
+	bool smt_multibase;
+	bool pullen_multibase;
+	bool pullsel_multibase;
+	bool drv_multibase;
+	bool dout_multibase;
+	bool din_multibase;
+	bool pinmux_multibase;
 };
 
 struct mtk_pinctrl {
-- 
2.52.0


