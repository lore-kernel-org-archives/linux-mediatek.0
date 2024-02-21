Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D0C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oA0fmKcMGpa77tBwzlw1ahRCKvmpIwJPYwf28NyUZ4=; b=cpefr/y5cIFC96KZrC+5Y744Zk
	vW4fnwoQ+PhD3m0+1X2LHLOrRybzJ94OZ/qljkXcEm7xZd7tXIMGdNe5uwEyigScUqFlBZgv/ngsr
	nE1/Vjoe0dpbPYzk6JRWGVaYdOM7mjh+faTeXs9k7LZ9eEGRCmsFldW4Cl+z4FEbqJZzipR8W2u0D
	yqfLyYl0HGOx6QNYafIB//9XuRUt1SB3uDXV8gfv+9jD1jxpb363g44p2t1f/9pC6b5q1ZqyIGp7T
	fVRvTCDu2oKNDIY9N4u68hUTKqyU1+F3jb4G6txJ8JPmIb4kvKcugAB8rW+YN8MyDZjhTDgYR51QS
	8g4kMCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm60-00000000ucr-20YW;
	Wed, 21 Feb 2024 12:53:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcm5l-00000000uU6-2Cx7
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 12:52:55 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so420335766b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519972; x=1709124772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oA0fmKcMGpa77tBwzlw1ahRCKvmpIwJPYwf28NyUZ4=;
        b=aVykvwnh+6R7t62AKjvIx4oOk+u+9hEh9dnyhbrHK/ZAR5J05cW2ulpICWpLDwvvqR
         2fXNR03b7PWKcY4GfUy5fv9mIkMis6zUZ+ny+NkUszF66BawSlz4V3AdL42cwq70zqMS
         MpblCTfo1+aPswwofEE5zgbQKdcGH/h8sNfa0MmknLLzM3DW+mYkwBWV1Hgjv9C03m/8
         wJ5dHpxDBTUFYHm7ahn0zonMbrGbvN+nFbZOO6T2Nm2BWG1W0zQZER1SR0kUIU0rVPh5
         52vSKu5JPV12WIfGd8tOk6Iu32QpTE8dDplsvzcce67YfHGlBf8PsQ0GRm5VkxpKYHrW
         M91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519972; x=1709124772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oA0fmKcMGpa77tBwzlw1ahRCKvmpIwJPYwf28NyUZ4=;
        b=JNykGnUmH7YdP3sDNP/D893E4kKaCHkOMUrtjCZpuJEqRXuK4MFAzhq4fhYcLVEA11
         G18tb6tPd2KlyqJQ7hlzfWWQnWNsvMHVlFLJp2C4WKSWkSUd5hUWQCCQDOaQ2LWrXMcx
         uK7A472chQsa01w4Jn2K7sJ6qfin9mTAdzT0za4AKQFV1wk744LX6W3JfmU5jjlHPXXK
         ry0jJKni9NYxJpiti5PEuunB8XF/Jwd7t8g6YPj0jKg/ePbcBysdfmSoRE1JXqWhd9Yq
         Sp8LrK1CBwDSZuDtS3Nk02EHWArxrxxLLntuzDo9TQS47xSM3Be97N31DsQu+feybCOl
         m/qw==
X-Forwarded-Encrypted: i=1; AJvYcCUa4A/Oh5jax0Y9HrkdWvF+Kxcp4I8IA/LxigtcKk885Rl3RNKSth3XwvDOpXLJgcFTfTplkvzvVfWrS7Bra15RAUXhH87BkTLaCToRf0qPxFZw
X-Gm-Message-State: AOJu0YxKoL+cRzIxIfo2FjUtzeQWpeGdXbnAhhMNCsbJ2xEiyewqrpZY
	7usYsSinewdnJdbVvbK9/6Qp4MBJUUb1cHh8jzOGi6Jpd6rgyZJkYbSao54mWyWssc7SZOfJesl
	n
X-Google-Smtp-Source: AGHT+IGubKf9S1jOzyrCYSLMxqJNvyD/zLKebRPkXd/WZNMB9oFnhq+scibnTGCncwjjI9LrMz7UMA==
X-Received: by 2002:a17:906:e2d0:b0:a3f:f92:ebea with SMTP id gr16-20020a170906e2d000b00a3f0f92ebeamr3876883ejb.5.1708519972322;
        Wed, 21 Feb 2024 04:52:52 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b00a3da5bf34absm4930392ejc.207.2024.02.21.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:52:51 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 14:52:38 +0200
Subject: [PATCH v5 2/4] spmi: pmic-arb: Make the APID init a version
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-spmi-multi-master-support-v5-2-3255ca413a0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10831; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=xUhXxEB1TSjaY+70YZslQBzXRf4SXFhFlW0PDrTOM4E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fIc/LzWkNf2MSvbob5MmWOOzD1tHWKMHm1Rn
 4nAP8UdQImJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdXyHAAKCRAbX0TJAJUV
 VtukD/9ZO8SwOLMldVbIUUgf6rJN27VVn/9Z7HqcZLDc8GpELnowT+jl2NvTZKOcdIdLXXWyKdS
 FmbCUTDyXbivjnHN1L4uLK3j+AyETgD7xkGEMlO6wsmWiN/PqwytOhRQ68UJWkWIoNLx9SqZCTu
 f+3Y7lHqYX24bZ1eT5NqQsgFJz5i8z+I7L0lFF3PvXswCJhktnMWYTTA2hQSTtLOzu5bKfOpQ8h
 OEbSVro3oOZmmENUKhuunC6J4wMXG8JQA4VY031Ehf4fUAMSBOPtOLQB2EF14BZcU9+2zpPtQW+
 0VUjogQal8YdO4tC/W3vFmxAihIykE56E6nLcV0L7JMx7xwxcsMPrA1xwaTMH6U8wSLLpkFb3zJ
 7DC2YQPMrGpxr4E0wn0gXcGtUKCExU3qZjEYuM9L5lU9OoYSO1LSzwb7H6yQHc3b9A4CsDGLB0C
 IXpG43flOBMiLfCgwWT9+qVRICXk4pqaai35jyCyO3vJ2EDzhMPWuPooaMz1r3w/SAsCD8OB42E
 DLuxte0e8ZJz3ER66Jaki4+/0PY+9/rGfBfAxD1PYVMwo577fKP52GdtIe3KBbKwkqO0jAwjDx+
 yAz62SNEvqk0r+K/N38Fl1TwOLkmC7Od30tKCtti0Vq07aLjy2tJ5YAjxt80lpSTjzPK/k6axY2
 G1SYuhKCrTQZ/jQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_045253_711160_A45E63FA 
X-CRM114-Status: GOOD (  20.22  )
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

Rather than using conditionals in probe function, add the APID init
as a version specific operation. Due to v7, which supports multiple
buses, pass on the bus index to be used for sorting out the apid base
and count.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 199 +++++++++++++++++++++++++++----------------
 1 file changed, 124 insertions(+), 75 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 9ed1180fe31f..38fed8a585fe 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -183,6 +183,7 @@ struct spmi_pmic_arb {
  * struct pmic_arb_ver_ops - version dependent functionality.
  *
  * @ver_str:		version string.
+ * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
  *			on v2 no HW support, returns -EOPNOTSUPP.
@@ -202,6 +203,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
 	int (*offset)(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
@@ -942,6 +944,38 @@ static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
 	return 0;
 }
 
+static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
+{
+	/*
+	 * Initialize max_apid/min_apid to the opposite bounds, during
+	 * the irq domain translation, we are sure to update these
+	 */
+	pmic_arb->max_apid = 0;
+	pmic_arb->min_apid = pmic_arb->max_periphs - 1;
+
+	return 0;
+}
+
+static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
+{
+	u32 *mapping_table;
+
+	if (index) {
+		dev_err(&pmic_arb->spmic->dev, "Unsupported buses count %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
+	mapping_table = devm_kcalloc(&pmic_arb->spmic->dev, pmic_arb->max_periphs,
+				     sizeof(*mapping_table), GFP_KERNEL);
+	if (!mapping_table)
+		return -ENOMEM;
+
+	pmic_arb->mapping_table = mapping_table;
+
+	return pmic_arb_init_apid_min_max(pmic_arb);
+}
+
 static int pmic_arb_ppid_to_apid_v1(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 {
 	u32 *mapping_table = pmic_arb->mapping_table;
@@ -1144,6 +1178,40 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
 }
 
+static int pmic_arb_init_apid_v5(struct spmi_pmic_arb *pmic_arb, int index)
+{
+	int ret;
+
+	if (index) {
+		dev_err(&pmic_arb->spmic->dev, "Unsupported buses count %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
+	pmic_arb->base_apid = 0;
+	pmic_arb->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
+					   PMIC_ARB_FEATURES_PERIPH_MASK;
+
+	if (pmic_arb->base_apid + pmic_arb->apid_count > pmic_arb->max_periphs) {
+		dev_err(&pmic_arb->spmic->dev, "Unsupported APID count %d detected\n",
+			pmic_arb->base_apid + pmic_arb->apid_count);
+		return -EINVAL;
+	}
+
+	ret = pmic_arb_init_apid_min_max(pmic_arb);
+	if (ret)
+		return ret;
+
+	ret = pmic_arb_read_apid_map_v5(pmic_arb);
+	if (ret) {
+		dev_err(&pmic_arb->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * v5 offset per ee and per apid for observer channels and per apid for
  * read/write channels.
@@ -1178,6 +1246,49 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 	return offset;
 }
 
+/*
+ * Only v7 supports 2 buses. Each bus will get a different apid count, read
+ * from different registers.
+ */
+static int pmic_arb_init_apid_v7(struct spmi_pmic_arb *pmic_arb, int index)
+{
+	int ret;
+
+	if (index == 0) {
+		pmic_arb->base_apid = 0;
+		pmic_arb->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
+						   PMIC_ARB_FEATURES_PERIPH_MASK;
+	} else if (index == 1) {
+		pmic_arb->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
+						  PMIC_ARB_FEATURES_PERIPH_MASK;
+		pmic_arb->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
+						   PMIC_ARB_FEATURES_PERIPH_MASK;
+	} else {
+		dev_err(&pmic_arb->spmic->dev, "Unsupported buses count %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
+	if (pmic_arb->base_apid + pmic_arb->apid_count > pmic_arb->max_periphs) {
+		dev_err(&pmic_arb->spmic->dev, "Unsupported APID count %d detected\n",
+			pmic_arb->base_apid + pmic_arb->apid_count);
+		return -EINVAL;
+	}
+
+	ret = pmic_arb_init_apid_min_max(pmic_arb);
+	if (ret)
+		return ret;
+
+	ret = pmic_arb_read_apid_map_v5(pmic_arb);
+	if (ret) {
+		dev_err(&pmic_arb->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * v7 offset per ee and per apid for observer channels and per apid for
  * read/write channels.
@@ -1358,6 +1469,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
 	.offset			= pmic_arb_offset_v1,
@@ -1372,6 +1484,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v2,
@@ -1386,6 +1499,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v2,
@@ -1400,6 +1514,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v5,
@@ -1414,6 +1529,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.init_apid		= pmic_arb_init_apid_v7,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v7,
@@ -1439,7 +1555,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	struct spmi_controller *ctrl;
 	struct resource *res;
 	void __iomem *core;
-	u32 *mapping_table;
 	u32 channel, ee, hw_ver;
 	int err;
 
@@ -1467,12 +1582,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	pmic_arb->core_size = resource_size(res);
 
-	pmic_arb->ppid_to_apid = devm_kcalloc(&ctrl->dev, PMIC_ARB_MAX_PPID,
-					      sizeof(*pmic_arb->ppid_to_apid),
-					      GFP_KERNEL);
-	if (!pmic_arb->ppid_to_apid)
-		return -ENOMEM;
-
 	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
 
 	if (hw_ver < PMIC_ARB_VERSION_V2_MIN) {
@@ -1506,58 +1615,17 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 			return PTR_ERR(pmic_arb->wr_base);
 	}
 
-	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
+		 pmic_arb->ver_ops->ver_str, hw_ver);
 
-	if (hw_ver >= PMIC_ARB_VERSION_V7_MIN) {
+	if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
+		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+	else
 		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
-		/* Optional property for v7: */
-		of_property_read_u32(pdev->dev.of_node, "qcom,bus-id",
-					&pmic_arb->bus_instance);
-		if (pmic_arb->bus_instance > 1) {
-			dev_err(&pdev->dev, "invalid bus instance (%u) specified\n",
-				pmic_arb->bus_instance);
-			return -EINVAL;
-		}
-
-		if (pmic_arb->bus_instance == 0) {
-			pmic_arb->base_apid = 0;
-			pmic_arb->apid_count =
-				readl_relaxed(core + PMIC_ARB_FEATURES) &
-				PMIC_ARB_FEATURES_PERIPH_MASK;
-		} else {
-			pmic_arb->base_apid =
-				readl_relaxed(core + PMIC_ARB_FEATURES) &
-				PMIC_ARB_FEATURES_PERIPH_MASK;
-			pmic_arb->apid_count =
-				readl_relaxed(core + PMIC_ARB_FEATURES1) &
-				PMIC_ARB_FEATURES_PERIPH_MASK;
-		}
 
-		if (pmic_arb->base_apid + pmic_arb->apid_count > pmic_arb->max_periphs) {
-			dev_err(&pdev->dev, "Unsupported APID count %d detected\n",
-				pmic_arb->base_apid + pmic_arb->apid_count);
-			return -EINVAL;
-		}
-	} else if (hw_ver >= PMIC_ARB_VERSION_V5_MIN) {
-		pmic_arb->base_apid = 0;
-		pmic_arb->apid_count = readl_relaxed(core + PMIC_ARB_FEATURES) &
-					PMIC_ARB_FEATURES_PERIPH_MASK;
-
-		if (pmic_arb->apid_count > pmic_arb->max_periphs) {
-			dev_err(&pdev->dev, "Unsupported APID count %d detected\n",
-				pmic_arb->apid_count);
-			return -EINVAL;
-		}
-	}
-
-	pmic_arb->apid_data = devm_kcalloc(&ctrl->dev, pmic_arb->max_periphs,
-					   sizeof(*pmic_arb->apid_data),
-					   GFP_KERNEL);
-	if (!pmic_arb->apid_data)
-		return -ENOMEM;
-
-	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
-		 pmic_arb->ver_ops->ver_str, hw_ver);
+	err = pmic_arb->ver_ops->init_apid(pmic_arb, 0);
+	if (err)
+		return err;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "intr");
 	pmic_arb->intr = devm_ioremap_resource(&ctrl->dev, res);
@@ -1599,16 +1667,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	}
 
 	pmic_arb->ee = ee;
-	mapping_table = devm_kcalloc(&ctrl->dev, pmic_arb->max_periphs,
-					sizeof(*mapping_table), GFP_KERNEL);
-	if (!mapping_table)
-		return -ENOMEM;
-
-	pmic_arb->mapping_table = mapping_table;
-	/* Initialize max_apid/min_apid to the opposite bounds, during
-	 * the irq domain translation, we are sure to update these */
-	pmic_arb->max_apid = 0;
-	pmic_arb->min_apid = pmic_arb->max_periphs - 1;
 
 	platform_set_drvdata(pdev, ctrl);
 	raw_spin_lock_init(&pmic_arb->lock);
@@ -1617,15 +1675,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	ctrl->read_cmd = pmic_arb_read_cmd;
 	ctrl->write_cmd = pmic_arb_write_cmd;
 
-	if (hw_ver >= PMIC_ARB_VERSION_V5_MIN) {
-		err = pmic_arb_read_apid_map_v5(pmic_arb);
-		if (err) {
-			dev_err(&pdev->dev, "could not read APID->PPID mapping table, rc= %d\n",
-				err);
-			return err;
-		}
-	}
-
 	dev_dbg(&pdev->dev, "adding irq domain\n");
 	pmic_arb->domain = irq_domain_add_tree(pdev->dev.of_node,
 					 &pmic_arb_irq_domain_ops, pmic_arb);

-- 
2.34.1


