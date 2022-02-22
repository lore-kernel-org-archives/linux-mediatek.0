Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LI4Ldk+ClBDpGSAhSGBiG1F/27pbHE6nIu0c/SIiRIQ=; b=Gqozd4XRKvzTnT
	bppPXk4J6ttcY2vnOExJj9bO/FJja/vY/xl0eLI6t+reY8HQKoSBBSq36NWUT3PIRFhtMfPFHEhL/
	AszY6egGambwiPkQcRuKBRmPR3j+AH2/Bkhcyuk28p6ZsNnkedwN46MVMqVt/bCGpeKjYPiLXznSJ
	+dj6+T/NOoRVrtd/P3vOiyJ2cYCZn3FSsoh6Zsguvzh6XIc9UZdkdw1SouUSvCA4R4aDtFPEsG6zU
	uEtt4NDDQQq0o2+aJ2TOPxZ2TjxkEPMQPtXKHkS4a8OipnR830FQAvnc336gGHFbPc8lVdLLroLLP
	nMi3t41Aj4oT34xmJhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWkt-00A48G-0W; Tue, 22 Feb 2022 15:07:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWe7-00A0FP-Is
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:11 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 28A853FCB0
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542003;
 bh=1gnJNDJDw/4tQtVmWxy7bj3CuaQdR4fw8lY4W6WZrSM=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LtOzeQtLN8Z6YkUxl1DuJcHwS0o8loATH8/S6e/tu1u0vdXfr9Ov/FXidxiwcaeiu
 o/rNwAxgwUGIYjdW0chJMj76dxMSRr8Rqh7sJ5MqQU+HzGOR46d1bTt7bF/tCpeBfd
 bP6JW+8UtNpWSnmKtB3LOh95npWvaIOZx3ETAIM/+yoZVEKemuRH0FCIcPUbgiwie2
 P7gfksRTTP/qKH3ujCWj/BZoCH9nmOSNKswgNCyTZNcqwu0CI5garnijE4vLd5Q7t0
 NdhrBi9JBBz0JK2+NgW5DrtCu/y90lQZxpqOgnWNWvNPPSsTEdEuUd99rMbb59jON4
 D5+xqre9gqONw==
Received: by mail-ej1-f71.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so5862648ejk.16
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gnJNDJDw/4tQtVmWxy7bj3CuaQdR4fw8lY4W6WZrSM=;
 b=ZjT9c/qhfMqSJgxIgA7ljxM5KGMqPzzg1EiK2sHQykzxrUQktL1z0FAgaFMY/iA8pV
 RJHwh56Yb7ot20UDdS+b/NjdtsQE1fSggTcISDHi/GIKTUfrB0ZI/neTkb1YlPyvjOWw
 yG4G3Ze0krPGZsbrm1yFTgPFJmzLhiAv0Xl459z0SIinrH9ov67G28aeBpqNr14n9xwj
 7NkqMaiGCL0DNm9VTsE3mYUhojTQd4IZFga9zEgCrbdNcGay2i/y9G/clwxzkJBpb+1b
 bJR1ziwcKO+rrDhNOThiDi1G10eIH0Pk225rvxfHe0KjkQCwuXSb+IPM8TVUq4UL1Aga
 lQcw==
X-Gm-Message-State: AOAM530bALVz9C7FcUZ3edkygcx+qSRENLztKmUOa0/3hgHXRHSNzHr4
 FdUd9bvT3Qvds8IoaD13GisR5R0LjJZoi17/rq8fslty4M1reZ+KEQjLBTdxEI/ydIpArQaVgh7
 5bpt83GNPpllK5T7XxXVbW2+lbPGdgW6Qavx793uUys/bEhyUAQ==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id
 bt21-20020a170906b15500b006c9ea2d3363mr19204632ejb.729.1645541999443; 
 Tue, 22 Feb 2022 06:59:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2oukZ+ozjlCm/noxM1LqqYguIfKnFdQpkzhzOSXTFSlmiKD/vXLNfpJoPvuzwYTi07oxrug==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id
 bt21-20020a170906b15500b006c9ea2d3363mr19204621ejb.729.1645541999288; 
 Tue, 22 Feb 2022 06:59:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 12/15] arm64: dts: qcom: use 'freq-table' in UFS node
Date: Tue, 22 Feb 2022 15:58:51 +0100
Message-Id: <20220222145854.358646-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070007_770398_8DE44E21 
X-CRM114-Status: GOOD (  11.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c85825ea1623..fad1bbfa1c0a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1761,7 +1761,7 @@ ufshc: ufshc@624000 {
 				<&rpmcc RPM_SMD_LN_BB_CLK>,
 				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
-			freq-table-hz =
+			freq-table =
 				<100000000 200000000>,
 				<0 0>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2fda21e810c9..87336c5866c0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -990,7 +990,7 @@ ufshc: ufshc@1da4000 {
 				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
+			freq-table =
 				<50000000 200000000>,
 				<0 0>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0d6286d27dd4..23caa29e7862 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2274,7 +2274,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
+			freq-table =
 				<50000000 200000000>,
 				<0 0>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d15fee495238..db2ac197c630 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1782,7 +1782,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
+			freq-table =
 				<37500000 300000000>,
 				<0 0>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303ba047..8c9e3c4ac5ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2133,7 +2133,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
+			freq-table =
 				<37500000 300000000>,
 				<0 0>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d242bab69c2e..a26bd3f13d4a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1935,7 +1935,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
+			freq-table =
 				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..edb904b58c0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1398,7 +1398,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
+			freq-table =
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
