Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8855C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1C+p5nWre4fNCsSXfX11GO7HY5IOAXIK0Eu293+s85o=; b=zFAQo3/+IDOwYL
	ump6N+Do8VfKcDN08vO5o+zHKPmg/fUIjuj99ONEC79guUaqNwnWjvF6DHa127wFBvppHXH3b30u9
	L0H9u6tV9ZoSnNCB5nxxt4DWWIFbgMsngSsm8P3BkwO66rKFSiDNpPS/Co5uMbcrLQzOJtMT+XqEt
	XaoXROPzGd2BTp7Id50JMaTCXstrNVz9rhjW0Z2gheyvz9GgjtaevkZGxfdnKxdLFLYIHDMEosPAe
	f9oO2Y0K0QtFMt0ZN+E2YALuFRRfb6VXX9mQq+ZGau6ekBNoEK8O/ZUYpQyiTHzoiII3zJEIloAMs
	MRp5taH+UlvI6Ebbtg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uuv-004OyH-Ct; Thu, 30 Dec 2021 12:52:25 +0000
Received: from smtpng3.i.mail.ru ([94.100.177.149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uuY-004Oun-Uk; Thu, 30 Dec 2021 12:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AI7M4IM+OIQfNp7Vwkgow1e5z6visorja0WbeRGp4Us=; 
 t=1640868723;x=1641474123; 
 b=taZa2x/vt+TZx8Dk/wCiRAmaGYg7xvhVZsEurWsqSlGBq4BcumIVaLYaAzfEBPGJa1b4kMjBw0/lyz9OLz3/suG53Vz2ZquSydOoNEt8y2l9SEy9zjp6XB5a+EkJrK9Xo1Eg729M3Jz7YJAryX0hVUEnEGnz3PLamVKQ7jFWxW58HJt8a1Y+YcQwA2hsygxnhOeK/5kfJKPJN42oQhZGtTdgdxL9rdqcMpHz7isSbRIkVoNYKr4PZbZeCKw79fxtwAkbXzpuTBMBtWqrRyT/ikCw4DKS1/vExuA7L8TJ6JeO1g6UCOwKbHqhj5HNj8pKwaTJB2jj/n6w4gwqZW0pUg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1n2uuU-0001Tn-SJ; Thu, 30 Dec 2021 15:51:59 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxim Kutnij <gtk3@inbox.ru>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: mediatek: dts: activate SMP for mt6582
Date: Thu, 30 Dec 2021 20:51:51 +0500
Message-Id: <20211230155152.48715-2-gtk3@inbox.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230155152.48715-1-gtk3@inbox.ru>
References: <20211230155152.48715-1-gtk3@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A67C325213A5E2C0E449CAC477A2A6F0E15182A05F538085040450BCF773D3DF88160F72509ADBA016566A5ED421034FAE65B4B2153517ED7C4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE766DCF8604E9C5C06EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063702DFA59B3C994360EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA69254326C01B69220E1AA0239E909E00020879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063793270F7220657A0A389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493B89ED3C7A628178125A4AB119743A3B3C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C98DCDA00E0158592738A57C1586C77681A742A5B678BDD7F9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF15519F706774CB6A699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34E318F287A436F24C999557752B3EF12E5B4E0FE4061C08EA6AF60B13CC337B9A8D73C3FBA8DABA541D7E09C32AA3244CA30F42E3C18344009E7B19D8CBDC2F27B4DF56057A86259FDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1qmHCAeuKqPnSxAz7wEH1g==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D642AD7DBB5C5DF4F89F393FC02AAF00E88F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_045203_388507_96C00266 
X-CRM114-Status: UNSURE (   9.44  )
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
 arch/arm/boot/dts/mt6582.dtsi | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt6582.dtsi b/arch/arm/boot/dts/mt6582.dtsi
index 4263371784c..5efcbf43325 100644
--- a/arch/arm/boot/dts/mt6582.dtsi
+++ b/arch/arm/boot/dts/mt6582.dtsi
@@ -15,29 +15,43 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt6589-smp";
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			clock-frequency = <1300000000>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
+			clock-frequency = <1300000000>;
 		};
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x2>;
+			clock-frequency = <1300000000>;
 		};
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x3>;
+			clock-frequency = <1300000000>;
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
@@ -56,7 +70,18 @@ uart_clk: dummy26m {
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
