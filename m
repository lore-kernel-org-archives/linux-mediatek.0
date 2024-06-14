Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8583CC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=; b=uUzU0GTRAFmbgGxD9lPoovDDH8
	I2xBXo6ktbjGcNsTFxPQyWe7ucguGR5v0C/Nv+KycCSQX9YuGU95NIzk6i2Rz9KfVizXvZe+UZeDQ
	KPxDXPFhVlCx9TNwFcySfOEhEpvdID2mY3d/mDCjTBoVrXF0alWoLO3MvPWnoNoxySNEJVzwXG4Jb
	lWPVgk4TdccELqHk4xhbf0ulBPyP341e+9qsyoxT41oSni/mPuphN2CkfEsg+Q3uJuh6tgGbjxJaU
	iX7Ex6CdaJpy2KN2Mj9RGZbH/Lx/wcQsBj2dAA2UQ6we9pX799XUX4PcSngh2Q+SA5wCiMa68OUBU
	ia7Viu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wv-00000002FrG-0HCp;
	Fri, 14 Jun 2024 09:47:33 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WB-00000002FB4-1Jq2
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:49 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a63359aaaa6so282228766b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358405; x=1718963205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=yssuqOU83j9kchR0g3rJvBlPCsSI06ngudTkVJvq+h+flikvfdE2gampqTu8sbq03I
         DmfFAa03UwDKdtg6kqujZuRdsmmVu0LSzrF5sU8Uf7vruvaYM4ATqoQMUMEeiU9RZFqd
         gNQoQwG6nzH2Syd2VU8ZEj96rFlboXQhnSZyMr5Beh8HJASco4YoufLapmSR1lyfAI6c
         0xcfqkz18F/3NyzdAMdtGpRixK/rSRQtQ/sbvMM/LJMTAUiqk8COccEtOy1IZcxFLqIi
         lrYCe+Oyh/7GKTnIcEQZUGQ3JrqrtHVMDX1HI/JXQkiwNjh4wyLvacPWUGAh5WjLlEba
         pbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358405; x=1718963205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=n9UQ0hrxd2gsy9y4OUGC9zjqMFMHwgD8f6Tak+9EcR2V1c23ELWIcGqozehHueBhhv
         BUWgMi14mqcsHMjNRcuAgztiBsfoCaSib+vARJ2u1G6CwHmGm8emGoTHsmUbh1O6BZeZ
         AzFVZpGgbPGYvBXUY69axlyGWD2OwJznmCfrkXxct5+t7vvPPthdwIRCKCphArwY65jt
         L8iwtKZyjGi00JiCC+s7PNABR9k+p9irvkmW2hbUSnFS3YuX/ZOEesUX5L19cw4Y3TU8
         wOhrkUmcitTpFaDjM9CtOQ88vFkpWgD3vCIEBefZfYsEr+823/OG2UB3Fvs+YQFbNSyb
         szyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtBPKxM+m2c4dsndWbKpmo1ZvhjjXfkZ/E5Vx0uwEbeejc0JoXOQcgDaHctQ4QPssg3WnHhUartPfbzmcyTnX+aZDvGJuE1sweXd/c1dZ4UqjG
X-Gm-Message-State: AOJu0YwHRM4A43l3VRbFMuB40sYOsu3NNqVxFBlGaYe+bMu1dS71qTpB
	RjNI++oYMJxFfbw9E4BdTQSejC5as4MXTo2OiRR6sCLskeYJe/8YHcE6mUYJr3A=
X-Google-Smtp-Source: AGHT+IHlYvfZnRQiJVv8ztAIy5FtuFGGY28pk8Ex9meikXiQo2nuK+J7KYvFbJtI8301IPK0vUIPpA==
X-Received: by 2002:a17:906:a09:b0:a6f:5f75:2096 with SMTP id a640c23a62f3a-a6f60d461f6mr140579766b.41.1718358405253;
        Fri, 14 Jun 2024 02:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:05 +0200
Subject: [PATCH 06/22] dt-bindings: thermal: imx8mm: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-6-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1QXEmZd+cFRuZ9pAA4Z0kWtLyHTijEgWCuJOa9SDRmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFlbbbrZbxDOrrFndHK7KrXUzJDw1D1Nw6AE
 6S3xdbshASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZQAKCRDBN2bmhouD
 1+kFD/sGnvHOKrY+EhoCdoHu7iJLZC1M4sL9G6Yao9AC291vehS0a6iUOXKVgc0S7wTHdl2lCaV
 naDrLzfUXUetvHgv8FAhwUuXZX/C6jfC+VQuscZd3QgI9zJEWpPLlQVarLBRtvdZr1RvWKNUroC
 /R7/V3ndnLQS8wB+8XMj9ZGqWhXr5DjruMYMSrId1NeB/H/FHtCvMhUf1E2AceQ26NP/0Q7Nllm
 Q4s7N6oYkjyt+IZD9tkEODXQbliQk88dgc+dABH7rt5skMz186ou1uHERYerQZ7ZtajckM51A5D
 5zHR3EPZ6YBYyVo0md7YUD44+pWha8sx2fehN4w6yuMskcY8IOgkUyRR15h8UwGr5nix/Hmt9hl
 XW0pbFwgHTBppYNLodhiMPqpvvb5VjbIkSooty39pHu95j/vDGJ24JAP2nlwLfGhVXbDt13R24w
 imF2g2583XIAxUy2phI0JjSeYlOpbshrQZ6uQ93uJ9bD2AcJg+p8d6J+adWZV2YZJ8GntdBvAKW
 hd5aJ866j10e91MXXzh7Dcs5InXghT6WDBL5Q/gGDGafMAwRBQl20gIeBfDFzwqIPEk5G4fw3HB
 wvFZizoZTq5aXdChJYJk87xzmMo46BsqQ/9j4F0TNsY5WZg1BONp4xZPzytaP9vvpO/7gOStZBx
 nQSxk/Wn+Tzd5Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024647_585384_A6AE2D52 
X-CRM114-Status: GOOD (  10.56  )
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
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index d2c1e4573c32..e7ddaa6c966e 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -16,6 +16,8 @@ description: |
   for i.MX8MM which has ONLY 1 sensor, v2 is for i.MX8MP which has
   2 sensors.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -51,9 +53,8 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


