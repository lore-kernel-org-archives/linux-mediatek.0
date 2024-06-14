Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C56C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=; b=dy4rlKh/0VZ/iBoaiQg+lPvbsV
	25w46Zfr9d6AOh5ctFSVpd+QNaTEN+L3OtAhiYhoUtQu8/P+7G/uBk4ngS5yUQvQln+9e+U7XQ/WQ
	fxSj2YPJTJKIRvp7aETSyXo2LHxOoFViJKhZNtH3jKGpe+YaE0B4xccSHRVXIfJdRQYHhuRpqIUUc
	0nFVbYVhcsVXcooCQl0T8BKceibXDBWFt78xMQo4zNqaNRgdAfXpvHO3bgAswwfCLcwAAPrCA8xdY
	s+yztDsBWMGhQuBKcEU+VE5LOLsBGw+P4GsG6opasPwKQeFUukCvLBDbIkzAC/Nl3erKr+zJmtG1j
	ysWDVboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3YN-00000002GwJ-0fpv;
	Fri, 14 Jun 2024 09:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wh-00000002FfO-3IBY
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 09:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=; b=NTay+D2nVbutSXgiwDnh3RWAJG
	7bR1ehiYLsfzdNDKbBXXsOnVT4e1KjTI9cdWzzQvOoFZOEZxOKIlqhl51LYqtKz1B6h+YajKgNa9b
	n2SxyvdNVt53eKdZVSPmi2CRQPazESmBR2Gvtrxv8+5zZrMvmPCQBfDPUtHggxrAFwJqRQVFp8wEF
	orCWwTpU+dSF+6tykccSxsnkvoYysmRLKnxWAHfphsX+ay01sig+Wrz8RW++VSOWNwGO0NZ3Tao4y
	XMSgPV6OltWmEebP/rq3+MYo2LDgm3Ll2RCQ9/etD7cVh3dLCpCCMXbT2H1Fsz1xrX+nQktTVo3/2
	BmEhCEog==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wa-00000004FES-0D5d
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:18 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a6f3efa1cc7so522602766b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358429; x=1718963229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=;
        b=VltmbdAhrk81uY1XxaEfv1IgPirU89u2yWtQRyPaaa5vYekLfglmvi5/yFIuxThbH3
         dXYLP1BtpL6UYT0bjNRAYs4TK9jwnQ3amOaMFEBAUmcAOgxglywDPkdBuPxyZcbnZ281
         7CvqTHQOTmjjuYApBuiTHigO2NUbrsGjfCHTektLIvOmHsXGCbpvOW/IWIs6TOxKFZCA
         LCkmAdChFJX6c5paIlvjxIg4ynaiCiMfH9oX9h5nZLoMhhJKJuBI4iVN/Lgr7R28K/mv
         H1gd0MxwAEJsrkviCPvHHlfaklIcH2zCMlgCsieb7eVKte6kxy1QwDMGzno/zQHWebl8
         XFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358429; x=1718963229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=;
        b=p5324Qfobq6nnKmRRE6Ab3RNiIsVltQ/ZikvZbFmzNqDiHg0hWk88tsA7cRFHmH4R4
         8XpkPeZirRPAR2lkAgpsYjolzmNTvNf6TjlrSWke0sOF0Fg4QgI2nIMGjzWHn7HRJ2i3
         MTqHJlVd5oj5yAUaxJRTtQ6NdBBJArWMTpVXtwOgK4vIhDmoop6hPbdHRHLEWMimKQqT
         /aC/YOv61EaqB+v72Ak4XOjRaz8TIMTS3SP+SEhf4TlSWEAcm49BGQPkiJSuFW+xBeoC
         bQbh2aJBa9N7FrpTbwCSeLxf67XEdU4mkybZ1FflFiDCIfla37h2LPPRHYQpj6I3ZOS4
         hu5w==
X-Forwarded-Encrypted: i=1; AJvYcCV3fqO0z1sAAqpNIF2tmSVGd3QQJI7+toP5+32mE/2LXlRcxaI4mpq8KFMmndvNxge2yHZmFtx/3C0yv/SwvDAQSpBNt29ndBr0lENVUhyawH4h
X-Gm-Message-State: AOJu0Ywgc9qkDvc2X9v8CRuR18JpqRmcc1QbyL7ONaYvSmPpWh2kb3yl
	vuc1IhHV2U6DEGBPWm1ldznBpSH/IwJNDBDKWXHG90pI/YsHffno8/GUylKa6us=
X-Google-Smtp-Source: AGHT+IGIKghrlULYLHsfLKde8CcadgZJW0YzgNbewj72+XW0ql1TiGTPFflVpMsUJxAghmYfIehKqg==
X-Received: by 2002:a17:907:9406:b0:a6f:1727:cf4b with SMTP id a640c23a62f3a-a6f608a7945mr189043266b.23.1718358428993;
        Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:15 +0200
Subject: [PATCH 16/22] dt-bindings: thermal: socionext,uniphier: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-16-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mIeSyvnLon2ygamBuRDffzz4itb60m44w9O1qvVSAt8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFuGs5Jr4iu4ztVMLTV5UrKA/VmvClhsc3Nu
 /DgeeOEc3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbgAKCRDBN2bmhouD
 10rZD/9/pL5MAXa4cu08LXfwwna/wMuGScuABTPKkAA5rLndGvqQlFBBRMSephHRwgqXqp3Ifsy
 5/CCaVDAhKCkQSZ7NO0c7N/nnrmVH6VumgINouVuooUF/4kkzOqHy0Ps7bPuuX9QpkT3RY9wRLE
 46OwqjthHWuZc//DYekmQaF/L0qSJEk3SSJKGFVansCiaRvv0vLvluIIputqAPE+5A70K37ZVNR
 /Frtg4VKlW2yjKKwAjwvEmnU/KSO1gx5pg4fCsJwfJKoMqJbVrjPQgjH/08LIcfE4HCFesRhr01
 753qIZ+Zsp8tvJJ0I5W4fBh2Ycur+VCwGfHZNQN/D58/eRl64Rdlfriw2/Uns8Tt6gsabgnorj+
 mkIBO0w9/zygKNIJWRaL4AJTgYVLViyH5x9axMJvhcl4pNb5zE/ddX0PGivIvwblBrQcWTgdG4A
 FSTY2l4LvCmP1li68LdkKwt/pFW+2nj5LqhjXkXWLfUU8MAK+fO6ZuRILsYXJQX+5H6+Me5YoZH
 JMvprdk7NXkgNJa2Xcbrfq6/eTGzZypopRcxFn4T2nWjQ0SzNVZj4tetdcp8HOVXRUjb/j+JNW3
 42jZg3DaQZdvo7oUunA54ox/aRO7TB0R4xS7pxtdbMgf/pgqWTbfWEFsWnhgItUJjpazn9rqRnQ
 e9qS9o8tU4rOHag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_104716_749367_3C4EC3E5 
X-CRM114-Status: GOOD (  10.42  )
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
 .../devicetree/bindings/thermal/socionext,uniphier-thermal.yaml      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
index 6f975821fa5e..8210b7079721 100644
--- a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
@@ -14,6 +14,8 @@ description: |
 maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -38,9 +40,8 @@ properties:
 required:
   - compatible
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


