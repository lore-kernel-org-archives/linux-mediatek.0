Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4C7C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZK9+FEvdO5b5SnvhwCCn3o/h6a0KrmEZudlpSLpeZE=; b=aytUEm9FVwDkIOnKqu30yweMis
	vWxPHvlNo6ZRzqFswbBzB7E+5g9MkooK/11kGGFDGv1vzcLG90CqvcQ8f5Nxn6i54jEcpk1MR/q9S
	qEv1vdITGRqwnyjP3ipxIe9esyHQ6/d/tEcdB5P8ITXmMT4Nr0gLqm/hWjFhvsBPEeckCYceOVkXA
	zJK4rlBnYXu3fo6RjcNuUhH/QtVKcgscaeh9yyHb2hZMt4YKnWvk8p1TO/PEvmvOXOm4/yfE7DCMk
	P7JdZLFLT7SkiOFncEcr5YVIowooQfgb++bNyJJC0iMnZfka3XocRs/ngzgnwzie1NbqTzs5xFnxZ
	Ce4qBsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfft-0000000FYej-2GRb;
	Fri, 05 Jul 2024 09:56:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfc5-0000000FWG1-2WEF
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ee90f56e31so11066791fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173140; x=1720777940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZK9+FEvdO5b5SnvhwCCn3o/h6a0KrmEZudlpSLpeZE=;
        b=q9nazWDfQX4wnlh6Ylh6G2n8spOntyibrT6J5PA0Hg4MWYfFfT0IQd44G7tf80Whr7
         PljzP4RzoU0F/VJsr1pUJkeWEKyNlMFqeYJn9Vlz8yYPMtWbF0jGeQF1t9kzcHb2eIZ6
         gGEjqWBQ+3atyJKw2AGfyRyRLivdvO4Jlxr9ytdpT01B1+1wiRAEAlon4aZ6pepNVy61
         f7SKEHPs8mCRPXpUwNk2m1/Nl/TvsJ9ULJeHfh3jM/d7EvAZQ0YAi0/mJqMvoih4yAvS
         Xk7aRLypsy0cstxsjHR7F5Km3mCrva3BBAZw2/xR0N9Y68vueq7fGyz7IOpDqMj2AZW6
         NDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173140; x=1720777940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZK9+FEvdO5b5SnvhwCCn3o/h6a0KrmEZudlpSLpeZE=;
        b=FvriAMIEdrCvmMQ8kL9c3B7G4Siyab5gm1Zsmi/6SPenyEnsMpzqRCeYST+TK0DU+D
         4n/ZIr/ZJzTzF0szlHYVXdW0CBBQaQ1S3UUvjXcjzynX6ILhuiJjXZdJh0F5p5v9OycS
         g46G6KOuOhZB3bbA5JyqC921GcgX0TRCA9LhPaTTcs2r02aeHdIJN4u0N/RsHv5Dq+Rc
         PS30XLWjQCNvLwxDIc6wZC2FCyoUfNceebDkWrDadiXPtiD3/zK8nV453qZ6PTEVxK5S
         r9oXKzvtpBKIOoHxwH8AsxGjeBWYChraWzvBDs4FR2hm4qzcn4OwOM5yYyQfZ2+QEXrQ
         RHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX70BLSjsk4ntzjfYSQzVo8vmdEbCVhI4WMP+FndDuBLNnTxdjOa8fcvAaQjA0do47lFf9lvYcJ+dwGyn2GH1ZGmmYR4/iGRxg2aS9ii3WjrTek
X-Gm-Message-State: AOJu0YyOSBnGV1XH6wIl4f8ztz/2kk8hibTBW9C5SBHDShkCuLSBbUeT
	LiEwVkpyhICGMncMIxJ1+H07OpXQY/R/5bjuZYzO04HZKGB85fR0Cjbcfqoux28=
X-Google-Smtp-Source: AGHT+IGVHwkbByZvrw6mDusVxlNiiHcrJbvlEiT/YrtA5v7OASK5UtwPznU1bZHU6sVVA0zGCO8b0g==
X-Received: by 2002:a2e:3502:0:b0:2ec:51b5:27bc with SMTP id 38308e7fff4ca-2ee8ed55e01mr27148791fa.21.1720173140070;
        Fri, 05 Jul 2024 02:52:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:33 +0200
Subject: [PATCH RESEND 14/22] dt-bindings: thermal: rockchip: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-14-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IGcKhylVD7M2fiaVzKgopYky2mw3JJLYGI9cCuiXQyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Iw9ZYN6CLePxLn0NeZKj4YTnecyOtfCTACL
 uqH5kJdeLiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMAAKCRDBN2bmhouD
 12wyD/0b08sxMLlf3O5jVJxyRvjubxkal3vYiUHwHaCEYijYcIRMRzRuOcEQONwVpWazVYZ1fJB
 w9yW1XH8PUEVQ1G+eLU2gGw9LxJriiM5E2zruvPgp5/XZD+fT4JPNeb/Ruse2b0AySdcMZYVNFb
 5CbToqDMyowzewIU3JQ8cittNjC6X9RiX8vOpKOAGu6lJHKlxkZfUkMOI16NPIZdFCL5fLEHpOZ
 ZawcwzH5GpPZcwwZuCg3HP9uXQQPpRmb785KRXBoeBT7qPkPfyQrgVEKXCCAa40PzH6j+TGQOqG
 +ySMJVa8CRFTP2/KreGr5BxdczZaBnB4uJPLQQ9DkzDNmWv9F+1zUYz0uaWGBRjkBzQVePhaaei
 142o12Ay2ytSWdnp9SuigdXzxuB/WfGQkNtp1QAyW/y7UBrGBieBi1nxclNETSira7qc9w/gjSW
 PSlne26ZRGbxddZeUARz/K14WgqEr1jMWdMPUvsD8HKATAdtZzlnJwHBm4+p9K0QGfz4K4MuUZ5
 8vsdMOUnnNXjhsKLMKqD8KcR1OkIpZSbGyG7ANud9LJf9YaA6DkCgqyaW/PDosarP2ukqKx64HX
 I3w1BiRI2qlslSK2mwyIJNkEP73KU/p9qf0vyzfESB1jElNUHGixEIeRGQbdfHDH8NiZzakW/es
 xwIfmVDSrvMO7pQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025222_013331_7F725C52 
X-CRM114-Status: UNSURE (   9.46  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 55f8ec0bec01..b717ea8261ca 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -9,6 +9,8 @@ title: Temperature Sensor ADC (TSADC) on Rockchip SoCs
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -76,9 +78,8 @@ required:
   - clocks
   - clock-names
   - resets
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


