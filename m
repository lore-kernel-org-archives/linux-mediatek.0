Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E41C27C79
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=; b=WueAqtMi4yU5wn
	Q7RrHnZCrHpa1Je7LkLXQnNvs0BqLTBt/IdMZqj9lL28Ty8hnMWWZynZ/zt+8x6eQjgtEPTyadFhD
	jyn8RHyAbyAJs5kqbKTsrVVruU9P/wSl54BrfDX9uEq+DhWMNbVo4zKbxWCtqjR48SB+77GDezPyL
	AbGDVo8w7EbLwLNJ89BpqFXEQ/AnCOoriZM58CrGlvsRjGOtxR9TgNtZ6itVuqI7DmJlVbs8cAUwE
	EnqaxXh7e7XeWR4NDoDWV+ew2AAIuBCZdGKcRLYroR7e86BicampB9y1foH1wk1chGvv+plsimPqR
	xYZIPCg93hUcc8ElDKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3W4-00000002F43-01bV;
	Fri, 14 Jun 2024 09:46:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Vy-00000002EyD-11Kv
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6f0e153eddso266673766b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358391; x=1718963191; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
        b=UMSq7CUy6Ebe9iU4juf8OBAtoFNsBzbXQ/zgF3sTh6pOxUId2BRessfPSIFSgQE6HV
         mbvQDm4eKUYMKotOFVo8M9GflAi8xPWTYE5UuLfCgDOGBwW7z0Va/MSwmy0lT1oPguJ3
         xKFTxnr/JfTAcSqpbfQXMY6hwwaVtuyQIlYR/7kN7OdpZx9LifmRmx5sDyaH9I150EDw
         Fa46+HTs8bhseI7E9d4zt17ZzHSdaYpdcHO/RAT2Qo8mksQ6k6XLFxSCSSAszZubDKXD
         FosGFJXYLG8Oqxta/mJ1zvgpcrc03fC4vqv3ZtsJqWC/lOw9ztKPDDMnUFOpm3Tx1zZ7
         uLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358391; x=1718963191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
        b=d+QtfbDxVPCWux0tkSnV6V3RdTQEqAOObeaCSM0mF/MYpMLyayOkPfsYi7ChpQIZ59
         kU+NfpGtDdauvXt7QnBoe71LhhEi7TcZ2zyOr/rm9qIzdw3c8H+hSYLbJ54pmK6KOzrf
         ddy650COuwGpZdFYqnT+BZ3cfsd+t5vK0yO/rvda16nvXiNywoaYCTby8GxkqkZR5Gpx
         YBU2JkrJ9I1My03Tm8ZEwROla+hZHsWt8FfTL7rpYM7ekz0Enwvomhg7t4RrXvgwT3Rr
         wzyLwqypnGNaO31u3v9a0/MRE2NVA7m+LQfcSR/b49a35ihdz3ycrQJVvfb038WQCQHU
         pWVg==
X-Forwarded-Encrypted: i=1; AJvYcCWI2iS8cI9bDfNlbbC/LGXEnd3QTHfI4/iJja5AfV4kI2jyTI7+wQM+968PIPZzP3ePVPwATG0l8yvYXuRyrcTJx/HP3/CDfm8Ck/mf1nxCqb5E
X-Gm-Message-State: AOJu0YzTMwQwN93V9FkEd4rX0qyIX/6Le92PU+YBPCmiBlfLO/IjgRpk
	5trGhF+caV+N4VFYZwMWpQw1GD4lY76wVQiy3h3ox1ZZboyr20B5rabavHv3c3M=
X-Google-Smtp-Source: AGHT+IGov8h4HWz1vwXrMuZx4d9Kl8tLftrHfY/R0lPxIE7iVJTda8tqaONdGVeUAi1qLy3sNijSsQ==
X-Received: by 2002:a17:906:d8b2:b0:a6e:fc0a:efaf with SMTP id a640c23a62f3a-a6f60dc89edmr143181966b.49.1718358390766;
        Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/22] dt-bindings: thermal: few cleanups
Date: Fri, 14 Jun 2024 11:45:59 +0200
Message-Id: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFcRbGYC/x3MQQqAIBBA0avErBtQsRZdJVqYjjpgFhoRRHdPW
 r7F/w9UKkwVpu6BQhdX3nOD7Duw0eRAyK4ZlFBajFKjO3Hl7DiHimekspmEJqXdoxbSDoJGSV5
 B649Cnu//PS/v+wHlGnZRawAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=p3XfyX3kLTCraBOtA3bYk0nZWnKJv6DRa4Xv9JXFZPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFZ2k3GJoNNLFeKNDEm6wol3YrFjWScB/fEO
 gMayn0IsTaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRWQAKCRDBN2bmhouD
 1/1iD/0cmbLdy7BRDK+hdAHoMuk7AzFr49JqiJx9VLENFE1VKTi9ZqBN8aDoSCByUeWGR0qU+4q
 KEogi56HJQfUf74TNd3+SnFy0Sn+vjwhHn/CGv+mMBvy+WBQcLFhAVq8OPFrC6ZaHnMw+twYqdZ
 cJztoB4JHHpNSh4utMWjZ/1dCwew1GKPFztUKT8kK4OUhxotGA+oTqFklvuMza1LUOitasdXcWE
 NO5DOwXa3khj+DvmylZwD9aItPM+9lEIrSe1ZI7Im3INY+QlThZu8/jXgvQShu4wMFo6ZiFcGSf
 DZQw22RWE9MZfA5rprvMGcHRONNxt7Bj9+XsmFTvsgLNUMtn/4cgbR+H6XB53fYsCXd/U77WruG
 5FCXdX04NfpF63KybtlPqGyse++v9DRIjDqOl+YaajBVfY5AIWnNtWpkqo0pHDjr8imiQP7O9RM
 uJCHWeyn0PwumkruVCJHJ6atM6UxO20yBQIoccFirseDL9dbds/B7ghSRppjIKrS9caS0Zu+XK/
 i2UMwVJf+O4CyDzjLhIUmKwCDk2jNSqCbmUvcv3F5+o34uhViJYX6Lq22U/Nd7PS7LT1uFK5pNg
 xGjQ4xLDpRUyKC0lPvWUtf8qn7rOAsuoc6ELE0cz7nJbX0rDs1XLZl4fdMI6cRnxhT0CibGBy7L
 6PdmGjRdB0YzBJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024634_466908_92EF6C45 
X-CRM114-Status: UNSURE (   8.86  )
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

Hi,

Few cleanups witout practical impact, except maybe the Amlogic schema
(bringing required cells).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (22):
      dt-bindings: thermal: samsung,exynos: specify cells
      dt-bindings: thermal: amlogic: reference thermal-sensor schema
      dt-bindings: thermal: allwinner,sun8i-a83t-ths: reference thermal-sensor schema
      dt-bindings: thermal: brcm,avs-ro: reference thermal-sensor schema
      dt-bindings: thermal: generic-adc: reference thermal-sensor schema
      dt-bindings: thermal: imx8mm: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra186-bpmp: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra30-tsensor: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm5: reference thermal-sensor schema
      dt-bindings: thermal: qcom-tsens: reference thermal-sensor schema
      dt-bindings: thermal: qoriq: reference thermal-sensor schema
      dt-bindings: thermal: rcar-gen3: reference thermal-sensor schema
      dt-bindings: thermal: rockchip: reference thermal-sensor schema
      dt-bindings: thermal: rzg2l: reference thermal-sensor schema
      dt-bindings: thermal: socionext,uniphier: reference thermal-sensor schema
      dt-bindings: thermal: sprd: reference thermal-sensor schema
      dt-bindings: thermal: st,stm32: reference thermal-sensor schema
      dt-bindings: thermal: ti,am654: reference thermal-sensor schema
      dt-bindings: thermal: ti,j72xx: reference thermal-sensor schema
      dt-bindings: thermal: simplify few bindings
      dt-bindings: thermal: cleanup examples indentation

 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |  6 +-
 .../bindings/thermal/amlogic,thermal.yaml          | 22 ++---
 .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 22 ++---
 .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 17 ++--
 .../bindings/thermal/brcm,bcm2835-thermal.yaml     |  1 -
 .../bindings/thermal/fsl,scu-thermal.yaml          |  1 -
 .../bindings/thermal/generic-adc-thermal.yaml      |  5 +-
 .../bindings/thermal/imx8mm-thermal.yaml           |  5 +-
 .../bindings/thermal/loongson,ls2k-thermal.yaml    |  1 -
 .../bindings/thermal/mediatek,lvts-thermal.yaml    |  1 -
 .../bindings/thermal/nvidia,tegra124-soctherm.yaml |  1 -
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml      | 12 +--
 .../bindings/thermal/nvidia,tegra30-tsensor.yaml   |  9 +-
 .../bindings/thermal/qcom,spmi-temp-alarm.yaml     |  1 -
 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml      |  8 +-
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |  8 +-
 .../devicetree/bindings/thermal/qcom-tsens.yaml    | 96 ++++++++++------------
 .../devicetree/bindings/thermal/qoriq-thermal.yaml |  5 +-
 .../bindings/thermal/rcar-gen3-thermal.yaml        | 69 ++++++++--------
 .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++-------
 .../bindings/thermal/rockchip-thermal.yaml         |  5 +-
 .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 41 ++++-----
 .../bindings/thermal/samsung,exynos-thermal.yaml   |  3 +-
 .../thermal/socionext,uniphier-thermal.yaml        |  5 +-
 .../devicetree/bindings/thermal/sprd-thermal.yaml  | 47 +++++------
 .../bindings/thermal/st,stm32-thermal.yaml         |  5 +-
 .../bindings/thermal/ti,am654-thermal.yaml         | 15 ++--
 .../bindings/thermal/ti,j72xx-thermal.yaml         |  5 +-
 28 files changed, 230 insertions(+), 246 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


