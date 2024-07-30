Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42702C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WezfmknizvYRsGFofh0x0uAf86VCroElHp8yktpX8m4=; b=cWvAqV0ORXHBHwzOz7Ap3KLqoH
	+QGKCDPkARHVnL5SeUjhXDU8+JDDSZCSr7yyuT2MqhpIhxRU9dK9nzizl0IFKYmScD6aOPw1jRs7h
	TN5QDDzlf9YYxrItqgDwbwEubE+9VljDmGWaTB+p3wOToibGfoJWfFkWSy3ShnNmoeOEdMyxZiDRx
	S3QbtlTja2qWhyL/gzWqLzXDHVbc42scE92Riu6Ky5YFyYx0rI0ycLNbifjy+cWpS3sw1Ol28O1s4
	u1gU4Wj244SfJenS1eQA4Ya0SLtD1cKRLp93DjEQj9fjTSKh+dz8ylXe+ewdQfSrJAhdc3JQcP21N
	43un1OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYha2-0000000E58z-42OC;
	Tue, 30 Jul 2024 07:47:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhZE-0000000E4uf-2K0A;
	Tue, 30 Jul 2024 07:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D786061E19;
	Tue, 30 Jul 2024 07:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10014C32782;
	Tue, 30 Jul 2024 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722325603;
	bh=/1UyRDxDBbUGDXPzIHV51t98DfSsIxNOuwNCDXhMy8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXKCgQVUgiMD5DnjrQb/DEV0shSrPRhqhFWAtn5UXtlH2T3H/uPDfIdnLZRJUf7wl
	 bahgfr4dJTU7ghCKtPujgbllaURpJgo2MW4pewmQhrEf6MnuKRPe4NSBVAfYxiCjCr
	 apLGIfQ9+9AWyM4TCg2LysicG+oulsMtA4JQwhNvAnBTrM56J9SvY3vWwOBnl2S3g1
	 WtEnebNB2r6NvFfgHwWV95wagZfho/z4Zzdo9G42QQYF5NBbR5MYJ6RBDR+zOBberx
	 1qBH2UbgDoxBqc0yLxyvTs6JX7gpcdqru2ZmwlMrx/X90dkfw7H33Hs1lb/vcEyzsB
	 TSMVt7IQVl5uw==
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
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: Add airoha,en7581-switch
Date: Tue, 30 Jul 2024 09:46:32 +0200
Message-ID: <63f5d56a0d8c81d70f720c9ad2ca3861c7ce85e8.1722325265.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722325265.git.lorenzo@kernel.org>
References: <cover.1722325265.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_004644_676529_398A1AD9 
X-CRM114-Status: UNSURE (   8.73  )
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
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 7e405ad96eb2..aa89bc89eb45 100644
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
 
@@ -284,7 +288,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: mediatek,mt7988-switch
+          contains:
+            enum:
+              - mediatek,mt7988-switch
+              - airoha,en7581-switch
     then:
       $ref: "#/$defs/mt7530-dsa-port"
       properties:
-- 
2.45.2


