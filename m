Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C5C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPkbhWZm3CGJZxhsQVnfGwmLA3P4wIND54iEo/rU79A=; b=5EcAZ+3gq1XSffBWDv0rzgvgKD
	QqNZMBwVNoCPCn5Cpq8eMo3nuapVNvgU/mgCgWn2kyDc+7YM0fbhmDJv1WPCN+umYPEvzWyELe9Ix
	B1HIQ1SmBFFI1FdUbhDLCkq0WkIwAoFjYZXG7VSDxpHLSztD9+BNZQEzALif1mg4g1zsBt+N7MWFM
	s2FmAY3Y0EFzEk9VpOPA5ArVQQhSn+OwRafzDDVtLe5nIjb7MetnReRszKecce0mDQ+nmbr5DCNo3
	VC6JQBvLyXAYyeXxU28ugh4QHFiU19b2gLifCKOfo3RdARwW9AUJG1IVQxhc05rSiJyrZhk1Q1nUa
	11IAbztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vPR-0000000BK8Y-18XV;
	Thu, 10 Apr 2025 17:09:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8N-0000000B55S-3kNG;
	Thu, 10 Apr 2025 15:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20AC568449;
	Thu, 10 Apr 2025 15:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C31C4CEDD;
	Thu, 10 Apr 2025 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300086;
	bh=d2xEle5JR0P+8ywA0siIkzQPF9OlhK/me+6AtXOc0AY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qg97LQXxGV9ue31R3MdJVO2YsWgEzGw16N4u8DA8cSMGiQre4zl71TcotrYsR03/s
	 qxPvL6r0xo8sAMHg/GmU2Ydh7pqHl4uCL4KwtnVRK4bZcRVsku0EjD5jyo920SnEgM
	 3YPNYEJKauEYI/YTN2EPPH9Sgs2M98xRB4VCeDSvhZ0XTwsK3MYnJyr5+oehnPZQPR
	 x7DBrqvDUukbGMNLfanV1kuogiP7OWadByi5f7drA7qqyQOQ/TrgE8YzeedwdpTED9
	 TzmFsWHaGHmHPqL4Wkm1pjhIUHDaaOUuQh+21Lzzb9zRW9meTqoHS7x7RiG56MLbUg
	 XAsxucDqzahhA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:35 -0500
Subject: [PATCH v2 14/17] dt-bindings: Reference opp-v1 schema in CPU
 schemas
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-14-63d7dc9ddd0a@kernel.org>
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
 Viresh Kumar <viresh.kumar@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.15-dev
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

The opp-v1 binding is only used in MIPS and arm32 CPU nodes, so add a
$ref to it in the CPU schemas and drop the "select".

As opp-v1 has long been deprecated, mark it as such.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml   | 1 +
 Documentation/devicetree/bindings/mips/cpus.yaml  | 3 ++-
 Documentation/devicetree/bindings/opp/opp-v1.yaml | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index acf38b3518dd..5af1396d631f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -353,6 +353,7 @@ properties:
       physical start address it should jump to.
 
 allOf:
+  - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       # If the enable-method property contains one of those values
       properties:
diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index a85137add668..471373ad0cfb 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -50,6 +50,7 @@ properties:
   device_type: true
 
 allOf:
+  - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       properties:
         compatible:
@@ -68,7 +69,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
index 07e26c267815..1b59b103dab6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -18,7 +18,7 @@ description: |+
 
   This binding only supports voltage-frequency pairs.
 
-select: true
+deprecated: true
 
 properties:
   operating-points:

-- 
2.47.2


