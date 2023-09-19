Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E9CD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgL7bVCmTeXSAUxRJPsWW6VflSxwxTKu8gD+M41yTns=; b=cDwO7T67DEJAcSZLZxHfzvmQVM
	jiCKFLNTbdXkOuCyWml2tZH+sgB5Vvr0nAK4gHf5RIxOEG6bGq06tXhXBgbyfrbvnIg+MJxfEWr5z
	b3Y8Wx5zFhZzYueNZBGc9xqp7HjjMrckPrpraQNoZp6rWoi4fI7DNhBNqyUgyW8MbUp0tiXEOx3XX
	5nqebHAoMGkCyhqLIqXlogyYEGbzD63+B9yuDl433UQ+2GufRMRdr3F6WHrpOH/AJyBwFxYKAALyR
	pXxGkEB6wVxfwJLTpKd1Gef9ETtgGS5jyX7a59u8vkpRZ9X1K1UD0TgbWodXxwkHKK7K49agQujHe
	SxXn7SSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYHD-0005Jw-2h;
	Tue, 19 Sep 2023 10:48:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGi-0004lJ-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c39f2b4f5aso39944535ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120467; x=1695725267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgL7bVCmTeXSAUxRJPsWW6VflSxwxTKu8gD+M41yTns=;
        b=QH8zEzvTtClp3lIifHyL3LTtxtSdiCLoZIGBtxGK31XChMgd0mc3kfKXAqPunY4YB6
         gbcYWtD5ZKmlKW9V/7s5EZFc/6h6tHBoxphXWu6Ct06zDtkOiQdew5F3RiAm9gnuJqMo
         JjE3bEtlMQz2td1vOqVMCJ+dWRSw+XyYMPEjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120467; x=1695725267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgL7bVCmTeXSAUxRJPsWW6VflSxwxTKu8gD+M41yTns=;
        b=JJRhBLsP46WSfbTfgxhJCvVh1vt6OvQdgGPGRR/lsTsFPHp1Y3++sxvNQzjSEJDQuW
         HBg4bJzyZsUFQ6z7ZcVWFV19hQHpbLDZb7FXW2brVGZDeZiOhoZZE6ZEx5BKmmNoVFXb
         R4fN4sDDuvMrqcghjYFoBrsePl97g0sKUAyHBIBPkBxzlRsihq94xHHGS1tbYJXGvTcb
         FD/VcSwzvjsvq6GIaGvbBh2vnOyxX1k/9ddbV2eAvjOE2FEZEYzqqqplnazEuvLtkk7Z
         Sn8FbMhnXHRZD3YvEXFgnB9lH2kfy6iLfE1wfS72V5jtgA7xgya/qSbaQlhMzwSoJrCf
         Yh0Q==
X-Gm-Message-State: AOJu0YzvUiAO5Z6pdj2yZFPDbu3rkiI7PULqwsMz3QXfS7ZlChWgNE9r
	QuZhoaiFb6Qz41O/cWOaXwSA3g==
X-Google-Smtp-Source: AGHT+IFplgVxrIR06V2bVySXAOitXyoTokakgA3Y/GdbyCeDXtXSoOdxb5QtMFQuHjFRcC1bH76SvA==
X-Received: by 2002:a17:902:db0b:b0:1c4:5c05:c3c9 with SMTP id m11-20020a170902db0b00b001c45c05c3c9mr7490890plx.56.1695120467676;
        Tue, 19 Sep 2023 03:47:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/12] regulator: mt6358: Make MT6366 vcn18 LDO configurable
Date: Tue, 19 Sep 2023 18:43:52 +0800
Message-ID: <20230919104357.3971512-10-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034748_268794_57CFFCE8 
X-CRM114-Status: GOOD (  13.88  )
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
---
Changes since v2:
- Linear range selector values fixed

Angelo's reviewed-by was dropped.

 drivers/regulator/mt6358-regulator.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 7122ad43be6e..fdd4710d57d8 100644
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
@@ -553,7 +574,6 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 			 MT6358_LDO_VRF12_CON0, 0, 1200000),
 	MT6366_REG_FIXED("vio18", VIO18,
 			 MT6358_LDO_VIO18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
 	MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
@@ -586,6 +606,8 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
 	MT6366_LDO("vsim2", VSIM2, vsim,
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
+	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18,
+		   MT6358_LDO_VCN18_CON0, 0, MT6358_VCN18_ANA_CON0, 0xf00),
 	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
 	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
-- 
2.42.0.459.ge4e396fd5e-goog


