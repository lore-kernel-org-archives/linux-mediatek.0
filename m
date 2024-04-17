Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F2CC001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPbCq+oOUcmq2IMBiN6gCV1jsU1Thi9sfqYTDJv76Mk=; b=k0x0m9UpJ9Ms+0MVLqubTNy65G
	CQKlBMlfNp8EzjUTXWuKkSZ2ccCQw+wcFgaBQmrWZkUP2rIhqNqhK8zM10tgPqo1TYjmmCu3Z5dLC
	t2t0GPW1tC9xJq7DkY6JHzXzl20jpSchgnD0vJt2iqWpIJy6p9jD6oTuNXgy0Qvr26ZXVNm/nCNUE
	h4l2kpCfOQZ23bsIEh4O1UdofHhvP8Uy2JeC7Gl2Dof4ixFU0SZ7KTq09HUg3xWkpKb6vzZuDwK/z
	/veHXPe9wT22jgNPM28s6m5AkIjed1ygPnnT/KZ4CpROZxwbwNbjsgHC0dD/z85GKM2MV4vNpsfxj
	FCbM5w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTa-0000000HQsz-3rBQ;
	Wed, 17 Apr 2024 20:01:50 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTH-0000000HQe2-3mp4
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:01:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5700a9caee0so76196a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384087; x=1713988887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPbCq+oOUcmq2IMBiN6gCV1jsU1Thi9sfqYTDJv76Mk=;
        b=BCnOTINs+I5Oy8CMgQDUalokyDnV+V7MKlVygwBZmh+NKJmW9vAaC92bY3d3qOahrf
         jWsJkvxA/thmsbB+UcB2wftAhB9RYq+ACohHQm2w8riN8zPcXWnvyFrWlGwe1FTND7Z+
         ycFHUqy46FuXBmxc6k1pf23xTyJM12haFjOBt5IZn6dPsjxRlicmqomoQm1EZ9IVoTLg
         FcINH/eosL+2hmFdMUCmC5BzBe/b4DIZ9zwZhO9Qvj8kFI0aJqAKtlievgKD9WZakyG5
         C7b8ZpN4wj4njcC/4NrD+VWUW4JGime6zSP6YpYWjZEOQO/HHkmZCN1hnSkmSh8kNusD
         GtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384087; x=1713988887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPbCq+oOUcmq2IMBiN6gCV1jsU1Thi9sfqYTDJv76Mk=;
        b=vt055YxA6yoHA7z37OGQJzkpxcmWteElYJiHb8jKMKfbOCCIi0xpxEDxTgWjyqeCaG
         Nq8fCPUnqunvEy1l+rQuasJO7Ly1f3j9qLvXw9neNNftMWz1Q8JAZL2Brvk/yxejYyLb
         jEOyQ0yy1RCy0I0Wvz/RqECURBQxbfFhQ/oVVp0b6sE3g3l3XDCfg/StMDjbw8Q5Hkd6
         DZ/zNgJ0nQY2kp6pT4em1hM2uO1rNPqWzNHfbpElULOkWE/5300ceDHrlLKU5CZlRitr
         yKnmH2dTyrRxwEf23/9R5pChXSMZv2dV0Oat2gevf2Bw+Xyv+oyPE1qGFmWMrABPiMnw
         IUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMKNEPaaFgnzy8FpPowQtY16H4O4uHUzK3IJM3eWC7htqpSu9YrBp1hqg5KVNbJZSfGj8pFZOQlzTj7R3kVBVMFEjMVKaaCrH0aLIsjawRkr94
X-Gm-Message-State: AOJu0YxWuslQH3eHTeRlozq1AU/UvhGtd6iLfM4483kXuXkU6/Xrciil
	mhlIvxCB1XJ/n2IYthRDdcExCLhmMc2fSIaDWflvTPIo3djVN54OCzoXuuTFH7c=
X-Google-Smtp-Source: AGHT+IGua8+m5t8v6T12y+RuGXYF3KFnzmkDgbe1oqMkbVQmx5XTKjDvs0Gfd1slqTTZRF4rKL/5FA==
X-Received: by 2002:a17:906:144d:b0:a55:6600:b33 with SMTP id q13-20020a170906144d00b00a5566000b33mr324872ejc.23.1713384087256;
        Wed, 17 Apr 2024 13:01:27 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:56 +0300
Subject: [PATCH v10 4/7] spmi: pmic-arb: Make the APID init a version
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-4-5bc6d322e266@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9035; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=nDUGRMtAX6AaUNrI4RsW85nuAecGS2OuKESyiWtIJd0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICqFwbGUbq2PsX2eGqy4maYPsUKhfMAH9YNeZ
 hSfhupI27aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqhQAKCRAbX0TJAJUV
 Vgs2D/45SZ5NUEJDVdxBMiV9kzH8CJQr93noiG+lFPDHLKKkTziW7zif/LC4O98LiIMxuYAo8wR
 SzW4CZ2En/Yb0+60WUyF1UZuG4VnqM6f3AL+mSSlreZdWXPCkTpwoLzQGRzmCNwMQekAM1HA+P0
 TbQM8Z0p/+wgIz2iaQU2G2dX2NoWrjhHxycxE51GF0sT5Z0Fqmcrg0yHhmxz9Fkt0fU5Prk43ci
 dlfMjuaPeGRZ8Ev+cz0VBqCBAsVygmESpTRd3bXs1Om9xRBqSPN+K0Gy2YJitQEaL1qUBTcRmil
 9cqGvlHzKp8nwGb0nzEOsZM6hHNepyUtD5FmtoI/i8nKzyo1CSLGBv/dSzH6RGbUh5Te0aA1OYA
 1dowLr2hdYTu094I+ULnZ4VXV3/O7sh9GpvDVY9BhdfMAiWX7r8tflSL8Nq9D37Kc+tgG+pFibJ
 c/q8AeZNYTUgqCkqETJED66VRA4/Zq4mwVYE5MJiyhibXRBdAe7v17oW1N2ndc1xTu7TqmcTiOJ
 LON6QkfGzjjA20cxRJfTPVaL7/IWn2TI6PyoDy6N6vHJN1QkPyuiS5ygKdwQVobqKAPBsTC4/+g
 HNwcRQjreWxhSGRFd/cZSnXs7GI3Ksr45LtO7Divi6YaZ8a9iCljrKJnkgI7BcMItVD4e6FKsgM
 EKCA3BfqxIwsZuQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130132_034789_3387A51E 
X-CRM114-Status: GOOD (  19.23  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 144 +++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 75 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 12c0efd744c2..fe45d62a42e2 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -186,6 +186,7 @@ struct spmi_pmic_arb {
  * struct pmic_arb_ver_ops - version dependent functionality.
  *
  * @ver_str:		version string.
+ * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
  *			on v2 no HW support, returns -EOPNOTSUPP.
@@ -205,6 +206,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*init_apid)(struct spmi_pmic_arb *pmic_arb);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
 	int (*offset)(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
@@ -947,6 +949,32 @@ static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
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
+static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb)
+{
+	u32 *mapping_table;
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
@@ -1149,6 +1177,34 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
 }
 
+static int pmic_arb_init_apid_v5(struct spmi_pmic_arb *pmic_arb)
+{
+	int ret;
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
@@ -1363,6 +1419,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
 	.offset			= pmic_arb_offset_v1,
@@ -1377,6 +1434,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v2,
@@ -1391,6 +1449,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v2,
@@ -1405,6 +1464,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v5,
@@ -1419,6 +1479,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v7,
@@ -1444,7 +1505,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	struct spmi_controller *ctrl;
 	struct resource *res;
 	void __iomem *core;
-	u32 *mapping_table;
 	u32 channel, ee, hw_ver;
 	int err;
 
@@ -1472,12 +1532,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	pmic_arb->core_size = resource_size(res);
 
-	pmic_arb->ppid_to_apid = devm_kcalloc(&ctrl->dev, PMIC_ARB_MAX_PPID,
-					      sizeof(*pmic_arb->ppid_to_apid),
-					      GFP_KERNEL);
-	if (!pmic_arb->ppid_to_apid)
-		return -ENOMEM;
-
 	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
 
 	if (hw_ver < PMIC_ARB_VERSION_V2_MIN) {
@@ -1511,58 +1565,17 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 			return -ENOMEM;
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
-
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
+	err = pmic_arb->ver_ops->init_apid(pmic_arb);
+	if (err)
+		return err;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "intr");
 	pmic_arb->intr = devm_ioremap_resource(&ctrl->dev, res);
@@ -1604,16 +1617,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
@@ -1622,15 +1625,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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


