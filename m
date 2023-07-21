Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28997EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBEBajXPeANrxdpiP5Fykz/Cq1TcahWs+MuTM0uJsmg=; b=vXpFegk+a4WUp936sxgKvAsA4M
	7OVlnuQ2Yzk9BPql1AwQciY3XI+Ha57snsvHmzakVEKNTQgZs6e2uHvevzi4id9nDp+oDpcEzs34X
	j+M0OHQzmSASPxiiBDKItJYLXhvA/titCMpGtQuw/pk45u58RPc/WT9hYqn2sm50GMUBJr+qteaL8
	uSEe9iWdKRPaNr88r1/S06GU6syFBDw9+iEizKqdg+nv2XETMgUSTrFb1AVTqYvb60nD3cOdeke92
	HTcyhPpg10WGrTCjmpaXdBMLXPfvd+i4KGenztCLHXZEZyZ4W0PIzxgXn0BRpaxC0XVPtkcrGwuGN
	Jjj+zE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlWJ-00DNXJ-0F;
	Fri, 21 Jul 2023 08:29:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW8-00DNNV-2B
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6682909acadso1119433b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928180; x=1690532980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBEBajXPeANrxdpiP5Fykz/Cq1TcahWs+MuTM0uJsmg=;
        b=J/Zn4wpP5VNVOXfKPjNJkboqjmqL/vgKtUn1Rqo40UtHQXp/5DPvJfJQvJWKuaVLGO
         nIpiJD0itnC2zu+V1pMCfFCMJ/MTotClIBDurcZK571aT9CCR2zsKksO4eZp+GUZbO3e
         4DmP3rBKaDaNyMT99ZXxzdrxHMEVTPe26OtPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928180; x=1690532980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBEBajXPeANrxdpiP5Fykz/Cq1TcahWs+MuTM0uJsmg=;
        b=OvBFFNUUL8zArZHB3OAvph3lAaidzCo89LnXVfAToBmhL1eIO1njfXflN2RIWfbKyn
         G4E0qozCltVfn+WV2dns4uxqZdmTM6cUk0hIEXfk9JSBK+2hqT09Bu9i7xPHyXJPeXVW
         QRGk6DXtoFE0ezKS9SVEWS3P1LzhjBfRBML9siK4aO6d5LrjWzYFy27HPqfPBIxW4yM3
         8aZT9a5BGMFJeOpXqBxn0W+HzEAhwl2vJhhrGsqCf3XJHpAfvAOGdtsa41YOSXgrorgE
         7x0mucAI1I63Jvxws9alrHiBAFPmeWjgB/JGRp1ZijlxG20V0m8X17kvogxK2ViDd+hH
         fcWQ==
X-Gm-Message-State: ABy/qLa9P+e8KJ6GO7Hkj0FEEvfD4oxyy8P2G2LWCalc+S9g0bjyVtMa
	1HmpKtj3TcTFPhEjX4ukTMaIdQ==
X-Google-Smtp-Source: APBJJlFDtfbR4C/I+qjjtDOEeJbaMFBrL4FhBuCmIiVzEhT72OEsSIEZNX/0gWIzVTcWcePM5JbR2A==
X-Received: by 2002:a05:6a20:b709:b0:132:d2c4:9cb9 with SMTP id fg9-20020a056a20b70900b00132d2c49cb9mr972256pzb.29.1689928180182;
        Fri, 21 Jul 2023 01:29:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 5/7] regulator: mt6358: Add output voltage fine tuning to fixed regulators
Date: Fri, 21 Jul 2023 16:28:57 +0800
Message-ID: <20230721082903.2038975-6-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012940_723449_46A9F224 
X-CRM114-Status: GOOD (  13.69  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index a1eae45f5fee..b34ad85db771 100644
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
@@ -476,8 +482,13 @@ static const struct regulator_ops mt6358_volt_table_ops = {
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
-- 
2.41.0.487.g6d72f3e995-goog


