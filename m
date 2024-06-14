Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059B1C27C79
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=; b=EVmNDsGt5IvIrWo5P0R4QraecS
	dBD+z91BlFaxtXhXEgX/xPug6MB9FeUXVeGk7xavtcfiljoMjEJn5y9UIDNOlybCrXZ547o9Mqz4Y
	GCyQg4igr9tQY08DC4xf5U8fV/oynt7w7e8AhaoHaWOIcKeijWlx/SCVLHGZRxL9ZO+QpKzptqxhP
	6GmZPI3N9Z2s2GSitEAGL4lw3weUF8o6WuTDqNQp5j6BXsPtVMGpcl2Nf/rDLXTWSAk0IjDya4u+B
	LhvN6jsBsoU7vGBkuZ2zcIUFE+58Y/dco+ZEa4UlIfhimJYv1oG31Sfq3WDf+2AgAVI+YfsXgaCX/
	rSrpzH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3YE-00000002Gq8-33Fh;
	Fri, 14 Jun 2024 09:48:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wf-00000002Fd0-2uB4
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a6f0e153eddso266770066b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358436; x=1718963236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=lriyV2qI3guRv8SHEcU+yi1VlXtLVL/oR/viZOaxb4o72sDOMp7B9/LMjT5ifmy7hB
         NfZmLqHewRIZ6zyfem/vklyz/svW6z7QfxdVS0+IC19l4I4lDpfnforLg8DN2s7+P3yo
         mtprMc5EQhUTkC4jUUTRZJYYrE6GLt+yY0z5ZvA8Z4+LY5TRiTyjUrx7s1iWpTQLKLwn
         3I7oUvHYV0x0FcyGw7+T0quL57IK9l4Ep25XH8w6OJGD4V3QI0NSDytGVhne3rmXfzw+
         8hJmxwTXJs3PaWR6SsajoNPIEU2SbUdN1thHRxcbZEksjow7RvRJdWmzkxOdluGFN8UA
         E1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358436; x=1718963236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=aU7q76UCIuO2P/5nR6xuevlmoiUfy6zLMkLqjMY7SMOUshdUzcyI4fbCdpOy3iVuaw
         NgPXQLkWaxpLKIyzY4xlLbvrnlSzxgiBtKP41iW4kQ4A5hUZit1U9WtzdRmPyT39SuYh
         wkOM0NwFN83jwcObvX09rR/OJSw0gtDy0tZye9O9LnzNreP6yK8YCcQZmoE7VEl9r/LC
         oDl6fKryQmRkBG34Z5C3tQ3m93Latz9sHhlF9R1iEyG8RW0Mzr9YV+LomXYgHCB4tWaz
         wUqF/wS1zgb066R+Qs7CjP6I1FGk50muiFC4++pbB+qW9jVzJUpNkTGzItYcQL2hvDAz
         UULQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhALrKL/x0xy3ou9sxlfJ6wCi4Pzpp3uB7d+YFsewZJ7DZs6j0t39ezqDBioh8Hv9TccvI0jnMObJsVWRdDD8fIULMuBEt21ARP3y0Jr3nhVR/
X-Gm-Message-State: AOJu0Yy1zrYT2/zbF7Z44hC5k45yo6S7olA6MODQjrrZJ0pQgkX8O941
	YretYRGqLiYcy7lpvN44XRIn5eNt5c4xo/I6tzwawP0pSBbTLub5bFXufAnwQP8=
X-Google-Smtp-Source: AGHT+IFYhCUuIW/shPa24Bm16cB64oTNa3LMl0BHr5SyTcIcKZ2BVmCvxjUSzjAK1w5nMGYHiOtHug==
X-Received: by 2002:a17:906:35da:b0:a6e:f6bd:edd9 with SMTP id a640c23a62f3a-a6f60dc51ddmr140028766b.59.1718358436151;
        Fri, 14 Jun 2024 02:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:18 +0200
Subject: [PATCH 19/22] dt-bindings: thermal: ti,am654: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-19-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFwqmuRGwyBRQ3wR18ecSX6kfmBdIXE+Ent6
 hAKRj/Sko2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcAAKCRDBN2bmhouD
 17hkD/9OxjeCJICdurLShHs5yp7HzuR740CrmJrC7McgPnyp8ztY0sSwbQvwGeRuMsaxGidE0J7
 xqY0L6Ioab0oY31XiF1QnateecuxDA9T1PBUpytt4fbqwY10Qo5yKBPBX4OBCNAvwl6BVE2Me5N
 4t7i4RblHCch1dz5REf2XLI28pklsg0B8zZIVH4GGYVP8w3Zb3cg2gpT8O2XBsi5teF4w2pPjYW
 E+yohdnJv/uikgyAzHZ7gYKicgkaA48sLZKA9i+UyrTEYxz3xdC+qIpl0SHa7U54fKUpvIuL5tA
 1ozQi0DgXwHEMJo7Zxpkx823UnjbRynt7urLGgk2Zr+mNj1itWuyxVMw9uku7tJrSwBAIPgSXnC
 1GWhPTu8jS10dmPcl8LxdQMZzbOSiV1hdWeDFvFxEXkY3DHy7EaGTkRMsSqo9jJzOpLq/OxqFSa
 1Bd+lZllAcbV4piQt3dFG2rqt2/HHqyRzp58F8D/YSexdS8VQ2cU9D+Ibljv/xuvluLhIfuoVzb
 T7/0Whyrz0JrF36X67nkYcnekOy+Htkzl3/sFJ1rj2eXxrAEZeGoootoY8/rwk/+eAUHpRhd1YM
 STNX8eI0cUshXtTfkxs52lVyh6zDP4i0jhk1mN87RJ2/sQgDita8xLImSYHC7tTKXeb/34qVmbe
 OF5UQMHSan3bk9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024718_010885_9B8E12C0 
X-CRM114-Status: GOOD (  10.39  )
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
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
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


