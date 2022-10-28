Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3381FC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBnZz2bwg+asXyhpEwhxnZxZItsSvwXg6AVLhzxjJ/I=; b=4sTclqkwPTsc1oC8ncv37MwAah
	+mvcchR105qaDKPBcvTciAJGi3+y2gUzQBdXURohs4IfQ/MUxF4BIJqWF6RwhVgkN/BiPOTFuhmqP
	mgwJLk3QW9sEnU4SzgU8zxeupANCQTjYt/MaVJV2YD99xJ95523z0epZGzdr9t7kAf13sqOWVjZhH
	Stg31zCvi+CWnvErKnLiiHnY/SvWCye+8QkFPbI2JRtHX9lvoPSkPWvDJEsgmmfK8IIa9VNw8k3/E
	w0jjMpN/F8qhIbame0CMa4cx6AKlGubMT9u6AcGA5ZZpIWJ7f44vhBe6A0ZfcY+wwwHx0eIu+Pzwg
	f8WmRDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRRb-000ZbE-70; Fri, 28 Oct 2022 15:38:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROT-000Y8T-T1; Fri, 28 Oct 2022 15:35:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id n12so13724897eja.11;
        Fri, 28 Oct 2022 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBnZz2bwg+asXyhpEwhxnZxZItsSvwXg6AVLhzxjJ/I=;
        b=I9s0jCE8baVJL5Fi1BA2sAhKWfMPYYqdgnPV9FQQwAHy2lkzCej7xDuUJv2GueKpWN
         SuHWVNfQBIyiJtfGGAjSr/+Uv8/B0Qcdz2AV8OyZDuFjnoXu5kUM5sqqu/DbL2G60Ygc
         Z2yU5U1Y7cJHWOspeCaGH4RQ+7soh3QMj2owp2tY55xvRsr+69fQ/cBsFL3JuCVJbCET
         O0cjjqbW1rd0k3MVDqPUw0/fLbUS1kCJeCC8YRoJ+gcyY/2DqTM1Hj95fuZxtcx5K8PW
         1lCetdu933POsP4oTtC3+441W+2dNKtB5EcBNm1GnqyvzeTWlNldxcFXZ9O1x7an/NkL
         ZzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBnZz2bwg+asXyhpEwhxnZxZItsSvwXg6AVLhzxjJ/I=;
        b=ZpFjqM/mwO331lwOcPxyEC6rAuD8BPSktBTmwQedytp43H9i7CHG7GDredgppttmiG
         4j+TbET+NrwOu+rp0Aj6cU39b6/cf8egYcFfccazqwTrgWX4y9EIDSmwJL48+sfFlZ+m
         BcLs0vdcnFi6EbUWLA0qgRoEaC7H1wH0sVQYF1kah9HgdUR3drig9B1a0zkC4L0h9Mmh
         necNAxFZwUpAYNsiFqoMflIa4iEOHi/NxfinZEeH3HaPLFOHrhvGfyNWtZxBU5EKcYAa
         tnaoNwHnfOVlXJi1IFLJxZg410q7kKIJmOm3wimyargPkEP17/27fNqMbiwRJW7SI4MP
         xuig==
X-Gm-Message-State: ACrzQf0c5JHRzTlKIhNESzpkiyisclMDCCm7L/P2SqTPKs4QaGu6+mLk
	4LM+uV+vQXJZHgjo/DM2v00=
X-Google-Smtp-Source: AMsMyM4zINbvxH4EzrFuFH5QwAmU/dl4Nr1EcM8MeNvx8f0kYk4BTBifUSWklitKa4XvfnixH+T8cQ==
X-Received: by 2002:a17:907:7f25:b0:7aa:acf9:c07e with SMTP id qf37-20020a1709077f2500b007aaacf9c07emr21151819ejc.280.1666971335002;
        Fri, 28 Oct 2022 08:35:35 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:34 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Fri, 28 Oct 2022 18:34:59 +0300
Message-Id: <20221028153505.23741-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083537_974197_D9CCC247 
X-CRM114-Status: GOOD (  12.58  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml in preparation to combine the MT6795
document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index a2141eb0854e..23b1f7867afb 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,19 +111,21 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description: |
           A pinctrl node should contain at least one subnodes representing the
           pinctrl groups available on the machine. Each subnode will list the
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input schmitt.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
 
         properties:
           pinmux:
@@ -134,9 +136,25 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
 
           input-enable: true
 
-- 
2.38.1


