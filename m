Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A1C3ABB0
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 May 2025 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vavMTR2D1KCOOD6m+5FBBXoIqxt2okFOaC8013/6GF0=; b=0dvHZm5oOwovJ2r4DaKajyEaiD
	BihJRq8Os+FGHgU/UApxOsAMGBP4NA78UwfvL6cH1cdJ4DTJhAg5g2an2AN+vXF/ZUravf3hReXze
	Dxglst6AWYElEj8dhHq6MCZGATjcZ+YPgIP9YMv9AvNrQPoezlqGqYFrgwseGJgQaomc0v0go6/SJ
	9K2eGaIe5pJvFEc14XtqUp21Il7MZ6kuxXToDsVj8m4SJO9Sqw5QwEQJOgPA+aqYx6cRKfa758j4s
	yhPjcFrOPV7TS/jJGmnl9oYItENDc5ORVrLR7QAKoucBjpCatPVDL2OLJqsSmyb2um91vR42hoK8v
	bEMTaa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6O-00000002dwz-2CJV;
	Fri, 02 May 2025 17:23:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtU2-00000002YPJ-04od;
	Fri, 02 May 2025 16:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204207;
	bh=X2Ng3agimfiOa3XjrZaTTRUXoUq+StkbsTQYQSI5kBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZVqt8R7hTEtpyGw29k2ISovDQgjRLUBeIRsJtt7SHFM/kjQuWgidGNN9bxjosfC3u
	 +GxffksQhGqNVVu8CSg3UZwAper72bRhraZcSy/b5Si4WGO66AgmqALFuEl9l+k112
	 +DRfEVy9NwFmVV2VgArnldMYxm6O1k2FX8V9Y/0yLRjNWcP79kFV8JQChpmdt7L75P
	 z/j3g8I4ec1Q20H1iqIqQuQGNkcUZ8QHpZ+1tPJgXk2bNCVQKIM6sjWndkuhf+AbyP
	 2h3PwAOgqm1kGnfqdMsmZvRHS6SIRBTqLpAIHJhRJ21t40myHKqQ9egvHzySuYsndj
	 JPNMn9wdHLJ6A==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B05D17E1062;
	Fri,  2 May 2025 18:43:25 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 12:43:21 -0400
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_094330_224304_82CF4420 
X-CRM114-Status: UNSURE (   9.09  )
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

The register space described by DT node of compatible
mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
including registers for controlling bus protection on the MT8365 SoC,
which is used by the power domain controller through a syscon.

Add this compatible to the syscon binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c6bbb19c3e3e2245b4a823df06e7f361da311000..f655ec18cc2d96028d17e19d704b62f6d898fea4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -190,6 +190,7 @@ properties:
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb

-- 
2.49.0


