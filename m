Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A1DCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYrrnk9gAyVJlmxR2Jn1fbR2H/dTdi6KJQMEHQbzkpQ=; b=Wes15yPl2Cg/dBvqB83sdHH2F7
	nzKQVHck3Kmy9egxYFb0kd3OnEvDGQFJ9dJIwDV7OuHO0xKfX7mmR66rl1zmLCCVpRlWWzhPdsqNf
	lxEOxqNlKLkZ6mGVZNbCmE1GHfnPO8uryC4Zp/WTQCua7/wko3Lf6Nq79awX0gLgpUwOx2odtE28m
	MfedDPnGUG/6LvYyLlJJ+A5ZiB8tc11iAIJzYq3+xcVHVC61nuZRK2V81b1M9J6KYg46NP3a3VmNp
	zmOl47OVU8hpWqegZ3LvOtk1m7XFrxAmUY/ZEAY3Dj4MDSOMrOCcDnINNky/VmOeX4l9cZiqipLA1
	GVkDb/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIIf-00000001o4z-17Mt;
	Thu, 04 Apr 2024 08:18:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIIY-00000001o0m-111w;
	Thu, 04 Apr 2024 08:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712218692;
	bh=qNIQsRN63cUz3fWMTVMY3OVNv9ArpXhRU38uV3pGBZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=dStsbZdkhPsfyZzFRVUrtm8IM9PzGbB+AuNpRGGes+uBvZ+QtQzq2WBq3QNL8z2zH
	 gDXj9viF/xWxNYcQDCmbWhQIMGxLf3qqH49Eq2ONQRU8r/ZPLsCa3IyP+2gUuhnVaP
	 eaaBPWWm2sFzSumPhqCenBWwip1uubRdLyIlcfB3raBaSvqy9178CDNoYMgDE+j+BQ
	 F1ioO9xsIkbFGspD+V5OQXNQDbRNqcjnhO8WF4dxhetawSczO2yZOWPk+g7h8ZvXE0
	 cihfTVlHQFlKgKwA9VAI5VLALS/RqnAvvftMNGt/0/V3sjOt1+Bhn7MfFSbydtxGgr
	 W2qTevEKwiXSA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94749378200D;
	Thu,  4 Apr 2024 08:18:11 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: u.kleine-koenig@pengutronix.de
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	thierry.reding@gmail.com,
	miles.chen@mediatek.com,
	xinlei.lee@mediatek.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Document power-domains property
Date: Thu,  4 Apr 2024 10:18:08 +0200
Message-ID: <20240404081808.92199-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_011814_625450_FA80F6C9 
X-CRM114-Status: UNSURE (   7.60  )
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

Allow the power-domains property to the PWM_DISP block as on some SoCs
this does need at most one power domain.

Fixes: b09b179bac0a ("dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index afcdeed4e88a..bc813fe74fab 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -52,6 +52,9 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.44.0


