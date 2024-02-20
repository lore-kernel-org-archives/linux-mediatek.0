Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4649C48BC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJU+qiLfShMKFnClWJ+LsA155QSh6V5eijJEbScCWrE=; b=1KGV++sLUMo4VTbVi4LpxXOtpJ
	tzh5o1LWkIgy/9IPlg4ClLkJ6NEElqr2oRs7EqNheZZFwq9mvoj3RWo9G/OKEw8c/d48I6D2ZUKub
	z573q1kTNqtnZe2jaOSJkP8I3GIMucqS4N5Ol4aoYFPxEchSESvZ7t4YXZ5ryZi8Ejy68C8atGCdj
	xZ2QAkLqfbETr0rONtt0f/qjr6aFkjGpfe7tfkRzyMsh+2Ml+qRAKkJzOE7I7N/xZO97eZpk6W2Vk
	NC8wbHwvKEO4W7GtA8Iiq8L9LYaED0fbKNHztESBnYP5wVh4BMQb8ky7WIDqhQGOJipXR7Rnvtf42
	Pbw97ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPj8-0000000Eljz-3qBs;
	Tue, 20 Feb 2024 13:00:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPip-0000000ElYK-1KVP
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 12:59:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-563fe793e1cso5194115a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Feb 2024 04:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708433981; x=1709038781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJU+qiLfShMKFnClWJ+LsA155QSh6V5eijJEbScCWrE=;
        b=b1xXhLa0n6AFb8PrOC9urwNO77ZhzFpe3BbRjqCIYaRHash6lntGtMmTAZycfUQ0fL
         gmkaJ/SdgwtluczhtHJUzAwkhtV/JcZD6THHLjYpELy+quv90qROiGwtwO1C4racuOA9
         t3KBQUKRMzCaC7ZdEQuAqMo8u5X9IpmiwLDraQbw8vt42hT3GmEti3/qmMlBRSR0qbiH
         9RLSjzoRAMl09h8/sHHFVcP6BbJJ0CxSRX7hCUcHs6Uvy5/cvILEBGzG43ZscHsGZg6x
         A9p4yfLyanmUJ+MFbfw8SI+4Q83Tq1YTRDYjyS7sWWyMy/x45mA0vS8g0iYTO4+dRGAP
         qAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708433981; x=1709038781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJU+qiLfShMKFnClWJ+LsA155QSh6V5eijJEbScCWrE=;
        b=SK0+Uw/a/Of0sCrWgqOPDHrnsJqy1zbgw5PXYi1hVF3WRSSzU7JXIP1o9NAaN9GeN7
         hC6pKe4ajJcOUw4E3wfbBl6UN/oqLKgkidr0C5Vk+C02aWoZkqxY4A1AdL2bCx1GdhDw
         J+nFI7odZeVQ1gl8zRaTw1pkuEtlqU1UW37jkwG0aQy0EU08WSmUjTDhQhnq4F/+jAA1
         JJqs4V+Qb91vjhtwZ1zilFBqboMBIhayroB+6vVL6U1ovcg09ngVKJ4uZb7eMSDc10eL
         FlLlXyis7BwVDvE5vdAJMdL3YWS4iOnC53xoCl0PoIDdQph54C4D6jad5/JKuHHmmQ+i
         K8UA==
X-Forwarded-Encrypted: i=1; AJvYcCVyb2mamXXSmk+G5oWBEBAXX3vaw8B7/iIg2V0e5/JicSy7EleFI+SwEOWzQ5EDm9KhCL49Yu6P+LdSzAPEE67d35DtgKHFLIMHekfsWsI86Eaj
X-Gm-Message-State: AOJu0YzcPMljE6un1/3yuI0FrpF9qrbNvBchXIOxb/EeJQ2uCf+D4v3D
	MY77wjY4LQmMQutmBnhD2b1QzFDlzW6RIpoyLRCiibQJmeFYrpMcu+ktGBj85Aw=
X-Google-Smtp-Source: AGHT+IFTU8HAkI+y8TBkvHijTzj0OheeS453Vyx4i6YSIs28n7KxAwTO8JZie2ZimftOVibbFLy0Iw==
X-Received: by 2002:a17:906:ae9b:b0:a3e:e84b:232 with SMTP id md27-20020a170906ae9b00b00a3ee84b0232mr1571112ejb.75.1708433981473;
        Tue, 20 Feb 2024 04:59:41 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rf23-20020a1709076a1700b00a3ce36ce4f9sm3948802ejc.83.2024.02.20.04.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:59:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 14:59:23 +0200
Subject: [PATCH RFC v4 3/4] spmi: pmic-arb: Make core resources acquiring a
 version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-spmi-multi-master-support-v4-3-dc813c878ba8@linaro.org>
References: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
In-Reply-To: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7622; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=eoBqasf2Lf4kUVh5GoF8UMFjxTzmG4XIhpcZ+yy2rOQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1KI1j15AdL3iObZKp8qMphgZYSKDsh31QNQGz
 5Y2y/XmNEeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdSiNQAKCRAbX0TJAJUV
 VqvlEACaWqBY3l0w5nJxEJWtUZlGVcc8i5vgbq9Ncmz8w4q5pUhhuIS/3b6W5hGZ4TL+tP/mg2q
 6S789JPyXknh5/qovzv+uz+pOjxrRzEFKYRvTZDhzs1YXYbWEQKVI5OyxQ+bh7Rt957cYOkoqYG
 mHCndlJn19SfnHO936OBxfRdgBFtaScKy/AUdjcojLUPzkYpPORLiGf3/MEEk3MAtXj4IrTmosw
 da2mW5zL6nLvt7G2aLO/bKJgy273QHrx9fel3AsS2cuQ7KxNsg8ZLdFOiWiT1RyqGOK7XlxpKw1
 qq1bYsd3lrRUhu4X0mIcv/cwwoPWNaWJyrhzFhy5NjIaYORHfPG/gR0m/HSwNmA+tuCCt+HlmFf
 dSOw1R1dzYWb/6+OwpjxrhRfGh1xSnAUzGegb6OPgxYI+LiBbtr6Xb8/t7L+m9nv/Iemz4lw3di
 WKxSiYOMUgty84gLbjOr2Jpz0lklzSiqLo0YByvdh0J8rX0p1fUKnw+aDfZXK6e6yil0IHi2IN2
 WGQRW9ylhdxQLg9ucGvOZ9LvJX7FVXYDLN84atY5i0CRzjitKvtpnBIu63ciXDKB/Tvi5MPC5uk
 KPXcaABYYhJ5/jtiRnv+Pd6oWfBYsiMViXaMlgsKwduSOE9KZ1rofsPy2R8Mrxel98nAZ8P0A2z
 sb6iQ/31pk0uj/g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_045943_486740_1253C5DD 
X-CRM114-Status: GOOD (  18.44  )
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
 drivers/spmi/spmi-pmic-arb.c | 115 +++++++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 43 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 38fed8a585fe..5aad188a3db2 100644
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
@@ -1063,6 +1077,35 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 	return apid;
 }
 
+static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct resource *res;
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
@@ -1246,6 +1289,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
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
@@ -1469,6 +1524,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.get_core_resources	= pmic_arb_get_core_resources_v1,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
@@ -1484,6 +1540,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1499,6 +1556,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1514,6 +1572,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1529,6 +1588,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.get_core_resources	= pmic_arb_get_core_resources_v7,
 	.init_apid		= pmic_arb_init_apid_v7,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1565,16 +1625,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
@@ -1584,44 +1634,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
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


