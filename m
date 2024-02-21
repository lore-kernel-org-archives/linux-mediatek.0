Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A504C54787
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=; b=INqf+Dk+6EsiN/dijUVRxL2jeO
	ZGKSSo6wm/sLcVd5DnGi1eysCZGwJIz+hrkzkpZS6cDmOfyyTTKRr4LjxDCznryUvfWsUsADcMQ30
	SD6n/Xsl8GyXLvHScukKC5Q74y0Nv3PC3Vj6N+O3OKmRGVh8b8VC0I9rOS4aO6K3f84iTTyJ8wZGj
	nnltZ4/UaTyzYdpQKtWZj6mevSVLb1Ipxxt5iJz+Lr1n5Mk4vmCwMRGHUDLjtzs6dQt4Ma6RLit+Y
	zzlREJBvcH5D3lLq/+98lx/YrFkYMGRY6jF/vg0+Ap1JcD+GlfGTb0dNwWtK5hd78nwShDrq5IrTH
	Otzm6O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm61-00000000udK-01u7;
	Wed, 21 Feb 2024 12:53:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5n-00000000uVV-3GHk
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 12:52:57 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a3e82664d53so441175166b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519974; x=1709124774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=;
        b=fH4AuySUmCjFfPAO1Y9gIttvihC0TgyF5hi2BUixyyVZk25ojm7OIU2oMSVBRLIl+d
         PUWjRBTDlqVA6OrY4NRZ0dd3f8y6kap1hnWTCcHe9FSPmYp/+tLYyWsM+Q1R/ef15T0p
         +CAq0z2KpW0bTCoqrTc3i6Pu4P5UOGk/kJmFhdSa+lCG9NUz1ha1OKdrWDavkkPtEmtF
         BGcjptjjUR7vjC7WfAMtgeGCNMGT67lGCyGsCcupZIhPqgvf9O/ZEaOpNGg1U3LMgRKr
         YLmMBk60OXSDvsGemRLexuMyceoPltqj99a9hsDl3tf5YhF7XBq5dnr+TfU6QSiP/gmD
         jBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519974; x=1709124774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=;
        b=TQLLU5sxkx3ohveTEuZmPewhESoMF3BprCM/ML7rXYhlp/IHhnIJRatYkU5Z8Ww65t
         xyBrdUvHGbFROf0k6c/1AntB6xzp55RB2x+9WMzP4PD3YcQyx/lFDQQKOqiB5km5sniq
         Zo6BB80IzcY9Xvipl5cLtx/qQ81DS9CJAhz0N/80RthMgM7AlRfrS/bbeukXmhE1tgSy
         Rd7PFD3/1RHKnYzDAqYcbbirxnhZtq1R/2GFIlV61yENKhbzFWcmp41VcEvXirgkcX+8
         vL3nxq/5qtxBvKCYpSEn/eQg5ZsFMpTu1ubZ1oaP80Sq+h+VVJSoOym+wmdixdMSd8O2
         0dTw==
X-Forwarded-Encrypted: i=1; AJvYcCXXzFZErH06NrxTPxJ+pgMtoOWkE6M1oQCfP1Mu23CPmojz5xZAFQG9AGmW4mS7s6y1Dk6rB2tPbTnDGKNEM2n47Ca+gtfoo60EwwsFq6xQtMCq
X-Gm-Message-State: AOJu0YwuI3boTTtr0DBaAG5L73qcnoKp+pyWdlMTm0/cFfvzMgTZR52P
	0/8y9QNpYtKP/3dWQoZzJv15aRfDAqoQffgRnOuN0qPUGtQHFmQPJc6BXo2ADNI=
X-Google-Smtp-Source: AGHT+IGWuiYDZQnZv7k8NSx8kDgKiR98jgkc7kQV7Q8X179RvlTIMFh8AgiFrXJ9C6SQs9Gz+Rrqhg==
X-Received: by 2002:a17:906:2b53:b0:a3e:5adb:cb21 with SMTP id b19-20020a1709062b5300b00a3e5adbcb21mr6741071ejg.59.1708519973858;
        Wed, 21 Feb 2024 04:52:53 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b00a3da5bf34absm4930392ejc.207.2024.02.21.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:52:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 14:52:39 +0200
Subject: [PATCH v5 3/4] spmi: pmic-arb: Make core resources acquiring a
 version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-spmi-multi-master-support-v5-3-3255ca413a0b@linaro.org>
References: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
In-Reply-To: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7561; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=BMjyfCYiK4XOXFgvoI4oZtTuPAW/B6RJ1erAWAohJjQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fIdHibzQ+Jjjc8jNSuux/G34CPe3rNbfTzQp
 8ARjlhyG8aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdXyHQAKCRAbX0TJAJUV
 VtwQD/4oWs1npr+DBf9g/6zf37WLcDJhiyvwCiiaAc4Aztq0x89Kzd2KTGQYX2Ihglv55KDkS06
 4eiymg3It4dCXcyRb+O6+RkIh58/dCqtY/ev1MaWrpoJhH0Iypl0hnLFMjsFwYZfgbHwHIRj7iD
 Lgiy2MZGx3JcLaZCzk6BoToZ+JiUTA7vsJ7cJ1ZaiRfz7XOxkSx+EC+58TAJb06cNOgRzv3jv3y
 vzkYPppTvw2/xzKcBugQG4IhZpKZKpe5pc6h4xB5F6bkeiCO6uaGjDaL3BTPq+MfxTUppXtouOH
 dFEH978wIgwayq2aqKLbIRrXTrbdHm6JVsbm25HfOCKi5PDpCvWQNDHGDgfPTmsrWHGp6jadkPE
 XVAVkvG3Xw8vik2OP2iyi/Wa8NTrgwWz5MVRiggmvmb73l3C+42ECW6ZYAqlEx6VBnRAwRF0qE0
 AJmAjgovZ3oiPd/6zxz4fpMJl+qsgysoFcJikhGEYdEw2X+FD5DYo30s8ue+38tqPFcZXIuxUBL
 d7MDKE739S8ITwvwHSYCC/6mkpXWKBEB5WWxntpApugJLbIooyULFGFvXo8irewPysDJBFzOzTE
 tdbErOIrmrTyPUYN4etaaWdtQQ8jOAeSPL5Yq1eg61EMNTwxmNv3FFID2YpsWsSKiLLTKQl2gVx
 7oaSEDIWQL3ByQQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_045255_931951_0E4B2DED 
X-CRM114-Status: GOOD (  17.42  )
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

Rather than setting up the core, obsrv and chnls in probe by using
version specific conditionals, add a dedicated "get_core_resources"
version specific op and move the acquiring in there.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 113 +++++++++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 43 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 38fed8a585fe..188252bfb95f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -203,6 +203,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
 	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
 	return 0;
 }
 
+static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->wr_base = core;
+	pmic_arb->rd_base = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+
+	return 0;
+}
+
 static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
 {
 	u32 *mapping_table;
@@ -1063,6 +1077,33 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 	return apid;
 }
 
+static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->rd_base = devm_platform_ioremap_resource_byname(pdev, "obsrvr");
+	if (IS_ERR(pmic_arb->rd_base))
+		return PTR_ERR(pmic_arb->rd_base);
+
+	pmic_arb->wr_base = devm_platform_ioremap_resource_byname(pdev, "chnls");
+	if (IS_ERR(pmic_arb->wr_base))
+		return PTR_ERR(pmic_arb->wr_base);
+
+	return 0;
+}
+
+static int pmic_arb_get_core_resources_v2(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
 static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 {
 	u16 apid_valid;
@@ -1246,6 +1287,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 	return offset;
 }
 
+static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
 /*
  * Only v7 supports 2 buses. Each bus will get a different apid count, read
  * from different registers.
@@ -1469,6 +1522,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.get_core_resources	= pmic_arb_get_core_resources_v1,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
@@ -1484,6 +1538,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1499,6 +1554,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1514,6 +1570,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1529,6 +1586,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.get_core_resources	= pmic_arb_get_core_resources_v7,
 	.init_apid		= pmic_arb_init_apid_v7,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1565,16 +1623,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	pmic_arb = spmi_controller_get_drvdata(ctrl);
 	pmic_arb->spmic = ctrl;
 
-	/*
-	 * Please don't replace this with devm_platform_ioremap_resource() or
-	 * devm_ioremap_resource().  These both result in a call to
-	 * devm_request_mem_region() which prevents multiple mappings of this
-	 * register address range.  SoCs with PMIC arbiter v7 may define two
-	 * arbiter devices, for the two physical SPMI interfaces, which  share
-	 * some register address ranges (i.e. "core", "obsrvr", and "chnls").
-	 * Ensure that both devices probe successfully by calling devm_ioremap()
-	 * which does not result in a devm_request_mem_region() call.
-	 */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core = devm_ioremap(&ctrl->dev, res->start, resource_size(res));
 	if (IS_ERR(core))
@@ -1584,44 +1632,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
 
-	if (hw_ver < PMIC_ARB_VERSION_V2_MIN) {
+	if (hw_ver < PMIC_ARB_VERSION_V2_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v1;
-		pmic_arb->wr_base = core;
-		pmic_arb->rd_base = core;
-	} else {
-		pmic_arb->core = core;
-
-		if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v2;
-		else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v3;
-		else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v5;
-		else
-			pmic_arb->ver_ops = &pmic_arb_v7;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "obsrvr");
-		pmic_arb->rd_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (IS_ERR(pmic_arb->rd_base))
-			return PTR_ERR(pmic_arb->rd_base);
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chnls");
-		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (IS_ERR(pmic_arb->wr_base))
-			return PTR_ERR(pmic_arb->wr_base);
-	}
+	else if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v2;
+	else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v3;
+	else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v5;
+	else
+		pmic_arb->ver_ops = &pmic_arb_v7;
 
 	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
 		 pmic_arb->ver_ops->ver_str, hw_ver);
 
-	if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
-		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
-	else
-		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
+	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
+	if (err)
+		return err;
 
 	err = pmic_arb->ver_ops->init_apid(pmic_arb, 0);
 	if (err)

-- 
2.34.1


