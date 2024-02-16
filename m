Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE40C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0yWp3kmRi/q9g+bxyO5xtW6e0LFiF61440qHk1ggdBg=; b=wTYNN91afBkzcy/noMk8vziRUs
	p8UeboTlBwmMRxjew6FFde5KUVw/JFkSfo3ODpnaEEik4sCILj7VVMQ5t7IzVtb6X0ER7e1Qf7ya3
	VCW+F+uEUGv7dGnfOrOOYPsl1SisBMrvsA7xRazIuvnOog9KAiopRZY0qON6RIU51EufidaDeTs5h
	tdbUUqXMIQ3aAcW2NxcZQ9Weo7iqtntWr/LK4h/iwCiAzCjYmHf3x4DMm7hOnK1CW4Mv17z9xSpYq
	ET2FhrMXHK5FrtUsuswRtMNfNxCToYJIEtgGM1+LX5sm0w+VfCUjGwIWTwMChrqI/j3gPOhvPpWjw
	qCtD2Sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1AL-000000030nI-3W6G;
	Fri, 16 Feb 2024 16:34:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1AI-000000030lh-2b1K;
	Fri, 16 Feb 2024 16:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9795ACE2B56;
	Fri, 16 Feb 2024 16:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3E2C433F1;
	Fri, 16 Feb 2024 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708101254;
	bh=PAYlbhU4FVr6ISJQH/LWFRXKfSB6vQ8ZEgnzc0wPFNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M6vUJGqDo8rcxNxvIhEAwgLujWIjhbZeRj9UBc7p99/yrphFh9puguzZubhEGOcAT
	 wjFEyfFkeGwQWxuQlHM23KEdJ4zfIjwZixpHUFyGNJ6Ym+gNZongWrlaCjdRl6m4yu
	 aielKv3xxsH9rZz6uaCuDnPg7BLB6r5Nsw9Tb734iTcMGAH1EZmLwXtRnsfNHln5DV
	 RzIjJqmfp0BahFDjOloW9Ja0zuGFVnDnl6pA871PCOrApHC3OL+xjix2NPnzkHbJ4C
	 bAAYQjVVlJ0IBACvP4hsW+7+EdEGThqaFdKEh+TNoHekCtKeGzcp0Hy2fWE/WTgj1y
	 TqKg7TO5yRK2Q==
From: Michael Walle <mwalle@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
Date: Fri, 16 Feb 2024 17:34:05 +0100
Message-Id: <20240216163406.1050929-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_083418_890455_F93A5861 
X-CRM114-Status: UNSURE (   7.16  )
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

Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
computer.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..32896f91ea38 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -357,6 +357,12 @@ properties:
               - radxa,nio-12l
           - const: mediatek,mt8395
           - const: mediatek,mt8195
+      - description: Kontron 3.5"-SBC-i1200
+        items:
+          - enum:
+              - kontron,3-5-sbc-i1200
+          - const: mediatek,mt8395
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.39.2


