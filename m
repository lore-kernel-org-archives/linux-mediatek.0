Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F3AC25B0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ho+Nb4Kl/C/aIXeakRLVlBshDy8+kHxnGlegszRANBE=; b=0gEqzRec7FsYYSYJNkXllChRTV
	uqcXa5IcLlgEtD0Czvxor3jkb1jC8Omgpi6Wnl7LDwrMQbVfbSOATZSZCklpjKLw/ym1Gk+wWFuDu
	ACJN9BQQoO//5F1rYO+fXu0Z+FleEf/f9+fggZPyKC+o0CdJmV9AVvUMmvTtZtnzP6O0uOjaq/nat
	TQuIuE6RiaFhx9iS/jKRbL3BmbJqqWbhRjcFUUJAE6ZDwyv7cEGev3J+Cwd5xsLWLGJRIaozaQnCb
	tjrMQ2ZGYwm9HDTkpCpjWi6Es53mNFMpZMSdvV1DOfh/fx4WBbqYxDXwfcNWzSYNQCrJ1J0EP8LG5
	7bNvttwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYq9-00GtN5-Th; Thu, 18 Aug 2022 06:17:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOYpy-00Gt5z-B5
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 06:17:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id u1so874250lfq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ho+Nb4Kl/C/aIXeakRLVlBshDy8+kHxnGlegszRANBE=;
        b=HniK3cF6yOKlCinfqd4fC1nP8cvW8vbpSR3UViT4wbZGZ+6LjIgxfCjNomG6n1ZtcR
         9u4t4zP68qB1w8AlQwsPu3IEL02mKJny/ZNe4+Cn9jRHhu3Cod0rrHTFy8Imt88ljjHD
         IDe8wCELy7QoNBYlm6WGXrnIKcCikE52O6U2ekSh9YgnnHj+rMWaquhsREZo4sz5Jz/d
         D0i9zICO4Up63mCL4Cv7pLb3lZclbtIJjsILnEP+19VBKos43BZZl29T1xbdCO1bB9o7
         g1miJ0F7Qbgv1RnamzyjkIQ7m2xvOmxDjBIgPVZH8w7nNnmfbSCb5pbtu7BgU90Ld+hU
         cluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ho+Nb4Kl/C/aIXeakRLVlBshDy8+kHxnGlegszRANBE=;
        b=tMueyMt4DTzP3qr4GStuhQb88dwgxIlBWhjhf7o4ncw6vL6PQzkR1VetppEDXEmbO4
         g8PT90L1CZDuaXjNMvKOXGR0JbFxK867tEj2SJAztYCpyCPGw3ljyYCVrFQTxUWll/ie
         B+6c4Q2/Fqs+MkfVbZYzkovohVNeF89hc7aObX9HaDWzYNDSPytcCusXRgcL1DQkUYkO
         DueETekLXm9LeC15aOxYpyd0oOmFRPCaAUPhuG6/Xj6LCa+tD4NpqRvQzN/q8Qkd5PXP
         VX5TJawbPn2XHzrzeT76pE4n+GyiZt4RL7w9zGBetXrZu/TypnQf4/NFtot3rMqzqEE9
         bqlA==
X-Gm-Message-State: ACgBeo15r7SR6oUr+YxA+x2Bg3TXsEh+l3+EwtcqKh6hsOOivZ91rXsV
	a0G6d4oWHpUhesjcW2UIHbr6Qw==
X-Google-Smtp-Source: AA6agR4Hie8Ptl9watzP9q3wSRaT1DJ6LQ5bGSYAymhnHao4U9kBrUHbr6CC3vfKu5GI47yddxEqpQ==
X-Received: by 2002:a05:6512:3e07:b0:48b:131:616 with SMTP id i7-20020a0565123e0700b0048b01310616mr544949lfv.475.1660803419504;
        Wed, 17 Aug 2022 23:16:59 -0700 (PDT)
Received: from krzk-bin.. (d15l54bxv1k5c31plwt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:671:aa32:2bd5:8994])
        by smtp.gmail.com with ESMTPSA id k4-20020ac257c4000000b0047f71771969sm93282lfo.113.2022.08.17.23.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:16:58 -0700 (PDT)
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
	Peng Fan <peng.fan@nxp.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: interconnect: restrict opp-table to objects
Date: Thu, 18 Aug 2022 09:16:53 +0300
Message-Id: <20220818061653.9524-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_231702_438662_D7C8E677 
X-CRM114-Status: UNSURE (   9.82  )
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
restrict it to object to properly enforce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct typo in msg.
---
 .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml        | 3 ++-
 .../devicetree/bindings/interconnect/mediatek,cci.yaml         | 3 ++-
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
index fa4f7685ab2b..f7a5e31c506e 100644
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


