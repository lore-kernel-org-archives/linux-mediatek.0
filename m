Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA9C369AA
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85tSJ7bPjsks2C+7t4rIJ+w+ufaQNaFl0cQA1ephk6o=; b=2f+sCHQtD+X1bp1EVBn7HF+BSS
	EmtUhYP8yZYsuOvcNDcCy1gbeVbxWV3SfkfPVi09jkKJejHRg0ICvMriS0Mg3fvocMuucv3Q2Gu0G
	romWvxitJ6SnJq5Tt5Iwv+QtI7H+zgfIoahr35K8Aid6ehd0wHCklVYTrCe1zQCJK/ZO1kS4xUm7J
	MwfLZU+TBJkkNUZnv1pEcKEGNzxHymq7RJ6GwULRuCmyqRzLMR0j4IGUuYaYw92LpfhBH9EN4fmAW
	zQYOu7HEf/mULJrRBiOo3q9zWN4o3hbT20t1O/bn2EkOdJI+lEnulmOi9qw3APkgmNq02NUV6fNHp
	6tC9f+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vPS-0000000BKAV-2J3B;
	Thu, 10 Apr 2025 17:09:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8O-0000000B55x-3P6T;
	Thu, 10 Apr 2025 15:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77DA4A4A924;
	Thu, 10 Apr 2025 15:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA7BC4CEDD;
	Thu, 10 Apr 2025 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300087;
	bh=TllkH9uFMCMy3fpbEojTrBhyQXHNcCjD8yUla2JfvUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sNAb1E5VbKgvxSB5W3oXYM6325xj/OjVnNTVVDPRi2u7yWVdb5WhwxzWS3GnEI8IU
	 QXfRiPgLCaC4MN87EoSVzc7bDHTOs4ov/CKCH9VUY2KNPFXJKR18ahp2xr8D2IVZgv
	 cl7KHWg33at5mbc2qs8CfQaFuBtnK2XJ9D10oset4tdFmRUWcPuQL3NfdSk8wSegaA
	 BegkCLM6ILpgSAtCD/PoTDG7BfGxhZ7m4gdEFhuVmedd9Dp3VnapsdudQww5uL9pBy
	 +0RrwJFf84k44bfu2YJhTdWyGl7y/yqV2ZkgnYsMCv5AGyoSDscCPSW2Ow5DRLshbo
	 i29dHN5eZOggw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:36 -0500
Subject: [PATCH v2 15/17] dt-bindings: arm/cpus: Add missing properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-15-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084808_989736_A737B720 
X-CRM114-Status: GOOD (  13.66  )
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

The Arm CPU schema is missing a number of properties already in use.
This has gone unnoticed as extra properties have not been restricted.
Add a missing reference to cpu.yaml, and add all the missing properties.

As "clock-latency" and "voltage-tolerance" are related to opp-v1, add
those properties to the opp-v1.yaml schema.

With this, other properties can be prevented from creeping in with
'unevaluatedProperties: false'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml   | 46 ++++++++++++++++++++++-
 Documentation/devicetree/bindings/opp/opp-v1.yaml | 16 ++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5af1396d631f..3846f13ded5b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -299,6 +299,16 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  interconnects:
+    minItems: 1
+    maxItems: 2
+
+  nvmem-cells:
+    maxItems: 1
+
+  nvmem-cell-names:
+    const: speed_grade
+
   performance-domains:
     maxItems: 1
 
@@ -317,6 +327,31 @@ properties:
       corresponding to the index of an SCMI performance domain provider, must be
       "perf".
 
+  resets:
+    maxItems: 1
+
+  arm-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  cpu0-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  mem-supply: true
+
+  proc-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  sram-supply:
+    deprecated: true
+    description: Use 'mem-supply' instead
+
+  mediatek,cci:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Link to Mediatek Cache Coherent Interconnect
+
   qcom,saw:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -327,6 +362,11 @@ properties:
     description:
       Specifies the ACC node associated with this CPU.
 
+  qcom,freq-domain:
+    description: Specifies the QCom CPUFREQ HW associated with the CPU.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
@@ -352,7 +392,11 @@ properties:
       formed by encoding the target CPU id into the low bits of the
       physical start address it should jump to.
 
+  thermal-idle:
+    type: object
+
 allOf:
+  - $ref: /schemas/cpu.yaml#
   - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       # If the enable-method property contains one of those values
@@ -416,7 +460,7 @@ required:
 dependencies:
   rockchip,pmu: [enable-method]
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
index 1b59b103dab6..61c080e50859 100644
--- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -21,6 +21,18 @@ description: |+
 deprecated: true
 
 properties:
+  clock-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The latency in nanoseconds for clock changes. Use OPP tables for new
+      designs instead.
+
+  voltage-tolerance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 10
+    description:
+      The voltage tolerance in percent. Use OPP tables for new designs instead.
+
   operating-points:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     items:
@@ -28,8 +40,12 @@ properties:
         - description: Frequency in kHz
         - description: Voltage for OPP in uV
 
+dependencies:
+  clock-latency: [ operating-points ]
+  voltage-tolerance: [ operating-points ]
 
 additionalProperties: true
+
 examples:
   - |
     cpus {

-- 
2.47.2


