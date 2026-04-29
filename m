Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A41FF8867
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1kkJJcMpCKvV0wRrUKhRZiDb62BE5KQoN/D3B538gM=; b=T+yc/6Dg1smOySB7Nzzvh86E3c
	pICb8rteWi7tC+PCHitXVbvWsM0XGn5PWoALHwccxv+uXmvm8kINP4Zv3MSnDi/u6WD5NO8PGFB8l
	22H0pGdQSawbGAAjb0TAByjb95OqUnp7sWXuwCFmK/de5BowxSy7cR8y2hM8PQz64dhQOGjKVRucM
	xDNbjlIS/aR4P5jy2Kl2+70JDnqRj4silDxw/OetdgjCzqHDb0QL/EY1+YRMrVRbRwqyYkI0GATsy
	c98gSQl7fHp5tkNiJemQxKL4A8e84ukAvaFrOhwNXr1GZTEJfnTu5R/CD79nWDnZU7ykiCdQLatlE
	And+S9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYK-00000003Avx-364k;
	Wed, 29 Apr 2026 07:41:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYG-00000003ArH-0luV
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so34055a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448503; x=1778053303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1kkJJcMpCKvV0wRrUKhRZiDb62BE5KQoN/D3B538gM=;
        b=j1PIyKWzn6oSD3ZmS+1PETZr2hVKt5BcRp9sa7ZAuPSuyULkO17YKdKwxvU04FZNJ6
         ORe2zdyOOrPTjede7O2fuJBJq/PM/IJWaIYhi+XlgPlcZkEyrvnCkhdCyogu2hntzzIz
         RPwKOk+mcka7ijrtJP9/dAlKriVi6GCDIR51k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448503; x=1778053303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1kkJJcMpCKvV0wRrUKhRZiDb62BE5KQoN/D3B538gM=;
        b=PPfo58AyqyoOIa3hsv+ocA/MVfheIx4tXb5XUvs9m1ygS6ZX+864GIvViQl6DXP3nx
         jG0V8eK1QhMyUkPe1/FEybd0XrbC5XDEMxybXm/pUFBpc0RJ6ja6djkc1Ku7zrKvJg0v
         qBJna/k7CRf9+Jv5VO0XPlXmYqIG6ffdc+g0oNKpfgjq0PWQdXUQDBUPXrIfTgYU8vQ5
         SJWAy1iyvEd130WdIs1HaFST56LEY5iYRZRouRE7bER11YBW0Qulq9Yk7N2VOt8SyXV4
         YW/JkqIETZV5uOUBj/5IUlyvqCsHTMWnsMA+T3rmYf6IIt459RW/mUG6NmmoQHT7gs7c
         P/vg==
X-Forwarded-Encrypted: i=1; AFNElJ+KkxZiaVKmot6HPP1xPnGdegqgv8d1fRnmGf37wqWOHKGKrZeXlhLfQ44xajrCuILBQQC8uDdRs0rFoEozzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQnA3ijtHy1KGauaAfLqPUfECMgxihB3Ffsn8FhFdZlhzkv/qJ
	asTSD3q1FXGPdFTnpeu9FMiLXS4z3+KRDJ5k81nYhuhRhj6f2QFFTw0s1aeh6v0eTA==
X-Gm-Gg: AeBDietwE2LZo3x75id6Cy1VAIj3dJvxqImhF3xqFpaJGZCuWKCenIhaYdXtOmHlQm2
	0E/C/Xv8oa978q52aQVNHnx2n+Ea6HfaFSpbemFfivSRswRZXioxt+4OY/kwu2EWhw2+CEsCMq6
	C4Z2fiORlkI+E8vl90oUzhHRYnKBRD+tDLiMX2ZdyuTORA1I612u1Lp6ZY10bxmJsJS37HDlzeS
	z8Yf7O1e9ElTTXc1ZWp9MlxTxRYMZVY1+qU07DF7vIYJfZ30eujfs/rFJZE9Srh9+PS0a+0TGj6
	ndPdz90lLy34x5xN5Wfhu+PcfqqGLk20C8wKaRYrLwp0MyrWNtbPDzAtasJnBNlhn/plG312OdW
	eBVlQEHOyXgG+/l/COSOiFW75vUP9aDXDCwaYtSaSRpVCK3ngYjghfOmdcTyrjfVYbJzUKJWJyk
	B67dYcXNEfi2Tm5tfYhBBHm8/424/pO0xyx3wLW1J62kfZJgpIQorf74G/jBc+hzDlrHEEaItcx
	Lu7IY3BD++CuYZn+iUBox13iq428w==
X-Received: by 2002:a17:90a:d88f:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-36491fbf112mr6940711a91.5.1777448503413;
        Wed, 29 Apr 2026 00:41:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:42 -0700 (PDT)
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
Subject: [PATCH v2 5/6] regulator: mt6359: Add regulator supply names
Date: Wed, 29 Apr 2026 15:41:11 +0800
Message-ID: <20260429074113.3720271-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004144_275101_D2A6E846 
X-CRM114-Status: GOOD (  14.48  )
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

The MT6359 regulator DT binding defines the supply names for the PMIC.

Add support for them by adding .supply_name field settings for each
regulator. The buck regulators each have their own supply. The name
of the supply is related to the name of the buck regulator. The LDOs
have shared supplies.

Add the supply name to the declaration of each regulator. At the moment
they are declared explicitly, but the buck regulator macro can be made
to derive both the match string and supply name from the base name once
the *_sshub regulators are figured out and removed. For context, the
*_sshub regulators are not separate regulators, but separate settings
for the same name regulators without the "_sshub" suffix.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Handle vbbck's supply internally
---
 drivers/regulator/mt6359-regulator.c | 220 +++++++++++++++------------
 1 file changed, 125 insertions(+), 95 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index bcf9a476a34e..fa97c3189df5 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -38,7 +38,7 @@ struct mt6359_regulator_info {
 	u32 lp_mode_mask;
 };
 
-#define MT6359_BUCK(match, _name, min, max, step,		\
+#define MT6359_BUCK(match, _name, supply, min, max, step,	\
 	_enable_reg, _status_reg,				\
 	_vsel_reg, _vsel_mask,					\
 	_lp_mode_reg, _lp_mode_shift,				\
@@ -46,6 +46,7 @@ struct mt6359_regulator_info {
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_linear_ops,			\
@@ -69,11 +70,12 @@ struct mt6359_regulator_info {
 	.modeset_mask = BIT(_modeset_shift),			\
 }
 
-#define MT6359_LDO_LINEAR(match, _name, min, max, step,		\
+#define MT6359_LDO_LINEAR(match, _name, supply, min, max, step,	\
 	_enable_reg, _status_reg, _vsel_reg, _vsel_mask)	\
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_linear_ops,			\
@@ -92,12 +94,13 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),						\
 }
 
-#define MT6359_LDO(match, _name, _volt_table,			\
+#define MT6359_LDO(match, _name, supply, _volt_table,		\
 	_enable_reg, _enable_mask, _status_reg,			\
 	_vsel_reg, _vsel_mask, _en_delay)			\
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
+		.supply_name = supply,				\
 		.of_match = of_match_ptr(match),		\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_table_ops,			\
@@ -116,11 +119,13 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),						\
 }
 
-#define MT6359_REG_FIXED(match, _name, _enable_reg,	\
-	_status_reg, _fixed_volt)			\
+#define MT6359_REG_FIXED(match, _name, supply,		\
+			 _enable_reg, _status_reg,	\
+			 _fixed_volt)			\
 [MT6359_ID_##_name] = {					\
 	.desc = {					\
 		.name = #_name,				\
+		.supply_name = supply,			\
 		.of_match = of_match_ptr(match),	\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &mt6359_volt_fixed_ops,		\
@@ -136,12 +141,14 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),					\
 }
 
-#define MT6359P_LDO1(match, _name, _ops, _volt_table,	\
-	_enable_reg, _enable_mask, _status_reg,		\
-	_vsel_reg, _vsel_mask)				\
+#define MT6359P_LDO1(match, _name, supply, _ops,	\
+		     _volt_table, _enable_reg,		\
+		     _enable_mask, _status_reg,		\
+		     _vsel_reg, _vsel_mask)		\
 [MT6359_ID_##_name] = {					\
 	.desc = {					\
 		.name = #_name,				\
+		.supply_name = supply,			\
 		.of_match = of_match_ptr(match),	\
 		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &_ops,				\
@@ -470,14 +477,14 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 
 /* The array is indexed by id(MT6359_ID_XXX) */
 static const struct mt6359_regulator_info mt6359_regulators[] = {
-	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
+	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS1_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS1_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS1_LP_ADDR, MT6359_RG_BUCK_VS1_LP_SHIFT,
 		    MT6359_RG_VS1_FPWM_ADDR, MT6359_RG_VS1_FPWM_SHIFT),
-	MT6359_BUCK("buck_vgpu11", VGPU11, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11", VGPU11, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VGPU11_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR, MT6359_RG_BUCK_VGPU11_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VGPU11_VOSEL_MASK <<
@@ -485,7 +492,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_BUCK("buck_vmodem", VMODEM, 400000, 1100000, 6250,
+	MT6359_BUCK("buck_vmodem", VMODEM, "vsys-vmodem", 400000, 1100000, 6250,
 		    MT6359_RG_BUCK_VMODEM_EN_ADDR,
 		    MT6359_DA_VMODEM_EN_ADDR, MT6359_RG_BUCK_VMODEM_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VMODEM_VOSEL_MASK <<
@@ -493,35 +500,35 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VMODEM_LP_ADDR,
 		    MT6359_RG_BUCK_VMODEM_LP_SHIFT,
 		    MT6359_RG_VMODEM_FCCM_ADDR, MT6359_RG_VMODEM_FCCM_SHIFT),
-	MT6359_BUCK("buck_vpu", VPU, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vpu", VPU, "vsys-vpu", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPU_EN_ADDR,
 		    MT6359_DA_VPU_EN_ADDR, MT6359_RG_BUCK_VPU_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPU_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPU_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPU_LP_ADDR, MT6359_RG_BUCK_VPU_LP_SHIFT,
 		    MT6359_RG_VPU_FCCM_ADDR, MT6359_RG_VPU_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore", VCORE, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vcore", VCORE, "vsys-vcore", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VCORE_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR, MT6359_RG_BUCK_VCORE_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VCORE_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VCORE_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_BUCK("buck_vs2", VS2, 800000, 1600000, 12500,
+	MT6359_BUCK("buck_vs2", VS2, "vsys-vs2", 800000, 1600000, 12500,
 		    MT6359_RG_BUCK_VS2_EN_ADDR,
 		    MT6359_DA_VS2_EN_ADDR, MT6359_RG_BUCK_VS2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS2_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS2_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS2_LP_ADDR, MT6359_RG_BUCK_VS2_LP_SHIFT,
 		    MT6359_RG_VS2_FPWM_ADDR, MT6359_RG_VS2_FPWM_SHIFT),
-	MT6359_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+	MT6359_BUCK("buck_vpa", VPA, "vsys-vpa", 500000, 3650000, 50000,
 		    MT6359_RG_BUCK_VPA_EN_ADDR,
 		    MT6359_DA_VPA_EN_ADDR, MT6359_RG_BUCK_VPA_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPA_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPA_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPA_LP_ADDR, MT6359_RG_BUCK_VPA_LP_SHIFT,
 		    MT6359_RG_VPA_MODESET_ADDR, MT6359_RG_VPA_MODESET_SHIFT),
-	MT6359_BUCK("buck_vproc2", VPROC2, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc2", VPROC2, "vsys-vproc2", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC2_EN_ADDR,
 		    MT6359_DA_VPROC2_EN_ADDR, MT6359_RG_BUCK_VPROC2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC2_VOSEL_MASK <<
@@ -529,7 +536,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VPROC2_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC2_LP_SHIFT,
 		    MT6359_RG_VPROC2_FCCM_ADDR, MT6359_RG_VPROC2_FCCM_SHIFT),
-	MT6359_BUCK("buck_vproc1", VPROC1, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc1", VPROC1, "vsys-vproc1", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC1_EN_ADDR,
 		    MT6359_DA_VPROC1_EN_ADDR, MT6359_RG_BUCK_VPROC1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC1_VOSEL_MASK <<
@@ -537,7 +544,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VPROC1_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC1_LP_SHIFT,
 		    MT6359_RG_VPROC1_FCCM_ADDR, MT6359_RG_VPROC1_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore_sshub", VCORE_SSHUB, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vcore_sshub", VCORE_SSHUB, "vsys-vcore", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VCORE_SSHUB_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR,
 		    MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_ADDR,
@@ -545,158 +552,159 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		    MT6359_RG_BUCK_VCORE_SSHUB_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_REG_FIXED("ldo_vaud18", VAUD18, MT6359_RG_LDO_VAUD18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaud18", VAUD18, "vs1-ldo1", MT6359_RG_LDO_VAUD18_EN_ADDR,
 			 MT6359_DA_VAUD18_B_EN_ADDR, 1800000),
-	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
+	MT6359_LDO("ldo_vsim1", VSIM1, "vsys-ldo2", vsim1_voltages,
 		   MT6359_RG_LDO_VSIM1_EN_ADDR, MT6359_RG_LDO_VSIM1_EN_SHIFT,
 		   MT6359_DA_VSIM1_B_EN_ADDR, MT6359_RG_VSIM1_VOSEL_ADDR,
 		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
+	MT6359_LDO("ldo_vibr", VIBR, "vsys-ldo1", vibr_voltages,
 		   MT6359_RG_LDO_VIBR_EN_ADDR, MT6359_RG_LDO_VIBR_EN_SHIFT,
 		   MT6359_DA_VIBR_B_EN_ADDR, MT6359_RG_VIBR_VOSEL_ADDR,
 		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
+	MT6359_LDO("ldo_vrf12", VRF12, "vs2-ldo2", vrf12_voltages,
 		   MT6359_RG_LDO_VRF12_EN_ADDR, MT6359_RG_LDO_VRF12_EN_SHIFT,
 		   MT6359_DA_VRF12_B_EN_ADDR, MT6359_RG_VRF12_VOSEL_ADDR,
 		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
 		   120),
-	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359_RG_LDO_VUSB_EN_0_ADDR,
+	MT6359_REG_FIXED("ldo_vusb", VUSB, "vsys-ldo2", MT6359_RG_LDO_VUSB_EN_0_ADDR,
 			 MT6359_DA_VUSB_B_EN_ADDR, 3000000),
-	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_PROC2_EN_ADDR,
 			  MT6359_DA_VSRAM_PROC2_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
+	MT6359_LDO("ldo_vio18", VIO18, "vs1-ldo2", volt18_voltages,
 		   MT6359_RG_LDO_VIO18_EN_ADDR, MT6359_RG_LDO_VIO18_EN_SHIFT,
 		   MT6359_DA_VIO18_B_EN_ADDR, MT6359_RG_VIO18_VOSEL_ADDR,
 		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
+	MT6359_LDO("ldo_vcamio", VCAMIO, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VCAMIO_EN_ADDR, MT6359_RG_LDO_VCAMIO_EN_SHIFT,
 		   MT6359_DA_VCAMIO_B_EN_ADDR, MT6359_RG_VCAMIO_VOSEL_ADDR,
 		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
 		   1290),
-	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359_RG_LDO_VCN18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vcn18", VCN18, "vs1-ldo2", MT6359_RG_LDO_VCN18_EN_ADDR,
 			 MT6359_DA_VCN18_B_EN_ADDR, 1800000),
-	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359_RG_LDO_VFE28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vfe28", VFE28, "vsys-ldo1", MT6359_RG_LDO_VFE28_EN_ADDR,
 			 MT6359_DA_VFE28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
+	MT6359_LDO("ldo_vcn13", VCN13, "vs2-ldo2", vcn13_voltages,
 		   MT6359_RG_LDO_VCN13_EN_ADDR, MT6359_RG_LDO_VCN13_EN_SHIFT,
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359_RG_LDO_VAUX18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
-	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
+	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
 			  6250,
 			  MT6359_RG_LDO_VSRAM_OTHERS_EN_ADDR,
 			  MT6359_DA_VSRAM_OTHERS_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
+	MT6359_LDO("ldo_vefuse", VEFUSE, "vs1-ldo2", vefuse_voltages,
 		   MT6359_RG_LDO_VEFUSE_EN_ADDR, MT6359_RG_LDO_VEFUSE_EN_SHIFT,
 		   MT6359_DA_VEFUSE_B_EN_ADDR, MT6359_RG_VEFUSE_VOSEL_ADDR,
 		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
+	MT6359_LDO("ldo_vxo22", VXO22, "vsys-ldo2", vxo22_voltages,
 		   MT6359_RG_LDO_VXO22_EN_ADDR, MT6359_RG_LDO_VXO22_EN_SHIFT,
 		   MT6359_DA_VXO22_B_EN_ADDR, MT6359_RG_VXO22_VOSEL_ADDR,
 		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
 		   120),
-	MT6359_LDO("ldo_vrfck", VRFCK, vrfck_voltages,
+	MT6359_LDO("ldo_vrfck", VRFCK, "vsys-ldo2", vrfck_voltages,
 		   MT6359_RG_LDO_VRFCK_EN_ADDR, MT6359_RG_LDO_VRFCK_EN_SHIFT,
 		   MT6359_DA_VRFCK_B_EN_ADDR, MT6359_RG_VRFCK_VOSEL_ADDR,
 		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359_RG_LDO_VBIF28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vbif28", VBIF28, "vsys-ldo2", MT6359_RG_LDO_VBIF28_EN_ADDR,
 			 MT6359_DA_VBIF28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
+	MT6359_LDO("ldo_vio28", VIO28, "vsys-ldo2", vio28_voltages,
 		   MT6359_RG_LDO_VIO28_EN_ADDR, MT6359_RG_LDO_VIO28_EN_SHIFT,
 		   MT6359_DA_VIO28_B_EN_ADDR, MT6359_RG_VIO28_VOSEL_ADDR,
 		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vemc", VEMC, vemc_voltages,
+	MT6359_LDO("ldo_vemc", VEMC, "vsys-ldo2", vemc_voltages,
 		   MT6359_RG_LDO_VEMC_EN_ADDR, MT6359_RG_LDO_VEMC_EN_SHIFT,
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
 		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_va12", VA12, va12_voltages,
+	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
 		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_va09", VA09, va09_voltages,
+	MT6359_LDO("ldo_va09", VA09, "vs2-ldo2", va09_voltages,
 		   MT6359_RG_LDO_VA09_EN_ADDR, MT6359_RG_LDO_VA09_EN_SHIFT,
 		   MT6359_DA_VA09_B_EN_ADDR, MT6359_RG_VA09_VOSEL_ADDR,
 		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
+	MT6359_LDO("ldo_vrf18", VRF18, "vs1-ldo2", vrf18_voltages,
 		   MT6359_RG_LDO_VRF18_EN_ADDR, MT6359_RG_LDO_VRF18_EN_SHIFT,
 		   MT6359_DA_VRF18_B_EN_ADDR, MT6359_RG_VRF18_VOSEL_ADDR,
 		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
 		   120),
-	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1100000, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, "vs2-ldo1", 500000, 1100000, 6250,
 			  MT6359_RG_LDO_VSRAM_MD_EN_ADDR,
 			  MT6359_DA_VSRAM_MD_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
+	MT6359_LDO("ldo_vufs", VUFS, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VUFS_EN_ADDR, MT6359_RG_LDO_VUFS_EN_SHIFT,
 		   MT6359_DA_VUFS_B_EN_ADDR, MT6359_RG_VUFS_VOSEL_ADDR,
 		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
+	MT6359_LDO("ldo_vm18", VM18, "vs1-ldo1", volt18_voltages,
 		   MT6359_RG_LDO_VM18_EN_ADDR, MT6359_RG_LDO_VM18_EN_SHIFT,
 		   MT6359_DA_VM18_B_EN_ADDR, MT6359_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
+	/* vbbck is fed from vio18 internally. */
+	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359_DA_VBBCK_B_EN_ADDR, MT6359_RG_VBBCK_VOSEL_ADDR,
 		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_PROC1_EN_ADDR,
 			  MT6359_DA_VSRAM_PROC1_B_EN_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
+	MT6359_LDO("ldo_vsim2", VSIM2, "vsys-ldo2", vsim2_voltages,
 		   MT6359_RG_LDO_VSIM2_EN_ADDR, MT6359_RG_LDO_VSIM2_EN_SHIFT,
 		   MT6359_DA_VSIM2_B_EN_ADDR, MT6359_RG_VSIM2_VOSEL_ADDR,
 		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
+	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, "vs2-ldo1",
 			  500000, 1293750, 6250,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
 			  MT6359_DA_VSRAM_OTHERS_B_EN_ADDR,
@@ -706,14 +714,14 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 };
 
 static const struct mt6359_regulator_info mt6359p_regulators[] = {
-	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
+	MT6359_BUCK("buck_vs1", VS1, "vsys-vs1", 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS1_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS1_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS1_LP_ADDR, MT6359_RG_BUCK_VS1_LP_SHIFT,
 		    MT6359_RG_VS1_FPWM_ADDR, MT6359_RG_VS1_FPWM_SHIFT),
-	MT6359_BUCK("buck_vgpu11", VGPU11, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11", VGPU11, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VGPU11_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR, MT6359P_RG_BUCK_VGPU11_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VGPU11_VOSEL_MASK <<
@@ -721,7 +729,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_BUCK("buck_vmodem", VMODEM, 400000, 1100000, 6250,
+	MT6359_BUCK("buck_vmodem", VMODEM, "vsys-vmodem", 400000, 1100000, 6250,
 		    MT6359_RG_BUCK_VMODEM_EN_ADDR,
 		    MT6359_DA_VMODEM_EN_ADDR, MT6359_RG_BUCK_VMODEM_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VMODEM_VOSEL_MASK <<
@@ -729,35 +737,35 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VMODEM_LP_ADDR,
 		    MT6359_RG_BUCK_VMODEM_LP_SHIFT,
 		    MT6359_RG_VMODEM_FCCM_ADDR, MT6359_RG_VMODEM_FCCM_SHIFT),
-	MT6359_BUCK("buck_vpu", VPU, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vpu", VPU, "vsys-vpu", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPU_EN_ADDR,
 		    MT6359_DA_VPU_EN_ADDR, MT6359_RG_BUCK_VPU_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPU_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPU_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPU_LP_ADDR, MT6359_RG_BUCK_VPU_LP_SHIFT,
 		    MT6359_RG_VPU_FCCM_ADDR, MT6359_RG_VPU_FCCM_SHIFT),
-	MT6359_BUCK("buck_vcore", VCORE, 506250, 1300000, 6250,
+	MT6359_BUCK("buck_vcore", VCORE, "vsys-vcore", 506250, 1300000, 6250,
 		    MT6359_RG_BUCK_VCORE_EN_ADDR,
 		    MT6359_DA_VCORE_EN_ADDR, MT6359P_RG_BUCK_VCORE_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VCORE_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VCORE_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VCORE_LP_ADDR, MT6359_RG_BUCK_VCORE_LP_SHIFT,
 		    MT6359_RG_VCORE_FCCM_ADDR, MT6359_RG_VCORE_FCCM_SHIFT),
-	MT6359_BUCK("buck_vs2", VS2, 800000, 1600000, 12500,
+	MT6359_BUCK("buck_vs2", VS2, "vsys-vs2", 800000, 1600000, 12500,
 		    MT6359_RG_BUCK_VS2_EN_ADDR,
 		    MT6359_DA_VS2_EN_ADDR, MT6359_RG_BUCK_VS2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VS2_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VS2_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VS2_LP_ADDR, MT6359_RG_BUCK_VS2_LP_SHIFT,
 		    MT6359_RG_VS2_FPWM_ADDR, MT6359_RG_VS2_FPWM_SHIFT),
-	MT6359_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+	MT6359_BUCK("buck_vpa", VPA, "vsys-vpa", 500000, 3650000, 50000,
 		    MT6359_RG_BUCK_VPA_EN_ADDR,
 		    MT6359_DA_VPA_EN_ADDR, MT6359_RG_BUCK_VPA_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPA_VOSEL_MASK <<
 		    MT6359_RG_BUCK_VPA_VOSEL_SHIFT,
 		    MT6359_RG_BUCK_VPA_LP_ADDR, MT6359_RG_BUCK_VPA_LP_SHIFT,
 		    MT6359_RG_VPA_MODESET_ADDR, MT6359_RG_VPA_MODESET_SHIFT),
-	MT6359_BUCK("buck_vproc2", VPROC2, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc2", VPROC2, "vsys-vproc2", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC2_EN_ADDR,
 		    MT6359_DA_VPROC2_EN_ADDR, MT6359_RG_BUCK_VPROC2_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC2_VOSEL_MASK <<
@@ -765,7 +773,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VPROC2_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC2_LP_SHIFT,
 		    MT6359_RG_VPROC2_FCCM_ADDR, MT6359_RG_VPROC2_FCCM_SHIFT),
-	MT6359_BUCK("buck_vproc1", VPROC1, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vproc1", VPROC1, "vsys-vproc1", 400000, 1193750, 6250,
 		    MT6359_RG_BUCK_VPROC1_EN_ADDR,
 		    MT6359_DA_VPROC1_EN_ADDR, MT6359_RG_BUCK_VPROC1_VOSEL_ADDR,
 		    MT6359_RG_BUCK_VPROC1_VOSEL_MASK <<
@@ -773,7 +781,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VPROC1_LP_ADDR,
 		    MT6359_RG_BUCK_VPROC1_LP_SHIFT,
 		    MT6359_RG_VPROC1_FCCM_ADDR, MT6359_RG_VPROC1_FCCM_SHIFT),
-	MT6359_BUCK("buck_vgpu11_sshub", VGPU11_SSHUB, 400000, 1193750, 6250,
+	MT6359_BUCK("buck_vgpu11_sshub", VGPU11_SSHUB, "vsys-vgpu11", 400000, 1193750, 6250,
 		    MT6359P_RG_BUCK_VGPU11_SSHUB_EN_ADDR,
 		    MT6359_DA_VGPU11_EN_ADDR,
 		    MT6359P_RG_BUCK_VGPU11_SSHUB_VOSEL_ADDR,
@@ -782,161 +790,161 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		    MT6359_RG_BUCK_VGPU11_LP_ADDR,
 		    MT6359_RG_BUCK_VGPU11_LP_SHIFT,
 		    MT6359_RG_VGPU11_FCCM_ADDR, MT6359_RG_VGPU11_FCCM_SHIFT),
-	MT6359_REG_FIXED("ldo_vaud18", VAUD18, MT6359P_RG_LDO_VAUD18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaud18", VAUD18, "vs1-ldo1", MT6359P_RG_LDO_VAUD18_EN_ADDR,
 			 MT6359P_DA_VAUD18_B_EN_ADDR, 1800000),
-	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
+	MT6359_LDO("ldo_vsim1", VSIM1, "vsys-ldo2", vsim1_voltages,
 		   MT6359P_RG_LDO_VSIM1_EN_ADDR, MT6359P_RG_LDO_VSIM1_EN_SHIFT,
 		   MT6359P_DA_VSIM1_B_EN_ADDR, MT6359P_RG_VSIM1_VOSEL_ADDR,
 		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
+	MT6359_LDO("ldo_vibr", VIBR, "vsys-ldo1", vibr_voltages,
 		   MT6359P_RG_LDO_VIBR_EN_ADDR, MT6359P_RG_LDO_VIBR_EN_SHIFT,
 		   MT6359P_DA_VIBR_B_EN_ADDR, MT6359P_RG_VIBR_VOSEL_ADDR,
 		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
+	MT6359_LDO("ldo_vrf12", VRF12, "vs2-ldo2", vrf12_voltages,
 		   MT6359P_RG_LDO_VRF12_EN_ADDR, MT6359P_RG_LDO_VRF12_EN_SHIFT,
 		   MT6359P_DA_VRF12_B_EN_ADDR, MT6359P_RG_VRF12_VOSEL_ADDR,
 		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359P_RG_LDO_VUSB_EN_0_ADDR,
+	MT6359_REG_FIXED("ldo_vusb", VUSB, "vsys-ldo2", MT6359P_RG_LDO_VUSB_EN_0_ADDR,
 			 MT6359P_DA_VUSB_B_EN_ADDR, 3000000),
-	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_PROC2_EN_ADDR,
 			  MT6359P_DA_VSRAM_PROC2_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_PROC2_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC2_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
+	MT6359_LDO("ldo_vio18", VIO18, "vs1-ldo2", volt18_voltages,
 		   MT6359P_RG_LDO_VIO18_EN_ADDR, MT6359P_RG_LDO_VIO18_EN_SHIFT,
 		   MT6359P_DA_VIO18_B_EN_ADDR, MT6359P_RG_VIO18_VOSEL_ADDR,
 		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
+	MT6359_LDO("ldo_vcamio", VCAMIO, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VCAMIO_EN_ADDR,
 		   MT6359P_RG_LDO_VCAMIO_EN_SHIFT,
 		   MT6359P_DA_VCAMIO_B_EN_ADDR, MT6359P_RG_VCAMIO_VOSEL_ADDR,
 		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
 		   1290),
-	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359P_RG_LDO_VCN18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vcn18", VCN18, "vs1-ldo2", MT6359P_RG_LDO_VCN18_EN_ADDR,
 			 MT6359P_DA_VCN18_B_EN_ADDR, 1800000),
-	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359P_RG_LDO_VFE28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vfe28", VFE28, "vsys-ldo1", MT6359P_RG_LDO_VFE28_EN_ADDR,
 			 MT6359P_DA_VFE28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
+	MT6359_LDO("ldo_vcn13", VCN13, "vs2-ldo2", vcn13_voltages,
 		   MT6359P_RG_LDO_VCN13_EN_ADDR, MT6359P_RG_LDO_VCN13_EN_SHIFT,
 		   MT6359P_DA_VCN13_B_EN_ADDR, MT6359P_RG_VCN13_VOSEL_ADDR,
 		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_1_EN_1_ADDR,
 		   MT6359P_RG_LDO_VCN33_1_EN_1_SHIFT,
 		   MT6359P_DA_VCN33_1_B_EN_ADDR, MT6359P_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
 		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
-	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359P_RG_LDO_VAUX18_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vaux18", VAUX18, "vsys-ldo2", MT6359P_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359P_DA_VAUX18_B_EN_ADDR, 1800000),
-	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
+	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, "vs2-ldo1", 500000, 1293750,
 			  6250,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_EN_ADDR,
 			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_OTHERS_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
+	MT6359_LDO("ldo_vefuse", VEFUSE, "vs1-ldo2", vefuse_voltages,
 		   MT6359P_RG_LDO_VEFUSE_EN_ADDR,
 		   MT6359P_RG_LDO_VEFUSE_EN_SHIFT,
 		   MT6359P_DA_VEFUSE_B_EN_ADDR, MT6359P_RG_VEFUSE_VOSEL_ADDR,
 		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
+	MT6359_LDO("ldo_vxo22", VXO22, "vsys-ldo2", vxo22_voltages,
 		   MT6359P_RG_LDO_VXO22_EN_ADDR, MT6359P_RG_LDO_VXO22_EN_SHIFT,
 		   MT6359P_DA_VXO22_B_EN_ADDR, MT6359P_RG_VXO22_VOSEL_ADDR,
 		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO("ldo_vrfck_1", VRFCK, vrfck_voltages_1,
+	MT6359_LDO("ldo_vrfck_1", VRFCK, "vsys-ldo2", vrfck_voltages_1,
 		   MT6359P_RG_LDO_VRFCK_EN_ADDR, MT6359P_RG_LDO_VRFCK_EN_SHIFT,
 		   MT6359P_DA_VRFCK_B_EN_ADDR, MT6359P_RG_VRFCK_VOSEL_ADDR,
 		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
 		   480),
-	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359P_RG_LDO_VBIF28_EN_ADDR,
+	MT6359_REG_FIXED("ldo_vbif28", VBIF28, "vsys-ldo2", MT6359P_RG_LDO_VBIF28_EN_ADDR,
 			 MT6359P_DA_VBIF28_B_EN_ADDR, 2800000),
-	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
+	MT6359_LDO("ldo_vio28", VIO28, "vsys-ldo2", vio28_voltages,
 		   MT6359P_RG_LDO_VIO28_EN_ADDR, MT6359P_RG_LDO_VIO28_EN_SHIFT,
 		   MT6359P_DA_VIO28_B_EN_ADDR, MT6359P_RG_VIO28_VOSEL_ADDR,
 		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
 		   1920),
-	MT6359P_LDO1("ldo_vemc_1", VEMC, mt6359p_vemc_ops, vemc_voltages_1,
+	MT6359P_LDO1("ldo_vemc_1", VEMC, "vsys-ldo2", mt6359p_vemc_ops, vemc_voltages_1,
 		     MT6359P_RG_LDO_VEMC_EN_ADDR, MT6359P_RG_LDO_VEMC_EN_SHIFT,
 		     MT6359P_DA_VEMC_B_EN_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_ADDR,
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_MASK <<
 		     MT6359P_RG_LDO_VEMC_VOSEL_0_SHIFT),
-	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359P_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
+	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, "vsys-ldo1", vcn33_voltages,
 		   MT6359P_RG_LDO_VCN33_2_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
 		   MT6359P_DA_VCN33_2_B_EN_ADDR, MT6359P_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
 		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
-	MT6359_LDO("ldo_va12", VA12, va12_voltages,
+	MT6359_LDO("ldo_va12", VA12, "vs2-ldo2", va12_voltages,
 		   MT6359P_RG_LDO_VA12_EN_ADDR, MT6359P_RG_LDO_VA12_EN_SHIFT,
 		   MT6359P_DA_VA12_B_EN_ADDR, MT6359P_RG_VA12_VOSEL_ADDR,
 		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_va09", VA09, va09_voltages,
+	MT6359_LDO("ldo_va09", VA09, "vs2-ldo2", va09_voltages,
 		   MT6359P_RG_LDO_VA09_EN_ADDR, MT6359P_RG_LDO_VA09_EN_SHIFT,
 		   MT6359P_DA_VA09_B_EN_ADDR, MT6359P_RG_VA09_VOSEL_ADDR,
 		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
 		   960),
-	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
+	MT6359_LDO("ldo_vrf18", VRF18, "vs1-ldo2", vrf18_voltages,
 		   MT6359P_RG_LDO_VRF18_EN_ADDR, MT6359P_RG_LDO_VRF18_EN_SHIFT,
 		   MT6359P_DA_VRF18_B_EN_ADDR, MT6359P_RG_VRF18_VOSEL_ADDR,
 		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
 		   240),
-	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_MD_EN_ADDR,
 			  MT6359P_DA_VSRAM_MD_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_MD_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_MD_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
+	MT6359_LDO("ldo_vufs", VUFS, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VUFS_EN_ADDR, MT6359P_RG_LDO_VUFS_EN_SHIFT,
 		   MT6359P_DA_VUFS_B_EN_ADDR, MT6359P_RG_VUFS_VOSEL_ADDR,
 		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
+	MT6359_LDO("ldo_vm18", VM18, "vs1-ldo1", volt18_voltages,
 		   MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SHIFT,
 		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
-	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
+	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
 		   MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
+	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, "vs2-ldo1", 500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_PROC1_EN_ADDR,
 			  MT6359P_DA_VSRAM_PROC1_B_EN_ADDR,
 			  MT6359P_RG_LDO_VSRAM_PROC1_VOSEL_ADDR,
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_MASK <<
 			  MT6359_RG_LDO_VSRAM_PROC1_VOSEL_SHIFT),
-	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
+	MT6359_LDO("ldo_vsim2", VSIM2, "vsys-ldo2", vsim2_voltages,
 		   MT6359P_RG_LDO_VSIM2_EN_ADDR, MT6359P_RG_LDO_VSIM2_EN_SHIFT,
 		   MT6359P_DA_VSIM2_B_EN_ADDR, MT6359P_RG_VSIM2_VOSEL_ADDR,
 		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
 		   480),
-	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
+	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, "vs2-ldo1",
 			  500000, 1293750, 6250,
 			  MT6359P_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
 			  MT6359P_DA_VSRAM_OTHERS_B_EN_ADDR,
@@ -951,6 +959,7 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	const struct mt6359_regulator_info *mt6359_info;
+	const char *vio18_name;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
@@ -962,16 +971,37 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	else
 		mt6359_info = mt6359_regulators;
 
+	vio18_name = mt6359_info[MT6359_ID_VIO18].desc.name;
+
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
 	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
+		const struct regulator_desc *desc = &mt6359_info->desc;
+		struct regulator_desc *_desc;
+
 		/* drop const here, but all uses in the driver are const */
 		config.driver_data = (void *)mt6359_info;
-		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
+
+		/* Use vio18's actual name as supply_name for vbbck */
+		if (i == MT6359_ID_VBBCK && strcmp(desc->supply_name, vio18_name) != 0) {
+			_desc = devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);
+			if (!_desc)
+				return -ENOMEM;
+
+			memcpy(_desc, desc, sizeof(*_desc));
+			_desc->supply_name = vio18_name;
+			desc = _desc;
+		}
+
+		rdev = devm_regulator_register(&pdev->dev, desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
 			return PTR_ERR(rdev);
 		}
+
+		/* Save vio18 name for vbbck */
+		if (i == MT6359_ID_VIO18)
+			vio18_name = rdev_get_name(rdev);
 	}
 
 	return 0;
-- 
2.54.0.545.g6539524ca2-goog


