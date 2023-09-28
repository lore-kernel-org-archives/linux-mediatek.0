Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE82CE7B0F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkJYdDv7vj4Uy20rk51h7r68X+BWwdYjEPU0JRU45tk=; b=Q9FYLna+m6Z+WsIvGzg17PVtIo
	czA6y9jZUHQmdi+nr+yEwtR9uevw2GWau0QmyD9o7Xe6VnS04ovHDIg3T49ey+WvyVhA5CvfMUY16
	smtQDDRp04H81KUHSBO1ZW1/UJMhK2JkFtU6PqqQ2lHrOeq1TCRaJ1WXxipR4/LutAxulBp8f24jN
	8PJOvg1Jd2b0EaJhuRcPB71yzhdZ6s/wxDB4tqHQerHg1rqRei89yf6UKZb7zBP6vcjLcVxpD1iYK
	bHEpINg7pEQX9rqXz9IUcxxuWwk3eWKEnarzDqWRxsKG/kf1WwztSI7hVaIn73cCkR69IQXGGzga0
	i5OWRu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmpb-002g2U-2B;
	Thu, 28 Sep 2023 08:57:11 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmol-002fZA-1w
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 08:56:21 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-77421a47db6so608672785a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695891377; x=1696496177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkJYdDv7vj4Uy20rk51h7r68X+BWwdYjEPU0JRU45tk=;
        b=i8DOvINyXqamuB9zU+O4qgHzlwGf2DFCN2w8SU8hhFxecGngbJC2f+98h4XUya4rnk
         1vjXtNQopXN1gfgSOLpP0Sd+EAELsin8W7qZFEuLj3OL8CRP2L4pjDoGdipV+VpG5C1a
         oY7ZfoE+8c6A/NNF6iDEOlWyLhxmoDvuCJTzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891377; x=1696496177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkJYdDv7vj4Uy20rk51h7r68X+BWwdYjEPU0JRU45tk=;
        b=dNTRb2KmbJ7HZhpGyKwwBfY1xMsjPjLeriAOveOdYxAtMZTsBmsqaMw9dZ4CFyiAF4
         8vW6geSvIEIkhROlbu1jvN9VRlqJgvmZf096Em/LxcaNfJi435f/ZLmL0SjJA/QkdPPP
         gzUIRX7Sw/hYPqPwFd20zKTGJ5c2vCnNczaF1KpGDsF6pJ9+jq11c2D6EkNcQ7N7hld6
         g8CMfHHKbVX/CsMfotFoTAMMUkpnpxl71jOqFakWEvYz8c2TC9iT2XyaGS22udE5M8H/
         FjtHqDymiTFU0zvkaiNgfXaQUoMV8ieI9sHHgUXgvVCF8jdxYp5Y77xUh337ua02K9vh
         z2dg==
X-Gm-Message-State: AOJu0Yw1lHGVJ9l8PrFKz2DC9Lz/gOOF77Wu19uj13vhx6zkPLiqaDM9
	O0GBuNJxAhTS+eLXEEsmdmc5ng==
X-Google-Smtp-Source: AGHT+IFJJUO5Hu6UJlnYtKh2hlhvcGkIEdCg29daSxtYpNQfNXcbnh8wqyTgQizr5sFN95VktY0cuQ==
X-Received: by 2002:a05:620a:25ce:b0:773:a229:5a4a with SMTP id y14-20020a05620a25ce00b00773a2295a4amr491245qko.25.1695891377265;
        Thu, 28 Sep 2023 01:56:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm1754016pfm.26.2023.09.28.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:56:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 09/12] regulator: mt6358: Make MT6366 vcn18 LDO configurable
Date: Thu, 28 Sep 2023 16:55:32 +0800
Message-ID: <20230928085537.3246669-10-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20230928085537.3246669-1-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_015619_685285_DD17A03F 
X-CRM114-Status: GOOD (  13.15  )
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

The VCN18 regulator on the MT6366 (only) actually has a wide
configurable range of voltages, even though its name suggests a fixed
output voltage.

Convert it from a fixed LDO to a configurable LDO. Its range of settings
is the same as the VM18 regulator, which is missing and will be added in
a subsequent patch.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 14ed728fba69..946f62242718 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -325,6 +325,27 @@ static const struct linear_range vldo28_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3000000, 0, 10, 10000),
 };
 
+static const unsigned int mt6366_vcn18_vm18_selectors[] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
+static const struct linear_range mt6366_vcn18_vm18_ranges[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(700000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(800000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(900000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1000000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1100000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1200000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1300000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1400000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1600000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1700000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1800000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(1900000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(2000000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(2100000, 0, 10, 10000),
+};
+
 static unsigned int mt6358_map_mode(unsigned int mode)
 {
 	return mode == MT6397_BUCK_MODE_AUTO ?
@@ -559,7 +580,6 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 			 MT6358_LDO_VRF12_CON0, 0, 1200000),
 	MT6366_REG_FIXED("vio18", VIO18,
 			 MT6358_LDO_VIO18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
 	MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
@@ -592,6 +612,8 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
 	MT6366_LDO("vsim2", VSIM2, vsim,
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
+	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18,
+		   MT6358_LDO_VCN18_CON0, 0, MT6358_VCN18_ANA_CON0, 0xf00),
 	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
 	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
-- 
2.42.0.582.g8ccd20d70d-goog


