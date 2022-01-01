Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09273C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCa3ZqCqKJouO6p+LHrgy/Y5xqOuWuXpT7H4kiR9b2g=; b=tVFnBIaCxKBuZP
	B3DnGSGHdT0wqTE9Ue/D6l4poeov2p/Tv86xHIv/unHu0g74/tTHbepkZztIlmIJVapw44gEzyBpC
	OolcJ4tybCF/7I2Lfi9WgraIVxW7SMHi5smnUN0yX++0BgZ7vxOGzWWGV0toJPBXYrMdbH1ih2ErX
	shz21Ul3w1GNTXFlYxRGb+h8s3f7m3NrdEdV/4Yyi5TT5fUHII1gcng0WWf9DGNbRB7vr2kvbTCle
	ctImoO4HGRjYt731j8cEI881J8zFZCMHSKD+r4VzjCEANcYL38xEu9QP0D790gm2Xr7T4OseQ3qGo
	VR0cRU3u7U9BAx1mtl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3eye-0076XT-5X; Sat, 01 Jan 2022 14:03:20 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3eyK-0076Ur-O3; Sat, 01 Jan 2022 14:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AmHTn5QLkTRzbIDSpxm57IEHnMkwPINiZcUYWqC9F3o=; 
 t=1641045780;x=1641651180; 
 b=aQ8V0+nTcdYVvRFALejb3niBxUb0IfVrJLGweB2NG9WjnJ0FMAuDvQP6plbI1Jxjfv7SBR8q/HUpkEZWa3+YOv80SwbDXZqEWxyAInBjy+bE8PejTuk48j3bSKd8NT2kIipiXYwu0vBfNU7+eSZLJZXRkglt7YQuUNtpJiv4yf6ZOtIs9l5VZe7HeJYNkvDqy+VpWItgusgVbY3bFYzzmDl5f6FDyKrm2/g+ShvZ7tTStBVdq/ttYafoSZN8V85OB56yrSP1Xyne4DRy2zcrD7grT76FVKiTFqW1ov+fB4mkvac3Oq1C9gT4L9bBM497i8ZCb8XQinA/jhSIowBmfQ==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1n3eyI-0008TK-Nr; Sat, 01 Jan 2022 17:02:59 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxim Kutnij <gtk3@inbox.ru>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: mediatek: dts: activate SMP for mt6582
Date: Sat,  1 Jan 2022 19:01:37 +0500
Message-Id: <20220101140140.4119-2-gtk3@inbox.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: dda186e0-38e0-4061-f60e-e297441d9fed@gmail.com
References: <20220101140140.4119-1-gtk3@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A67F048BDCF9374CE1A58D6149DC67AB94F182A05F538085040A0101759128AD6016C795D8B553528A6B2C0547B044728B1D1C0373C7B4A6AFA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72942E6CCEF3332DBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F5B2F26146BDF5648638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86945DF9F1CC75BD729390D53FDA0BA316F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCF80095D1E57F4578A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18E5D25F19253116ADD2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B670D51CA322917D6D089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C357A67C6196E73BDD3E36531BF0317A2755C091D42AAEF6B9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF15519F706774CB6A699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34753B45383CEFF204F7D5B8DDA22F309A27E28980963724510F8CA6FD09DE7ABF2DABF6287AB014B21D7E09C32AA3244CFE26EE6092C7DB4AB7DFCB2F60B05D203A76366E8A9DE7CADCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzdjxcBf1eR43lqoZyNF+Jw==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6DF5652CB75E442D31F19869E8BDFAE4B8F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_060300_987702_C11E0641 
X-CRM114-Status: UNSURE (   9.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds nodes mt6589-smp, pmu and arm,armv7-timer.

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 arch/arm/boot/dts/mt6582.dtsi | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt6582.dtsi b/arch/arm/boot/dts/mt6582.dtsi
index 426337178..2d5cb3bdd 100644
--- a/arch/arm/boot/dts/mt6582.dtsi
+++ b/arch/arm/boot/dts/mt6582.dtsi
@@ -15,29 +15,39 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt6589-smp";
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
 		};
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x2>;
 		};
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x3>;
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	system_clk: dummy13m {
 		compatible = "fixed-clock";
 		clock-frequency = <13000000>;
@@ -56,7 +66,18 @@ uart_clk: dummy26m {
 		#clock-cells = <0>;
 	};
 
-	timer: timer@11008000 {
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	timer: timer@10008000 {
 		compatible = "mediatek,mt6577-timer";
 		reg = <0x10008000 0x80>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
