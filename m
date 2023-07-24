Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5597BC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1KXAjeQsGZ0kfCjhNN/h8xLaYtNWODa2JQRrUiSTvs=; b=4eytRjyFUVef3rsHNPZvOaEKno
	Bf290xJ/qSRegDlXg7HwfcA+HUQ6MpCFvkUoCVfFJOl3AJZWUcPIUtpYhkHLay5ZlkkxQplFoAeDm
	eRVpGf2Txs8WwFv1rHcA96ZigP3lqcVIOB9NNihN9g9XTk3B8dpn0S22vcaoBgBaNnyt+W8FGY8O0
	btF0G7B8ttCbi4A9hZ/M3JVPCU6t5FKS7kKlC0YpTRwbvEoKIA9oYPpeRG/gATNSqN7miJVT93hQM
	7GQxfWqfsdBAbJnWHi+qLJn8w66W5GpX6RJYRDXLcyuDzKTF/D07lxLeSv2AoeA3oqzKdc/pyBuwf
	9wEJ7SwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyW-003qkl-0U;
	Mon, 24 Jul 2023 10:39:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyJ-003qZP-2W;
	Mon, 24 Jul 2023 10:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195163; x=1721731163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1KXAjeQsGZ0kfCjhNN/h8xLaYtNWODa2JQRrUiSTvs=;
  b=S1rVzlTcxZRBwVHYLFvNpyIwAuCYts+bnU7Oqhwh2xmPtQpMA1t7EICh
   YE8hbV/BWcQVBLO6w3uyzPeHQ7eG8CRaZnzvv7woaUTD8iiSu0aN7kNCm
   FN3uTiMSaRnvQYWCNH8G1nCJtYsvqfy+PeJg5j4AU/U7vcTqoqMtXx5LH
   b2K6vKiqyyFdWIYVYb2Fdi9qCVrOpKer464v6p3kA/LoDkFWVs1VONFmI
   to3omGGKHRKhBSoVW8NPaFrqVCaEddwVodWhhssWTbymgsbSDvXL1hcfP
   cOxF+BMxtinF+IeD2ZSy9aISmPbXNT3/ylaxuoyKY8p7VkVHQ6RwOoPJf
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078485"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D43DE280087;
	Mon, 24 Jul 2023 12:39:18 +0200 (CEST)
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
Subject: [PATCH v4 4/6] arm64: dts: freescale: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Mon, 24 Jul 2023 12:39:11 +0200
Message-Id: <20230724103914.1779027-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033924_149521_21980B70 
X-CRM114-Status: GOOD (  12.07  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
index 5dbec71747c3..61c2a63efc6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
@@ -109,7 +109,7 @@ extcon_usb0: extcon-usb0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb0_extcon>;
-		id-gpio = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index fef62acd1152..fe492b773edb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -24,7 +24,7 @@ extcon_usbotg: extcon-usbotg0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbcon0>;
-		id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 	};
 
 	pcie0_refclk: pcie0-refclk {
-- 
2.34.1


