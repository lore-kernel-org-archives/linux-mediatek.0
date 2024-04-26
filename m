Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DxkrkvnU1xYtRscdDinO11SYbefXzCnZwjBbMrTRS8A=; b=FclUy/ClmIKeq04QA2ZdrKj9JI
	vPJAb1yoqTMw/lLs6VvoawfhZ5tDK0KDMzI/8E1efzBzK0Eo8FdiS2XgbOoRKZreWo3/uAWMmM/ZY
	QZ8/YVnhQ5o280j0OaX7Vy9UD+sNWV5B19yUqQPgx0AKMc6VtQjiUqtPMC297z6XOn9QgEOocpRhy
	qz7+0IIiI3UPQeY/lAaA/Tc6Nmv+9duQVrCdZ4aKHwL3QNe3+9eOz2EU2CLHiXEswAXz67U2uiOm5
	+SA5IA7mNgsiO/HZjDOAFIEOlf0J/69FCB+ZcQgH0I/VVRwxHqTPJpVjeL39Py7CNAl9n3QbtcW7A
	4e3Hpjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ReG-0000000Ds0s-38NJ;
	Fri, 26 Apr 2024 19:54:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ReE-0000000DrzB-0Lyv;
	Fri, 26 Apr 2024 19:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87C4D62122;
	Fri, 26 Apr 2024 19:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF4EC113CD;
	Fri, 26 Apr 2024 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714161257;
	bh=QPeeDX2DDvQRA6ERB9qQ64tdJOF8dHgBuG6mRv3ZZ6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=esDMTaJXY14cgL7iUr+SLGpgILhoQ9+wW3SXgu8lu0DhL5iayrLPGTGsjg0SEYWMe
	 YIrkuEqen1KoD0KOXsRE4gQC9a8k1WqTzqgmmgycY2ie2N8gxvHkhP9cFgmEdn1gnW
	 1uX69RNBmVHlzctPrNTUWwO56+4iHGKwo+MoL4iNy6qcO+4GHaYTzY22qbQDr7QN7b
	 NtJ3GX9Sw5jiTZbINQBlpeEvFwzUos6LXUSu19d7LCkx2dywVBokQNq4DX1fuD8LuI
	 76JTjNXaStT+HEspUHtNuhh8feRTEKTgOpqociyFhC6afGDmKYBCK++rNLda18GM3h
	 3eCP1mJz1MSZA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: Drop unnecessary quotes
Date: Fri, 26 Apr 2024 14:54:04 -0500
Message-ID: <20240426195404.2771046-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_125418_224854_9A15B6B0 
X-CRM114-Status: GOOD (  10.27  )
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

Drop unnecessary quotes which aren't needed in yaml. This is checked by
yamllint, but this case was excluded due to the comma and yamllint's
mishandling of some cases with commas. That's now fixed in yamllint
1.34.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index e1a379c052e4..123d24b05556 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -48,7 +48,7 @@ properties:
   interrupt-controller: true
 
   "#interrupt-cells":
-    $ref: "arm,gic.yaml#/properties/#interrupt-cells"
+    $ref: arm,gic.yaml#/properties/#interrupt-cells
 
 required:
   - reg
-- 
2.43.0


