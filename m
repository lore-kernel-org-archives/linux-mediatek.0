Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE17CD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSYY97oVgPZ5kb8TuDqHkXyCfyuOKBglbVv/457JBMY=; b=1Hhg9Br0LhqeRJL3Za2jUwM5G3
	Hei4X+lo1FzrrK50Kp4R7Dycztf6oGc/oOHLdZZe75q/76YIU5ye+Ry5TB9nbgfefDUmKpko1MVVs
	LZoMqxleUEHT3Z2GRaNuLb7OUnnNMghFeygosdk4ZlnUwnxXZzhLmsLamEWGxly0+BKJR7gN/z5/d
	C5b/GzXUD0z8BEznR1fx6rXTFsBbWSWmx5m6IWhJFOKUj6o+RP+MtP/QED3eoZwro//1EDDFV7xjM
	QnAju5oQ+/g6IRMHux1Fg+FlrTmpKhPO/nXMk+JJW5BzFVmDhMVexwCsEs47wgv/NgLDyEsMA+RB2
	HkP/3h7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGc-0004fU-2E;
	Tue, 19 Sep 2023 10:47:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGU-0004X7-2r
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c4707b1031so21055465ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120454; x=1695725254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSYY97oVgPZ5kb8TuDqHkXyCfyuOKBglbVv/457JBMY=;
        b=oTZ4e5+gdgphb0ZHPUNGJaVF/VRHWQMZtKe8JjMq0iRGi5uF7XzaD3jRhhBiDjhLNY
         HVD7HOTRS3Uhduc2BgkpFdlcDhNVR7HXgedzfYgQWnITjNu2/4zcOg/LTmoEuxrr8kQg
         dLHBjAIxjAxR8avjzHeGRzALnKWRkcZX9wDwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120454; x=1695725254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSYY97oVgPZ5kb8TuDqHkXyCfyuOKBglbVv/457JBMY=;
        b=AglJkJwFD4vObH0o3z4MyHiKndhn6GYnDb4udlGRZNJQhy4RWMgWmoYIx1G83RBYLD
         A/5vqj7inR/mCrq7S6zYMBAMVeo33bH7bAb6rac0GOOVFlv/ekH6/J/Iycetec8tQeI9
         T2BF/fKn0i7W0L9sJNz8tUheCr8JvZU5i/ZfZORbCZfMvV37AAgZ50v4esmfSVrtOG3R
         Q+QRqNEf0mZ0elkYqRaO0SogwPlKkGfab2fDgrt0CYF4mY16EBQ1Fg2FJkyZV1to8nR4
         IOTPVFzT1v/a7pXMBYYelMQ/8AIsIsct2GkNcKPZk3+64fsyj2kRazMe1B3uq0PmFfIl
         qAUA==
X-Gm-Message-State: AOJu0YyBntn6EyYqArAyzyi1HuzJUcupDPPET2wjOjD++grtcwrdwwBp
	VBBbP3XZJChFehLu2YpwCZMrMQ==
X-Google-Smtp-Source: AGHT+IH8dslqjluxddWZr48ltSB+HQMspK87ZRjKTboJ64j/tCHjB7w/HcgYb7fjZuvBhKtht5Dkqg==
X-Received: by 2002:a17:902:be0a:b0:1c3:90c7:b99d with SMTP id r10-20020a170902be0a00b001c390c7b99dmr9899813pls.41.1695120454418;
        Tue, 19 Sep 2023 03:47:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 04/12] regulator: dt-bindings: mt6358: Add regulator supplies
Date: Tue, 19 Sep 2023 18:43:47 +0800
Message-ID: <20230919104357.3971512-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034734_938458_E544CFF9 
X-CRM114-Status: UNSURE (   9.66  )
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
 .../regulator/mediatek,mt6358-regulator.yaml  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
index 62e8fa6b4306..c5f336318ec2 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
@@ -18,6 +18,41 @@ properties:
   compatible:
     const: mediatek,mt6358-regulator
 
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
+
 patternProperties:
   "^buck_v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
     description: Buck regulators
-- 
2.42.0.459.ge4e396fd5e-goog


