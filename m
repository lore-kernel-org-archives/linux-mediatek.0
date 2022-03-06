Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04012C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LN5DVdma80qF/QCxQ2YFt/9w11nXGcC9OJOlwBvX5Mk=; b=xkJVAn6RrpqsmZ
	37DOzsSv1FBDWZcbPznUpqXw9FrZLN3CFtdO9t35gHr03p21AWdiZtAG8dBQtk1LeSM6+XjzKn+5k
	nn8uUwSYAuLMFPnSAVVqpgQ6tQequnPx8EwWtpLCsbm1d8l15EIUsb/sGZFYIDevsF+IpdLZ0bgoi
	PvICpkmhH05N3HFPP+p2e3ZFQcTwV7cCnGPARXzbmCUNUbmFh5wErtpxJwdKvMl5OLp/AIvSlgI1j
	pxVCQxLfvboFJdGaErs7g0tonAwZQCbrotg7UVSCG84cFWo6BLmFvI/VxBRfMKUcw3e0n/MfdN6qN
	i3bjcUP8pbiPxkakpdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQopg-00EWCA-31; Sun, 06 Mar 2022 11:13:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQonp-00EUwE-O6
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:55 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 382003F627
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565108;
 bh=xb1NVPmzCu//acWeZYDa5U/h0JIp5bKXDfT7rDv6gyY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=e9ln8Yvi0QHCpSdBV2IQT5JEfFj1Xb5NQ57kJ21Nx01AeSlA7rle8sRha7HgmhM8+
 WA6+xldp6LpsipX2b4f+upfomVfH8w8I/5TVOI5BAfpAdlu9Qp1mBcm0tXCLtZ+mDf
 ZfNIlxFMXlyaGlIpraWKaXzLahIOyu/PaQ5470nxB0M7Cut1Ef+/rfKvat/jDEg6RI
 gId7K5l2x0y4GbBIP6FEgMWMI6pikqyEBlkVktVCCDZ0H1j6K1BxlIvEl9jhFt8qC6
 BGKS3UEHcpwkjoNG62Q5VVsjeezPUlsNXLg1BTP+IpYRhc71JKnfkfhDKru0of97P3
 UWau52uhj1JFg==
Received: by mail-ed1-f71.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so6778575edb.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xb1NVPmzCu//acWeZYDa5U/h0JIp5bKXDfT7rDv6gyY=;
 b=yCY+5Cm/FpDlMWJbm8XxhD8wT4cmtMnz/WGQgzFIojA39bP7QboIp6skcG2/6aMkYk
 FAwhLd2b55o1qz5eBcFh+2+octfAqwl1Va8bQ0uKoYJzIRK7UymFReReQX9Jd2DNcuyn
 o7YicgMe4erzNS6shyBowYH5+I8xc3k/nM9SNPuPIGZGDr1J1fiWgRLboBMvLnKdXRTL
 rMce5pBMueKk2ak0WMWEp4PayyFhKiZzE3dmPG9mtfrSikzkvTRTGWXJFnvWYzKIkF5/
 SFN5SsqnA1mzV8n96hdpIHSRcrpoGZxJo1Ak8OuJq5ZqU/A3c1bMBo5zFkNlDTbBedEh
 TJRg==
X-Gm-Message-State: AOAM531dSxqAKFzS/3witt+5CppNksQB8fj7YZ0ruMAA02CPV01MWo2q
 6cfiI54+rZdLNpcJfZ3+MRPE2DCjS7beLRku2nof+POVOkWoeVFEFStH7tONTAmls2z+WuWXhbz
 OHt6eKYpzhYVg2iXYm+070kXnhSNfbKdhgmqo3rG1GJolgMHbaQ==
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id
 z17-20020a1709063ad100b006cea8807745mr5480150ejd.46.1646565104761; 
 Sun, 06 Mar 2022 03:11:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkqOPNZGWUEHHQJ1DdvnKzAnwvejxildLb9k95BB+Ex4BtuNUf/GcST/RwEz/yOnL8XuyPOQ==
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id
 z17-20020a1709063ad100b006cea8807745mr5480132ejd.46.1646565104528; 
 Sun, 06 Mar 2022 03:11:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/12] arm64: dts: hisilicon: align 'freq-table-hz' with
 dtschema in UFS
Date: Sun,  6 Mar 2022 12:11:22 +0100
Message-Id: <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031153_927104_975397F2 
X-CRM114-Status: GOOD (  11.72  )
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

The DT schema expects 'freq-table-hz' property to be an uint32-matrix,
which is also easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 8bd6d7e8a474..6b3057a09251 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1045,8 +1045,8 @@ ufs: ufs@ff3b0000 {
 			clocks = <&crg_ctrl HI3660_CLK_GATE_UFSIO_REF>,
 				<&crg_ctrl HI3660_CLK_GATE_UFSPHY_CFG>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table-hz = <0 0>,
+					<0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 636c8817df7e..3125c3869c69 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,8 +671,8 @@ ufs: ufs@ff3c0000 {
 			clocks = <&crg_ctrl HI3670_CLK_GATE_UFSIO_REF>,
 				 <&crg_ctrl HI3670_CLK_GATE_UFS_SUBSYS>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table-hz = <0 0>,
+					<0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
