Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF4CE79AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b2WIpX8UxaE2eUdENfJEhEi2DvYwtb84UnL6O0SUo1Q=; b=F3OUNQARkPGIdpayf6oE5VYXUA
	DP0u9UdJ87TQGthtJzCcUqaD/E4qHFBOMsX5m6ve4TPGPRbMMPGGXOwLSyzlZndg3tiSICQvX/POu
	ptBR3KqPgzDRqcSzBc1omfZbvsUjKv1PlYhtEjNde+2qfV2gXU/rwZFosEYWtjbtGQYq5K+0/P43I
	JO9Km3haD2L7QcnogYOJs5MxArbuZHWJDnlwNTQbQaXVauHsmhfUkKL5562O0+KzH+j5GShzpnFXb
	dGWZebTFz5eH/FJYMc3HunEgpcRBBni+R6RH3xWUKlJ5X0yaY+LBAPxEszY+tPxIOBJZt+hYd5iSd
	ssBoCr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisyy-002Lp2-2G;
	Wed, 20 Sep 2023 08:54:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisyv-002Lnm-1f
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 08:54:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68bed2c786eso5730760b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Sep 2023 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695200088; x=1695804888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2WIpX8UxaE2eUdENfJEhEi2DvYwtb84UnL6O0SUo1Q=;
        b=Pw6FPZDyRYyhDnjez0NXIFdqKobEF/Fi30Sgq2vuFsBYieNRnRY9R/7b3L5URYyhWh
         LdgizL+Zw3s2OBnC0TX6aI4PFHZMCXaHIhY5vKEX/PPryhZKYU5T6UaVt8hiJ4fBT3Km
         VTlMzTjHqMFkc6hf3hDqdRh3qr1CS022HMW+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695200088; x=1695804888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2WIpX8UxaE2eUdENfJEhEi2DvYwtb84UnL6O0SUo1Q=;
        b=fNxTPE6n1aIdyrnLakf56DQip15sxpDvyhM4ePnQzPU2QhwPnrzrL9uYveS5YgJd2M
         v+E5uVOK+d6QaWmXNi6G/tPa2tfnnYV3pHgqZ6bxlCXmbFxF6esy9qgSZhrHKEwZCveC
         QLUg5GdlFPbaLmmv6uVl6RH2WbLv6ArbjjfYP5LHTTum8UsETCpP7/B8kRnqg02gPZ6x
         +xZ2xm0Ebg9ESGjKYL60NEoWn7Z5T3naT9XYDspI2c6wY46uUXS2bxeFzxOgZrxzHwa+
         cT3XhOZXeS7IZVCl0c4Uc2jC4sycfEe2HT3Ypin/Z21+LRA3gT6zX8JILQQgCOOPmiTI
         sR+g==
X-Gm-Message-State: AOJu0Yw3uxL6O+zB2mbiJ2dgP/o4THoqU+Hrn5tUJJ52lbZBRou0GprA
	OLdq9UHThfUZHkmT5opU3Y33IQ==
X-Google-Smtp-Source: AGHT+IHVveuh+lATMhfAR9XUZNF/rqh9RwMphICIzbzgZrWEpzl1FQ9mTUPC9PSsdRJtmJ/PTbRk1w==
X-Received: by 2002:a05:6a20:138c:b0:157:e4c6:765f with SMTP id hn12-20020a056a20138c00b00157e4c6765fmr1744078pzc.36.1695200088426;
        Wed, 20 Sep 2023 01:54:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:88b9:ebf4:698b:cf09])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001b89466a5f4sm11340455plb.105.2023.09.20.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:54:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] regulator: mt6358: split ops for buck and linear range LDO regulators
Date: Wed, 20 Sep 2023 16:53:34 +0800
Message-ID: <20230920085336.136238-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_015449_599487_3F91E2F0 
X-CRM114-Status: GOOD (  13.37  )
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

The buck and linear range LDO (VSRAM_*) regulators share one set of ops.
This set includes support for get/set mode. However this only makes
sense for buck regulators, not LDOs. The callbacks were not checking
whether the register offset and/or mask for mode setting was valid or
not. This ends up making the kernel report "normal" mode operation for
the LDOs.

Create a new set of ops without the get/set mode callbacks for the
linear range LDO regulators.

Fixes: f67ff1bd58f0 ("regulator: mt6358: Add support for MT6358 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Create a new set of ops for the LDOs, as suggested by Mark
- Patch subject updated to match

 drivers/regulator/mt6358-regulator.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index b9cda2210c33..65fbd95f1dbb 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -43,7 +43,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
-		.ops = &mt6358_volt_range_ops,	\
+		.ops = &mt6358_buck_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,		\
 		.owner = THIS_MODULE,		\
@@ -139,7 +139,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
-		.ops = &mt6358_volt_range_ops,	\
+		.ops = &mt6358_buck_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6366_ID_##vreg,		\
 		.owner = THIS_MODULE,		\
@@ -450,7 +450,7 @@ static unsigned int mt6358_regulator_get_mode(struct regulator_dev *rdev)
 	}
 }
 
-static const struct regulator_ops mt6358_volt_range_ops = {
+static const struct regulator_ops mt6358_buck_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
@@ -464,6 +464,18 @@ static const struct regulator_ops mt6358_volt_range_ops = {
 	.get_mode = mt6358_regulator_get_mode,
 };
 
+static const struct regulator_ops mt6358_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = mt6358_get_buck_voltage_sel,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6358_get_status,
+};
+
 static const struct regulator_ops mt6358_volt_table_ops = {
 	.list_voltage = regulator_list_voltage_table,
 	.map_voltage = regulator_map_voltage_iterate,
-- 
2.42.0.459.ge4e396fd5e-goog


