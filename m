Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE45DE77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IG3hLas3UfTPkozAfYaKba7ObuA6dtQ/tq4NQXQommA=; b=Z4ePYnYYGVEcdpkvqx0nS1cbUs
	Br+Q7rizAC8JdLKagqkzuNY/A4prRq8zeGyNvdH0YOY4Uzud26BEKK41j8H6M3x/K4PiHujhwH4bI
	6I7KR1sxn+6QD2n4d3IHPA9EGlPOdkTn90HcGcKMEUOjLb0Q2mmpuKNP0hDOJTvz2GIAhmY8J4z8J
	MkV2QlbnZ8Mp5LpT9JLZ7vhLHNdMjPOQBlHMvKhEHDNK4i1V54WAsEq49got2/m9TwmmNSSFWNRmi
	P8888nKLXnNPFQ3PqZmu7E8zAP3e060DX7LfZQVGlma668U8ykO38jWAu4klwlgDo1QWBRNzTZOAb
	dzxVVz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYmQ-000000099QT-0pWL;
	Wed, 08 Jan 2025 16:19:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYij-000000098Ft-41vt
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso213615e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 08:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352948; x=1736957748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IG3hLas3UfTPkozAfYaKba7ObuA6dtQ/tq4NQXQommA=;
        b=tcywXcaBidqdKhzoBtrWKWDP3rZuZ/LvVwLOzHo3eEBGOwZ7LcqQlbhI2tmfJddbPW
         ymzt7VXNKABfTXS93924CX0nnzdveGFQsOGatlFMF1fHK8e8b7FSfBjKjeS4QhF9zU70
         +9KcqSWiWTR2TCoh2UXyKN1o4Dh91NQ0yNpn3/glihyINxs5LX12cDB1NVXVZdvKr4F0
         3MwmnXXSCTuGPLSDmYHFuZOt3fEcmzfzQSP9m4N4RzzEjSVCXzj4JbsoTfZCP0deVDMy
         wW4iO/HF5yRrhYjd2VU/MRk7yZr22aZgjqxtiwzZZHQyOiFR3g8LRIKZ0vHYz5meLEXi
         6vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352948; x=1736957748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IG3hLas3UfTPkozAfYaKba7ObuA6dtQ/tq4NQXQommA=;
        b=i5T51ahKkkVnNRFD0Oevj6OuycR0Fa3uwoA3F+Y4W8RHtjSA5ib2mS2gophBjtqDad
         IIfc+anVV8hjhMiaW3FyPpnoWkVTb3RHPlQOHSbpthH7py3LzyYEM5Ejdzb9kfNDsHPK
         mdT9GGN/TET4Sppgw76othY0rcG8jzCE465xHwnKRuvnG+x2hfMM3haUUJEsCasGVSxt
         7tuUxuw2JyHuGD90+/PTKrlbrIsJq+F3NBINoIvJPbnNsJwXARci7bina5xnXo0aZNTG
         oembeROESycNf0yVlSZzfkpz3LI1LeWjiZ/8MrexbvLFYF06ZZt8rhUa5a9L0FScDmoW
         nGEw==
X-Forwarded-Encrypted: i=1; AJvYcCVqGAIiDTdmkABdHM6HSNyGXq1R2n/tkWH0YkZREQ8bvddR84CcoQ8UKT4UOKYtS4Ie5AOAYZelMefbIDqFxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymQ6VTy/px6enLqDi3x8B/m2bZ3eeJsvszABV0/kmAKQR58qfx
	XmMaVInO/PA8uOHyMtI4ez/mIqaJmXjnTguERwQwb3QxAL0XbLxmT5ylO6YEOL0=
X-Gm-Gg: ASbGncsC/80pG/y753eamGLDsESE3ZY8KcirlPjlkTG2OROrRleXAts7YeUhKrZYR9d
	JACF5fXf4gbGkU0wFBqbmV4XCG6HRQB35yboavtNN1OrQitdSAV4f5cYYbM7cwRk5fmfwIELf8F
	gUOEcCvukvlwSRX3OburFcutuNEH8nQbsSNbmw2bDGLwGyCFoa1+tUUXViwqqdo3+xE2DekRUk4
	Otd3REoFJVGtpJPEH/7+LKCpeOyZafkXKwZuW7ho060S0MmL+UxeMZ5suYr
X-Google-Smtp-Source: AGHT+IGaEwxTWMsJfLtdd1I6PoPqL/PTANFRWph7aumfUnPlCkceeFP4oivIGxhbB8f3iUZetscqaw==
X-Received: by 2002:a05:600c:4ed4:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-436e25620e7mr33395155e9.0.1736352948494;
        Wed, 08 Jan 2025 08:15:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:48 -0800 (PST)
From: amergnat@baylibre.com
Date: Wed, 08 Jan 2025 17:15:43 +0100
Subject: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3t/5pxgQVWN7RxuofrCRFkP/dHvG8lcvXKXop7859wM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSxAVfPOiiIfUU1aZI0sXET3HOzDDreNQ/UVUQf
 9pAs9VaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURV9eEA
 CfysJK9hX3xkHwEMAwlWyxohxYBetop54h6Gncy4LRniwOmHwaHW5GzckCxFRrulUjXJ8QlWAFaElS
 zuQ4mYO4jWauG1rxAYsPVUmIEmV6gYt9nDspt4oEk1s7XGXtwPDIvMS8hp4hkOoHOtPY/c1KO17ZxN
 Cu5CHlgsPXPtE0mOi4R4Vl56mKR8BxxBtY1H9FlceZDOTC2JsUCcpelsbF0Gvl1er0x+EIpwRGMLms
 dURg+Rl8h7q5FSLBnsFVqce/IhTw8mq6lfNk8+5a4D9uOfgeIqpc7rh1oNa+/I+JEcjf0e9Z2w7dwQ
 X/Fxs/2ALXuK9+uWmIUuKLCmNBzlptr4pK0PeTfSAD5WokQOPnp7Al6+5gF5avoUeUPZ0SqrpRZY8G
 o1OcxhBWiakMhAncV/t1/WtlqTF9qCPmaAhO3mHaGazYrjQuTWCC3aBxkt1S36+mTwypmRA7YRCIOr
 g07kxlvKNxEMck3rqP032ddDR5JU0tQPvBSFLnXZuxcXUvCDwqJzfnPyUHjXfOnD7mYA+5ynXrqKtg
 uvM+O0FAKnJruleQtvWbMs6d6ta6EOqdr+6i+SbqNP1ARB5WeuLQZva2bkGarQdY/G2bOuXE8WVcr9
 LaDL2vMN29vq3jlQJpBtUa5iVa1mV/UuY0tmAVhCV6He7z/gP2JPfQBvepYQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081550_003634_C8A76DC1 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..d3c4942df58f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -97,6 +97,9 @@ properties:
       - port@0
       - port@1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -116,11 +119,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1


