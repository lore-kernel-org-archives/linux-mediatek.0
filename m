Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD97C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKhABv22J/9gfiYoML2xnjHSCQuA63FT5GiZHLVSUhg=; b=aNv7o/7VYd9TOk
	bBAqZRHPoZJzD2zn4O8/pGMIHX5/8CrHId/clbJvkgkygf3S/YdJg8U+VW+jhFyHz7h8zD21oMLix
	YmKuy7lEl2oqMXF4fnvfBuR8MM8kH5lruuNBkaLFXzzdAF7Emb+WKxvP3b1uK5nEPLOZ3s/N9fs4y
	unSFBj93ra2u1DdqgegBWARCSLaBa+PCl7OztwVy/+LdAuhntvy5GMj0p5Eb9QUmhIwoj01BO2afe
	iJwAmvilPzDmzwg8PwPp7Ji5v+IDRIHLCEyQRs0PDVACuvsMFubTbeAynPZMr01fZtQlGxCNAanfi
	mIC099lwvhd0n74zdijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLTb-00EhM4-4W; Tue, 26 Apr 2022 13:43:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLRx-00EgY8-HH
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j15so12288983wrb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2WiMjqWr2rsQkaBLMdtHZGm9iFmjCwz/X0cFtlbeMbU=;
 b=mMT97IDgEHYlbhiTTxwI72dtKJRNNtraEazEdhQ/1+YombRbDcfLnDCwnj54oiuFZM
 FovrX6lSuitpqUzu9jUJ7nsCKE/ZVtOBg/LFWmB33MskN2xoLOcCbAYUUHhBLf2bEVjt
 8TsMe1h3/CgL0gRVqs8VWprUHUtA4OE/YQdHxfoIKwhQYdP6vg328RtAtADmSoYcFM8I
 i0PYbWuSXY8crl2h6fYDPA+CDIfDFhVFA5V6OXhMOhQWl2dX+npfWyC8xS+MjX0ONbRu
 w1Elkgp5YYWIaK1wiJypr/20J6ugzWkTVB43oXyomvH+CZbmIgEhpY7dTM5v0c+xDDud
 OQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WiMjqWr2rsQkaBLMdtHZGm9iFmjCwz/X0cFtlbeMbU=;
 b=rRuoVZF0GNGeAhtodg0bz/IIDQq3uEYpuCADDBB7pr557iuhBGez0yNmUyLhbB2lhL
 ezAVU87evYa3UHvGi5rDJSXDLjX72J2Pqv71m1EG2FWrK/cL8Crr217xDVUS/w+dHNe1
 vK34BmPJCx0GBz5kcGzF3WA4/EuqhVXI7DlJfyf78m7gDvTw+J+c8+cqzOs2fDCywDRy
 ebJZgfs0kIOX6Idphqf4xr6354qdQZMDyYNBJ/tZuc5wHTUWt3aI1dnDSus5dCAKdgI9
 ojER6RI9wDLY/N74GGy3Ra2I8SN6lufv2oFhR0BoSoqqU/8IQc7sH1iO14rVrTYFO0O/
 qPgQ==
X-Gm-Message-State: AOAM532Z8ujgTkaO9uxBbkZBpwEK5VSLGuxwEf8blTRnlJ6u6rJkFJ4b
 yWJfFR74BWwftF9Tl5akOkzZ/A==
X-Google-Smtp-Source: ABdhPJw1ZH7IdVVddcYsXC8gaDPJgCy1xQQ7ICVPpYhMiOh4ni1tkFYXXnPGKsa/Iahi3/JTftqvng==
X-Received: by 2002:a5d:620f:0:b0:20a:d560:9996 with SMTP id
 y15-20020a5d620f000000b0020ad5609996mr12288405wru.471.1650980510326; 
 Tue, 26 Apr 2022 06:41:50 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:49 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Biao Huang <biao.huang@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: mediatek: mt8195: add ethernet device node
Date: Tue, 26 Apr 2022 15:41:01 +0200
Message-Id: <20220426134106.242353-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064153_625494_3B877640 
X-CRM114-Status: GOOD (  13.48  )
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

From: Biao Huang <biao.huang@mediatek.com>

This commit adds device node for mt8195 ethernet.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
This patch comes from https://lore.kernel.org/all/20211207015505.16746-7-biao.huang@mediatek.com/

The differences between that patch and this patch is that:
* The EVB dts modification has been split into its own commit
* The patch was rebased to fix merge conflict with the upstream mt8195.dtsi file
* Re-ordered the node to be correctly sorted based on node address

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index aa05071a80b8..a58641d1cab0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -912,6 +912,76 @@ spis1: spi@1101e000 {
 			status = "disabled";
 		};
 
+		eth: ethernet@11021000 {
+			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
+			reg = <0 0x11021000 0 0x4000>;
+			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "macirq";
+			mac-address = [00 55 7b b5 7d f7];
+			clock-names = "axi",
+				      "apb",
+				      "mac_main",
+				      "ptp_ref",
+				      "rmii_internal",
+				      "mac_cg";
+			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
+				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
+				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
+			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
+					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
+						 <&topckgen CLK_TOP_ETHPLL_D8>,
+						 <&topckgen CLK_TOP_ETHPLL_D10>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_ETHER>;
+			mediatek,pericfg = <&infracfg_ao>;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			clk_csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+					snps,priority = <0x0>;
+				};
+			};
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <3>;
+				snps,tx-sched-wrr;
+				queue0 {
+					snps,weight = <0x10>;
+					snps,dcb-algorithm;
+					snps,priority = <0x0>;
+				};
+				queue1 {
+					snps,weight = <0x11>;
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+				queue2 {
+					snps,weight = <0x12>;
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+			};
+		};
+
 		ssusb: usb@11201000 {
 			compatible ="mediatek,mt8195-mtu3", "mediatek,mtu3";
 			reg = <0 0x11201000 0 0x2dff>,
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
