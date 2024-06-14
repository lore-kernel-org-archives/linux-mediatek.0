Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A200C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=; b=YTMjXfyXYjlrtbsZjnj9Kx4U84
	2HsbrByf9B32hgsJ4WHk11Vpwkc/R/98IQKmu5iBhgXIbdxW9stVDTRIEm6XbkenegGju4N9Rf0ww
	Jy7qp8A0xUBDQSCWhUh+nmME3zip6GvAwRo87X6CnUFp9AwOcLK7kQGkj+YoWt6o/bDnsDkamrf2B
	Vh2UlTvoIbIUxIw+u+Sv5RsqB1TehDyf6CaAMkUrnWnXiUNB1OU3eW6eMZ0Ff0tOf8OJIUrd7dJ1I
	02EaJj5TBmpZvZL40axmrWXl+C1mWxnxK/E+/dNJfcFREKoO1Yg4u2C72jPOATuV6fIfW/kniE38S
	SND5vtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Y4-00000002GiG-26pa;
	Fri, 14 Jun 2024 09:48:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wd-00000002Fb8-0lxL
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 09:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=; b=l9Bb54QQ4S9hH9Grw6LnDoULHG
	c3tPPg5DJzlgRpAhBMQpzaZtLIsOkJTXD701znRt16LbUEnhKOvb1rgKTitiuL7N5jlCLL+HlPLaq
	NQ85SoThaDvfkCCgnwQwHPUDLkuT0EXe+3XUsq5I/lqyH26JfR9ltJbCFT0kK7uqroS+DrhfnTjRP
	immd+6gPrJIMDrnIOtMDqzfCaNLe2QrmSOJFsz1QXVyaMS8XBM7t6iQnuJLDRagVNebeUz7A/H8+n
	K0GQwRjvHIe2iFevq+KNAprIIUDG3UI1uSHRwGsn18A6x1mUVhEXdB2y9fgZMIKCYVCwKNljhLyL4
	6i3s29kw==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WW-00000004FDV-1AWe
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a6f1da33826so297040666b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358427; x=1718963227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=;
        b=lM0qOZ1RKnlRMxZZ83v1y9V4phJpoCUeufke0/UXNjN706ZL4iSXkdS50BZJXKfCFj
         xg1ME8ks9d/3vkYvt7G8eyDX3tMKzOxbWx+KnW9LNZCxPVOrj25Efurl6T/JMONLMJeY
         yV29t8FXJ6JPVQ6zab1KLWN2hGzV99nZ+q4fIeflJAlvMsN3L0pcBZ0R8fCrAyxXE+RC
         7ls3CaJe6blWqhoHFMYW2tWeA8LhKUkZQC7MJVeHmwWKXgec5tVU7NFvfWnJRw7lNbKW
         b62vieojyvBa78nCzEE3TSvRzyZfjbl1ywX54F9JtcxvdczU7M7skvJHViWi2dh4/Dk3
         PXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358427; x=1718963227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=;
        b=FwebzYhjby3PfuFQJApfnM6TrlF+glCduDs+gdznFVWArZbrnrd4zZo8mQxcPCmHyu
         KNSps2c8mv/SIsDNWqj4empwcldYrwbKKP0um2C0aldfuBnNaXWWOb6GW1y52uVzYeDe
         Tjj8DP3EzL8hIlLifBoKlVnsn/pDeCeA83lnEBVZANadGNALV3cPiwCVkBX51lwDKkuo
         Xl03lcc8Km2Gxi6ar0D+ktlQgqQqg5+jyeBx6QDxSUK3xr5YtUWyKjF5fpx11H35yDa3
         Ed+MHljgOUmd8YkgYWh4QOxoSjdMsFo50d8CAdMKbLjSga1gMY3JJZivT5qrYwnAaiSO
         ycBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWTHEm1d27B7Sv99573CvNppgOxrWjL4YN+5kmiLYhUQTF9yBZMRfdlsWJnFyp6R0yoCP3KuzAAWuHqOwUyitxeREs4dLDijAOKjOFw2BPi3vE
X-Gm-Message-State: AOJu0YwrCyh0V3J9c+3JDA9EOhS05IsUrmTHOVF2nntXGYadOG/oFs3h
	xhn31T5oz98pBNdjVvh7T7I1NXyBe0lc0T+j81QF0M/mEArcQYHu2m3xDssXXdM=
X-Google-Smtp-Source: AGHT+IGsBqftnrIXmgc1cHdRR05KgGIYwMeUvi/46uj/kB7DuzduBEC6phd954ouxCnWHDCAo+Ew7A==
X-Received: by 2002:a17:906:354b:b0:a6f:4804:d41a with SMTP id a640c23a62f3a-a6f60dc4f05mr221236366b.55.1718358426682;
        Fri, 14 Jun 2024 02:47:06 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:14 +0200
Subject: [PATCH 15/22] dt-bindings: thermal: rzg2l: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-15-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PiKB0wNkfaJ6xvGR1yJNgb5MvS56AdMDq4rywxnekiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFtz+IhHo3wCquuWC1ec8/3Jcu/NJS+VuNcz
 b34f6I3E3iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbQAKCRDBN2bmhouD
 1z06D/9PkUWBEfuEdXbJsuS6h77nANSMX4uhMlwoqisgMAkeTMkfGPP98woVm47q95V5Lwg591l
 FAtvbZhqil2JxvjG/5h0ONxSz3tKBDMH0WzOFIDxXm7j1lGjZ3lcvYI2qZRPqk3LMa93vXPcbfP
 p6JzZd8NiLvGfqpeFj4yPmMP5Zjte+hfqtLmWHy+wg9thx2sTsWxGWsblKtvokABQ6PUlVX1Sf4
 s7klRUix8KxwWqbKz3VbVCb1yMmlekTmLucE0NOa72rw3Q0u0skJ+sy6Gu+RAGV26u9KDWtKO9a
 G8AOkKlXsoL1AJO7TnYbE27eoG2nm5Y6aVWmnnIPDSyoR4bRYFoFHbIFYwhyrcoeUhwo1Y27VDf
 P9WPw0AqaEKIKJhbBoGYKwJ0JW7UnjRIx69BZ40rRljeFRvj/rF+LedohR2tQMrdXABedtqVubP
 lQWQnfVmR+K0qRYByRjZdlreodzPd7oGk5mOXs8uBw9iT75K1oEBHBWOu1cxib03+evVg1F/pzH
 wzZKYZ0ZZTiboHc0aZUgYrqQDeHHFsc7z3kYLqmvWHeSYD7Q4D1plbWRYlFiAPB0lefxcrkw0m5
 gqTjrtCXbVzf/rAD8MlTcNiJ4Yz4gh6fOleQtl+zSJusfHYV/Ay442/DcHG5Qn2Louam4zHzBp/
 T09Wn4Iy9v6TVGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_104708_876730_4B7EEDED 
X-CRM114-Status: GOOD (  10.34  )
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
 Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
index 03f4b926e53c..2f96c0fe0f75 100644
--- a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
@@ -13,6 +13,8 @@ description:
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     items:
@@ -43,9 +45,8 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


