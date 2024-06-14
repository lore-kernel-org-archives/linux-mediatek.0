Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64934C27C79
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=; b=O1FO/ygkn5lqz9WTSI9fuS3mtL
	L/LU8RssOaiidFrXsB84fj49jovf+S50rxEI8N/jyMj3e412m1LWwOi36vLe6GWI33g0ESUl2VV2J
	qyNa8/dyJ0AEdkELc7E2z74ggivTVs82EXVsQMlm4EPaUa1jwkn1jv5NPwmLoxWF8XUO2CUgJ2DLT
	MQUrGQ5MMb9CZCfCsPx5/ZX+rsg42PUIqU2qsq8Z+UCHpeghvzV7p0ljsn9pvGKpg7bNZz9qGXsxe
	roDZt/8UIkCSC0MDvZvXlq+BIS1snJuVzR5znio1Cci9B35U1wfNmdfskvflBrnORH7zvmNl8NksI
	PTAa0qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3X5-00000002Fyf-2TnO;
	Fri, 14 Jun 2024 09:47:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WH-00000002FH9-1ulG
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 09:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=; b=SQyyQLwPXF99z25qBc3e22mf+F
	RugGBvZOhZxhjhKhno0q4Gc4Ne9eOjGoboeMRiJ8qi6Vs7Qms7ZYDZaSSwCpc2cR15+2/EoMbBZTR
	gMgqJXqcwtSOHU+y+iR4jlE/mH2k7qFAjfx0o7O8UM7QPRECQr1uLzB1HOeh+pVmXxtSkJF1NtQBF
	rMrZ/J/GLMfPl9VSKEDqmSSAW5ebHNfxdrZVftEhacNr1pKd2v18bDbl6G5S+jgjO24iJuYY1+hpp
	cXN9IOQl5WV637kFxaRnmyWa+TInHD5Datj4ogE/cv901vgjT1iUbWAVhR33lcSWOAuOvQO+9odU4
	P1KVgbQA==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WD-00000004F4x-3F9X
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57ca578ce8dso2253259a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358407; x=1718963207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=;
        b=RYiixyUi+tojVQ+gKFhspwF9hKdH0ygm3Zv3SSNX3NsnVKCoq/dbdH7mJchm0AM5jX
         USBTkLsMTeQKwcOmHI4NGtkPjVKsnTOXpcFCaMsm8hNquCo3RtOM0+2DW1/0k3xFGAu/
         z6/yLl+NmhILf9eX/Cyo2NVTsVPnMa4f1C5LBsmiXdpyjLH63O3flxGbRzZHdFFGoPpM
         oE6Tip2hMLmPB/QJsf8KDpaMTXGh3FDw1BWC+T0paoCAKIF6/szuSSoHb4fiSY8Xsj1+
         WzmDhHXQ3d9vNX25oRE3JrvWYTHk7sJTrd2bUxZcbWIL4zBV2DytPzXnEn6mbX06+z+e
         yOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358407; x=1718963207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=;
        b=GdLdHAidDJIZ8XJ3yeYHlvCt8Ivov/cknxrpxgWCq4V3rgRAbZsjHTA5ItNux2iHqA
         mX/OVXypd9SfbmFwrxnozIqgfJ/ecXzl5kvtnyAboVF1P37PvZNIsWConWJAXT1waccu
         mMLnZXn+tx5AGrRkZ3BB+G4raHElWqAK6V/zIixKec5XkIUf9Dbd84VS1OiQmB0Pia+P
         I5GexJYtTRfzKKg+uIulzrUJ/WYm6pC5wed50kDRd6GdMhH7gCq/8osub6A+SeRw8wuT
         CursltKhd7WUDsdVmmjS1NHm8mwo3hvcrlB/zRmJL83LvC12G5HHEG5aS4mXapALUcQa
         1C4g==
X-Forwarded-Encrypted: i=1; AJvYcCXvQjm8h/BpA8yWp7o5J9v1m9FIn27TYTJVg+5JIbrxfU++zQ/2dzt0ED1hiq7C/ZmbnyKX+oCDbau5BndlDzGjAYreK8lCYBgMIcKSoM1SGmAM
X-Gm-Message-State: AOJu0YzovDEW7u+PkR0vr94Yk+bzmOoG4CNMBJJNPbksvBve8AT/bw/2
	2+s6htE/+NKLPYGuMV4LDy3XPfcSSu55H2UeSqxcRuZnQ8GvB+hXSXdJy1szTtM=
X-Google-Smtp-Source: AGHT+IGNlFyay8kOem24vdynFYgywyyZVSux+W6+RqwMfDi8eHKZ4ApmtC0R5UYkH/YsJbtiKWjL8g==
X-Received: by 2002:a17:906:c24c:b0:a6f:5c34:34e3 with SMTP id a640c23a62f3a-a6f60dc8a06mr152321866b.62.1718358407588;
        Fri, 14 Jun 2024 02:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:06 +0200
Subject: [PATCH 07/22] dt-bindings: thermal: nvidia,tegra186-bpmp:
 reference thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-7-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fPJBLqgC7318fFf2Al8T2+5gAe2h9ujfD/RlTMTvaWw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFmNf1yVZUqHe6ObrZYM4xsaIvMyiTnGv16X
 8eLBmKrFhKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZgAKCRDBN2bmhouD
 10HqD/9YU2o2Db6RJtFXb6VGo0dUKqGzbKYA3Mdmk1MVN+dZ7Wy6EUb989MBdxWjjNljpO44Du2
 UknQbF1FcW19LKcDSAIX0ES2dU3P4VWocs8UO6zgFVOQBHWGUa26u9u68RmEyBP1ilQsqwVpjco
 kPJM7HbNEWxxbVMRrrx8TNpz9QGSWje4itnmiFUrw/wOWdqhi7fMij1Ru5a9Uw9SNRDmpiEExUE
 8aFQ8gO/dkIQOxdGbdhTMQNBwhud8tdMaNjnplec9i2iO246I6sde5KAJGmMlCwj5FAYu1edvv7
 fGe9B97J/X2ZrqPYYGInyYquT4lmEwgS1aEBcff0AK3RXm7LqQrzMOSnCUvf4xIMWo/eS5kY37v
 yBHyqQ3+B96ONbFWpXUsCJc9xFQS2ECzvbW+v0HM+ieI5tN/TAOZUDbLK/cnM18QhISO5H8U92q
 ej2R0T1/+55GLp6ZgOPU5yX+RZgzFthAc3eRibixzjFvCldYJUGQXIDWcKVfq4aOI2YVugjpyVZ
 s7Dfk491xtZzep9zpwKR4UTrMcEHdjcIH0aiMy0zxq1SKo0H9+bXWE11SZgA1DD9Rp6OPdK60+I
 09YqIgW6C799e75K2VYN6K/uDMmrQmys7pmrtJfEIJIdU3hcXV9mlxNLyPGUEEn7jEgq6ZpAvsg
 PTevguPNxftPhXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_104650_092618_4CC4E45D 
X-CRM114-Status: GOOD (  11.24  )
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
 .../bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml       | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
index c91fd07e4061..978b9e6ab8a3 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
@@ -20,11 +20,7 @@ description: |
   node. See ../firmware/nvidia,tegra186-bpmp.yaml for details of the
   BPMP binding.
 
-  This node represents a thermal sensor. See
-
-    Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
-
-  for details of the core thermal binding.
+$ref: thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -33,10 +29,6 @@ properties:
       - nvidia,tegra194-bpmp-thermal
 
   '#thermal-sensor-cells':
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: Number of cells needed in the phandle specifier to
-      identify a given sensor. Must be 1 and the single cell specifies
-      the sensor index.
     const: 1
 
-additionalProperties: false
+unevaluatedProperties: false

-- 
2.43.0


