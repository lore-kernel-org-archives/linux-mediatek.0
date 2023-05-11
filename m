Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC364C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 23:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GXLLz1cb9WjUR21vBHXCkRjhHYZlPAU9fn/3rFZSY4=; b=QbVMdaK8LGlxv1zneLDwiySnKW
	NpaTqQcMz2JfHz1eyBbgTNHbYB0dRJybiS+SyRGPQp6sRGzEbmM0/GwdNNxNlFNLzIei6DiNzxgQ8
	PgoxXGxhBpCJUgHB138GshGTX3S9VwI4XNBlcY523XCTy0bIi23q9ork4TZ2JV5qhUpdg0+4pDBH7
	r7vENWAj9lGpE6MWnlNsWU3nScexMjlZpCe8yGVbfjUEB/dARrNGxTMBHS1USJx9hfWEO7iROOsdM
	a0I6Dq1cQxC3w1sE9XzSUNOWQJ8s/bLxZXlI3LybVwFhv7GG3cD/ZQI0UKtDKbCPxUHcvUaxeFJtf
	9SE770Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFW8-00AJZx-1z;
	Thu, 11 May 2023 23:16:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERX-00A874-0D
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-24df4ef05d4so8016513a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842842; x=1686434842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GXLLz1cb9WjUR21vBHXCkRjhHYZlPAU9fn/3rFZSY4=;
        b=DExkZbfiK7dYHdPhxBr1koLSFcgH+8Qe2mzgYfxjWSP/l0Qrezi1bLqTam26KdtwOY
         39sMwKChIzmpXPLMiTALhfSPVRkRfcYA+JkOOmLwzXXWNweNCgMnDBwgihE9jkZ+CdoO
         a5jxyKCc+96tFL1pYbjuJVvHn82u64k8LtHmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842842; x=1686434842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GXLLz1cb9WjUR21vBHXCkRjhHYZlPAU9fn/3rFZSY4=;
        b=RvjfgLjlqD1mC9DvmCE/UsiR/TNHc4//qA7XQI+SWws+ejXXAIssxYsz/BsS6mCtVL
         naWjLEbHNDxV3ppj7SWT9cveRT8F3urZ66DETI6UTVksCTH1571m3IvgVWNg+RqaYSe0
         /t+mzn1GsDownyBQ3XwEohsoSavNnh2kdWifSbDQr80TDHvnt8F2lPICuwE15ZDU9Cz7
         gl7IFqv3yhzXAgDubrNC8sxMJDrHulPXRmsGNH60k82/3O8TzwuQWWzh+R9aKnkko6oW
         maFKPocGtaAOJjB7Buv5gfd15V6mF/5rlCfFjKv6wjQdxaiLk40BSwwiHSqXjIWSKGeU
         6uCg==
X-Gm-Message-State: AC+VfDy2TIG7siUHVGJWzLPnUhf0mTWRbCTCoRYV+bE+lHndnrhvk+NE
	Jqhq+xQOThNV5/9h7Tbu6WDcHA==
X-Google-Smtp-Source: ACHHUZ4O5zM/KyCHiemx57/c7GppmLu6526CqNtTflW6Intyj5K7H5YpwWAlewMUVbSxiahggfCiOw==
X-Received: by 2002:a17:90b:28b:b0:246:9ef5:3c45 with SMTP id az11-20020a17090b028b00b002469ef53c45mr23147850pjb.13.1683842841770;
        Thu, 11 May 2023 15:07:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	yidilin@chromium.org,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues
Date: Thu, 11 May 2023 15:05:36 -0700
Message-ID: <20230511150539.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_150723_141360_7E7E52AF 
X-CRM114-Status: GOOD (  22.77  )
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

Some Chromebooks with Mediatek SoCs have a problem where the firmware
doesn't properly save/restore certain GICR registers. Newer
Chromebooks should fix this issue and we may be able to do firmware
updates for old Chromebooks. At the moment, the only known issue with
these Chromebooks is that we can't enable "pseudo NMIs" since the
priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
with the problematic firmware causes crashes and freezes.

Let's detect devices with this problem and then disable "pseudo NMIs"
on them. We'll detect the problem by looking for the presence of the
"mediatek,gicr-save-quirk" property in the GIC device tree node. Any
devices with fixed firmware will not have this property.

Our detection plan works because we never bake a Chromebook's device
tree into firmware. Instead, device trees are always bundled with the
kernel. We'll update the device trees of all affected Chromebooks and
then we'll never enable "pseudo NMI" on a kernel that is bundled with
old device trees. When a firmware update is shipped that fixes this
issue it will know to patch the device tree to remove the property.

In order to make this work, the quick detection mechanism of the GICv3
code is extended to be able to look for properties in addition to
looking at "compatible".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/irqchip/irq-gic-common.c |  8 ++++++--
 drivers/irqchip/irq-gic-common.h |  1 +
 drivers/irqchip/irq-gic-v3.c     | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index a610821c8ff2..de47b51cdadb 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -16,7 +16,11 @@ void gic_enable_of_quirks(const struct device_node *np,
 			  const struct gic_quirk *quirks, void *data)
 {
 	for (; quirks->desc; quirks++) {
-		if (!of_device_is_compatible(np, quirks->compatible))
+		if (quirks->compatible &&
+		    !of_device_is_compatible(np, quirks->compatible))
+			continue;
+		if (quirks->property &&
+		    !of_property_read_bool(np, quirks->property))
 			continue;
 		if (quirks->init(data))
 			pr_info("GIC: enabling workaround for %s\n",
@@ -28,7 +32,7 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
 		void *data)
 {
 	for (; quirks->desc; quirks++) {
-		if (quirks->compatible)
+		if (quirks->compatible || quirks->property)
 			continue;
 		if (quirks->iidr != (quirks->mask & iidr))
 			continue;
diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 27e3d4ed4f32..3db4592cda1c 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -13,6 +13,7 @@
 struct gic_quirk {
 	const char *desc;
 	const char *compatible;
+	const char *property;
 	bool (*init)(void *data);
 	u32 iidr;
 	u32 mask;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6fcee221f201..161cc8957e8b 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -39,6 +39,7 @@
 
 #define FLAGS_WORKAROUND_GICR_WAKER_MSM8996	(1ULL << 0)
 #define FLAGS_WORKAROUND_CAVIUM_ERRATUM_38539	(1ULL << 1)
+#define FLAGS_WORKAROUND_MTK_GICR_SAVE		(1ULL << 2)
 
 #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
 
@@ -1720,6 +1721,15 @@ static bool gic_enable_quirk_msm8996(void *data)
 	return true;
 }
 
+static bool gic_enable_quirk_mtk_gicr(void *data)
+{
+	struct gic_chip_data *d = data;
+
+	d->flags |= FLAGS_WORKAROUND_MTK_GICR_SAVE;
+
+	return true;
+}
+
 static bool gic_enable_quirk_cavium_38539(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -1792,6 +1802,11 @@ static const struct gic_quirk gic_quirks[] = {
 		.compatible = "qcom,msm8996-gic-v3",
 		.init	= gic_enable_quirk_msm8996,
 	},
+	{
+		.desc	= "GICv3: Mediatek Chromebook GICR save problem",
+		.property = "mediatek,gicr-save-quirk",
+		.init	= gic_enable_quirk_mtk_gicr,
+	},
 	{
 		.desc	= "GICv3: HIP06 erratum 161010803",
 		.iidr	= 0x0204043b,
@@ -1834,6 +1849,11 @@ static void gic_enable_nmi_support(void)
 	if (!gic_prio_masking_enabled())
 		return;
 
+	if (gic_data.flags & FLAGS_WORKAROUND_MTK_GICR_SAVE) {
+		pr_warn("Skipping NMI enable due to firmware issues\n");
+		return;
+	}
+
 	ppi_nmi_refs = kcalloc(gic_data.ppi_nr, sizeof(*ppi_nmi_refs), GFP_KERNEL);
 	if (!ppi_nmi_refs)
 		return;
-- 
2.40.1.606.ga4b1b128d6-goog


