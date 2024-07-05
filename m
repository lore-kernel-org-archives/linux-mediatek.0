Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D9C3814E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=; b=d6KTvQfSj1uHev2EWXw15qi93A
	f2vJ0TVydbxxcTLC0bAvFJxgHpjLNWCVFsgDt7S/5dDDrgZntpdQ1ot2lcUh3DpojOINgpue2cCmp
	c3805rVSrYrvo9CPf3BbIxmR8CKIBM3cp/i3m0CWzd96BnEMvSZkXv+JSTzNYFw4GDil2dUeh/Co9
	MxJLeyO/FkTPO8juJu3FL9eL9irngPXzh9UWjvCJdZ8id/5mIa/4GMNfPdIski4ecv215WbyjoJdP
	B4x9MDiDeQUHP4Y6NIcaKMRpWAYnXSrkql/bdGPsAecRuUBOOsy4hoaZRcy+nLCX5w79OSptag6a6
	UB3p/56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfez-0000000FY4s-1OPN;
	Fri, 05 Jul 2024 09:55:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfbz-0000000FWAy-3Dzi
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4256742f67fso9812915e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173134; x=1720777934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
        b=v1njyPdYmOB8Awkeoirb0Z+vfThAaekLuj1qLOJikFPXpo8foUPgKQpr6k/wvfmM7Q
         rGSziZfi7T50OjIQ2HvtKbPqcApgbGatKBf7hzIzELYN3PvLpGv1d7AEigHHUDv+rie9
         bswWMy5hQuF0Xp79WmxldgAsf6mr1TdtLwjDOvU70ycZAnJ02F/ymANFX2hL9885HY6I
         BICG39WbdJV6cP2ychl1tNxLDuNO0SxDN5UL97nps8LX43LjcvikaKpa14cjRFAE7XVf
         zZPYA8AU2WLhJ5DxqmL/tl10Kg3oZvXYkKRbfiqxfkhDtkfqJl+2KrDlXSzh+nPitbcQ
         19VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173134; x=1720777934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
        b=XrK30xfFwIOdo5oo7AqSqRT3LbcBLpmVz6ROODs4o2mVcVjoHkP7dGLhwVFNBrfReo
         gExfV2lmY6tbsShUgx0HPULCTo/lSw+WX6DAgGs7aZlH0Ah5oqUUIbjxzm1ovqrjtAVf
         mKQAjVmso4gceXmwykJ3SD+bfhuyYEk7zDRexv+Hx1bZGZnCRoccMI8MZyKygpCOuu/V
         Bm9vWUHCUmnvITh/KhsQ+pLFAGA4jVv/HrLv/kkvNeoj6dlGNkx8VDfQd7aUWVTD1iky
         dgQHutYiYMkDgtws7uC04dej+g78M3TJp1ZhpY/OwewgcZA9bQ64UcnLQMU/OJZBcPIX
         BBYw==
X-Forwarded-Encrypted: i=1; AJvYcCWeb/64VCbijXcwxGOhVfcF03aHH15I1e5E3FHdxVh9BuJalss0oHShGwZGW0fQk4d4fi0ob6hSuPX/K47QzWuQPjOA3fKWt96zGuCzT1J0wJA2
X-Gm-Message-State: AOJu0Yzxd98JzLZiZzp5CsXs/SnU+82/EY8imhQWhRHJdp9Wpzr19FJA
	guJJweMOqET2pQR32HCqXNNMjHQij1GdyTQTHjrXsGwkurgcqVvfiU2yiWoKaSM=
X-Google-Smtp-Source: AGHT+IFYfb3KFQclQvKrC0bxRkYL5QT+2rGoFThcisJv2vbGuFeFm7mkup3MxH/OKF2jKfIZ5LbeHA==
X-Received: by 2002:a05:600c:1c98:b0:422:4fcd:d4b3 with SMTP id 5b1f17b1804b1-4264a45f9b6mr29668465e9.37.1720173134425;
        Fri, 05 Jul 2024 02:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:30 +0200
Subject: [PATCH RESEND 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-11-554061b52fbc@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a/lRhuB7v/RH3R5hhGbQWTk2cMSnvHEqh4aApez49W0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8ItUHW8uis0xqBnpaivnedFAv03y9sHCQoyi
 PU5+qzAltKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLQAKCRDBN2bmhouD
 18AfD/9FP2sbB58gVOPvih1LQKxHYPR0Hs/4bGCOQweiMftG+QKq9EOPHzRIXTtK7kgNYMmiIPJ
 ESDVzDFpQtdPNScJKmQrrzckoPdulbnhSf/C+HvC+AOXeNQ3Y5rXnqVJyaVIzCATsGwB2G30OaX
 bwOopuCQR4XRMwuV1SSTvnm6iBuKVCpRBeIx1xF6whanxk5+b3/QcZ4sDwYhMkd8xYnhWtBaDOI
 LK+cxkel64DvnNqsQQIT12u1VVfMEgsLvlq+pBTxskUJ57J9xq2ZCpbbC0TJxa7haCFUdI8DXOZ
 ert0DERpvbg3lNVt2S9d6CdgftWlo9jIaMEqWl1k466LDEfu7skl8Bim3Muevr+0PTV39uJG2Vw
 Eu0o7uNkutPJRXAMgv+ikwQnff624dT9I5OsObJOX1sDCAn8vPv0eSCPw+7lFtRmfdJXGKOt4XN
 33+A2HmS+If/cDDdBuNDc9oob72OJWXKk2I/1SRHVwTCxPAfWMIyXdGcqpo/g3qdnFe12hr0lwY
 EmfN9bd0R0r3sVz17OiSSyA9ooIkguFI8MpmZ3GynWf+OdUcpsi7IMHMcXwqfXkaUME59Qk7rhQ
 vMYrJqv9zEwcvxGkvh88o+St8318dVAOhwM82L/kj3iot6Tiw5uoXXZt1UOwj0JtT3PkO0y4caT
 +jSo368RDDbbF7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_025216_010424_70FEE0CA 
X-CRM114-Status: UNSURE (   9.15  )
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..cce6624228c7 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -217,18 +217,16 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
 required:
   - compatible
   - interrupts
   - interrupt-names
-  - "#thermal-sensor-cells"
   - "#qcom,sensors"
 
 allOf:
+  - $ref: thermal-sensor.yaml#
+
   - if:
       properties:
         compatible:
@@ -292,7 +290,7 @@ allOf:
       required:
         - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


