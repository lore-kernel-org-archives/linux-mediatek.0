Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50493D21260
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z+P8UNvqP2F207yqlUX6ImNjWsCKBW8fNTzu+b0Lqk=; b=edM1jIZXAhtNkgIu+GNOoJnRyj
	PfMvRON8+ov8YYJUvZDcU2SYgs1brmvH1wrv1kn5zshn67nEHFoF6VXQwwwy7A0vTql8njEcLMBGF
	YoDwE5f+YgExZtVpYWeLqDqkZp3sWDfOVJIF6kmLZkLaan4weM4+6a3izsgHMrQpHN4jVMM0SDdyE
	2BXJnNc4MmR7d3gs4jCCjVOIm6Z2p7qhG8vFc6IWYT6782R9Cgc50ZJXNWzslJ4S3znUUHyM67b7j
	UOtBzYHj70y0xLeNFpMUa/Pj96if7cRWR2/o6W9+kxolnMOigGBtAh3qDJiqHTD0gxFjEt2wNpiQn
	CJgz7igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MHZ-0000000EFFA-1Hgx;
	Thu, 17 Oct 2024 08:54:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MEg-0000000EEmh-2Dcq;
	Thu, 17 Oct 2024 08:52:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99650da839so99170866b.2;
        Thu, 17 Oct 2024 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729155117; x=1729759917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z+P8UNvqP2F207yqlUX6ImNjWsCKBW8fNTzu+b0Lqk=;
        b=LsTUDmf/8S8qjkxF/7Dt+y+Eld8l3KPx7rZWEmwCBFEN31g10/bNxeHg9bB98UzFdX
         HAQsy2R3jctq88NI+79yvy9Yr/k7s0Rqy0pguEBLpMhh3gOeUWjMeh2mKXUdfhMGpR0n
         bDmSkZsy5HzqgUHIlEhOMDOW5qtr9Q60SY6Rw9Erc5zPuiMQWMCLnN10TOd/ty/Gb8vG
         sk/nfxENqVzLwwJdstmu7iY9LEtCzB4WPR0lPhlxTu94/3p60ikDjhH+PvWvBi/Sx7EI
         CUiRePZ1UYdyjLOl91I7162i+Bpcv3GR8KJTXCFVbFHqyT11LMS1pGnkd/abyodDQ61e
         S/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155117; x=1729759917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z+P8UNvqP2F207yqlUX6ImNjWsCKBW8fNTzu+b0Lqk=;
        b=R0Kr4/sXbW0Bz7OBIWy4HGY6e4flIeQOpXa8h+sIQbJeN7GyHZ5KFMuAcOKUIDgltr
         /KXNL4LLohdngJxSQwrKFF8cxc02idkiEzHWCOOFYv0DYjWbFzi2sj8xybBf706zF+Ti
         cr2nJGxuXTlX1YiuOU6Jooe681aC6TjcuNguZSweMK8r8dSxTaxppdR9ry3qfrxW3IZ+
         DPyoS2U3RTWhpeJriwUX27YJ79wbH+LmOEihEVfqYmOtS2g0G4BXFr4ZfIt3uH/GLMRj
         rrQz785FrsodaPhN4D2JPAn20zd3Zt7S/xl815UYFZdUlV6W5DX78TkuITzWPgG4JrEJ
         Pezg==
X-Forwarded-Encrypted: i=1; AJvYcCUEEMw6tAVwx3R+wZXMKDkFUalyDAwQfSQjkNSPdjlzREiU6GRsLNrUoKjn6i+hLTQqP+Iyf31f5oXZ76XMNK4=@lists.infradead.org, AJvYcCVSslwRnWF0n546I+/ZaGemmspePwRJsKDV2A/L+VBfm4ovmKGrjMhkyePSVROKjFE+MmsqSgLndMfVhPXoJvXR@lists.infradead.org
X-Gm-Message-State: AOJu0YwQGhTzgpKTRveDDYxJwFg4jnszagFDOoKPwGQBaeBpMA7tCDVf
	TJqzMxSZmBWh0zCMGomwXjJ5AH6FEhHCXyhvLmufChzOKkN1KzhE
X-Google-Smtp-Source: AGHT+IHasxy8ZcBwQ63aPHXND9H4VsUQyIbWvOQ1NFxI6SZCCyCKPXsoumTK68tT8iJu7uplyyd/TQ==
X-Received: by 2002:a17:907:848:b0:a99:d587:6045 with SMTP id a640c23a62f3a-a99e3b319efmr1895383266b.19.1729155116394;
        Thu, 17 Oct 2024 01:51:56 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29816c24sm267045266b.110.2024.10.17.01.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:51:55 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: power: Add binding for MediaTek MT6735 power controller
Date: Thu, 17 Oct 2024 11:51:34 +0300
Message-ID: <20241017085136.68053-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017085136.68053-1-y.oudjana@protonmail.com>
References: <20241017085136.68053-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_015158_598301_30259B8D 
X-CRM114-Status: GOOD (  12.78  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add DT binding for MediaTek MT6735 SCPSYS power controller.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/power/mediatek,power-controller.yaml  |  1 +
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  1 +
 .../power/mediatek,mt6735-power-controller.h       | 14 ++++++++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt6735-power-controller.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 8985e2df8a566..6d37c06b2f65b 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -23,6 +23,7 @@ properties:
 
   compatible:
     enum:
+      - mediatek,mt6735-power-controller
       - mediatek,mt6795-power-controller
       - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 2bc367793aec1..3530a6668b486 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -20,6 +20,7 @@ Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
 	- "mediatek,mt2712-scpsys"
+	- "mediatek,mt6735-scpsys"
 	- "mediatek,mt6765-scpsys"
 	- "mediatek,mt6797-scpsys"
 	- "mediatek,mt7622-scpsys"
diff --git a/include/dt-bindings/power/mediatek,mt6735-power-controller.h b/include/dt-bindings/power/mediatek,mt6735-power-controller.h
new file mode 100644
index 0000000000000..6957075fcb9e5
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt6735-power-controller.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_MT6735_POWER_CONTROLLER_H
+#define _DT_BINDINGS_POWER_MT6735_POWER_CONTROLLER_H
+
+#define MT6735_POWER_DOMAIN_MD1		0
+#define MT6735_POWER_DOMAIN_CONN	1
+#define MT6735_POWER_DOMAIN_DIS		2
+#define MT6735_POWER_DOMAIN_MFG		3
+#define MT6735_POWER_DOMAIN_ISP		4
+#define MT6735_POWER_DOMAIN_VDE		5
+#define MT6735_POWER_DOMAIN_VEN		6
+
+#endif
-- 
2.47.0


