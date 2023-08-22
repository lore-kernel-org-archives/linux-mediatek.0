Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F2EE49A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWvqEYx7nigLStoTHfBNGDNnZRGlEQKlFX9KEKxxWao=; b=j8eJjlmi8lrY42vFTYObMX9a9S
	fq58LnXihOOY5pmVSd5i2qq8de7WE5vJXLotQeLnKnOXjmy4WosDjrTZjCi378HXLQbj/rI7rYyJo
	JcldFo/d0+dEb6HOsLlPBtJwjgPG9mC6Ez9hOGDjbIYAhK48cYgQunJ41xLqa/+cWd4TDLouvRE0I
	fcr5jpjPBRFmHDdVU22mueFfGJcUgWVfr/J7K2Ous2PxEkHhmj3C3n10ts+89QO4vZ+8Lewv6XBzf
	jc7C8v/Jjfbpzp9wUpVR3S14hnRRImF2EjS8BMsqL8WV1939LHjO7fBwIAdXlhvUm3eTvF0ny8LG/
	z5muG/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1X-00FUNe-1P;
	Tue, 22 Aug 2023 08:46:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1D-00FU7J-19
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68a4025b5e8so1563854b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693940; x=1693298740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWvqEYx7nigLStoTHfBNGDNnZRGlEQKlFX9KEKxxWao=;
        b=jZv7Hu3uyjMHvZQPJZuxOzNjrT44nxbUjsoA5wMpqxP3QTGgr5mvNpeRrAZlXVFI1O
         wjJnR3722qCjZYmkUdTqeAS3LQSGR/N+mgDw6oU5vf2UQsfQEbQ+8Mo5QAHXjek0D+4D
         +T0FFLVlm+5+pS+Qi2nVB5tZOW74+MqSDCjDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693940; x=1693298740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWvqEYx7nigLStoTHfBNGDNnZRGlEQKlFX9KEKxxWao=;
        b=Pyo8xkHYAaq/dZap4nxMFfiHzoPqLaaZs/wN1xAw50+QHtzxqANeKwqpcuYOlY1jgA
         eaOHDnsk1UY47MDz2sFeaLmjC9FXOcInl9SxNC9ZCpJE0udb95vnTaTXaoiEhbtBpBky
         tZppRdLSZARY5kYmkxUUWFNOtnH+VEx06MigP0Yx9ZmJrpLOVLsmoIhboVRMblk9ovZ3
         3Xnr+C8BhZJ4DnvBAOYMp6t/qBOeY+bOs3/T4zKvqelRPL8uZqKH3FY1XlkRGkpHs/FQ
         XRpVMS0Hj0Kcbq52nX24Su4naNDlX9tpe0wCKXoP46mp4LcvDPYr8iUbknGGeJEmZTxM
         UXTQ==
X-Gm-Message-State: AOJu0YwB67oxDhLqbYH4E9QmxMCk7R/6f+EtEnlHG43K1v39LyVSOcPI
	ElhA3DI88Jwt21lXbSxb3a5D9A==
X-Google-Smtp-Source: AGHT+IFb23fhs9Apos2oL1dgOhgh6KyRZEOAL6GURDoRrpRHDeYzqpoHYXqhuvJFd8+IVfDagjd+2Q==
X-Received: by 2002:a05:6a00:2190:b0:687:8417:ab51 with SMTP id h16-20020a056a00219000b006878417ab51mr7254197pfi.8.1692693940475;
        Tue, 22 Aug 2023 01:45:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:40 -0700 (PDT)
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
Subject: [PATCH v2 04/11] regulator: dt-bindings: mt6358: Add regulator supplies
Date: Tue, 22 Aug 2023 16:45:12 +0800
Message-ID: <20230822084520.564937-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014543_403482_7AA8C53C 
X-CRM114-Status: UNSURE (   9.61  )
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
index 4d7924c5cc7d..82328fe17680 100644
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
2.42.0.rc1.204.g551eb34607-goog


