Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB7C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYDaogE71dXTVwOGmKawoSDvGd1saOq3dhOykjCphGQ=; b=ghRLtGdImnpwLD2VnxQE3SsVws
	RlGslneownGPo2LsS8hq+vAyHV6aXjyuQpsC2uqYc/ctyTsAAGxsV5y4PYnCJ+eWFIAMOITdbbEud
	4TYBfF4nVv0zk976mM/I8o1ryh7gVg1Xiz5pKi4ke/GNlHqPgZgRW/HRwv9dZNt4WaLE5zU6Kb7m2
	S0uQ5+L1kfDX7DvinopQCJEY/rjT2iOLi2RHrvjkri6ItB3zGbZ88iy34aDN8YcfqPcyR9ANcIqgk
	cvUYr0KEXPs8k4Ky0u4jgSr8du5rPXSstovD2JkAMUjnfzNzl6Mdrv3qLyqY35sQkq4TPWDGc/xbH
	oco6YyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyU-003qjQ-2e;
	Mon, 24 Jul 2023 10:39:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyJ-003qZ8-1v;
	Mon, 24 Jul 2023 10:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195163; x=1721731163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rYDaogE71dXTVwOGmKawoSDvGd1saOq3dhOykjCphGQ=;
  b=DJy/9I98QdnvLe/XdPntVyCuwQw3xvyFxn1BrGLyA+g507haCdA1SbZT
   9uslzSpwmCqiS+jEjEft+vt8w0LhBQ6HB4YA2Y09o/BaiMvKLXSPTrWvD
   QWHki1KDhzd4VLL82REr8K8hj8dCSTay9r7fY8r3/BzNK1PVm53X3oD61
   ojU1xE6S+eHH1WeaGqsPfCx/IXCDBTd7Es3Gf/gDHZ8McLyMuRNOLIh+e
   BhNKu4Gy7/QK+4Ql8wKspohD1/1SaAPIHDJNvUaaPJ/wfrIJI8tXq9hqO
   n4hFTY524cLV6QcN5YMT++SnUTxfGYxg0+B0Uwn3uJ14j1F+y7ekPeFmy
   w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078484"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:18 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 73E83280086;
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
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 3/6] ARM: dts: nxp/imx: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Mon, 24 Jul 2023 12:39:10 +0200
Message-Id: <20230724103914.1779027-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033923_954768_6235D850 
X-CRM114-Status: GOOD (  12.80  )
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
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 570995707504..11d9c7a2dacb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -26,7 +26,7 @@ backlight: backlight {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 104580d51d74..9fe51884af79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -29,7 +29,7 @@ chosen {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
-- 
2.34.1


