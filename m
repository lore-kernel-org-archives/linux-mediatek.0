Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD7C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Euptqm6AQ+F0QuGH0RphAHyWpFpyyW6El8dH9cEUISw=; b=CQJGvRsPn35toZ0Lub5mRFl/yE
	dH7Y0p7BBVgUHeoOpZoMHOWaLWmya2QHAIJKPTbU4XbauGpOeLcMOEM/vt+EouJQ9EHzTio7DM4I8
	RY3j8Rx1HZHGANzBu9IT550cUgSQBFPXFdb9mfK0SS5Q6tIsJfpSV3uM/+MpARvCVHStiEd+OAjQe
	yBvvztBd0p/fpKZ7IORVK4T8KcBp/cX+8DGZwTCIaRF93rvmGHTw++hZC5HvjqpZr0qbrR3PolA50
	wL+lgMYG3SH7n3Z9N6dN6PuQ9pkxNbWWvhoODqtr5mLpBOnaRQWSxChXwTsGcpp/7KqeAIkm3CVdp
	HOiJBzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQMm-00000004CHz-3twZ;
	Thu, 01 Aug 2024 07:36:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQLr-00000004BwV-0gjX;
	Thu, 01 Aug 2024 07:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A90486279F;
	Thu,  1 Aug 2024 07:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052CEC4AF0A;
	Thu,  1 Aug 2024 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722497754;
	bh=0D2yOl3zvpdPmIbZ/Q8aSoiaOijPs/yLkfqLirVDDPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hh5Ka41vWtNQMjAnffTrHz+grZ8r1nlLTOVqmURjifeez+F0v/q044XHFQBkvULk0
	 2evzjRe+ULmYdxPNB5yAbV3EFa4MGOkyumRggcSH3XVNLRw+T8Mn1tboGYfbGOqTKz
	 CofnS9qEc7AeEGYwZnxmXxlt/WhbkmV25dYAkkyVq8YnVHWUPXJZoUh/fhmho3g45C
	 aedOWHDDs33wYsI+sRYLEDFhmft8dJUKeGHJIf+ONeJh9HFCXVigjPW+2OvTQP6dcY
	 rbLDGi0SAjr9oWTG4ypc7Cu+ifgKfLLXdtag/UnU2ShNkniO406bC/wEqfRjOq2GnH
	 1g/K08Ougqbxw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: arinc.unal@arinc9.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: Add airoha,en7581-switch
Date: Thu,  1 Aug 2024 09:35:11 +0200
Message-ID: <f149c437e530da4f1848030ff9cec635d3f3c977.1722496682.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722496682.git.lorenzo@kernel.org>
References: <cover.1722496682.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003555_266282_C28555DF 
X-CRM114-Status: UNSURE (   9.52  )
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

Add documentation for the built-in switch which can be found in the
Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 7e405ad96eb2..ea979bcae1d6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -92,6 +92,10 @@ properties:
           Built-in switch of the MT7988 SoC
         const: mediatek,mt7988-switch
 
+      - description:
+          Built-in switch of the Airoha EN7581 SoC
+        const: airoha,en7581-switch
+
   reg:
     maxItems: 1
 
@@ -284,7 +288,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: mediatek,mt7988-switch
+          enum:
+            - mediatek,mt7988-switch
+            - airoha,en7581-switch
     then:
       $ref: "#/$defs/mt7530-dsa-port"
       properties:
-- 
2.45.2


