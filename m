Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32181C021B8
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTjS4QD5aRRTTtsDjSbm5qoyYHKYH+sob4ozlxJB9ic=; b=H6Ev+8jwxR2agmHBXCz8DdXIM1
	6swZTkS1h/Ucc2pft+z3RjCrGMAaImsk/Li4oAy4+oxPxM6xqYd4S7J/C7B+4+BVAwhS7iXXb+0IX
	ZpM5q3Vt7DSDCVUrz7Xm7mF1WkGkHvzjgAiOR7mGH+M+J2B8Yq8BcSuR07m6D91c3J8r1iT5NVaWi
	trEVNWNC7ch5CnkflqDqBWM4L0OiY76zHeRa2OoalkaZAjVEQUuRtl9c7TRVEQVck/dISv0w88FI5
	jJhUDtEVNiHOgvlAHKtn0L3xm4oilW7NS1NeSVHRbVSG/wEP7oFt+S1vy2uTQ2xZRK3jKuK/u3NzM
	r7eKYnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUYm-00000005IWU-1OC7;
	Tue, 04 Mar 2025 15:51:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0J-00000005A5w-3DkA;
	Tue, 04 Mar 2025 15:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101378;
	bh=7qZSEyR0V+Q68jPCbCpEUUUD/p2/zi5ZylCaXpvJvY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k9ktHFoHqQRCE3YD00V36KNImZxun+8eUdIuTWJwsFP5jZGJsqeSo/H3QLo/287Un
	 YVm1UpVRZA3U+zin9SjbgwPn7qXjzKtzfNvSyTrguFjcSernf8+MTCm1HOKVlV+rfj
	 4BYqo09Z/plEzmgoRYz+wdCrIqLbyqn+XB+QJdYxgqDMi19h0K/WfwqoI5z7WbxHV/
	 IErkwMBaAw3Lm2G4cJGDFz9Flo+OUtg24mroe3qGueq5MjqsiiMZShyyVNSNkW9FzF
	 doEpRNfRo9qBtRGR82UxAsNZH3p4/F5asCVsflx9TTWIVWjXktjDAC5uaLaBE0fyuQ
	 7rgQlIgSRaM0A==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B62417E0A4E;
	Tue,  4 Mar 2025 16:16:13 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:43 -0300
Subject: [PATCH v3 02/20] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-2-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071619_952537_93CC5697 
X-CRM114-Status: UNSURE (   7.24  )
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

Describe the accdet as a possible subnode of the MT6359 PMIC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..b2a50f754d00fd8e9577b9d8269868bdfc2e425f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -224,6 +224,12 @@ properties:
     description:
       Pin controller
 
+  accdet:
+    type: object
+    $ref: /schemas/sound/mediatek,mt6359-accdet.yaml
+    description:
+      Accessory Detection
+
 required:
   - compatible
   - regulators

-- 
2.48.1


