Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BBEC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7585F619A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7585F619A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPM1zsS700quNFxzhxfhEOIVhlubqsTMh6d/FWqzdZY=; b=pbt36fIIHc4R8O
	+JsEWxzh7ZJDrxDV4EiIdfeTgQMQO0pHANbiL4wFS5OdBcAowCqG7XOFrda1gP0CiPZMh2G3fgONT
	5ut4MIHMw6MI7aesWmEQeykhVLSPfv4A45jx9L8ONAIuh8eBuwUWNzenA/kwBZRrOm0W4Qc0xjTxq
	VUqVPEC6wtkbprkIP21zo+ZtxVq4r0JuyJL/AYC1OwiD48LRFb6mKSYGUFGZ6HgWJG/HEma4vlntQ
	uJpXpejxYRBBOt5Zwqzc3rjGowMnxDjrk5Ru8Q9CHv18TxwxBspk7wApMHNa2/cgVY9dccKWqr/Sx
	z7pOfcboR+nHpXGZYvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hu6-00AyLk-Da; Tue, 06 Jul 2021 10:02:10 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hto-00AyF6-1r
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 10:01:53 +0000
Received: by mail-pg1-x535.google.com with SMTP id 62so12806849pgf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSWY1fBkxp7FWdJPrKmGiH/hkzUiDqqnmk9Q7QtpsIs=;
 b=jWJQFGcxwuj79vmJcHRtOaISUpuPy74m+mz/6kM3awjPDGYDL8lxhZLAJBD7XtF8Ne
 HpRbUbNYfP43rVahUaYt/aGLvZp+UsnTMo6JjCu+zqwWe48pg2XK1shthi0U/5LFbaNJ
 lJ3KPBgPtZoVDsVS2y4NFilc7ZsUl7UuhT14E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSWY1fBkxp7FWdJPrKmGiH/hkzUiDqqnmk9Q7QtpsIs=;
 b=LfvvL28mfhWaptH6L8ehcx/jhr06MWDHO9tQ6DlvK4f8hoZ8eNJJ5fXy40diosPZOY
 Kj33R1bnQ7ni9nZNymBaa7o8YhTJbOVRRTMQVI55IwZWxrRYCNMyj5awiFigJtZA7v12
 al1sGcBwwDrrpBTNbF5IiXyHZlU1yftcBtaueXkuEXQm331DNJohaXvskb8ZkvVX58xA
 x+JX5fl53BLSRy6DICDCyLr8eeWtubBqlxdQ3Zy0rjxfix855QuDlbJllHhPhgdJbiS0
 CyhQdvwKip/tB/Q2H4FYy2YqWUm2S4A7M7LRFFf5TihoJ/Sszn2DiXKmBm2JN4w4p2hx
 m2BA==
X-Gm-Message-State: AOAM5315cAiSbJM45eIluWmjM+zVyHTvvt2uqJUn576vR1RVnpfbTdjM
 jeFswwyyJhm9kz1eW6e98/d9zA==
X-Google-Smtp-Source: ABdhPJzUtqxbWhHevakfpiZjCYKZq5mIf5PlxfZQQYQ8PoTP3hc0iVOhFa/YCG4lS4+nluypmIwL1A==
X-Received: by 2002:a65:684d:: with SMTP id q13mr13712197pgt.163.1625565710259; 
 Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:39c:c8d0:5422:cb9c])
 by smtp.gmail.com with ESMTPSA id y4sm4446642pfa.14.2021.07.06.03.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Kansho Nishida <kansho@chromium.org>
Subject: [PATCH v3 1/2] arm64: dts: mt8183: add audio node
Date: Tue,  6 Jul 2021 19:01:35 +0900
Message-Id: <20210706190111.v3.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210706100136.1205047-1-kansho@chromium.org>
References: <20210706100136.1205047-1-kansho@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_030152_143516_6A261A87 
X-CRM114-Status: GOOD (  11.16  )
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

Add afe (audio front end) device node to the MT8183 dtsi.

Signed-off-by: Kansho Nishida <kansho@chromium.org>
---

Changes in v3:
- Use audio-controller as the audio node instead.

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c08..af895921700c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
 			};
 		};
 
-		audiosys: syscon@11220000 {
+		audiosys: audio-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
+			afe: mt8183-afe-pcm {
+				compatible = "mediatek,mt8183-audio";
+				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
+				reset-names = "audiosys";
+				power-domains =
+					<&spm MT8183_POWER_DOMAIN_AUDIO>;
+				clocks = <&audiosys CLK_AUDIO_AFE>,
+					 <&audiosys CLK_AUDIO_DAC>,
+					 <&audiosys CLK_AUDIO_DAC_PREDIS>,
+					 <&audiosys CLK_AUDIO_ADC>,
+					 <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
+					 <&audiosys CLK_AUDIO_22M>,
+					 <&audiosys CLK_AUDIO_24M>,
+					 <&audiosys CLK_AUDIO_APLL_TUNER>,
+					 <&audiosys CLK_AUDIO_APLL2_TUNER>,
+					 <&audiosys CLK_AUDIO_I2S1>,
+					 <&audiosys CLK_AUDIO_I2S2>,
+					 <&audiosys CLK_AUDIO_I2S3>,
+					 <&audiosys CLK_AUDIO_I2S4>,
+					 <&audiosys CLK_AUDIO_TDM>,
+					 <&audiosys CLK_AUDIO_TML>,
+					 <&infracfg CLK_INFRA_AUDIO>,
+					 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+					 <&topckgen CLK_TOP_MUX_AUDIO>,
+					 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+					 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
+					 <&topckgen CLK_TOP_MUX_AUD_1>,
+					 <&topckgen CLK_TOP_APLL1_CK>,
+					 <&topckgen CLK_TOP_MUX_AUD_2>,
+					 <&topckgen CLK_TOP_APLL2_CK>,
+					 <&topckgen CLK_TOP_MUX_AUD_ENG1>,
+					 <&topckgen CLK_TOP_APLL1_D8>,
+					 <&topckgen CLK_TOP_MUX_AUD_ENG2>,
+					 <&topckgen CLK_TOP_APLL2_D8>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S0>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S1>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S2>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S3>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S4>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S5>,
+					 <&topckgen CLK_TOP_APLL12_DIV0>,
+					 <&topckgen CLK_TOP_APLL12_DIV1>,
+					 <&topckgen CLK_TOP_APLL12_DIV2>,
+					 <&topckgen CLK_TOP_APLL12_DIV3>,
+					 <&topckgen CLK_TOP_APLL12_DIV4>,
+					 <&topckgen CLK_TOP_APLL12_DIVB>,
+					 /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
+					 <&clk26m>;
+				clock-names = "aud_afe_clk",
+						  "aud_dac_clk",
+						  "aud_dac_predis_clk",
+						  "aud_adc_clk",
+						  "aud_adc_adda6_clk",
+						  "aud_apll22m_clk",
+						  "aud_apll24m_clk",
+						  "aud_apll1_tuner_clk",
+						  "aud_apll2_tuner_clk",
+						  "aud_i2s1_bclk_sw",
+						  "aud_i2s2_bclk_sw",
+						  "aud_i2s3_bclk_sw",
+						  "aud_i2s4_bclk_sw",
+						  "aud_tdm_clk",
+						  "aud_tml_clk",
+						  "aud_infra_clk",
+						  "mtkaif_26m_clk",
+						  "top_mux_audio",
+						  "top_mux_aud_intbus",
+						  "top_syspll_d2_d4",
+						  "top_mux_aud_1",
+						  "top_apll1_ck",
+						  "top_mux_aud_2",
+						  "top_apll2_ck",
+						  "top_mux_aud_eng1",
+						  "top_apll1_d8",
+						  "top_mux_aud_eng2",
+						  "top_apll2_d8",
+						  "top_i2s0_m_sel",
+						  "top_i2s1_m_sel",
+						  "top_i2s2_m_sel",
+						  "top_i2s3_m_sel",
+						  "top_i2s4_m_sel",
+						  "top_i2s5_m_sel",
+						  "top_apll12_div0",
+						  "top_apll12_div1",
+						  "top_apll12_div2",
+						  "top_apll12_div3",
+						  "top_apll12_div4",
+						  "top_apll12_divb",
+						  /*"top_apll12_div5",*/
+						  "top_clk26m_clk";
+			};
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
