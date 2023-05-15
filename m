Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4333DC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3ZxCx5hi3hTfImTlWZJFg7LTzfHGowr1aBuZvBj8Ek=; b=OIjdaEDP7lm17efTOTzbSPqkaZ
	/E8IOA9c1PzpRGhPkGBvrRJmGyRE6fE389gp/8AbiNZSmRRgm20HAQmlEDgas+oYacNkl7pChdU4b
	j7ln/HYQf2dgv24RF2IY9J7HHC+xy3+jnH84IYq7T0YRolqAfC7QPS5wMmP2cpNxlE/EmTugWi9An
	Ufn8bB5pQVUqp/UcAGm7iZsEPP/v0NOkuQTI0bT079OFvFQZo8+uyNzvvsXkze7z8E5W+nRnnaMLq
	4rw4A3yj7NwIHPeUU2S3CJlr+2SkmcuRNDwnQ6Ir4Z4xQnOSdLdQKi5otLZTjIuEk5iyxgMyb8/EN
	26j7RI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecG-003P4B-1p;
	Mon, 15 May 2023 20:16:20 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyec9-003Owm-0s
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:14 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53033a0b473so6603158a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181770; x=1686773770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3ZxCx5hi3hTfImTlWZJFg7LTzfHGowr1aBuZvBj8Ek=;
        b=Hbdt9iI0CBNRsRWJDq6LO2fdXD8SaO03ZHaJ8lncZbQVLatn4REqixKNi/L63qD17o
         HHOoNZBZebHLnkPuM0TGc9DikVIAEVVjUSf5dIZfNglLnIldiCXQvYMyLC6zIJUZi7Rd
         MuSHzfulUWCXbZfoxjiTNIlH48Va9wDUeEHqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181770; x=1686773770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3ZxCx5hi3hTfImTlWZJFg7LTzfHGowr1aBuZvBj8Ek=;
        b=KtoFztqyoZyKsSASufPyq98V121u315w4KknHom+u9aBqHnc43cHtgCCCSln36SEvX
         mCeZOIxx7FcA5mEhxlr2DnRm2JbGgOCNyHcdAWqeQrV14dXYU0Tu2EvkSsHnneifyRfm
         NPFfpxDFe7uBY7Vd+qZ8tcqiych6A2bOVn2FA/UwGIGwJVYQPdx0ReEBDP7qBJ6n1VA9
         SY9vIt0oXxjQOJSNVAo+fdlFVZEgCE0qL+dyh5QGD/SU1r/BO6TEqncauUg1W7maTTK/
         Ev0TkaHE1sKYKc6Gg16whRH7wWPfpn79INNOuJ6gPNmyrNoDEmtppoYLYrq0bkYo8f2d
         +4aA==
X-Gm-Message-State: AC+VfDwSbK+JvHx+1sgmZqhbbS33E7nFQwaTYe+A23oZy86xKu0r6pak
	zDMdcaeG41D2cTIz625/aMhhhg==
X-Google-Smtp-Source: ACHHUZ7JpUDHXpHh/owDGu2FwcJeNHDuQ797i/IR9w8uSlN+ZOxln0Gpr8ldwjJ5qvjlGTyjodrCkA==
X-Received: by 2002:a05:6a21:7898:b0:101:167d:8472 with SMTP id bf24-20020a056a21789800b00101167d8472mr32063218pzc.26.1684181770297;
        Mon, 15 May 2023 13:16:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org,
	yidilin@chromium.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues
Date: Mon, 15 May 2023 13:13:51 -0700
Message-ID: <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230515131353.v2.cover@dianders>
References: <20230515131353.v2.cover@dianders>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131613_317226_4F31E1F4 
X-CRM114-Status: GOOD (  23.52  )
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
"mediatek,broken-save-restore-fw" property in the GIC device tree
node. Any devices with fixed firmware will not have this property.

Our detection plan works because we never bake a Chromebook's device
tree into firmware. Instead, device trees are always bundled with the
kernel. We'll update the device trees of all affected Chromebooks and
then we'll never enable "pseudo NMI" on a kernel that is bundled with
old device trees. When a firmware update is shipped that fixes this
issue it will know to patch the device tree to remove the property.

In order to make this work, the quick detection mechanism of the GICv3
code is extended to be able to look for properties in addition to
looking at "compatible".

Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

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
index 6fcee221f201..a605aa79435a 100644
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
+		.property = "mediatek,broken-save-restore-fw",
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


