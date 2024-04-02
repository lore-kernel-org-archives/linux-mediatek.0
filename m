Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A005FC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLN9WNUdytta+DCs//0H8ccz+F/CN1L2bvQTLnp2UBE=; b=DkW8/39fpSPHGbiqnWXfi98nmW
	qSlXQ6Rn+Eq6WitTsBNsQFIaS0DUkHB7JceXlLxLsotKoGvNwj0PhgYzC+XIrid5dHg24P/4p7/zD
	kYteN7vaDHLLyp7FW4hEhGmQ0vYl70p3DaKfqgmKC/1+yDOz5nSJWykylZIsOlui0HXgu6t4eq83j
	cceyBuSKU7IFkYRqw5AKBeLJ5wwkS8qmTqUaRE5lt4LYRPGFOA8kZ3a6Y9XHyzfDRRLCGazgIhurD
	EJ4EiDi6pbii7VcDohQwnfvliaMH9PbniEue4Mbg+VyKZ0n3UpHIgQyNBDlebM9h7sSQCUkohm2EI
	Tm25MNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcwH-0000000Ayl6-0GG9;
	Tue, 02 Apr 2024 12:08:29 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcvu-0000000AySh-0nzD
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:08:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a44ad785a44so571287766b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059684; x=1712664484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLN9WNUdytta+DCs//0H8ccz+F/CN1L2bvQTLnp2UBE=;
        b=lGGC6iIhT1SY+E/aVTtQP9OYLEQwHgjArCwqeBadmPM4XfKRSMljjP2qlQlwZK+2zK
         tnLXqg/VXYlf3xZyRCEfzHtfGBLTR6UNK5cIQROajnWQZaPtc7bS3KKduxVZD7JKOeQq
         tDJJCU+uvBbzzoUq5/u/KDM+qotuBpa4VuJcCb5s4qRKyp8t995SBb7+v3ZxxKSdTszw
         fjbj65XNv59YRHq43mfz1lzZFd68O80V6K5ONiHeDgbOqQRr+1WyHnSARFHT2knwYFc9
         7RV2jiVRnYKNZMTcqnHLwhvlFfyvTEeS3jbnunq1A9OjMGC/H9ngXLSY++mLk3xfHK6q
         X6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059684; x=1712664484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLN9WNUdytta+DCs//0H8ccz+F/CN1L2bvQTLnp2UBE=;
        b=EddoJ39F1GxFWbe2rhwRX1VdPj+T8RDBL/plRSU1PQDXdSbbc5UQpMSow+kHjKPaoo
         PKViyHcdk4obUhICN4W+1+j0gbcLrLN66WM94lfNyI9NgkDEepzcFwhGo7A+wgIXrWbl
         4C3b95pzPP7UOM6rRQxO0b+a+Okpoo7H9U1YlGPrOWyiOL0xuKtOl7qSaoh/XkntdPWF
         yYMMWVh5Flc3lcIDfokxBjiHYe1NMknRGPJqnPVGDB6jcxtnaNos1jN55MZiofCaLFZf
         kHRz8N/UI9ngKwfj5NlEBqfhWpYPg+WheTSFZfRAV4N4GTWLflSxQaPJR3Vnp2z4APmg
         dsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdBQREoPoCFZ+s1HATqRWMVSQzqo5P8ytokMoev7YW3RaJFB5jxfXnwGi3TP8EHIMZLvRvFIMDNfPuQ7BGRCHkM3cZGrCr0acywRBglJNh9AAp
X-Gm-Message-State: AOJu0Yyh5+5+3tM2tfnk+naaZOK4HX50YQPUeMM30uStmuckpWlG/k1r
	1dElOrJiY/mqQ1DY8QK/aWzIfdlbKCFj6D1PHZlSN1AatWd/bwU2hbjtKSqU9+c=
X-Google-Smtp-Source: AGHT+IFykqzhuay1j/sfklQEoJnE1/8PVJNqyR7rbL1TlN2gu47JERvBgxs48GHilPxZUhuDj1JzFA==
X-Received: by 2002:a17:906:f0cc:b0:a47:3428:2b2f with SMTP id dk12-20020a170906f0cc00b00a4734282b2fmr7437788ejb.64.1712059684163;
        Tue, 02 Apr 2024 05:08:04 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:08:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:34 +0300
Subject: [PATCH v8 5/7] spmi: pmic-arb: Make core resources acquiring a
 version operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-5-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8237; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=O7cNoZmVJWFEFWJmtPJYuOXR0ryp+dBLUdbgokTOciQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/UW/l9NfW87+6fhsij0uYti2odDmCnO7Rr5g
 RIiXvqys2aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1FgAKCRAbX0TJAJUV
 VgKhD/4kjFXwwb70eAQh4aH2yC5sviEPNz2a0eR8CzUhs0oWyBdP3MqvcBwLhdWDgnXV2Uv2VnB
 qV4fTiKbFJJKgZ2anVsJjuJN4KzmF3xD4y47NwXIiYMpzfKxfSm0kOXbJvRNTRlWuNDjdjHQ5s8
 33V/Rq1hA/f1U/92uicRL9aBoBV94FIhRMp7ifJnjeGt+DJIq5BkDljB0PqFl0J8g8DHrqBgaIo
 GHU0H2B4B0JQPlQKz0JZjiXyaISI0z1tLhXIIuyzXZgs2O293ApFVzchkz0EUwjFCYPOk2vOc63
 a0doCCaSbfZJQaqjadKV6MdcB37aSWbwl2pV9Msg4nMNtA1RqWKJv/H1G792sFfV0Lu6wPRoqs+
 p8bf7h6rJpw5J0wdppny3kDfqEL887w08ZapP/Z7nGb7D5kLxsGYCp2KQ7nILl7maEDeSg3VhFv
 b4mhTOwtosRMdWazFvpWWIL3kv0AIvStXx9op6O95QPoFJKEizTVkC+3urdwr75GzilCWipAFIs
 azeXQWRpgUCGR06jCVUcwNg8q6I0bf9CDkoJfF4+jQMlK6iXsoz4xRlAsm/HkwcWooVVX3dAIeB
 MLwcNlDwYEfhp0MX5uJoLPpMXLRL3Oa0FEK2v4XA1RB1f1/YVV2qiTPc3NRKd8tAx9YxbfJtvJX
 AipvK/ZjarLADHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_050806_353992_A5B1CCB8 
X-CRM114-Status: GOOD (  19.58  )
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
index dc969f8bed18..ff777b4a6f33 100644
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
 	if (IS_ERR(core))
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
 
 	err = pmic_arb->ver_ops->init_apid(pmic_arb);
 	if (err)

-- 
2.34.1


