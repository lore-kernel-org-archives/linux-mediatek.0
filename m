Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B570AC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F93B6144F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F93B6144F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5g9jx28Vrl1c06uq7yEo0R/gkkZnPWhNZuCS6YMWcZI=; b=kv0An1hVQWgvDQ
	uXXmsCd/t/a7V7oKHnlbp0K4nhZ2jc+7YOITj/u4mNcRJk6nNs2JXhnNhEtZv7CP7WlfHTD2+ZxPm
	ZB6amiHWHqde/hOmRjua9IEpDw1AbieLH6u3SDHVnJCN6wA4dtmqlpxlb3DyDoYmeczcCg3epo9Ez
	x3qExJFuW/BrsL7biuQTJvdXijM8NWMHqaqCab4tZd57T0l6YoXnl4jpxXkHXsGeZzQriOarMWjTT
	ZDkBEmptKaMESUPSr1x/ktD0l8GF86ixOSZqTv8O1U+kPSxThwk8ka8Af0xUiWhYS4Y6QMBbRMyxw
	xcSGI03EZyZr4kf3BV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lytC3-00GmxJ-64; Thu, 01 Jul 2021 09:41:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lytBT-00Gmky-Cn; Thu, 01 Jul 2021 09:40:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A60281F43DE2
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Bilal Wasim <Bilal.Wasim@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 3/3] arm64: dts: mediatek: mt8173: Add domain supply
 for mfg_async
Date: Thu,  1 Jul 2021 11:40:24 +0200
Message-Id: <20210701114012.RESEND.3.I9e27871bb700c807a564957302b292e9935dae0b@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210701094024.1273759-1-enric.balletbo@collabora.com>
References: <20210701094024.1273759-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_024035_590523_9D2D005B 
X-CRM114-Status: GOOD (  10.80  )
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

From: Bilal Wasim <Bilal.Wasim@imgtec.com>

da9211 regulator needs to be enabled before enabling the mfg_async power
domain. Otherwise the subdomain is not enabled and causes failure in
imgtec gpu driver boot.

Add the "domain-supply" property to the "mfg_async" node in DT.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a..a8efff2071bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -157,6 +157,10 @@ hdmi_connector_in: endpoint {
 	};
 };
 
+&mfg_async {
+	domain-supply = <&da9211_vgpu_reg>;
+};
+
 &cec {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index f6a1738dfbaa..4fa1e93302c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -62,6 +62,10 @@ usb_p0_vbus: regulator@1 {
 	};
 };
 
+&mfg_async {
+	domain-supply = <&da9211_vgpu_reg>;
+};
+
 &cec {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 003a5653c505..dbda5d656b29 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -504,7 +504,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 					reg = <MT8173_POWER_DOMAIN_USB>;
 					#power-domain-cells = <0>;
 				};
-				power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
+				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
 					clocks = <&clk26m>;
 					clock-names = "mfg";
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
