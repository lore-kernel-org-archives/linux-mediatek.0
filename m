Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB2C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uBINhkXj5CiEZH5/8Pm1Qj/TstsEH9+dcozESvLJgY=; b=owLTiR+mom+FSEI+yLEkVc2eQ+
	tVoAjOlKWuBNSoxSuEiCwr0Dsy6bDLV42uSWZUU7PRXO4t0PIweLpWEO3ii8wvntjiy4XydzqDS9t
	XUoZjN1bsJjnuFXH8xv2wZN2iPArVFPF30Jh+kwl9By4a4GYOIj6GPFT54aM6vrU8B7QveNBouH6v
	KIGSoty9rpaWIZW1a/b+ybxgpBNlHpX5esyFTdRkCltrlaPiMNouT00Gmeg0rfFwZa6Egvl1SJ5dQ
	Bm2YLhG0ccw9/07Ef8Cvl0XEeKL+gk3x/zbv6LBzI9t5bjfiaRY1hmUI+VtZ7hTnzJ1TKpgLbnayW
	SVJIXrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtK8-006jyB-1c; Mon, 25 Jul 2022 08:20:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtJ1-006j7c-Fq
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:19:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so5882238wmj.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1uBINhkXj5CiEZH5/8Pm1Qj/TstsEH9+dcozESvLJgY=;
        b=4VWKR6bZmkYqrWq3HipPRaTMH3acCvx2/KBXfW0kxl0JLH2/QaFB5eScM72+FYuodm
         1Ps0q3GVeNhtTBshvFoBo3Tg+luJAwRx41Xw2WtnWBJxDGW50QVjM//ZZ7wJvEAAosnM
         +Cpv9WmVQCiCmjmJ29j2Y2wEiCmig/9I5iyCVcpCZU1JQbrbcqLFkcPaZk6vTFVvSO4k
         r8HNjXFoAY4onmMo4mvQFeERGQPpAGzZMSpw4mwbD9NsJwuInYdD0TxA5EmnAe/IvGxy
         VFPQIIeLE0FjcUp5Z8aNVQnik0SGEXiA3bBapqYfkjetq4LhdY5qx9raqdGyxVn92K0p
         hIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1uBINhkXj5CiEZH5/8Pm1Qj/TstsEH9+dcozESvLJgY=;
        b=rKOaK8hEzfBBF3u+MmsM2gd7ukoGG+R67KoVNw54fGhAbYDYMp1NUt2tz34XlDUlgs
         G1IlWXVwZ4Fpeg/6V4TbgKtI1ha1vLOOjnbv7ijr6qr2V8KoOQOpV0UDSBxsSfgWUYfT
         37eNwLjg/Ppcw3SbC95JzBL7YGSngb+AxB7BD3jzN6pLy0YgmsPifWDH48Vmbr8nwlNp
         dKKVEhuDk07Gjts8KX2oIiRc/2mNE92YYJnL+E4EO7C1gVq0pJcu07qZ/cb1NlOXNeLK
         BU5ehLl0CfCNVF1RMFOxgYO6VhcosWykFhgGiJZYFBpJVj7tnPWHgw+Nc4VqWumALUK2
         f1oA==
X-Gm-Message-State: AJIora9pBQd/COB4FnXNMRtPCf/f5PWa2nS220x0b8BV3gV9TxGRPfJK
	K1zqgTvtCe7+A9H1zst+PJZpyQ==
X-Google-Smtp-Source: AGRyM1vVJst7/Aus6G68zbPeB5sjlhQjFaxS3scwhOLz5W4CplCDcGNlIQKvOud+yzBrYFf/TaeraA==
X-Received: by 2002:a7b:c851:0:b0:3a3:19df:2673 with SMTP id c17-20020a7bc851000000b003a319df2673mr7533079wml.75.1658737148896;
        Mon, 25 Jul 2022 01:19:08 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:806e:25e7:daa:8208:ceb])
        by smtp.gmail.com with ESMTPSA id x3-20020a05600c420300b003a3200bc788sm16695264wmh.33.2022.07.25.01.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:19:08 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: power: Add MT8365 power domains
Date: Mon, 25 Jul 2022 10:18:50 +0200
Message-Id: <20220725081853.1636444-2-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725081853.1636444-1-msp@baylibre.com>
References: <20220725081853.1636444-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011911_539045_AB6C66D8 
X-CRM114-Status: GOOD (  12.69  )
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
    Changes in v2:
    - Made include/dt-bindings/power/mt8365-power.h dual-license.

 .../power/mediatek,power-controller.yaml      |  2 ++
 include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 135c6f722091..2c6d3e4246b2 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -29,6 +29,7 @@ properties:
       - mediatek,mt8186-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -67,6 +68,7 @@ patternProperties:
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
+              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
new file mode 100644
index 000000000000..e6cfd0ec7871
--- /dev/null
+++ b/include/dt-bindings/power/mt8365-power.h
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
2.36.1


