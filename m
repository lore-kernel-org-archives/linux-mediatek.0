Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B71C00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=; b=I1tvqTtEDl66ZgoJnkSvhS6n/k
	ZciG3c57Jx439Rmehf/jl1Ke8ZGBtV3p0frZMu0PIMBcuSbL0Yc9VjsgdzqRkStwP39Qz3UgEQ/U2
	LULcH67shJqR1Q1Gl6rm6kvNltGNT1lN0VPmMJ4HmIqX++75XZzOm0KFCXVba9T4SectEJEUAO4Ca
	IRifM1c9h6ISXoX0krKkRBnd8b4MMeIJJj7REIBsAZVogPp3BiVVo6l61pmh9GTzHuaG0bVWyK1UP
	zentHiCnYBWRm62c85mXBZZtk28nuVc16s6bHcwG2mghHlvFAIcxelRsFa8e7NNACkJvF4KgbD7oh
	s/OwajeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7A-007Ztc-2q;
	Mon, 23 Oct 2023 14:41:08 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6i-007ZX0-2Z
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:42 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-778a108ae49so332353985a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072039; x=1698676839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=APDqu4Jy92kpGIA0dRfyYQBkj7wUV1d2Ug0Hrhdw+fQ/KdtGi3gznJb+fJLy9liK9E
         iVxTZ+B+pkcDc/vGz5ye4fZraz6/hF5Jxxj+rLzz2yfbZZmOrql7BlkLbi35s032ETMV
         6F8viHrWHka1aI3yVDxelU1puFUvF5rMt8zqKuDqyx19h+31ktfdly7ir+LEE5iwwCc4
         d0RcWaeY1Ur9WeNA96cxrSGFCmcfc/TO8+rUlf9bdwC2X/aKEXXrTdzbk5a2bKWawenW
         NBeSzMk5YYlQoKJpfgbDTFLRecMKNkqjgY47oQ98kwEejfZvQj73x9OZXBMxGAWRyhdu
         DmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072039; x=1698676839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
        b=kKSFpxSrLUWtrRSBc527zjMWG5elZ8S1VyibIJW7PcPLyoBXG1hGfPG/yTSXP1zmqk
         zuXNliFCmwdE3z6JQ/Hps8Ky7Jdm5/F0CU8sFOFCJBhG5gRfjLMpcHiZ4mwBK9YDpQgG
         nZG3cXPnZbkIdhoaCy4+FKWXwpJbEjPMzqub6krVU9CGlJwcPlL7y70EBB08stBxr+Kh
         jXjzaNfWPuTH+KtMrw5wZXCZf+UKT3WGyShDopHzPxOrUbtEXqRPvJrhC9C29n4EqhmN
         El+6QwxvOM+F1UkQ8vofrCGKB2gGjhgPNIV+b8Elb9AoVAD2/NLwdlsbHIF87lO/qhRY
         +O2g==
X-Gm-Message-State: AOJu0YxRw5jnzp9K1HwfknCh4glSJbk0eS7KqPLTFR7glLVy0XIsg5iR
	0sO+BmWMk/eGEtudTtZ8njvcVw==
X-Google-Smtp-Source: AGHT+IGmkh9O1L77tHkFCr0ysnRzrxjRi2acXqt64UGUhhSvN/MH3ee3+LZqnzFy176Ke8Fnz9QwRg==
X-Received: by 2002:a05:620a:2590:b0:76c:a952:c70f with SMTP id x16-20020a05620a259000b0076ca952c70fmr12157510qko.35.1698072039552;
        Mon, 23 Oct 2023 07:40:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:39 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:06 +0200
Subject: [PATCH 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-6-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=P6NTpV6Hcl2nq4Xnripe5Czc4f+S/tebkAJSAKKZfY8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPLAFxugtO1wZ1wc6FF7eR6Teq9Ksq5ScGKNOo
 wQqT5GaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURU8PD/
 9nARfanwZ43dC7K38128J+6s4DtRyTG8Hj37dZv3E61VaZVngol48cTkmXw090pPu59i5eED3Je7Zj
 j23oVIMjIX68q/zeBxDw4f2iBdqzrQpcfbYsEJM/wyt9jzk9K0d41kVLw2EOuf/8CcnISQFn9v0vr4
 Ba3mxWWRTn3rke0AR8IAfs/3OVQrzxbT1/9ZYihMIic0eoBoE0rHOxX1qgAux2bzUPRkTjecZF1NZE
 1t8Y+rNbCXFXtynEILOxuQeYMSudfUWkLJ3DmObNMbbcMvXdcBKq9TWTRn3nu26GnrnyKMyc8lt32s
 +eybrWvI8JX0OlCT3qtGZKq6DjCs/2YiegaxQnAWVQqwQlmbvSy7i182JHCPHmsdYy48fpz5pyAfQN
 tX5f2ghH3h90rmfwd80LH3T5u69lBpIUgNl3xs56SqCZcESvviuxGUEdKZRcWKHHAQlLr1Qx58vfnY
 4swHECrNRS8mQvQk00mISHgkWFE+FGp21hFuG126GPOpCSQetVNlq9Y+vLWL3hTuYAJTtcsOPFdm2I
 pfljEC21uDHrwGEdXicc8Nsm6w40nIkw6t71siqyx0vgQ8PchwCecgKZWz/2yuqO2XlOaICRDtbhU4
 4Cn75XRdTzR6Ax/7Q/RCVx15kQa1IubAdplkKWdvRb+g07dHmShLPZJgHFTA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074040_837529_3FF767BB 
X-CRM114-Status: GOOD (  10.24  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


