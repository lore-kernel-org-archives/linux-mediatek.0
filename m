Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wek3pwSoxuSxAB0+7VDITpgtiS2rz98u0Ist/PwlmJA=; b=lOB3/2FW0S9r+7
	ANmaBFIJsHa0jsQdyxMs1EfDbeWBOMZo5/lh4RjMUsjAJva/9XTxATOsg4utYzTk6/LUvIFScnjil
	FpkV/G2W7mNNVIR4hRwcs2tWsND2JrOcgxG8PxzYvtx5PQCZSSenteakxUBWQFO7g8JzSU+xGwe32
	LliYKPc411clvwArVePgE50vw+iXjXE4fV0v0BBeaZ9ZC48WluYW32EfeK3RFa5wKGbea28bC5bCg
	ZVTziTfu799q2+rnTR5ukYhcKRMUug/sG7OumSXQPqEONO09n6HDC7c6urnQa71ifKTgSne3iATyv
	lxqTWrUQp5XJ+S3t76Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWno-00A5R8-2S; Tue, 22 Feb 2022 15:10:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWeH-00A0MI-5K
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:18 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B5B923FCA5
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542015;
 bh=LfKEooVWXSt0X9amI75MXA0ImuzcwyjqGr8txR6hCCo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=S16eXlqgVfdBuJl/1hHHyyn+igXPSYEeSBbfp9cyC4/tXFd0LxvC04fJp2ZknoKuD
 E0Zc16OShVoyrYv7iPH83EHSUf4XcPHPwMKWuF1PlkmvAY6WMv5h9hFCOCwuIAbL2x
 UluuUmxQBfRYJsCfgeae0LIFgxDH5ous5K+nQasKfCwx1GKIuDbKCoXLaI+3/V9o0s
 N5G9czrcnQa/o6i3Z9Q4BexKkfiD8zo5rj6AYzJXeRsXHMqgQROCLc0iRkbqyDIjdQ
 RPN8sp13XB4qwSxvtYAEwODY9rk9lX4O5zGb/eVhca3dqIqZtbQOspQwWvAWbhHHpT
 XRjfc2EqYLxXw==
Received: by mail-lj1-f200.google.com with SMTP id
 q17-20020a2e7511000000b0023c95987502so5903106ljc.16
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfKEooVWXSt0X9amI75MXA0ImuzcwyjqGr8txR6hCCo=;
 b=7nbHNeuM6GgF0xR+8CPOnzItaqTRxl4J3gBE3f5lvaFEgyjvpkK8UeV8+QciT3UYgh
 5b1PuFhxE7FsKN6ANDGrL9k6oGI9TXH7u0t28Is4DQ3Pq4EFrp2+5DzRHapNpfhqsWfg
 dcNwPPpTVIhvdetnGYFaHF4QDG3KsuMT5gdNuwi5Psra2TPcOYBEfaU0rmlq5l6t8hTj
 8YHSNtOsd/iAGQud7W5tRgrRrB8pQJDRzGd8zE5cc2vMQhMaW7AqWFtwF/rZfnTDsmvm
 YSTDPEgVLZinC7qp9v8f3V2qpccH0ohb0QpIK/dtYCyn33mYHdoy0LU9lKCqgczcU6WN
 O/nA==
X-Gm-Message-State: AOAM530lphBajxkrOdv1KygA/JindDUMt19h4f7FTIcIAy8m9VKqhAFW
 YVuQLO7ToIu/Pxx288KEaftdedU87yfpWovKKG9EKR1p8JQEt2zMJwXtQjbZf47869s3UXTuoHP
 cn7AEi1CuAkDyQki416AQft8vkiU3dsdF1IAOfGDkczYrFnujvQ==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id
 g2-20020a17090670c200b006cfe1cc4d8cmr20090153ejk.696.1645542004850; 
 Tue, 22 Feb 2022 07:00:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR3qbd+Iftv6XGp15bvvgUICPOPWMYZg+AzIuOxdejdmzbh/iz1wm8C/0MI15ezn8MGt0S6w==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id
 g2-20020a17090670c200b006cfe1cc4d8cmr20090120ejk.696.1645542004625; 
 Tue, 22 Feb 2022 07:00:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.07.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:00:04 -0800 (PST)
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
Subject: [PATCH v2 15/15] arm64: dts: qcom: sm8350: drop duplicated ref_clk in
 UFS
Date: Tue, 22 Feb 2022 15:58:54 +0100
Message-Id: <20220222145854.358646-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070017_352782_14DA4A33 
X-CRM114-Status: GOOD (  10.29  )
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

ref_clk clock in UFS node is already there with a <0 0> frequency, which
matches other DTSI files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a26bd3f13d4a..cb6442c9e761 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1916,7 +1916,6 @@ ufs_mem_hc: ufshc@1d84000 {
 			iommus = <&apps_smmu 0xe0 0x0>;
 
 			clock-names =
-				"ref_clk",
 				"core_clk",
 				"bus_aggr_clk",
 				"iface_clk",
@@ -1926,7 +1925,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				"rx_lane0_sync_clk",
 				"rx_lane1_sync_clk";
 			clocks =
-				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -1936,7 +1934,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
 			freq-table =
-				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
