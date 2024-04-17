Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49CC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ik1QcwFkKnesUoCKrKTfZ744eQhYqC76PyVF8lARPM=; b=O3vy08OS+ki/6mtUDfcvbREKw3
	4KW5pHumj2lhCn6JuJgUUkn9wKti1L1y0vHhNDfdQz/Lxn9EFvCw2xqPTLKaRLKeBPQB7qtEVRdOk
	HgZ2eG2qe9lcY2TPAFqq3JtpdEAy60aWA6sGL0gqG0ZvGkWkgeUERIAqZ+r01hSw9w40zQtn2VpuR
	DzOtaonnkKkq21kh0tiZnmiP9LTKIZT4l2sy5XhbYPJR3XDPGp5tfoIAeAOW/XB8JKPIrZI/QVb0z
	Sy4ZSOrW+QEPMz8ATvtWT3JfgHNZUBMi4uHiBM5vkFcyaZa4GeyHV+2gNlHmd3w3Z5R3lgPYZSJZN
	iud4eyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTZ-0000000HQru-3JxK;
	Wed, 17 Apr 2024 20:01:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTH-0000000HQeA-3on5
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:01:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so2199163a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384089; x=1713988889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ik1QcwFkKnesUoCKrKTfZ744eQhYqC76PyVF8lARPM=;
        b=FxLfd6Hee9ivdK+bqeadA7CSjmPZ5Lh18DBstD8wKhfwyk4J0vezXiXaarHUzJmdOm
         PDSNk9Q7T2rB4NepV0jaZ4g1zYwWMXc6idEEkqEBTQvc5myfVqmrwRHlz6miZOXxsuN+
         OszmrmH0QgmFSEPIwWuA/N8ELn13roS0q6AHvSWW4El6jyiNjzlqRV1weyoJDT5K33dk
         kaEvsLziT6papxyGxEHL2w/FzWUMGqldTG+tNKJPZIXFkj4IeYQ/xAyUbagEkqKpjv8o
         kmFWIdVmxH64Ec7YfrQ8m7bt1j7RNDgQGI49mojDM82AtI1DGYEkWNrbFrZecsCdmcuD
         lduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384089; x=1713988889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ik1QcwFkKnesUoCKrKTfZ744eQhYqC76PyVF8lARPM=;
        b=YwGvtfqs0nP2iJsuaTj7QeTLDNcyKS4Uw2swNJFvW2OCOubUuxg2YqOtVtkrkHMl2n
         nDQPs4OraVr6REu57WMsooSuaiUZfRPeY/VafEX2spc53chgbiTtOruGToOR+QApsl9x
         vJtOSY7Z1BIbVpmDTr3t4S8uzp67QkA1EnSEbzGSPq9BhfN8NVSjQXWZJ+FV4lBSqArH
         D1ijQiLAaeGttzc4PqS7hCWUBDCBue+t1jvw8etaOZHLUb0SvrUNHDJrcb5z9SQ43+8b
         FLG3zTinSOvCDBY0aHIhcxGU1xFXop0xuCBjVkph3QPQgVeNjxEA6ZDXBRtByreOYR4n
         llqg==
X-Forwarded-Encrypted: i=1; AJvYcCVmdvZEEOphRiOLBE6BU03LR2f7/0ys8c471hM/VQTG2f+5LF87a+owENjVNWszlijKzSjXmrBIlESnqJRfSjpuPIPPbWFTsPSlXnGOGr8x9XNd
X-Gm-Message-State: AOJu0Yyruh1zmOLTFzbhCsHWC/HHbniEPiyEXS06cb4NYg3ObhfhfeOu
	YjEVQ0rldEF9ZcHij+05NP8XMp0qCSWw8imcONE++Zft7O6RBkfLCKLLv4po57k=
X-Google-Smtp-Source: AGHT+IH0ADVjOSm46pm7JjBY2G41SJgsx0GYCr4kfnbaMkRcZph7J0C5UHNbVGDyRkwCgDxixTPbbQ==
X-Received: by 2002:a17:906:33d7:b0:a51:c62f:3c91 with SMTP id w23-20020a17090633d700b00a51c62f3c91mr145681eja.21.1713384088938;
        Wed, 17 Apr 2024 13:01:28 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:57 +0300
Subject: [PATCH v10 5/7] spmi: pmic-arb: Make core resources acquiring a
 version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-5-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
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
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8178; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=JgE0pLWRTv3liz7sG3qb+WlIgraYdzr6rzGEiGnF5I4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICqIeZOQ/UFnoQfy8FF9orO8nCgmRRZlXvP9E
 obaa5rfUNyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqiAAKCRAbX0TJAJUV
 VnrHEACcNk9YzKjklZVvURP0R2ebjLmBuVNrEpPeJWAK6M8jxodrHRei7dQWJjTjPknRP7tKwuD
 lUedljsovk4q7UZt4yeX6kIbH0zcxppunqWB6ri3PA0jYP7BWbZ+w4oUUrgF0QGc8+FGtUKE0+i
 7DwwW57X5mSwAfp/DFyQAkBEoZqru61D0Gan0rMZzKvkaIqH/MU65YG5d5e10qeiRDy4+g0hRLK
 KeaOrc/qp7UJb2WRbJAQ/giyPYahtcc7rlFX/nVYtT+InNmEy0aHyVzwjjaRxVR5md7C21px/g9
 W5Pap+fFjCcr0UlDWfqWzGRaauEYhqAUArGimmPThwTbFeZ+FFJVD4eZ3gmJvL7VioqUcNeKYbX
 2affei5CxttUztREbpi5c+7jq4SyZ3xR2+pu9zS+EMZaEVU7I/GwfWOGW6+5Gseh+t4WCbt4FmU
 cLN0yvSIftEpPRD/hGmwWmu89oGdxtKsKnXdKV4xyV65b7EKuwnqBeborL/pUK5zHgjTeJkJQPz
 uyME4yjgmefvjIET0HP9XPa7h4pqCcV4T5zRkkFzFdFgM684bnIugdkitiA2PGd/8KqgOREnx1w
 m1lNJ28BPjlWa5ZBEVS2408/80kD+fO6r9F+6rgFMJqTbHeR2ZehbyfLswrfSE8j2iXNcw3gzrq
 3MMIMjRT2PC1aEA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130132_048831_9484FB99 
X-CRM114-Status: GOOD (  19.08  )
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
 drivers/spmi/spmi-pmic-arb.c | 114 +++++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 43 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index fe45d62a42e2..db33ca0e11b8 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -186,6 +186,7 @@ struct spmi_pmic_arb {
  * struct pmic_arb_ver_ops - version dependent functionality.
  *
  * @ver_str:		version string.
+ * @get_core_resources:	initializes the core, observer and channels
  * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
@@ -206,6 +207,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
 	int (*init_apid)(struct spmi_pmic_arb *pmic_arb);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -961,6 +963,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
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
 static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb)
 {
 	u32 *mapping_table;
@@ -1062,6 +1077,33 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
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
@@ -1239,6 +1281,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
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
  * v7 offset per ee and per apid for observer channels and per apid for
  * read/write channels.
@@ -1419,6 +1473,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.get_core_resources	= pmic_arb_get_core_resources_v1,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
@@ -1434,6 +1489,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1449,6 +1505,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1464,6 +1521,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1479,6 +1537,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.get_core_resources	= pmic_arb_get_core_resources_v7,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1515,16 +1574,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
 	if (!core)
@@ -1534,44 +1583,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
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
-		if (!pmic_arb->rd_base)
-			return -ENOMEM;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chnls");
-		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (!pmic_arb->wr_base)
-			return -ENOMEM;
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
 
 	err = pmic_arb->ver_ops->init_apid(pmic_arb);
 	if (err)

-- 
2.34.1


