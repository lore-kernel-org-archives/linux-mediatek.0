Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E24C36005
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=; b=RDDw6n/X2qmcqMiGC0yRoNygKg
	XrZkW61YhKiIRqUIGtbTSflcPoftULgHKeuSIDxifAcubBKEret0CMuPsE+lRCB6nYtn+QED1EMsK
	9jaWfLZ9nMKE9hnZehxmeWztmk8VeOLI+fDGI4NQV8RlxRc8aSkHpmvMafk3lXRz7gstZTY+mRTK7
	pTC+ZbzdvCbS4a9AK9KMk/8oOtXqNKS+hy1nVjrhjpHyTaAcPT2Bb89YM261E8zgPQSK+rrpcQIpO
	AzjkElDnMxF5fP/aNOE1GgknEjKEfjWEIVmgLbivxnBqbc4bHgPMw5bBjUOelou2h24V9h9yi/43s
	scMU+7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIZ-000000036Hr-1Pxu;
	Mon, 24 Mar 2025 12:52:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhGq-000000035X6-0x6z
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 12:51:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so290720f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820670; x=1743425470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=qHWvlM1gtcMeZJfnrLRkWn5wYqJez3GppSyIjCA3j1pBxyh9qto9ZySHZ33dA8GGhM
         /nZJDE2QiTP7wWAKQtRMbvVr4TJXcS/g91G/wAI9n/pvZnMrRNVttfjUmtFYM4FPei4F
         faGTcXNmn18AejuG+ew/I1vrLrwHeiy5C2ym9tU04Cx63EDqSNzwhoTTekyghXqR9TB8
         PtSArYi/Nno9PZy59pom4rKRhpKeqsLdsZ0hgg/H3cB2WLXErWGIMFtahY/Q8eNWpb3P
         doVlDQecw0xp8zPwaZdIJVH9zmEfyU4WvQ5SQWW1H6dYGA84MQCnfUXFQWpbXVBAQ6Jd
         uZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820670; x=1743425470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=rXXJeS3/stuFyAynv/S0pnrebzbo1MZnGjS0+V2UQPULWhR4bgpdhO5IeP5y4KPe1y
         8FXdvs0EObMSYJ3Tlw1duVSvrX34qFP4ZjcHwqYi6lO6cLw1ZFV1OvUxr+LVNXo4amRW
         z2T0otyA5+RsPHUxSQT9vHDFFVdxgSc1Qd9VoPzcBr90TxE8aNGPrAsZ+F81sQq27mHP
         eyn6WPvEGZI+FzQIW3UO5lzAfhnwoDBxOjk9PjBFy/OH0iCTbyP5mA/8AOdPYFB9+XgM
         IGs0PxK4gIXTiUaFHjJ/EFE2fTNIK4RK3OsKBMGtR3sthgTvVZTP50vJrJ9lc4qIhf+w
         4oPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0GKFg2swjIZiP2M6Q2Yy79QOPKQchz+Q2LGks8RK8jzaPHbwnAJXRb511Ze5cXQtvhfgWb1bkilCQX/xxeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxje+0Fwt0JePjTW6s8vjQk8rVELTUyJzA+qXQ9hJHsBHi9aCR6
	UblvyH8vlVs/DpQHJfYFjF1qXRxTHG3UXspArwpz/ZV+d1y6MsdESptwk+ewEqk=
X-Gm-Gg: ASbGncvPP9oqQa2V22YR5BTzDa8dAY6PlCsvUGkyLN33oEaOIW6q5pXyEIsGbaPq6E2
	mUYEI4vrSgT+oTHoiWy/+4zCvLfmCOZGiAdDhkC0NmyzqWvtKWw/hwe72QYWVcEVJqtl2pX3FTq
	AcVdj7uoPquil5JvZOHxKAFmg9XLTzGMFNtwDk0T4MCCq91QTVhuwzWSh8Gc97x8sjZaJFd9BSr
	kIaaL9Nz6Ou6gUAgQSfVEUB+rSG58g4+6w6/cVjwu4IHIl3bRDNn6ykspJgeR35hTjEOGngPXfk
	mUXC79DbPyfTc60/s3WG8uxeDS/VLmL7N1F+4Em6Fahg0+jU9QaXDMUeiA==
X-Google-Smtp-Source: AGHT+IEQndIp5eFpgd1dTDP4lH7gXczSBzoAyRnBiPmFPk1TMdz1z67MW7mzStpV92IOyZshhOAyYg==
X-Received: by 2002:a05:6000:1a87:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3997f9406bamr4947758f8f.9.1742820669984;
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b517csm11117180f8f.51.2025.03.24.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes from DTS example
Date: Mon, 24 Mar 2025 13:51:04 +0100
Message-ID: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055112_257623_EB641A3C 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

Binding example should not contain other nodes, e.g. consumers of
pinctrl of, because this is completely redundant and adds unnecessary
bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      | 10 ----------
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  5 -----
 2 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index bccff08a5ba3..5f2808212f39 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -136,16 +136,6 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        syscfg_pctl_a: syscfg-pctl-a@10005000 {
-          compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
-          reg = <0 0x10005000 0 0x1000>;
-        };
-
-        syscfg_pctl_b: syscfg-pctl-b@1020c020 {
-          compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
-          reg = <0 0x1020C020 0 0x1000>;
-        };
-
         pinctrl@1c20800 {
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 3bbc00df5548..f4bab7a132d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -245,9 +245,4 @@ examples:
                 };
             };
         };
-
-        mmc0 {
-           pinctrl-0 = <&mmc0_pins_default>;
-           pinctrl-names = "default";
-        };
     };
-- 
2.43.0


