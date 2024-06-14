Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C88C27C79
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=; b=wl+lQi6L37hetJTEfGKeCJhs64
	zEOR9B5+58ucgAvD9+HjlTDzOdL4vc7SAQPCtOC+Om9Prtl2JAAxAM1Ev5PG+z0eceUhulIFduac4
	T8upq8d8YeJ6B1wXXbSZ/XEEbtf0R/PPz/07Z5PugyHKhksKtuy+JqfT6e1u99luB+4WevNkcBUW+
	BfpFJdLpOHPs7eEI7qm7Dqq9caTgPPGS04NTZvMt00YwpG1qhNneMPBjersDDn7Hgdb5vclosmTQd
	AsAtraYTqJg5p34CQP7MgepE9NCyXYThXFOIXl1Wj83UJ+dFRF1rBu8y8QaKuwNCy0FSpumwoVTAJ
	EJWVRurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Ya-00000002H6E-1svn;
	Fri, 14 Jun 2024 09:49:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wh-00000002FfW-4BS5
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57cad452f8bso2096187a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358438; x=1718963238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=Gk0GM7oMHQBCiwtr0y65qeNk0Iv3Zo7UAce2vaO6+Qe7GP+ErxHJ0YhAePkwXS7W2Y
         eyQO95rS1j6fLPriLwZZ7yOS7UlO20KMwS97OH7+wU87Zg1FbXhtBS+YT4Uuj5RHGxUs
         siTvcIbJEhq1wxe8mPYzou6OrHxU2eohzcCZVvk++tRndSjJ/AW9GISNDVwpIpqJlm97
         Hf6mZs+tqgw1E//u9kt93+uwQIraC/p3uzaD9ny+RbjXZE2pCKzNq124g4Th5aweX890
         EuC+sfxbGN68Xc6WuNGHizWiEdb1MK/5TJu1umt2C0EODeQuGz3qozPeh2YaZa5QBgQv
         +vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358438; x=1718963238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=sBw2fMB6ldd9z20V/LEGcuhw7IET5aCHKlUc/7Q/meo2wbdWd7lN2dtfEDKULZEN+6
         e1oU24gGH2aZNuVof0qBIEDeorHnQyHzOsNTJ/l/emMj850ZR7xrhphHD7TslVKtZPDl
         IS5oXz7qt0CSI66R0RlE6YMK/JUXZWJQc7xIYtpzDDRO2Dt8wfeoKVq79+HYY6CTxSaf
         hve0g8uODqCQoWGIYnjKctOHVDecAjHkg7Sx8670Gd+KZu0aL6cTuTFVwK1tORnSWj3A
         lttMc9HeshoT6rxlc2N3ELekZhroTEOBapRDQFyGgiwB/0eERdscLfXT5YnlK8QuodQc
         gkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIN3pGjftQxvRdC6KRIxML2DVlyGc7T7JZDINgQ3Ekp0n6s7ti0t+38BoQRjX+iIcdro7y8eX5kTGMToGL07rtM76uWAJLlAEoEtxxN2IsGH1
X-Gm-Message-State: AOJu0YzYoEjbZXVS/ZsKEayutQU6U44/PaCJdmbmJPfY+akLVTPnFgJT
	2QZaUIjqEpfKh3F2zNX0sAynN4HF5GOPtG5470QeQWBGOcD9fYzXylbGckcjAQ0=
X-Google-Smtp-Source: AGHT+IHImE03me+jBXAaJKDis3LvJaHdcyhORbJZDZPs74Uw4HneHqZI29aXqpZb3jL7FRfyUVcimg==
X-Received: by 2002:a17:906:f74b:b0:a6f:2605:aaaf with SMTP id a640c23a62f3a-a6f60d204a7mr143354066b.22.1718358438479;
        Fri, 14 Jun 2024 02:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:19 +0200
Subject: [PATCH 20/22] dt-bindings: thermal: ti,j72xx: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-20-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFxyygP0KDRWxDno4kM9DyJJF36q0Pj0JLXC
 R5ZthscE++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcQAKCRDBN2bmhouD
 10MhD/4/36ep6K9C/2A0+yLh/7h03kLK7tqhV1a2oEMiR/3bLKcpn6umQP6r9gvpMHFlRX5wP7v
 2Qcy7ULesoTVCRfLz4eewatjk+KaHWQsvPJPW3mM0/NcAviaPhVr4Rhx8aGE4qMZvaATX/EFkos
 sdCgL3T2E1K7AQatgcC+1b+PKDToD4VSvpUhUlBzal4f/lh5VFfaPlTkFL2hXw8RqukTXlnjwGV
 Z2dOi+pr+iLn4vPMTgOjHlqHYOY+Fw+LFfy0eGipU38yT3nZhlQ31rsNf3X6DNHQ8N4ZP4JWQfo
 azTKXqmkvo9KhPB1EyU3x1F3/rlnS9RNBFqis1F5jfUByE3A4wy8b3SskCx6A7KcUmHThp5zZey
 +vSWFb21wO7P4/0EM4SrAxnaRrSZ3EcyxVjx5jJlX9gX43bj2stJbhNQXNUKbMAVvz1tlqf8xX3
 GildL9Wcxj8bvNFfcGI6IrozJSx9uVjfA3xFZdHpjC6HD05/qSDT2Rts54sh8RhFhEGpir4fDaC
 gf3Yu6j3t9hhKWwwOaELcEKJw11d8RG23XGWH+voe9MnFlR3dGPlHvIAhq5lvkvvXNc0r9PLnj+
 V4Qlq76yHruzbODm+mWzdVMIu3SBsg1YxnKVpDzMgR9XhgoI0DAS8Kl0elUIaSplgkIG+amxYMv
 ym9A5pI2M7JT22g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024721_525691_BF3F65DA 
X-CRM114-Status: GOOD (  11.04  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
index 171b3622ed84..82b77b9795a3 100644
--- a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
@@ -22,6 +22,8 @@ description: |
   Temp(C) = (-9.2627e-12) * x^4 + (6.0373e-08) * x^3 + \
             (-1.7058e-04) * x^2 + (3.2512e-01) * x   + (-4.9003e+01)
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,9 +66,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


