Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560FCD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=; b=Q7st4ocVjko/uXRzOTt6EziOeV
	HeNdPgTWwHodK8Vb9kHqGYj8o/gW2GhtkfOiXDIVbLIwUeG34O3sXvZbeXT43sRlavtvZd+DwBvhT
	xyWQ3ZI2fdGwnSNXkFjELl7psSGKuYPaH6+rre8XIs8A64+OpxHqA3F5b0K79RxPgMHH/X9HRU7Ex
	mRZXUXF+Wc/f6i4YQBsE7XeydIntTBB9pEY3OQNTQb+RGDw93YBZMEiKi6zQB5ppiihb1dV6/aEBD
	EQ03lns8iz/tPcMLpyGiR6sAOmZtM9PrFhMCFe9El25XeEivzPlfqppLjfKQ0ev67li4R5yozz+MN
	zFPLdEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAQ-000000051fC-0W0B;
	Thu, 14 May 2026 09:15:42 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAM-000000051d6-3OWr
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 09:15:39 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8025f1c227so5821275a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750138; x=1779354938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=kaSmagabwIpii4XO/kRKqVZAeeZRZgiJyKLzPMoJAjpASPgh1wLXfdQvDo/gud4CyO
         K+C4U2GNstg4bMzLTFhZ2u9o1JmgMpyQ/nUE9uPoc/IfWpX3VZY6ZhK7q8XCzBm4HwMS
         i1/f2FdL/slb53Q1c8b47zCR1VneS6J/UvP3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750138; x=1779354938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=os1Lb5Ta/bo1ooUQIqv8OH9Td71dx+m0kG9lpxe+Qek97DlU1bXsmql69Ots2XCvlr
         RQQcqOPFAOZY6rJ6j0YAzG/24w7p0DesuH13nTdsPDX258D2HG9D76qZxmorJeX9MF+G
         r/3IzBUcJQwT9wSOKzrh/nfuNkP0X9Gi0z7Wz1HXye0lYtSVGG6hTsiqQhomHOJCrs0t
         cxcv+N/Fl8txmeGJCiMTK6Jpqp8B+3yEWBmYCXcVbx2xa0hwbz8fBYpyzvVhpf96JVCE
         ql310Ol6WratEJzJQNlOXlEfzcniLPihcLgybK+ydxcKCH5PashSME7yACODAqJC136e
         TE/g==
X-Forwarded-Encrypted: i=1; AFNElJ/SE17jkME0xFzq50LracbJdkYnGd7uj5ZJxFWRKnS0MNdggf7HZju4/2mXoNVsKDDxsMANRsJoAtf08m7zlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykXJEZEI81TRTAqOlYMtD6+V1eNp4iobh+p+YiYjBBM7lnp4kN
	qYiDjxCtWXJVPMDaDFpRklu/xenSvueQjweX2FQe7RBmplponFlQtkO6uHiHHr18OA==
X-Gm-Gg: Acq92OFMHtfCX6tTUjVCp1QNpS1n0GPVoxUyFHc0pNsQRRXI9fFp5Hy6hsOWKoG0qvJ
	GEQn7WYLMw+8x8eCouZa2L4E1kI3vrLsyyiH0CCHDgNBde4MgaB/MqyAYtfN5OqOQrPPHRn93wZ
	nGAalxLAIJZiKG0VRcKQUZiCAmBUq9L9Qg8L/6g4eWUVXXzrJ6iuSHEtETZPz448lkoreTs5eIb
	5KwJD06K1F2KxSmj1LByX8FhaSeE81uZ04cCUV0fGODrbblW9aV87Mg8G1xAEfJ/cOk0DQ0SwL8
	ia+VsXiOLQKtlmQ1DEsnVnALQG6GnnGf29Q6d/tiJ9GskQ4aircpiLjyaq+gZNZHhNPB9Cqj58f
	HoAVi9lzsNhtiBTkIPO5crySco3UT6BRFxz3ReTVTleYbPNQpYn1pK0CbJN0jx+a5jCmh5M1XHc
	1b+eV4zk0Eof69Ks8LGs5Z1Ctf1J5Di7VibGmTzn1fTW8gJCrz3oqqdlUgk8puIDTeRL0L3mfoq
	N1qiMAcpMJmrjMMq5A=
X-Received: by 2002:a05:6a20:728a:b0:3a2:ccb5:abc7 with SMTP id adf61e73a8af0-3af809790b7mr7760536637.13.1778750138225;
        Thu, 14 May 2026 02:15:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:37 -0700 (PDT)
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
Subject: [PATCH v4 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Thu, 14 May 2026 17:15:14 +0800
Message-ID: <20260514091520.2718987-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021538_902631_A5A6BDFA 
X-CRM114-Status: GOOD (  11.94  )
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

Changes since v3:
- Dropped duplicate 'va09' from 'vsys-ldo2-supply' (Sashiko)

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
index 05c121b0cb3d..ecdc77fafaf4 100644
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
+          description: Supply for LDOs vaux18, vbif28, vxo22, vrfck, vrfck_1,
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


