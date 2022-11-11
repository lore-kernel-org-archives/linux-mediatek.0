Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80815C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGe1JFiwJ6Jd5hSrZL+y1PN9+LD6dER03c2pB+GbJLg=; b=fYmBd948GnelhtzJYlnLOaUg1U
	VQzfn+bzUg4+ZovOisugHBKWhefUzzWo292rL0UxIzYCX+kz0qTATttBYZ9IUUAZbfLIGvv/Yvk1Z
	NteHPji7IqgMX7tCatGOvNPZ+bBpDjVCLCIvZmJ3/IyUzeRsNVpQtlUjQZ6oeyFeGojdIFBzUWn9I
	kIb65nz1CMLu2eRodksvSdcYiqAtXNfeS9j94+c4DIV1Kmwt1Tp9HCHkKnbTXaupMFTOtEhIzZm09
	HOtrml6BT3rhRdFngEFrSD7SgNk4KNTOHLd4lQvXHhbn0eMlKkw3DN17WygdBt81+3OfN9N8P7ePL
	aEEs78Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSLB-00FJjd-1b; Fri, 11 Nov 2022 11:36:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSKz-00FJcV-IZ; Fri, 11 Nov 2022 11:36:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 955FC61F48;
	Fri, 11 Nov 2022 11:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87287C433D7;
	Fri, 11 Nov 2022 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668166604;
	bh=3RaDnZ53pbckdRhlNF7hOhtOnoJFCOeiN6Pj8MvQ8c8=;
	h=From:To:Cc:Subject:Date:From;
	b=aV9KCEk/eelSsOvQGNfpWwxqxT3sdtc53rs06VUfQu+lfvmnlyWUqyFEAgahVZeae
	 xeOxJyMMD851iGKgUL80M8BYAmss+6Kec7H2z5c9nMtE5pQ+29cz2uk80tyw8FJ+q9
	 QJRGOFNNOdsl52L7H0d4wO0n9wpF6CTGJFL3VOKRRQAEzCkicmLHOF36Nbjn6Z6hgf
	 HouWlXWFbPAmrD5OSEo/rwVkHg6j+ROQs5emKIlQ/woGHL/qZWbo8lWHru3URUUjXY
	 WX9qCoP46xs3Klu3QP64ckH11cpsp3dN8rLniuLVy42S8Em2HwVdK0i466Uhd3ohjj
	 FcPwfLOnOupcw==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] arm64: dts: mediatek: mt7986: Add SoC compatible
Date: Fri, 11 Nov 2022 12:36:35 +0100
Message-Id: <20221111113635.4603-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_033645_674957_C0DDDE6C 
X-CRM114-Status: GOOD (  11.40  )
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

From: Matthias Brugger <mbrugger@suse.com>

Missing SoC compatible in the board file causes dt bindings check.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index afe37b702eef9..0e3b603159477 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "MediaTek MT7986a RFB";
-	compatible = "mediatek,mt7986a-rfb";
+	compatible = "mediatek,mt7986a-rfb", "mediatek,mt7986a";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 72e0d9722e07a..1191ecf345a7d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -14,6 +14,8 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	compatible = "mediatek,mt7986a";
+
 	clk40m: oscillator@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <40000000>;
-- 
2.38.0


