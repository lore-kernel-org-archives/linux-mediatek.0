Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSZxuav+GZLHEhx0PcZuEJFT13Cz5GiIRQhUeg5SZkQ=; b=ZSgoI1jVTLa5O+
	HgLLbiiplhozHHhUsSw93X63rD0Yoj0zm4paqbi3Mqrrc9AykkH6SxjiRbsmzysocUc7wUOwkRYhR
	lf1S6fjbcDDYx8ul22iE/5gShZYbxpBkr8T4PkxTIcjBjJo+lPNgmJyw4/B7icWstoyaWnPAQm+hC
	Sv7Jzx73OXCxerwcuB158ToSsAnhPQLdLaU5cnAt9mhAmG0A5TWga15jYMQYtX3nueTNI0iY6ljF4
	5I69V51OE/KNwDieRN6VQGZJyr9xSk/4zlKpmzHNZs0dRxtqdXx9q1hSGxkT/i6iC4ihs7mqnqMuf
	x4lZok55zLTfQaWBCYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYus-00H1RU-Vf; Fri, 13 May 2022 17:17:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYtu-00H0sH-GA; Fri, 13 May 2022 17:16:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3C4F31F463B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462185;
 bh=+SNQosugZ3rRLzeC91179/d1xD7fpoErRAwb547pmRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWKopfN0gCAevdMs64GrFGRQOoXOWOZ5dEbZuDUJ/CfmDvVIP/DIRM49p9aEv0Erv
 pLkOpeIUHtpk8LLXs0b0zqommLAo6ctdZ5HVztrATXa8QHC5UX1Ig4h3dQwwkgFM+M
 SrrejUVWOGN6ACEUd17B2N6ov+dEJneNr+JWygg37z9Ntf0VqS1wtJWj72TqiA26v7
 v7xWklVkDa3B4Bs8dglaW3EV9GFo3cBMe/PAOY72ZF0AEQ7A9V9BVNliog63roMQV3
 2CGMUCEOd6yiR/hwHKASMEmD1rDPF4epMoLeTIFcuoze2UFxscKK9x4Qey/2mvgBQ6
 cAnqszV9VLFKw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/7] arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
Date: Fri, 13 May 2022 19:16:13 +0200
Message-Id: <20220513171617.504430-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101626_707985_FB345DB6 
X-CRM114-Status: UNSURE (   7.62  )
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

Add the required nodes to enable the PMU on this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 1456b9035336..639104b3f693 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -160,6 +160,15 @@ uart_clk: dummy26m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI  9 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
