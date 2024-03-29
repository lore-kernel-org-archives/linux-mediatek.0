Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68302CD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuRJarbec7jfhNmRygSPVxuNpYaNSltHxT1UdGqVad0=; b=V84IOSqGOA7tjCk0byTdgw8+TN
	06irHuqSyvpJYHJXAUTzDV9w4o0E7G8O6L3x+Rzm7b9NVa2eZtnmgFG1yiz5dZTWus5AAHQA2If5u
	xPnvWJ9B+oH3YL5utTLrQpftZJxinhtF0NBEtiiMLf0hcyHNZ6GemN5vfukyrqgNKTEX+CHKLYG8b
	UpWvtFi9lsWHs9iLhkuA2O60ZdnkfF2DxbtaD5Jcdq6DvAeB6ckrZr29rjgGwJeQifgcKGEstx2bC
	MxuMESrQxT35JWKGqpEwdU0SfRTB9BGxexqHHImu1hVSFGcyH+8dNZlls3DLYuTtO7R7EMrNTGyHV
	i3csRLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNs-00000001fLd-3hnx;
	Fri, 29 Mar 2024 18:55:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHNM-00000001eyw-01Jq
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 18:54:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so2815870a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711738489; x=1712343289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuRJarbec7jfhNmRygSPVxuNpYaNSltHxT1UdGqVad0=;
        b=Rq7O7yxVGzKF21k9NoU9czNVEq9z7bg6qQze1SMPCT6SxtfG8N9V4LmS1hyiAcZU1N
         7LGmMG0gBxKhTPnXzsTeIZhggH9DFrJxc8BCQwRRYWXAHee3gHOkjNXEKkLOosHC0aXK
         +h09o8xpi5EJjapotcVW40WUDguxizuvN9DR75VnDR8OoQQq2Je4QkQKMMvHP0RUDtYP
         owxY1LO8IYg9DilPezmU3JXdpA+4hr8WoQIKqovHiPI7xZ5d6p+hb0z/2nZm+FqLSCx7
         qRhd3mqznRUAbJTAxGa4ZTBGPzZC0vFmuTi9ZtyopMP7GPXJ4cbMRQ5qBXHtr7madDC6
         dldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711738489; x=1712343289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuRJarbec7jfhNmRygSPVxuNpYaNSltHxT1UdGqVad0=;
        b=pbbzKNWLpgVSJVy9H5TPKN4iUS285AgLaD1nV8uY/8bjaV1S5B9O4bm5SVCI+KzWjG
         wtwBEcswyjbVV+rsaGxjjFvSz4f1yg6gHqhhkR30RE+XRlBRx1Cax/Pw80UENYQIUthv
         KJtkQPAxZ4WmKK2H3NycVX/D38zb7aIgzjy9lUr1bBA+m8otABHtYKMlZlsFG7fwmij+
         CvBckzH+nFsSMoQoNe/zu3qfq2XANrNrz4z7wp8eX1eULfLWFjDVW1zVur90jNo1G0ZC
         oA6aTXn2j808NvirLpqkC8MjrCTT/4B69Ey7WNHab+Eo7lAVqIdq4dOO5l6uRh8U2xzz
         TQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXwDZp7jaTeZjRZGX/1mce/B+ySINdy522BJPimibpRHwr1GDSOzCa09vXxW/zFMj7jhIg+WCT/BavMyo2aQAS0AoY/5it7HD/nISMd6CUFNlQb
X-Gm-Message-State: AOJu0YyfxEAAMHDaKYoCadvvN/xMrEPi/DCdTB/SY8EN0NE/p/C7iFKF
	7tjW0F0iMaQQYWYTaL8wtoSAdEpfZ6PQ+8k1d1dW7GmTQBi7LI7fVoYOw0IpTbI=
X-Google-Smtp-Source: AGHT+IEkfmLlGD/keMPoNisXIDK6Cw079oLjkff8JBeQJYIy5gvktwlheJQX7F2EEstW1KRY8l+CIg==
X-Received: by 2002:a17:906:751:b0:a47:533b:10 with SMTP id z17-20020a170906075100b00a47533b0010mr1949297ejb.62.1711738488994;
        Fri, 29 Mar 2024 11:54:48 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gl20-20020a170906e0d400b00a46c39e6a47sm2235618ejb.148.2024.03.29.11.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:54:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 29 Mar 2024 20:54:21 +0200
Subject: [PATCH v7 4/6] spmi: pmic-arb: Make core resources acquiring a
 version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-spmi-multi-master-support-v7-4-7b902824246c@linaro.org>
References: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
In-Reply-To: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7896; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=vH5adHP1EAvzF8O0o4HxU8svaRA6gdvZ4ICXbaOtPTA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmBw5tutK7rEXCC1CRUOAszcBVUrqbBgrxWDwTx
 4pE8Zr4o6WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgcObQAKCRAbX0TJAJUV
 VnNOEACAoQukHuH8idc09I21aE5kr9LtY48y1QJrzGLO4KLU6bIy2mBX5B+84hdzsSSF6lFpDmZ
 +yxQRqPS9jBoxPPQEVlR8qgQo0xQDfK/UfY2yS6GyZz42YHsf7yB9qNbBIYX/HBMCeNnio9e44c
 i+7IYQroFIReNs5KcdVU8kuH8IlQnP83/tNr6dqOfRs2T/WXf3y8zSF060+mu0NxJwR7JwLBSGW
 AWGz3lBEgrlbICGxbCIuBj32sCtdsWbuz95ZB267ZvNIKgzsVkkSZqz8Og4pyysGgCw4Zprd/mA
 DjjlDSe3zVEmK72aseNprriaGqm3aPaDtVZhyS3UccFeI2y2AV9g/kx8AXAGsJGRNUYL3Of538B
 bJhyJi4PxrAMfL5Fmi3LgxRnD5nEaRnLET3OkHONpZrDYvBJE68CW0Tusl91VKjBvdimDerkH+I
 SYCuIv4Yq+RHNSD53TG0CTmxbbDCjbL60MJOyVESy1uNk+BJzktucQwM/g6aYi1lw7jpwQojAkl
 VVl+CiGSIaWhNhPK1bGm3EKwSRNfHpZ2r9BVp/t+AFgTQAEJvxUhws1ji3yRDTreI2kv+vokmWy
 XMjQdJL8Bc9xAWJLBUg1urnXAuQE7wpxGdxCeZu1DZ7+Ln1Clh9QavcRfcXelfuGw/T7G/b4x2Z
 zIVrpzA5sDkZpaA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_115452_250423_E1732B6F 
X-CRM114-Status: GOOD (  19.47  )
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
version specific op and move the acquiring in there. Since there are
no current users of the second bus yet, drop the comment about why
devm_platform_ioremap_resource can't be used in case of "core",
as it is not applicable anymore.
Don't switch to devm_platform_ioremap_resource though as we need
to keep track of core size.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


