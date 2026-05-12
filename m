Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A552CD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=; b=SmvhzmeuuPVOqGm7AXQMri3sJ+
	tAI/kAj7Mo75Lr2hznFa+ERjtamu2nAs+afgg66qZLrSbULhshVNuxv1yCJ4wutOdTmchHLGfZosn
	Z2a4Eq5N/Fj1x9zly9WbNJ+H5oKqn8/Zk1hzc1O4L8L125Wobmm/CcuT58sWnGuQdeE5ikdxMLFGV
	0c68BNW+cFyoPzr22J/Rfxjg5LV/7IPmrVaz3vkGxyTyh93G58MFGIx61KK55Sy7lIOWtCJiqo1Mq
	OslRi8C/QbAG8JoFhLOf/8rn4wnCM4IHKRUIm0ufANBsxIz+NP2wmmXbzF1oJaXu9JitnumJfeiEh
	w75wF3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMish-0000000G9AG-0OWL;
	Tue, 12 May 2026 08:54:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMise-0000000G98a-3lZF
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 08:54:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so2361985a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576060; x=1779180860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=g0hDeIWrIYlxxPVa7PWwjjhLGkdHf6iaX6IEPAoYm4WA5N9aZmNgwFH46sQfTosu4e
         58ahpLSpirl9fN4viMxqFoE+E8cXuM/SlvwVF/m0qU1mKrP1gX73im/HaWuAgF+NElrg
         hVEODs8EvClut1e44A9RKCCGq/V/5qL6IUud4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576060; x=1779180860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=jt00pyM36kl/pHHZyeHw6AxGwB3AXde3WkTxYQ/t0Irzls9sXp/A1oqXr7DtPffol9
         QIwGwBPgzeIqJyC/PWTSehSE/R2XXuY1lTAADVKADCtNuv9hq92+xu0DnZfIx1dWeM3q
         3B3iqPThX47zJYD5GuZt4GkAEkkXs+O0TJz75se7+QXQ/xLv2aPF7YKv/q0BgAz6H4IC
         EdsHYcPReKmHG/MoKDlmjtytnyOw4dCIJMA3g542hMbcd22MkvowUVdySqgFDoYMud2s
         20RtoVscELGsPewniKKrNYkCTrCXzwF02dhYfYgnjf+f8x1rm/Pqg34bwWYrS6M1taW4
         Zp+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+G5rpvsEKmNT5fDZgby3jedaIYaHFv22xG1C8SYn2MCq4hS+kIYzJ3MJ6+5S1aM7zh+OscdDyLnrHFczJBMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqmYkiaoUk+MXRNj0T0G6RwXAjULSf7Oc3r/yuAhy6+FH/8cN
	KhLvT+HbeksEeRATijodu11XdqYyYJD813lvWbK60X0IBFk3SXjBxiXBDBOQevspsA==
X-Gm-Gg: Acq92OFK7sInjtqC/6vDWSGQnc7xHtEcaRwG93d0X+19vFGrJJqOr9L7/dZL+B44ZLb
	+Pdm0HxurY2jZ9goRKNfDqiA1zKii8XKumW0Kdw2qQImarYkThFCwraO5VJqV1YM1E1wxVR8g4s
	jQHFBJ1b03SkPtAfyXnJNPzQGUBAuSZlPgXvpU2zLqffUv/d+UwkPCZpeZ2pZXINNOxPMJA55Sa
	GStB7RFir0Z7YijYWMNDK5rCMb7MFucv7YqWVenwlPxq5v4HKXDlJtFqIb81A8hMTGZEiQmd3jF
	2jE+CjemhzL8Wd4tbVJtYxAPGe8j2b7XfeJua0NO23ylEExAFGDLIfH7fj/HbABVsqXFO87xmt9
	snV8gZZHjjus7LNkDJDs+YRtU85ozHR6qC928WtYqZiXG2bYnqfiQH9UagyEHaCpOT3Tm+/5w6F
	NolHDm/aJiQr6n+U7t6Y35Nys7Q1fPM9ss49ZnKm2b0JQCRtMKjEouSysupqTk6Hitfs3BxI1r2
	x5eIPUwVvIwwfu6zFk=
X-Received: by 2002:a17:90b:3fc3:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-367d49bc472mr13305606a91.20.1778576060010;
        Tue, 12 May 2026 01:54:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Tue, 12 May 2026 16:53:49 +0800
Message-ID: <20260512085358.1693208-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015420_967996_1B643245 
X-CRM114-Status: GOOD (  12.38  )
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

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Lee, request from Mark:

Lee, this seems like mostly a regulator series - OK for me to apply this
patch and send you a tag for it?

Changes since v2:
- Fix vsys-vsmps-supply property name

Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..9e6053677981 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsys-smps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.563.g4f69b47b94-goog


