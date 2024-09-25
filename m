Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA56C369CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2iSmOLo812yFnIR5Nq9UtGPT6s6P+lL9nzScHALAHw=; b=UZMVPs6iR6u34a
	0OyoauD6F1M9gPVThTutedw2YPbATeVfFOqyiZKjVzV1zurY93nboWJ042kdEww1UgeuPZCnFMvnD
	Agls/ilyeHCFKIiJVF0HfJQo8x6sOgNS7LmgTULqTm0prm71pXXlWD5nn+ypcUmq5HLV0YSmBgYDA
	Yb/ylzPIzLVbNH07sekhbFXKoD+G3cAJfrZX4ZITent+vkjZc7UhKuRez22/6Xesh6lvAyU8stGtI
	y+GopUsUicKZNb2rlluAC1u1G7yhY+R6dxYhYwKbwq4hOZfpIGufrl7YU7S3gCwlK47J57W+oWRXz
	YRYy5V+7uYfDA7U/u+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPpI-00000004p35-1j7b;
	Wed, 25 Sep 2024 11:04:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPly-00000004oMJ-0enE
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71957eb256bso5710654b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262089; x=1727866889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2iSmOLo812yFnIR5Nq9UtGPT6s6P+lL9nzScHALAHw=;
        b=jqTS/aST1Tw6HV4ytl+40aMkJ9FcNGAACQTkSsAiyudhYXcs2Z1i0CusUfkcC5z7jt
         71RbGduV7mH4GBpiNhSgytDWTN9EuXup2bohJwYo1Jb5uc1tqyaS3+oqT1zm/ZgRSIHX
         LiC3xsaq/oiUZ03MeFI76QqXVyI0PsZGaf8v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262089; x=1727866889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2iSmOLo812yFnIR5Nq9UtGPT6s6P+lL9nzScHALAHw=;
        b=IS0TWrisXG7qyy7DsTUoxkggxuog66bZGWjkk4/thgN9LUqVnOC6I02NUYZxdbBkmo
         u8/e3vQ+LlIj3Jtan8O05Eueg6wjBf2KZTPBAZunDT5JUNQUi0TkVQuZBZbKaAh5MBBF
         MPovjACB32lzPIhUPskO0XZOAr3S0+2wnP2QT5Qt0qgYaOwinYNi1xt4Bg4cYYGQ7NC8
         Oz8yd87XUfy8bhhsMEcafm/34Gv5VMxFnORXyvVP1fnWSD1n9AIcvF6HZ7kcZr3cYOTv
         AG10KN+vZP7XijDyj9JeYiB9kvLEFcm+RKY3YvGrCj5nUvEA7Z98JLKi6akge0VNUCtC
         tHAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8D9m+1urZnTmUK6XJNaHR0ec1wdUdXSmvDvFDjr3E9FjvZA6D0tHPKkeSvuDECj3zEWfdiYrxZ73kbQi7Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZNmlDkBF4K3hf0acb+mGiep8krizMrEsDg0TSpL+0rOK3TFFR
	KX3jeqWjNbTxjKW7imNwq1UVONLf1UJeGenLINPdRvpIcTI9hqFvrFv1TRoG6g==
X-Google-Smtp-Source: AGHT+IEDiU9yG0J24zu6lnu25+9BPDQ5H9Y9675km39iDIf0qssdZRYcfe9ubry0OUwppyeNUeL9pA==
X-Received: by 2002:a05:6a21:e8c:b0:1cf:1b7d:8481 with SMTP id adf61e73a8af0-1d4d4b9bb7amr2971899637.32.1727262088709;
        Wed, 25 Sep 2024 04:01:28 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:28 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/6] dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
Date: Wed, 25 Sep 2024 18:57:46 +0800
Message-ID: <20240925110044.3678055-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040130_222572_12D79E0D 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In MediaTek PCIe gen3 bindings, "clocks" accepts a range of 1-6 clocks
across all SoCs. But in practice, each SoC requires a particular number
of clocks as defined in "clock-names", and the length of "clocks" and
"clock-names" can be inconsistent with current bindings.

For example:
- MT8188, MT8192 and MT8195 all require 6 clocks, while the bindings
  accept 4-6 clocks.
- MT7986 requires 4 clocks, while the bindings accept 4-6 clocks.

Update minItems and maxItems properties for individual SoCs as needed to
only accept the correct number of clocks.

Fixes: c6abd0eadec6 ("dt-bindings: PCI: mediatek-gen3: Add support for Airoha EN7581")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 898c1be2d6a4..f05aab2b1add 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -149,7 +149,7 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 6
 
         clock-names:
           items:
@@ -178,7 +178,7 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 6
 
         clock-names:
           items:
@@ -207,6 +207,7 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
 
         clock-names:
           items:
-- 
2.46.0.792.g87dc391469-goog


