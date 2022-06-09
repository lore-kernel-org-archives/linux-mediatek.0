Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE53CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSZxuav+GZLHEhx0PcZuEJFT13Cz5GiIRQhUeg5SZkQ=; b=vLR/OPVra6viQC
	MGuEojMeR/2bZ7OQGiZehms+3gP1qlxIwSggGxUiul/ASM1VsAT8mpP6Sa/9CYupyCst3BPGjnhiJ
	TxtHxx4AGI3gvtY2xqlUKuJTLNhxMD87KDNnHZtwVoDU5TQsUdjrnfE1OBe8NvOe7eJlZbpQ5PZgH
	lEPyj1CD+Kvw6itLwX6zZMa06TtEjFuX4RIa8SpjaT0/HaNzQsEvxUNHbGoFZZaT0TTKuX4+LIh/n
	GV8YA4bMCU4TaoEmLUzWcrUiU29KLSwztBZlExLs4HNqAaGxitcOgpZEor1lFLbgtHJnlb0mhHbbe
	AMpOxUlDqwn80Z/PdkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGGR-001GfF-Qg; Thu, 09 Jun 2022 11:23:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFs-001GLu-E3; Thu, 09 Jun 2022 11:23:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A23166017CF;
	Thu,  9 Jun 2022 12:23:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773791;
	bh=+SNQosugZ3rRLzeC91179/d1xD7fpoErRAwb547pmRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S7KJDmw4QBP9Uj7VYNzil/QC22SlwfQosv38ZlTcKF1fTNbCdGJMtdM/XXAuS42cx
	 tkber570qlmPd1KgxxeLT57PuZ8dSLaYH/b3G8r8eR3sEXxnnnqiHZasnsC4wosbKB
	 qoPhN1SF9UYkrT/XjkdACqiXVpAOEhWQhS9W7BJUrHT1dH2u0qn93Rq8LOjBAuZtNk
	 iD0qXVvBuFebozm+R/4ydMZygTpqkCRAGLtcFOQYRhe7Kt1VEvwpv4D7MAfb+c2fmT
	 ZfDgTHfbhQZBDJGYky2Tgl4OTWys0UseWYN8K32Ktx0q3hSRZ+RSQT8T7UcsXJyjeU
	 gMZ73MX2uQ+tw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 03/10] arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
Date: Thu,  9 Jun 2022 13:22:56 +0200
Message-Id: <20220609112303.117928-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042312_658477_9B4B3B57 
X-CRM114-Status: UNSURE (   7.77  )
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
