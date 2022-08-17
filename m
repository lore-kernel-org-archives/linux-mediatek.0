Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8870C2BB41
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=guVwRYHb/3tPD4YUcYl2zZXQzxPVqgggnejxGyEtXkU=; b=Et1h5A1ALL3eVTCGUNqQTaXMZm
	R2LDVVug7/CEDdzGrC+O7djCiqiOozMckp0qcUSkcmsFV8O3h62dpdiu9wqaLDnlZdNu2ntgMlHr1
	/eUbkqD2ay1rzYaUD4VT1sm/T2BA/JpFfkm1Rd+V2CMnX0dCjivhtSihS5eanh8/F6KvoRKwJfqYh
	motEltgfHkB2vdTFRtsMFkqsYhMSCxub3a6L04J2fIqgn3SaqQvyiiCI+pmVMPxE3296iR3gV7zRz
	WfQL0GHIsYjhyCYPp7NjRsarvfwHaZlW4L+DypYAYCaO2v1fWmgJM0UiCt8F2sjEoq2CjAodgsihu
	J3QOBDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCV0-00BvAU-2X; Wed, 17 Aug 2022 06:25:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCUo-00Bv0Q-6f
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 06:25:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id r17so17776184lfm.11
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Aug 2022 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=guVwRYHb/3tPD4YUcYl2zZXQzxPVqgggnejxGyEtXkU=;
        b=KbeOUIoM9yby5Yomhn4o0VC5YzJ40kFhiRc4Wd/GWN0fy0o4Ng6nUV2YaHdeIFPoPV
         dwSaF1KnuXbuxGR5WzE8q+6w83z34s+aLUWazlKA8Yn9+uuAlvKi1wiRYwGrmWlYuob/
         /QTvsrCCU6BW6FMaKvc40eR8m9nW46FgGjIfA3Kk7jJlxzUkFdEjKsCGQyQ5neuhEwaH
         qDj+8vJgmanJw+ZlNciLfwUU0TXyhbYugRh82NidfHNgJ4FlOS31WiAo7oieqwrTl1Fz
         Yo+4VT6Tk9p6j2aVkufZzWhfxKBlRYGqZJJ9+/Q/gj0NBfrGAkRcXdlwkprQUjTPPqLM
         dIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=guVwRYHb/3tPD4YUcYl2zZXQzxPVqgggnejxGyEtXkU=;
        b=bF98g2fVru0M33tvxsi0KEJbhnVYq2X6E1Ge4OEiw/uxiTsXwNj1hQsZrvGO7EX1Da
         TZ50fGcS+khnYH0vONnsFquK5+dxZBLCL3o2UvRJEkzsn8yPySbrnVo0un3g+LFQ/eBb
         LAJB/7DryTpgnp3ABdtUQvp+CG+sQ/lI74mdmpJSw+i+V7B2lruDVyolJlTEGtvRiquJ
         TewT62/aShDoPOQnpkeeWsJhY/rDwq17RA3OlmsorrSx304I/53t3AwxFKWjsSV5mAWc
         TWqt96jiD3SvQnm5IHXmuBmO9Vj3atQSgd9+r9X7SITV7PgKn/MmhhDdbw5b/pFLHwht
         qK6Q==
X-Gm-Message-State: ACgBeo1DCLhHKehGyMvJ3zTxmg2DPmGjiTIwm8bWMHEYcSC8xzXp3spn
	Cx97RAp3UYztPvA5louZoWUYkQ==
X-Google-Smtp-Source: AA6agR5P5rXqmmHFgywOnH+IYAiRqXSQU7AhevL0GU7rLKmPJkOR6GsdL8LqQ5goaYKSEecI8yEiIA==
X-Received: by 2002:a05:6512:1584:b0:481:31e4:1489 with SMTP id bp4-20020a056512158400b0048131e41489mr7929105lfb.509.1660717537551;
        Tue, 16 Aug 2022 23:25:37 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id j5-20020a056512344500b0048fdb3efa20sm1537655lfr.185.2022.08.16.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 23:25:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Leonard Crestez <leonard.crestez@nxp.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: interconnect: restrict opp-table to objects
Date: Wed, 17 Aug 2022 09:25:33 +0300
Message-Id: <20220817062533.20076-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_232542_316934_FB85740B 
X-CRM114-Status: UNSURE (   9.07  )
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

Simple 'opp-table:true' accepts a boolean property as opp-table, so
restrict it to object to properly enfoerce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml        | 3 ++-
 .../devicetree/bindings/interconnect/mediatek,cci.yaml         | 3 ++-
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
index 09c8948b5e25..7d8d0896e979 100644
--- a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
+++ b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
@@ -47,7 +47,8 @@ properties:
     maxItems: 1
 
   operating-points-v2: true
-  opp-table: true
+  opp-table:
+    type: object
 
   fsl,ddrc:
     $ref: "/schemas/types.yaml#/definitions/phandle"
diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
index 449c7c988229..58611ba2a0f4 100644
--- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -36,7 +36,8 @@ properties:
       - const: intermediate
 
   operating-points-v2: true
-  opp-table: true
+  opp-table:
+    type: object
 
   proc-supply:
     description:
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index c2e697f6e6cf..a4743386c4c1 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -35,7 +35,8 @@ properties:
     maxItems: 1
 
   operating-points-v2: true
-  opp-table: true
+  opp-table:
+    type: object
 
   reg:
     # BWMON v4 (currently described) and BWMON v5 use one register address
-- 
2.34.1


