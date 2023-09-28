Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060DFCE7B0F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VUxLWLgQ80Pm3L1prBCg/hMI4tne1YjHqrpTBd8u2Q=; b=VvVejBTwTCVV4gQ3dsaSO9Yfp6
	9Zbw2mfg+usmCfefW5CAHf/gIemPtMmhVNfEyL3vJbG2BVyCbYpUbE4Qm8PS3YmB3Ijl9bdpleH1+
	sU58/LeiB7XgnLOAqYV+PmoZ7yi/HroTr3Rn++N8JsztsfVFjLbjNDl7Eo1TuoAyArnjywYoIIpIC
	wJJO8SIgBUIEQMm+bh1wULqEdxahdSV16v6dyhsXYXxza7ik6oMYnwc5GDc73czb/xx9WLDZSauYv
	naj1B3OCnwWu+h4J22LG+3O312N/yBDimOBtEpb3kCLO+b3Eg4H5Z5Uj2bCQjATSIhfD6ED9kShVJ
	yEFVj5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmom-002fbf-2e;
	Thu, 28 Sep 2023 08:56:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmoW-002fRe-1b
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 08:56:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-692c02adeefso7572926b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695891364; x=1696496164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VUxLWLgQ80Pm3L1prBCg/hMI4tne1YjHqrpTBd8u2Q=;
        b=W7FSm1ajs2tz6nrf56ZrKu44hDKadLT2HAei6/6B9ExmmjJt4nGyTLNsg4I/CUk1H9
         8eNYzWdzZ7hgCJGfWWwax54VsAnML2yxFbdxQYCyVVQPNb2rXWpN6bYGxnVSb7Lf2Oif
         u1bqWd6b4ZL6OTaiufXThsz3UgHZRKDJEOyI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695891364; x=1696496164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VUxLWLgQ80Pm3L1prBCg/hMI4tne1YjHqrpTBd8u2Q=;
        b=L1OXawo51aa73/Qgfvb0yFjseRmh3c0Knt1Qn6T8/4Z3iq2z5889MQLlj3+f/tOtSm
         Q/SO6AYsf1HSuceD52jVXnQUle4XLLdKC/4iRply9Gkb2YGadsbioPE41oQRULp29pr1
         FNxWjHknOpT/1Etja6whOVbtfnwb3qKk9cRgMjmrJPQ5HX3Zef5IME8j8zwEYhq9xlmD
         Kdgx1l+AXWK2ppuTW8Qdxc65gkjqUrHgeuxLNCCtuBvV40DByy7jdyeZIpN57UzVvk6D
         aY9rPdHIYfaMVH0yGhw8vEV6w/qVkDCk0dIJVtlKouEkUaRXwHjgaKpzXdHAEX/PwFl9
         XUCA==
X-Gm-Message-State: AOJu0YyYTdvcSTCge2dFtT4+7ezyPesC+yVUZjAsdRwKgqQXdPAA3zW1
	udb7hwAWvBtBi/KU3Y9zch0biQ==
X-Google-Smtp-Source: AGHT+IHtrWewxnhjNB2afm44QHya+LkWPvHNgUDR7Ji3onSnvYMF6drgVnRdKj2wM7M/V1Ql8GZGLA==
X-Received: by 2002:a05:6a00:1381:b0:690:4362:7012 with SMTP id t1-20020a056a00138100b0069043627012mr612979pfg.28.1695891364006;
        Thu, 28 Sep 2023 01:56:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm1754016pfm.26.2023.09.28.01.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 01:56:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 04/12] regulator: dt-bindings: mt6358: Add regulator supplies
Date: Thu, 28 Sep 2023 16:55:27 +0800
Message-ID: <20230928085537.3246669-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20230928085537.3246669-1-wenst@chromium.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_015604_539643_FA331095 
X-CRM114-Status: UNSURE (   9.69  )
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

The MT6358 PMIC has various regulator power supply pins that should be
supplied from external power sources or routed from one of its outputs.

Add these regulator supplies to the binding. The names are the actual
names from the datasheet, with hyphens replacing underscores.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../regulator/mediatek,mt6358-regulator.yaml  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
index e8c3299d698f..f2219d8656c2 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
@@ -34,6 +34,40 @@ properties:
       regulator-allowed-modes: false
     unevaluatedProperties: false
 
+  vsys-ldo1-supply:
+    description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, vsim1, vusb, vbif28
+  vsys-ldo2-supply:
+    description: Supply for LDOs vldo28, vio28, vmc, vmch, vsim2
+  vsys-ldo3-supply:
+    description: Supply for LDOs vcn33, vcama1, vcama2, vemc, vibr
+  vsys-vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-vdram1-supply:
+    description: Supply for buck regulator vdram1
+  vsys-vgpu-supply:
+    description: Supply for buck regulator vgpu
+  vsys-vmodem-supply:
+    description: Supply for buck regulator vmodem
+  vsys-vpa-supply:
+    description: Supply for buck regulator vpa
+  vsys-vproc11-supply:
+    description: Supply for buck regulator vproc11
+  vsys-vproc12-supply:
+    description: Supply for buck regulator vproc12
+  vsys-vs1-supply:
+    description: Supply for buck regulator vs1
+  vsys-vs2-supply:
+    description: Supply for buck regulator vs2
+  vs1-ldo1-supply:
+    description: Supply for LDOs vrf18, vefuse, vcn18, vcamio, vio18
+  vs2-ldo1-supply:
+    description: Supply for LDOs vdram2
+  vs2-ldo2-supply:
+    description: Supply for LDOs vrf12, va12
+  vs2-ldo3-supply:
+    description: Supply for LDOs vsram-gpu, vsram-others, vsram-proc11, vsram-proc12
+  vs2-ldo4-supply:
+    description: Supply for LDO vcamd
 
 patternProperties:
   "^buck_v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
-- 
2.42.0.582.g8ccd20d70d-goog


