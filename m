Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3987F3D61F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=; b=YQKjG4v1QNsC4YZOTBsdFFxGiQ
	k9I7kCqfK1QYZduelu3tiiBt9AiHYRq22v78zkPGCp5ybhdc3AXyan/07wzpN/26ZaJZfih9qO6Sc
	nnXuh2lcbs6d8+iIL7UF8DokzV/BRVJ+qHe3KhxxHhb4oGwxyyzSX5o3AKE0LCvToVk0Mu4Wg3kkI
	W3TkQ6pO6mYKx31MsF1oTeEllJyC7cOuVnG3paGzSKhRnL3TMaHI8mMk7e5B/L4jEW2AXnBItqMtX
	jCo/IjOPx0kNyaQjHhQtwiqDF3705hNREVXWH95Jwys+rXiHFtiMnPtpcwXbcdqnmuq0cYMHA1XGZ
	L5JHryGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785P-0000000ArhY-3NWd;
	Mon, 30 Mar 2026 08:35:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785O-0000000ArgV-2HfI
	for linux-mediatek@bombadil.infradead.org;
	Mon, 30 Mar 2026 08:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=; b=CY13iHvRu6A7TOttK3GQI8k+pR
	hp1mg35t8YimKWFH655pFS6h3xb85gXIROFAGe4oRdCbKBMbSOi4fNROQ3hMQIymByrRgLaeEYhuO
	RkDvTV7stgBEu+IfRvLwcVX530G0u+VY8FH/xlQ28xRt0SYhW2Pom4lfA5KOaYTCH8PcGSZwEGfTU
	Hi3AU25vsq07Gpa3OpIyeC5rWV9dFn4YR3EvP8q8iJ53hC8OHLhKjnyvEWucr87ha/Ok1p/BK+SJ1
	qwQDYmInQ1wl0cMUKxHxP/cFlYLp5zIhKxfWnTmNvqEetpDY1irEAq1Rf0/GlrbYaNfMhKz/glThR
	KMqchyGQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785L-0000000DKI7-2vOF
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so29574945e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859698; x=1775464498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=r/NponBHieddWtorA+L1DSAvt+TbzH+ovnbQcoFi+kjUy2vVuJrJnEYL4mqFA/AuTb
         tiSk2ZOtHHm8Qbr+EG+BGVXA/FTTSu7/VyTZ+K5plq2J5MKgiQBdxrveaSQSxi/rqVVX
         sT21gROthhEnDHMrkOcGgtWE64oqD5PbVdr1U+VlgFs94ZZIpJzCetFv4CCtLkQIwRwO
         69XBpW4OLvcAVVUCEmE6UYYh6QH9X2gN4vLwz8Q46vFvZJYOsvwgBVIL9Kf3IaBh4KLe
         s7AkuvivN6BE2F1iaVG/ruDu+NP9R1/DbIqpeQJbziiw/tw9eRmjk+oXFcBprZ1Utebn
         VrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859698; x=1775464498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=jUgEAmVYAjlCFjBUsIcZQSq2rHh7GnfTyr6rscnmzgFSLLqBVBNQCVtN8TOQMpu5ZS
         pWSMPfp4R8+Z50L2CKUTk5tLhZowONaknXkc7z3TL/t8IcJ8u+b3qRXQvQ7MXGNpEmXE
         A1imTmHXQJ/dMfNAL80yS32bfJ3o2UAVlmKOSp0U1Zoo41/laqHgWEtqTdNUtunlfxF+
         iGLYopWLfQ29Oav9cUVZIyNl4QwKDSE6CNAbWaGhV76MB4BAqbRK9RT/RyoDCJNDUlUg
         BRPfQsEVhoWpj902i7AdNoCPnNY087YhTo8WzHjGwYSRIxw7SgVK172QWlDJHtWNNL0g
         ecmg==
X-Gm-Message-State: AOJu0Yy/IeN/03lQaddETAZ5ZxrLzInZfD1jWhI4Wy1FKvcNhJGctY4g
	VmM2aOjqQxVLeWb67ugZ31uZiu+3ptWtw7c0aCNb+yblACYPcQjvMBjo2/NvNy3F
X-Gm-Gg: ATEYQzy/c8I6ZkOJBpEybtIJu1iLwdARU8i6tjY4VwHTgCZGIiIaxMYdd+dkDJh7SMz
	4w5U07kA0Dk3ku1fGvoImxxuP8UosMt14xCZSlpEo/lP1vTrz6kcWUxTxaN229fhvx5mSUhrPGu
	AAY6J4spuc+cT7ToUHT4vXVnr0iAt0j0OTKWk0e3zfJTKAU9cVIqcL0IqFHq7YazkMG01uNjAv5
	eDYPA1Ctw0nIYiX4q9G51ovmj1GbGiLVrluKZmkBBXsuJ8E3IojHfBQ5AQXB0DkvtP7CRnz+TYY
	ebnt8Mz4kBdVcwjdNJcjbjTIAsHSvCDb41k7z5kbZd2q9N7I0t6vaLLIXnaI1+fBEdkWLbqp692
	quAenYKgtOuUXV9jP3nSaUnE4lVHE/qSnmuJGeimW/jTI8nhmu3SGM8cI3YMyhrkkViQHoTjZZn
	IM3xABCZ1fv3Pa2s9kGAo1oVebE5ZwCQ==
X-Received: by 2002:a05:600c:a30f:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48727c81e54mr170906055e9.0.1774859697668;
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:35 +0100
Message-ID: <20260330083429.359819-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_093459_884347_C2D64ECA 
X-CRM114-Status: GOOD (  10.00  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Remove the
required constraint for the regulators node compatible property to fix a
dtbs_check error.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..bfad018cfbf3 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
-- 
2.43.0


