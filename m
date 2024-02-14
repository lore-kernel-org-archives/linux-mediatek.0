Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B47FC48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv6X//QoczbVtCVw1UzbH/X0Q7wummzkDNbCZ0tojQU=; b=GqqTnf/uv4cs0Sh47HKfaNf3d5
	7ks4HnIGNIWdu46D+//Vk9N9qxKZwyZ0OX/3QXUX3IO+oMjxIEUCqUBntn621OSMQ5TOs5nHxw/8e
	30ACDgYpth4DwoQRQBN/hAAX8OXhVC1Jw69oyOU4heC8OSkZ4cqxFNN/MTzRiRwIZJQnRc3Oi46n3
	NNxplTn8BGGB0JZVyfLRJ0xkSXnJkKlMn/40dxoAuxxEknwwsogamQBVMXB2ij2LooutZ79owUVru
	YKka/ygQMbHmXLNTUvAsT3OKsdohHceRKhhkLSfajD6szpihJFIfiOFcS+kC3u+tMHCCFR149tMYg
	KqApXwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMa2-0000000EGP5-0MDG;
	Wed, 14 Feb 2024 21:14:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMZx-0000000EGM4-3yaM
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:14:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5116ec49081so192241e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945244; x=1708550044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv6X//QoczbVtCVw1UzbH/X0Q7wummzkDNbCZ0tojQU=;
        b=UqkOjuoD4BZKM2IrPieRLiZ6EhWQfcuocedzGf0o01SUeVrG4vrEp61B76718Ill3Q
         0Bzsp0fmhZsABSOv9vetA93xNO0eexaypUDr+W5gQ8pl8Oa2y93OvyipG71tQy7jdboy
         E/8GGmfohLjbnbZ9zU+AFOODpNxNflBUIQqF749IKl9r10czKSnugsOK5GqmL1amK4Ja
         BrhlsqH+G6ZXr2yQCy20cwXQsEKRIGBZ/k1GBRUf0WSsDu8s49uhq0/YWl8BTu8SlbeJ
         XmHZFNbJ0dVK/tLkDNIuBom/WTZmscq0N2Pd8LeUEiF8Fv8T8vb+xgjs0uaRtGwnx9Xy
         0O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945244; x=1708550044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv6X//QoczbVtCVw1UzbH/X0Q7wummzkDNbCZ0tojQU=;
        b=rcg60Rt6Df976Qz9MYQiZ/Ftl5sJAw6IipdeGZQsE9omohrRQbhu7cQm444r5VSdXp
         iSB/sDPqYST4sTC8SOwWCn/v/0NH+WB8H2wzGHgPOANz2u0RrNqetERlohMH4f8Ez20K
         EA/ipL3okR4451FM0pV0X2urFh4nQnJGwr7XNp//NhJE5GWBGFmF8IDZGdC8r8ZXwIcU
         hM4FOXavaJbVvr80ewXpbDxTt0PlvqeKV6xo3M7a3KDmrxT+GXTvthd91ZXXroG818dw
         nyML5OEbAHmEBn+NIcYCQL2ozncn/3vxKgSjV3ZvsGrqqji0jL4Ovb7Ie3zl6En4KH2B
         LJiw==
X-Forwarded-Encrypted: i=1; AJvYcCX7HoD4stEvEhdkxGFtZA5ePkshI+2yziQz7komagVjaydhrkpDBgh4l/0xDnLXB1Sc6hDc/47IkcaYEiGBpqMTDZbxxN0Qq+Z50wpYUg0Gb3Qd
X-Gm-Message-State: AOJu0YzNZQIsYesgHfuKZr5FnTIfK4vu8HKnp8ICxAM/8cpjT5+FaF49
	2wDiYEIKcPLoyW4WLUjCdn/03EpETeK5fzBrVZS9SG6LIi0WmPpimVMmokdmAbo=
X-Google-Smtp-Source: AGHT+IGGBbMVWOs4KgtibIblCyH6HVl2O62mkQ2Yx8cbIwEWDSfgrKNYQdUN1iDqKdhMESylRZrSVQ==
X-Received: by 2002:ac2:4e92:0:b0:511:9d0d:ff59 with SMTP id o18-20020ac24e92000000b005119d0dff59mr2684848lfr.62.1707945242955;
        Wed, 14 Feb 2024 13:14:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJt0FTmGJ6w76/IyPJ2rkUr6w9zNq4VlNiSbviCuaDczvsGogkMPN8w1G2/ivfjAgJUph2j9LQNLtkD8DJzelPdtxShtibVuQryMjnusvj8ytGwOuTzLLrtaqI6oMI9E24SXqAxUmLOzANfe2mE20p2uaWlgO/C/5uGljW1Zpmv+VR0FWCq3ZP7nQTNKcEGH2n10sX2KOe7iAjw1BxRlNxBC62L8iDi5qQYHp64GEDzgorkdYkxdBAU9gRGSStGUKpOry7uSWpMifpT8gEoq5zGjFqI+yv8J7CkKe/cy5wjFH/AEhvcJY2gBXB5TurnVQS1ZCYK3BC94WDDz5BDH9CzRghh9zuxzXMW0XCTNkeY0GMLTgc1PjW8AbikMMEIk5LVtwZm139WcvxQGClZi84ex7RQAXajeL++3sldGFqdjm/K4YkgEUU7oiexkuoiEXuyA1asJp+f1kE2cxChw+ka+mYAJPYMxApO0NzsLmNJxpDGcCyevXyBAstwXepppLWppC9z/0=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:14:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:13:47 +0200
Subject: [PATCH RFC v3 2/4] spmi: pmic-arb: Make the APID init a version
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-spmi-multi-master-support-v3-2-0bae0ef04faf@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
In-Reply-To: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=10835; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=bKFYboLxMzFRb04X+ozb/WPJtei7l0yJHbarbvFO084=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0TsUbt+BWFJlchTfXaM18f41dpucg2xQf7B
 vdbv4pW4ryJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tEwAKCRAbX0TJAJUV
 VmSSD/99hucTi1nIhlstOOR1/4S0kT6k6bezP8nSgsgcnc+Ow+7Dz32rigq1K7q+1cL0JXjYbDX
 ERUWxiiWQYV+AVBSNuyd26mWEqTy5JYjqo9X4/OudJqhMkTscGMbmcnxylPn/7CbPoGhPUkrqoh
 Kh6yEPDN2DcXRd37sbCxS8VZ7qep7kjKAmDnQtWRcdDMiqF5Hh8uuWbSqPhRbF9XymzgpIgiXsq
 BTIbCfNHzqTd6xHTCBQmKVIMzhQ92DBxjdw9MY5LLNaIuSq7dCAoWHOR/O9JXabiLCocjzpGYKf
 fvQZt+KrL343AnXN4zmDlUzJxNsKlhMok+4fBkV5GVBgLFtuGgSYxOqYwad9KLSEjjOwrvnYijj
 3Fir2AodT03rIVwMsW53nsGX5PnspmK2zjw/QpEpBFnIU3RT77AJhTYrEdXls5OQVfB9yMNZUdW
 5vCkk/h8JAXwB6zWqBOt2lwWUsOTQBjR+t/jcxZqXM1NKa196v2XeFzLxhVf6DOJDJxTIjVNloh
 /KQ1QKphc2W1Fsv4DKhuktJ5MtT0hlCRUlbDSWkV5TCkJ32ykuVSdHPY+5PVHYb/0awGjrtQgs7
 vmZPxj2eQdEIW2NKF/axZgIEWTmI0SnnsprTfGl0KpFsQ61pXaLN4PFxt+BnHOEptiHvhPexqgh
 O6ETGVyMR7chqDQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_131406_106559_BDC794E0 
X-CRM114-Status: GOOD (  19.66  )
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
index 9ed1180fe31f..23939c0d225f 100644
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
+ * Only v7 supports 2 bus buses. Each bus will get a different apid count,
+ * read from different registers.
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


