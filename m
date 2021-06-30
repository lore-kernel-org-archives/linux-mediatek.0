Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F3AC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 15:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2404B6142C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 15:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2404B6142C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmFhJ3b9tbudILFlpZUSk3TdBt3PEygNK6qYdZqAo9M=; b=WssDlQwAKPAQZ1
	UU006J0aeqbgL3zCPKEPRsQTjztODb0PPLj2y4nH2guNXCwTOhq0iTVuSIZNpcM3EdLxjB5ohjHiK
	MUQhyKZnIe0UbiRLR0D9FIGa14KYWk7rlDrNNtdAtEAOALOtFv5PtBO46MZehVPLBpzs7QWaO0nYN
	1x1Hu6r67x/gPBWc6GSeDZEnAR676zVlaE2IPCQH9GqRp6qyizYSYur3qY9OWLX+gB2l3Zo5xNmBe
	DxatcI6/kJJ8YZH682IZiDAw2QPJ5t0EkX/85/QFMd71y1lKuPzSn2zWVhMGAyTVnTIrsSuWVNs7A
	7czULEYJOQP4UxGT3PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lybhU-00EX8d-4C; Wed, 30 Jun 2021 15:00:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lybUi-00ESsX-Ad; Wed, 30 Jun 2021 14:47:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2DBB11F435EE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: jitao.shi@mediatek.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, eizan@chromium.org, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] arm64: dts: mt8173: Add the mmsys reset bit to reset the
 dsi0
Date: Wed, 30 Jun 2021 16:46:43 +0200
Message-Id: <20210630164623.3.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630144646.868702-1-enric.balletbo@collabora.com>
References: <20210630144646.868702-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_074716_565165_E862743F 
X-CRM114-Status: GOOD (  10.26  )
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

Reset the DSI hardware is needed to prevent different settings between
the bootloader and the kernel.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi  | 2 ++
 include/dt-bindings/reset/mt8173-resets.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index e5596fe01a1d..36c3998eb7f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1036,6 +1036,7 @@ mmsys: syscon@14000000 {
 			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
 			assigned-clock-rates = <400000000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
@@ -1262,6 +1263,7 @@ dsi0: dsi@1401b000 {
 				 <&mmsys CLK_MM_DSI0_DIGITAL>,
 				 <&mipi_tx0>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 			status = "disabled";
diff --git a/include/dt-bindings/reset/mt8173-resets.h b/include/dt-bindings/reset/mt8173-resets.h
index ba8636eda5ae..6a60c7cecc4c 100644
--- a/include/dt-bindings/reset/mt8173-resets.h
+++ b/include/dt-bindings/reset/mt8173-resets.h
@@ -27,6 +27,8 @@
 #define MT8173_INFRA_GCE_FAXI_RST       40
 #define MT8173_INFRA_MMIOMMURST         47
 
+/* MMSYS resets */
+#define MT8173_MMSYS_SW0_RST_B_DISP_DSI0	25
 
 /*  PERICFG resets */
 #define MT8173_PERI_UART0_SW_RST        0
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
