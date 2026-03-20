Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA71093180
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlrekApKlUbwDKtk7HfgXJbBOeV6ri8Bu8y2Agz6uwA=; b=qGcwImzAOLzklt0lemSe95gDCb
	9dsgyIA4XC0UCWve63utHED4Ya8+lRjDIuSIu9/iqqzPcDuvJzVQDKGZIjUK92F+Vfe/5TfTMKDuN
	bDZuXGEt6D9A1KIUzlhsND+C0l0XUhx8RKiOn4QLT8MA0kSgTsIq0L8YmcglcoOx0iwB5/tJxDh/I
	BRd7Q2pJqgsc5vxnxfax5FAV2TnXUZmySqxYUA0LbZp2hLHNRYHY2sHxNGu1jK5PQivLqcPhyXJev
	8hEGq+PBbU8fhgI/vNoH+5C53YATQ+PM40aKJFVgRt+sxnelaBXVr5/KNeIvr4X64ENDz+0nlXa/a
	6c7jrxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UEN-0000000CFff-05qy;
	Fri, 20 Mar 2026 07:25:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UED-0000000CFa8-2wKr
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:25:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so15094b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991505; x=1774596305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlrekApKlUbwDKtk7HfgXJbBOeV6ri8Bu8y2Agz6uwA=;
        b=RlbucYwVg92I5DAwf3SsauBJFKxwqs6jKaJrt5VuJjSgOjHgr/otSMmC+JoZC3eDrZ
         M6bsKzCTo7AigCXOmLAvZzxQmY713PVjoon6Hgd8/0oclVV3MU3KZzNlaMZDyXtWQ5B7
         iQ776HrfELKWsPCmUl/n0J2kJzH0Kp0kti8Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991505; x=1774596305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlrekApKlUbwDKtk7HfgXJbBOeV6ri8Bu8y2Agz6uwA=;
        b=J7iVvHCLLXQsspjT1bU+lCuSjyJLEbqbNfOJlJsZFF7IP+Gp9cjeNtnqnUmzStfLQ+
         DIN/dPYDX6gnnf8yBF7TYWj9/+x8eCkQ2RU1DrbWaLlZqPFvbF8SofsBdtPZnKrr3gMm
         zisyMWF63EzwUcwZygb4Eql9uYMgnInYu5AToJiAh2Xgdt/WAzsmy7EBav/csPQ+oF2d
         8KrxQ+x/aS218poHasHqx/qOzsMdWqFOnj+4sWCvf0Bz0plKOgx/o7trOxa4gj5B55wg
         oXMvnASSqynZN2o28+Cs4SZn1DlbZHc/top+bHz0IjxHMH0SdFwKw6zg0LrsG14WFv7Q
         Fhtg==
X-Forwarded-Encrypted: i=1; AJvYcCXPYgUq2vYtU9CKGy0Rnw265zknsmq8ZUD0YwuPRcaG/G/sLE/vFBv96WXpXqQSLoIkmH3M9RSOENYYZMuWDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPkXkscrPp0/yBfbouXnufOZSgvXISS1CbWNpiLKuHkkcze5z4
	brppopXmNW9Ub4dQysfCgCm1CwNYCfq1eObQUWza65hgawM6CFv1vlsBjWqWTmphYA==
X-Gm-Gg: ATEYQzyjIij7CGPji4Yog7ZWEnI5Eum8s7YFCrXMP9dNfWd0Mr7ThIY0M06Tk00TMGB
	InAWPlpndWGRRZ1eVFYTgijNsR1Fd6brxxynC2V89tq+FlS4eRFSmuNyTzUxGC9eMiv/cWm3pw4
	ytpkamRYTBp2QTJ6nbTOr7BJCohbC08Kff7eXt55gLuEkwvdyMR3DGxUvJoy/ve/61HVNrbHoL+
	afPw5gOObkxUdCWNPK+om8yDmLFYwZ0Q/RhGN04vqQC3NLk1LngxsF74DsajLT2a6su4IGFtz9b
	cBR0yfZLw84cCF0MIb0Gd6OXwCMiMn7Mrz4dTDaNGavqBR0SFkTHXQ2Em9qTl9rtwLWfABXAVEh
	N/zT/q+kBbTG0pWaVBsRV5I8CAVxc+Lr+TrXg1MEsoy/dGpwTQ7u/+lp5Wa+6p0oQ5vVwbYikPG
	o96boU0hkHelTGtIruR976mFtudCPRZ2jbMQU74eTFx+pF3IDFijfAdUqJpFPonIV9ojFaU8ZeF
	areQW6Jhwp3ExByo+I=
X-Received: by 2002:a05:6a00:440e:b0:82a:8163:4c00 with SMTP id d2e1a72fcca58-82a8c251943mr1530228b3a.2.1773991504904;
        Fri, 20 Mar 2026 00:25:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:25:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] regulator: mt6359: Drop bogus vcn33_[12]_* split regulators
Date: Fri, 20 Mar 2026 15:24:37 +0800
Message-ID: <20260320072440.2403318-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072440.2403318-1-wenst@chromium.org>
References: <20260320072440.2403318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002505_753320_9BE25C0E 
X-CRM114-Status: GOOD (  20.19  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Unfortunately some of them are already referenced by in-tree device
trees. To keep backward compatibility with them, keep the vcn33_*_bt
regulator, and drop vcn33_*_wifi. Sync the enable bit from vcn33_*_wifi
to vcn33_*_bt at probe time, and clear the enable bit for vcn33_*_wifi.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6359-regulator.c       | 120 +++++++++++++++------
 include/linux/regulator/mt6359-regulator.h |   6 +-
 2 files changed, 92 insertions(+), 34 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index c8a788858824..dd3063949fb0 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -589,18 +589,13 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	/* name has "_bt" for backward compatibility */
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
@@ -637,18 +632,13 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
 		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	/* name has "_bt" for backward compatibility */
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
-		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
@@ -827,18 +817,13 @@ static struct mt6359_regulator_info mt6359p_regulators[] = {
 		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	/* name has "_bt" for backward compatibility */
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1, vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
-		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
-		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359P_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
@@ -877,18 +862,13 @@ static struct mt6359_regulator_info mt6359p_regulators[] = {
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	/* name has "_bt" for backward compatibility */
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2, vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
-		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
-		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
-		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
-		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, va12_voltages,
 		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
 		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
@@ -945,6 +925,83 @@ static struct mt6359_regulator_info mt6359p_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
 };
 
+struct mt6359_vcn33_regs {
+	u32 wifi_en_reg;
+	u32 wifi_en_mask;
+	u32 bt_en_reg;
+	u32 bt_en_mask;
+};
+
+static const struct mt6359_vcn33_regs vcn33_regs[][2] = {
+	{ /* MT6359 */
+		{
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}, { /* MT6359P */
+		{
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359_RG_LDO_VCN33_1_EN_0_SHIFT),
+		}, {
+			.wifi_en_reg = MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
+			.wifi_en_mask = BIT(MT6359_RG_LDO_VCN33_2_EN_1_SHIFT),
+			.bt_en_reg = MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
+			.bt_en_mask = BIT(MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT),
+		}
+	}
+};
+
+static int mt6359_sync_vcn33_setting(struct device *dev, unsigned int idx)
+{
+	struct mt6397_chip *mt6397 = dev_get_drvdata(dev->parent);
+	unsigned int val;
+	int ret;
+
+	/*
+	 * VCN33_[12]_WIFI and VCN33_[12]_BT are two separate enable bits for
+	 * the same regulator. They share the same voltage setting and output
+	 * pin. Instead of having two potentially conflicting regulators, just
+	 * have one regulator. Sync the two enable bits and only use one in
+	 * the regulator device.
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(vcn33_regs[0]); i++) {
+		u32 bt_en_mask = vcn33_regs[idx][i].bt_en_mask;
+		u32 wifi_en_mask = vcn33_regs[idx][i].wifi_en_mask;
+
+		ret = regmap_read(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg, &val);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read VCN33_%u_WIFI setting\n", i);
+
+		if (!(val & wifi_en_mask))
+			continue;
+
+		/* Sync VCN33_[12]_WIFI enable status to VCN33_[12]_BT */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].bt_en_reg,
+					 bt_en_mask, bt_en_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to sync VCN33_%u_WIFI setting to VCN33_%u_BT\n",
+					     i, i);
+
+		/* Disable VCN33_[12]_WIFI */
+		ret = regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg,
+					 wifi_en_mask, 0);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to disable VCN33_%u_WIFI\n", i);
+	}
+
+	return 0;
+}
+
 static int mt6359_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
@@ -957,10 +1014,13 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (hw_ver >= MT6359P_CHIP_VER)
+	if (hw_ver >= MT6359P_CHIP_VER) {
 		mt6359_info = mt6359p_regulators;
-	else
+		mt6359_sync_vcn33_setting(&pdev->dev, 1);
+	} else {
 		mt6359_info = mt6359_regulators;
+		mt6359_sync_vcn33_setting(&pdev->dev, 0);
+	}
 
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
diff --git a/include/linux/regulator/mt6359-regulator.h b/include/linux/regulator/mt6359-regulator.h
index 6d6e5a58f482..d78ff174761f 100644
--- a/include/linux/regulator/mt6359-regulator.h
+++ b/include/linux/regulator/mt6359-regulator.h
@@ -29,8 +29,7 @@ enum {
 	MT6359_ID_VCN18,
 	MT6359_ID_VFE28,
 	MT6359_ID_VCN13,
-	MT6359_ID_VCN33_1_BT,
-	MT6359_ID_VCN33_1_WIFI,
+	MT6359_ID_VCN33_1,
 	MT6359_ID_VAUX18,
 	MT6359_ID_VSRAM_OTHERS,
 	MT6359_ID_VEFUSE,
@@ -39,8 +38,7 @@ enum {
 	MT6359_ID_VBIF28,
 	MT6359_ID_VIO28,
 	MT6359_ID_VEMC,
-	MT6359_ID_VCN33_2_BT,
-	MT6359_ID_VCN33_2_WIFI,
+	MT6359_ID_VCN33_2,
 	MT6359_ID_VA12,
 	MT6359_ID_VA09,
 	MT6359_ID_VRF18,
-- 
2.53.0.959.g497ff81fa9-goog


