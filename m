Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D79BC07548
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1000020C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgO8KAfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1000020C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ecQr7ZgwfENxuOuKd21Z3Z9+tEgSb+gGtooaOdyetpQ=; b=dgO8KAfQMcXU6qskbn6LkhYfk
	FRyXQzsPWH9s4gAmhSJj6czE+SglsdMC7PEYnthNaw+eq6me2fEJ1vQHQnrj04nwZakp7SXdlGPBP
	9QBpaDhn2ThLnRYyN7BOOTsQkrTIn48dnmjamxqBfRBkdDa2j5RW0ti9ajyDhojnJK6VbB3h9Iv8V
	feBQB7ILdVh0kmuHtyqwVEU5ujOgzvpwKcfMrQF0Iyy+Qbo0Lszi/FC/CdRu63XuaI0bmed8IqQdY
	oGeDpEFfXKQDSfNvpL7p+D9K0FX06k3q0I1ndacGhd0Kjb2jdDwkvwXmXlSciDYG/hCRYHqWhLi11
	w4YbmjYdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQNo-0004P4-IV; Thu, 10 Sep 2020 17:29:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQNG-0004Ag-OL; Thu, 10 Sep 2020 17:28:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 67B6B29BB10
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] arm64: dts: mediatek: Add mt8173 power domain controller
Date: Thu, 10 Sep 2020 19:28:17 +0200
Message-Id: <20200910172826.3074357-4-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910172826.3074357-1-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_132842_935021_2D906238 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 fparent@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domain controller node for SoC mt8173.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 78 +++++++++++++++++++++---
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 5e046f9d48ce..3b08c5404d81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -450,16 +450,76 @@ pins1 {
 			};
 		};
 
-		scpsys: power-controller@10006000 {
-			compatible = "mediatek,mt8173-scpsys";
-			#power-domain-cells = <1>;
+		scpsys: syscon@10006000 {
+			compatible = "mediatek,mt8173-power-controller";
 			reg = <0 0x10006000 0 0x1000>;
-			clocks = <&clk26m>,
-				 <&topckgen CLK_TOP_MM_SEL>,
-				 <&topckgen CLK_TOP_VENC_SEL>,
-				 <&topckgen CLK_TOP_VENC_LT_SEL>;
-			clock-names = "mfg", "mm", "venc", "venc_lt";
-			infracfg = <&infracfg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* power domains of the SoC */
+			vdec@MT8173_POWER_DOMAIN_VDEC {
+				reg = <MT8173_POWER_DOMAIN_VDEC>;
+				clocks = <&topckgen CLK_TOP_MM_SEL>;
+				clock-names = "mm";
+				#power-domain-cells = <0>;
+			};
+
+			venc@MT8173_POWER_DOMAIN_VENC {
+				reg = <MT8173_POWER_DOMAIN_VENC>;
+				clocks = <&topckgen CLK_TOP_MM_SEL>,
+					 <&topckgen CLK_TOP_VENC_SEL>;
+				clock-names = "mm", "venc";
+				#power-domain-cells = <0>;
+			};
+			isp@MT8173_POWER_DOMAIN_ISP {
+				reg = <MT8173_POWER_DOMAIN_ISP>;
+				clocks = <&topckgen CLK_TOP_MM_SEL>;
+				clock-names = "mm";
+				#power-domain-cells = <0>;
+			};
+			mm@MT8173_POWER_DOMAIN_MM {
+				reg = <MT8173_POWER_DOMAIN_MM>;
+				clocks = <&topckgen CLK_TOP_MM_SEL>;
+				clock-names = "mm";
+				#power-domain-cells = <0>;
+				mediatek,infracfg = <&infracfg>;
+			};
+			venc_lt@MT8173_POWER_DOMAIN_VENC_LT {
+				reg = <MT8173_POWER_DOMAIN_VENC_LT>;
+				clocks = <&topckgen CLK_TOP_MM_SEL>,
+					 <&topckgen CLK_TOP_VENC_LT_SEL>;
+				clock-names = "mm", "venclt";
+				#power-domain-cells = <0>;
+			};
+			audio@MT8173_POWER_DOMAIN_AUDIO {
+				reg = <MT8173_POWER_DOMAIN_AUDIO>;
+				#power-domain-cells = <0>;
+			};
+			usb@MT8173_POWER_DOMAIN_USB {
+				reg = <MT8173_POWER_DOMAIN_USB>;
+				#power-domain-cells = <0>;
+			};
+			mfg_async@MT8173_POWER_DOMAIN_MFG_ASYNC {
+				reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
+				clocks = <&clk26m>;
+				clock-names = "mfg";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				mfg_2d@MT8173_POWER_DOMAIN_MFG_2D {
+					reg = <MT8173_POWER_DOMAIN_MFG_2D>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					mfg@MT8173_POWER_DOMAIN_MFG {
+						reg = <MT8173_POWER_DOMAIN_MFG>;
+						#power-domain-cells = <0>;
+						mediatek,infracfg = <&infracfg>;
+					};
+				};
+			};
 		};
 
 		watchdog: watchdog@10007000 {
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
