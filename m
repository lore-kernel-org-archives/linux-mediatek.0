Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978E3C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 15:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6030161429
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 15:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6030161429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhu+7gM5c7eWSek1DvarV3SblYg3aY7u/DYeoiv8gSc=; b=xF53hUBXt34mic
	sDLXtN8r77oaPxPTvp8MKG5ICY63+GEEnucKgOVRqnh6n3+Z1x9/KY0ejnLdmPxoUA5AHDhVbyHhM
	ENbBzRG80GRHXr16UEm7DufJSGPf3g2ZObt0L40+6y6aWpLS7VlYAxRTVPZavJe0NMi8mGNBS5M8T
	bn2Oe99B6cpqAQu3dNZnmsGMyzxn6GCmaKQ2UkFgmoNq/eliHYptGdNHY06pdvUuBf0hcSWJqYNRY
	Xhfq2/XJDNUBflv4zjW8/edGDHwdH0HWYwNJhKk8oV9N9eZli2tV5CtI0Gqo9cwMDSMlCDMQ7xIBL
	i5Jx7UZpjrF+yprhXxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyblL-00EYNZ-Gg; Wed, 30 Jun 2021 15:04:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lybUi-00ESxt-WB; Wed, 30 Jun 2021 14:47:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 78C381F435F8
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: jitao.shi@mediatek.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, eizan@chromium.org, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] arm64: dts: mt8183: Add the mmsys reset bit to reset the
 dsi0
Date: Wed, 30 Jun 2021 16:46:44 +0200
Message-Id: <20210630164623.4.I933f1532d7a1b2910843a9644c86a7d94a4b44e1@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630144646.868702-1-enric.balletbo@collabora.com>
References: <20210630144646.868702-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_074717_234090_4D1D765E 
X-CRM114-Status: GOOD (  12.74  )
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

While here, also remove the undocumented and also not used
'mediatek,syscon-dsi' property.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi  | 3 ++-
 include/dt-bindings/reset/mt8183-resets.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 085e2c96b5f4..2d02365633c3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1286,6 +1286,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
@@ -1400,11 +1401,11 @@ dsi0: dsi@14014000 {
 			reg = <0 0x14014000 0 0x1000>;
 			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-			mediatek,syscon-dsi = <&mmsys 0x140>;
 			clocks = <&mmsys CLK_MM_DSI0_MM>,
 				 <&mmsys CLK_MM_DSI0_IF>,
 				 <&mipi_tx0>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 		};
diff --git a/include/dt-bindings/reset/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
index a1bbd41e0d12..48c5d2de0a38 100644
--- a/include/dt-bindings/reset/mt8183-resets.h
+++ b/include/dt-bindings/reset/mt8183-resets.h
@@ -80,6 +80,9 @@
 
 #define MT8183_INFRACFG_SW_RST_NUM				128
 
+/* MMSYS resets */
+#define MT8183_MMSYS_SW0_RST_B_DISP_DSI0			25
+
 #define MT8183_TOPRGU_MM_SW_RST					1
 #define MT8183_TOPRGU_MFG_SW_RST				2
 #define MT8183_TOPRGU_VENC_SW_RST				3
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
