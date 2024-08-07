Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46971C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPvR72lZb/wflZcn3jY985NiYdzDk6wakY3S4I22XZI=; b=VNohcSlE9vF81ebhhGr4RyG5eI
	5SPsj79+SfdZ7+G2la19TUxlf0sfjmsAgxeZQJ3iiVSty+hmTnbDPILylkVqkjtPd3sJlV4U6u8J1
	bC450GmLoMAGlwVodbcHN+dAZZZGh+Gt/zt0500QHqgnnB5exiZ4YQDnKOGcn2ocGnL5YnZC9jmsq
	9rRFfcpDHXX7bCnYf7MBLqJGLw8aOTwicVC94kzDGoUaday/x34IOe6uS+RKmOE+QZ0jydzqdTw2s
	AUxclgDPmQKF9kzpX4qXbBuJ1TzMDlBRJCvHWp2k5ZDzSJS9LmF/95S4IAB00RwZyJZ8LeIm7a2St
	7Eb1Lndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk1m-00000005lVP-3rdS;
	Wed, 07 Aug 2024 17:00:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk0E-00000005l9Q-2oNC;
	Wed, 07 Aug 2024 16:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F74461203;
	Wed,  7 Aug 2024 16:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE6BC4AF0F;
	Wed,  7 Aug 2024 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723049949;
	bh=vbdFAWEiqj6ShPAUeJoHxn0X1+oKzNYipb6Dvnup3Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KA0U/0S20BdjnuW6Uoxyzkic6oh78rNPddLXcgEF1JljObhi44cgkqbQriB4M1pDb
	 YfEjv5nSDpc61QTI1SLOnE4ZK+7Z9mU/x25chUe8NgINndOK7DHSLeWJGw9g+7+QnK
	 JTmZd3w8RzGZuNYfu0i3aa7/gV3jYeXw/msAeXqxpJYOONtAS4lL+mvv59/e3qL8S5
	 arURPuCmx4XzdA/+BwuKcJHkGL8LnSDBWVbfntEITsOFdBYupZLicCkMIYC9OGiFVb
	 FFhUwX+XwrnC4xRoDDnJ2HuT9oVrMEp249tu3dMxRyjal7CvpDcFTM3MLtDt8cYaS3
	 pjro68RqpFP5w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 07 Aug 2024 10:58:54 -0600
Subject: [PATCH 2/3] dt-bindings: Move Mediatek clock controllers to
 "clock" directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dt-mediatek-clk-v1-2-e8d568abfd48@kernel.org>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
In-Reply-To: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_095910_904408_D92E1F77 
X-CRM114-Status: UNSURE (   9.14  )
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

The "arm" binding directory is for architecture specific and top-level
board bindings. Move all the MediaTek bindings implementing clock
providers from "arm/mediatek/" to "clock/" binding directories.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/{arm/mediatek => clock}/mediatek,infracfg.yaml  | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8186-clock.yaml         | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8186-sys-clock.yaml     | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8192-clock.yaml         | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8192-sys-clock.yaml     | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8195-clock.yaml         | 2 +-
 .../bindings/{arm/mediatek => clock}/mediatek,mt8195-sys-clock.yaml     | 2 +-
 .../devicetree/bindings/{arm/mediatek => clock}/mediatek,pericfg.yaml   | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
index 230b5188a88d..252c46d316ee 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,infracfg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Infrastructure System Configuration Controller
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index 7cd14b163abe..f4e58bfa504f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8186-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8186
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 64c769416690..1c446fbc5108 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8186-sys-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8186
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
index dff4c8e8fd4b..b8d690e28bdc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8192-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8192
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index 8d608fddf3f9..bf8c9aacdf1e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8192-sys-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8192
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
index d17164b0b13e..fcc963aff087 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8195-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Functional Clock Controller for MT8195
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
index 066c9b3d6ac9..69f096eb168d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Clock Controller for MT8195
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
rename to Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
index 33c94c491828..2f06baecfd23 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#
+$id: http://devicetree.org/schemas/clock/mediatek,pericfg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Peripheral Configuration Controller

-- 
2.43.0


