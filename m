Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D93C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGyNZMSELVhIYsmh8IQ0cClyJQ3/Pu1dOTSavukgh6c=; b=oOYxF0EgaKjAtjX/CxhW0lVJ4m
	y0jvA+V0mzVF4yW56QcJMiuDyQAuF6nDdTGLh6bww81uiwxOIA9oOAEiKIthgtf0T3mMAaaU9KMf0
	z2HRm22nkrfGyGCWs4oUFnzr6zXaoaD6nbJBoiNbUaXnTp7LePHIY8GaFjg8E3NRlrYB3dr3YNKi1
	CDj2wE4XZVQWGmf7SpikKthe4+vDq8AmQzMQhEA933ywQvDMd3Sm+eOUHBmi6jtnJ/Ws7/NlrkySA
	Cd/uvsz+wzyYgiPzoaBxz9WOWXyPeSTsGfQ2HdCUCMpy4RY7u6vIj4sNXnqfrtKiHjA1YRhuLGiMf
	iW9w6LkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDY7F-00FHNN-66; Thu, 05 Jan 2023 21:49:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV3y-00Df5r-BF
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BGyNZMSELVhIYsmh8IQ0cClyJQ3/Pu1dOTSavukgh6c=; b=litQP3pFMIPihZR5G6DTQzK47r
	Ov0zYtl0+gnDk2NvmTPbX1DE9dIQtT4WHISLDFT+k9TcJKP8wZMv8Onfir+1cPMeYJAdQeqGgbWXF
	0DnT8uiDcuwRmIYYajgpbEsTseMqgU77oN7KQWqKlgruEp/jjPiGnMPlZIEjIenCzCvdMy/ZubVPU
	lYDPaAN3riWbTRL0D0T+YS+mCH6iJhQgVymUOE1S3az6kcoo9S52j0rELioBgmGWT7PQ7yGtv0kfw
	E/u9tbT92OZh0jNjrIqU/RoTn00BulVkWiQJObrUjytQevIUJmfYvXHGoLTkXjpHuSkGwmYP3xjtD
	TuezSmrA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTiR-001Ve1-2r
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id d17so17025603wrs.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGyNZMSELVhIYsmh8IQ0cClyJQ3/Pu1dOTSavukgh6c=;
        b=DFV2Bk7pE1z4nPsGE5YQsNh5/MwQhELQBIwLpGoUt5Kr9gGjWSCWaFcpmx/AiWgzTM
         CeJmBndmStn53lw/APB9JGUuZ75hK168BLWCI/aimccr/+KgtnF2uyggiH/FpeScDRZ9
         +Yl4VULKayXF9MQk0OaIC5ksglOZuaQtzTLCqmwMD/1z4GQbtzQL3k7lIkYbHCrOMtow
         OtLWWmEESfhoGWyamVruOyv2ut8FI+UEPxH2mD3AOfjNKwJHDRXDin5IrcMvaC0GLALj
         YbliiPCOSz8pGhwtNyXH32N8CUQXHE6sJcSAizkGHLBmITscU38JNk17TMPNYeNMrW1I
         pQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGyNZMSELVhIYsmh8IQ0cClyJQ3/Pu1dOTSavukgh6c=;
        b=n8FvvGc/KR0H+Z2kUCNL1P8uYhcW+H8XHge2bbnBZOSQn/37towSqOHNnrEfi8c2CY
         vRgVoIZ15YEz5L5CtZmHaOygpXvUUjE+hrVD6ebeA4JyZzU+H8fC+s36MQrTDZUYHwk5
         7CjyM/SbT4PzimZxP+C1PBVk5ZimwkBYgvcTj1cV/amHeOYXyi5OczdhMHe8FNS5wp1h
         GaUE14Z/dhl4Cbn2O8Hyz++NFEkDCJ9YveExbutMG6F1zUAKZ0Gs5sDc7rqLve+GDCxJ
         CCj6S5zxZiF4kgoEXnN5rvMRqvPyZarXyExgPI8cV9gcI/VUvxeeKUKhG4ynuGYITUEm
         f33g==
X-Gm-Message-State: AFqh2koU8cfenP7U0UdG7AdtHFoNTD+lQBxvtziE3s5HBi+HEtaR6Uw4
	ocXZiwI7qkyzv2CD98exSTInzQ==
X-Google-Smtp-Source: AMrXdXuowYI8YNiqe+s1dAJFjpbJUx2V8Zot+mmm14+rnSw+zcIM7fBJvdIhDwBvmez939s1n5rILw==
X-Received: by 2002:a5d:4e4c:0:b0:2b8:bcd8:1808 with SMTP id r12-20020a5d4e4c000000b002b8bcd81808mr215071wrt.44.1672938467798;
        Thu, 05 Jan 2023 09:07:47 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:47 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 1/8] dt-bindings: power: Add MT8365 power domains
Date: Thu,  5 Jan 2023 18:07:28 +0100
Message-Id: <20230105170735.1637416-2-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170744_083752_53809680 
X-CRM114-Status: GOOD (  12.86  )
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

From: Fabien Parent <fparent@baylibre.com>

Add power domains dt-bindings for MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v4:
    - Add infracfg_nao as it is used by mt8365
    
    Changes in v3:
    - Renamed mt8365-power.h to mediatek,mt8365-power.h
    
    Changes in v2:
    - Made include/dt-bindings/power/mt8365-power.h dual-license.

 .../power/mediatek,power-controller.yaml      |  6 ++++++
 .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 605ec7ab5f63..a496c43cfa16 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt8186-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -86,6 +87,7 @@ $defs:
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
+              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
@@ -113,6 +115,10 @@ $defs:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
 
+      mediatek,infracfg-nao:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle to the device containing the INFRACFG-NAO register range.
+
       mediatek,smi:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the SMI register range.
diff --git a/include/dt-bindings/power/mediatek,mt8365-power.h b/include/dt-bindings/power/mediatek,mt8365-power.h
new file mode 100644
index 000000000000..e6cfd0ec7871
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8365-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
+#define _DT_BINDINGS_POWER_MT8365_POWER_H
+
+#define MT8365_POWER_DOMAIN_MM		0
+#define MT8365_POWER_DOMAIN_CONN	1
+#define MT8365_POWER_DOMAIN_MFG		2
+#define MT8365_POWER_DOMAIN_AUDIO	3
+#define MT8365_POWER_DOMAIN_CAM		4
+#define MT8365_POWER_DOMAIN_DSP		5
+#define MT8365_POWER_DOMAIN_VDEC	6
+#define MT8365_POWER_DOMAIN_VENC	7
+#define MT8365_POWER_DOMAIN_APU		8
+
+#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */
-- 
2.39.0


