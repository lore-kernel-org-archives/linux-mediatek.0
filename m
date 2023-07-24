Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A40C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qasRJBYcDc3IM7O67HXLUNg24UWtgcoDmAI+FFpNvzc=; b=FUPVE65gf+MiX3mdpMO/ofy65l
	ijBE77K7BISjj7Hg6ayOCWhj2lwcEPnTr++/kWCfJIAqd2178MYE02zcxdIrwUsRob/qIBExzZxGt
	VtnG7h5WPl20t6oO5FtufLrn3JUvoAUcNNLZaRugy66yNUVwSAngs1sZGEKyWqf5ip9lTuTeQ9eV7
	PEXklEbji6sI4GGJnFVyphkbIsDuFl4V67hFT6ToJbVKwj3Jjnnu2+jHZ4yH3TKhrN9JoSkslVjU1
	i44Kg8eEkPiZ/Gfkusiew09WruKLJEWS9ITOuNhkuHLnS0gpeTp2YVSElkMbc5vtI6RVjSYYQjglx
	qLLVzgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyX-003qmY-1z;
	Mon, 24 Jul 2023 10:39:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyL-003qZk-04;
	Mon, 24 Jul 2023 10:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195165; x=1721731165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qasRJBYcDc3IM7O67HXLUNg24UWtgcoDmAI+FFpNvzc=;
  b=gGIAaP4ZgJnG/GfyNPGRxK7Qloroi0WofIPB10BUyTT1+uzBO9SKKPdt
   eAUIk1iUjCC8IlUh6SLUtOukRqtsXsVRTWegI60YprAC379sNnvMN4eHO
   nnxSDOQ/RalZPNiQ8DvYdqKHkE4w3SgeUM9D8WCsP0ZNMdPFcfVl2dkHN
   wpkBYg3NyFKoWMEsYRxwkBwRRtKv3pDAYdUR+mlRecYBjApF+50lxq0KH
   7nMDTL6s9a2ns2LZc+FV54lcswkvE9ivODLPjtvvAUBMA1O49guvFvc5/
   fuPBGYtoxr98L6c+ddrOuj6T1p0lWNOpZ4GIQD7wTsGZ3wVIqox9W92+e
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078486"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 41D8D280078;
	Mon, 24 Jul 2023 12:39:19 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/6] arm64: dts: mediatek: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Mon, 24 Jul 2023 12:39:12 +0200
Message-Id: <20230724103914.1779027-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033925_375024_E2CBD29D 
X-CRM114-Status: GOOD (  12.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use id-gpios and vbus-gpios instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index fffdb7bbf889..0c38f7b51763 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -43,12 +43,12 @@ cpus_fixed_vproc1: regulator-vproc-buck1 {
 
 	extcon_usb: extcon_iddig {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb1: extcon_iddig1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb_p0_vbus: regulator-usb-p0-vbus {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 5122963d8743..607d65ddba9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -41,7 +41,7 @@ hdmi_connector_in: endpoint {
 
 	extcon_usb: extcon_iddig {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 16 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb_p1_vbus: regulator@0 {
-- 
2.34.1


