Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52434C54E67
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=; b=RIDkI8+RCCecGIWpf3JZKRzlH0
	X47NlL0qNZ6wnxjM11AcAS2R4VZy6Ucj4sMM8cvLq1YWmdA2Bjw8ly4tBla3oqLxxMmxP9D8TKjnL
	CWlON+3ARjdY1SzoMKtb9AaNRkED8+TpK85vD1QiyjsatUv2tg39gW0koKkDmxz57Hmi7XkR8Dq+u
	DF8x46IBCkqYxXUdDE6zTIXhdqQlxVvBwGUoAblTUvfR2MwbK5o6BrYoxRj17FEWZ0xJC5SzHen8+
	ddeFblxfrnJeO87/7nsYElXdJsAYo5ulF17Z1Zm52kXmLTv/DSjS5KW/MUSzsMPWf9KoviSgw88Jg
	XqqyfiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9gA-00000005Sy2-14sd;
	Tue, 26 Mar 2024 16:29:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9fK-00000005Sey-3Ox7
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Mar 2024 16:28:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a44665605f3so674451866b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Mar 2024 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711470524; x=1712075324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=;
        b=Nf+GEc2J6hMryjnKpuUVivG1ve1Ikf0dYrgq5KbQdclX4shxCgAIFZNimi/b2NINEV
         Mo+gtEqCC06gUmo+2srOpGM9nr6PXD3Lg+WqDJu541s6fDkfQx5iAdNqwynmKyWdO4nC
         QxeAQeWkArTbi5EvZGLLEWq2HQWY/vajMsuOzOp1Kk4gG8qYcnprw/drRifn0rKbprbY
         ePqDg+Xa/dfgnLYzddk8o+Vg5Pa1XmcZbcjIUQpqF9gb+tCi0H5wDQSrvOZasypFtH89
         nUiMayVqhxnL44cv3VomSnAZnv+3b06ElDOCy3HDsk3ajb/Lb5fNXlxXfhMs8JKyvLm9
         7z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470524; x=1712075324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJWCFRrkjZXs2WI32Il+ppCE1cfB8jGTI/OTy71gmgo=;
        b=vctIDWlxuGL0XeehWSB7OHU55hlgRVsHbjhTvAdMzINslhi85f/NmLB+3bH9+F5p2Q
         KbSeGo3Homc1NJxsB1rI9jgGCWsUx7OsYbEauxE+YPeFNijhJHZu1OstjCrsELo0ZDj6
         6Z7bJ+THUJObiHrwRh8AOJMT4B+h0BfHmm44mAzEsBHPIwBx+xyj2tvcTikCUCzkJcSn
         8rmGoNDCZOqLy/+kaELDYNJ2mORm39YYoHU6gXHXWyYqLty5rVm4hZbX1qj/ToE0i6MQ
         vrPZfUIUlJT7NG3/XQQ8PDJ5Ry6lNXY4wkRYIbhdSAqTrJw0hdm5Bv4XYocdBt7EtNdi
         MjPA==
X-Forwarded-Encrypted: i=1; AJvYcCUdnlsFVKreUKEbRvek7tS+zmiA5PDFob1iN6jj8UcWqPSCf/NuHkqDX2CkhpQPbi1IU5bXiHnjMWzfDy1KjOf2ulEk4/JZx23YiYw7MmTHAafd
X-Gm-Message-State: AOJu0YzSeCpxaBpAbjs46fgkDaURuBODe1feXgM2O/p73SITDsiSQue3
	OI1Wsd/pn+zIKT2KAhgxR8iMGNbcW1eZvEzTqOhW38NEUtSc9PYh8petwff2f3k=
X-Google-Smtp-Source: AGHT+IFAG5wruUleZEL7CtU/KtUzcqK30D+axysomjwzYdnwZu5Pc+Jhi3SyFctMqqxWhHFZXLrYOA==
X-Received: by 2002:a17:906:1d4b:b0:a46:9395:54d8 with SMTP id o11-20020a1709061d4b00b00a46939554d8mr194910ejh.14.1711470523930;
        Tue, 26 Mar 2024 09:28:43 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm4375051ejy.214.2024.03.26.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:28:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 26 Mar 2024 18:28:19 +0200
Subject: [PATCH RESEND v6 4/5] spmi: pmic-arb: Make core resources
 acquiring a version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-spmi-multi-master-support-v6-4-1c87d8306c5b@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAvexoOSBjVBq8j2la4sv3op92CycuDZxbrn/f
 YNHCP+SQZWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgL3sQAKCRAbX0TJAJUV
 VujZD/9GcixiXW7XWE3cMEzM3dzjIE1yorzLj+qnd+3kCKmzsxeWmKbHV+YLotKTlIqucETm7OK
 5/zA+BbrvjRHqClaZgmgvCGG8tAA0PXsZL2fSIG5SXgnFZdxDHo+Dk3NOcLhIl3Lj3l83rLvcsh
 z+7MP/9cF4ohGADGSb9B4wZmQ9/7LuinXMmZphsdeiKG7/jsM8grL2NttQDbXWhobJ2m5PP1oBl
 EsULcWq+qK16TlbTBp08VtC2qYlpwwhS039c0iMlhyworgkjlyH20reRRLiA71sPd9Otya/kzz8
 RjacoXmkWmuX+9uFoxpmMMAL9FzayJja+aJixT1i+zl4Dv7zY+OzMUqnoEvVYvOdmHgUEbXEjfJ
 ewX9A3IWNx2LYiZmjAbht5hCfgVNNMURxG1M2kjeSsYoUuvGif3AflZMnWhUplPnkQuvna66NZg
 7ngfoKx+EbVRIm7lXvZ1oNZc2B0rsvxhJuthlsNki6B9NrYLstj7aZoeZOxFHL6db/RTF0WD/p0
 7ZKlWmcGb/zQ2wdbtDVJm5gTdZFbrP4Ghlk1SFy0mMRUcTiwMopr1W8cRa2mKGkhfPiA8ZeUDQa
 3rkIcCkPlZF903Qs1AWIvP8eSx9kEF5RyCc8wDgjDfC6E9eqAtcCgjQDTwODHdzc2AnRX1EdHni
 1Tfdq98q+xfjS1w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_092847_432644_BBCDABFD 
X-CRM114-Status: GOOD (  17.56  )
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


