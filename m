Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49879C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ys7+gAx0aNBkte/FWD7H4VU0J/Z7WfW29i7yuLuFcpM=; b=lKBhu/4/yOUADNNX3iXc9z5i+r
	3VVdKRaWMctgBWe4Q8m9U3FqP8LBXrQrmm2yiX0nU/RAy0asvn5j0zIo0WorrAVyxg1bYIcNsbkEf
	mmr3VBB5nBROUHLecyWIg1FFtgE8f+DxmKC3DpiO9wRIR7zuGYuWe75viLz4tbmEdkMT8i5SU0XwR
	OajxUsZvZXJmne3w6WquX93tFPs4ZOvp9RZJpXp7zJFVAllPp7ftbMdgHV53GYhDr/9ZeC9LEJ3Zp
	A6pzhbwdZgN9uoRuS+uMfz4rXDN5uB5hmGXFFpC7z7JOc0KX0L/haKxFz9U0FSWH7W9Db3tB7Gxtv
	2Xd2cPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6s-0000000Fb0W-3gOA;
	Thu, 15 Feb 2024 09:32:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6S-0000000FalW-04RC;
	Thu, 15 Feb 2024 09:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707989544; x=1739525544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ys7+gAx0aNBkte/FWD7H4VU0J/Z7WfW29i7yuLuFcpM=;
  b=DUtk2RS1rYv7FVT8CR9IMZbxGm3Tvc4MPkzeJo/SgXGVT8LzUmJM8Xjj
   GvXdEmXuxuNWHPHuIZEWicgVhjz3weFlOVWsTxPQ3bOQO6X4ptfQ77G1o
   TqQZmWXZ/fry7NVzGFIGjf3SPEgGxuleoNLk3r1S1+bqdfrg+cellZFCM
   /W+hwHFX6/w9rIc9InM+Gs28X7ljo74CSUduw2Iy2cfkU67lNOIdXhulf
   sHl3Ick6RNZXL4kn8x21eKhY41ybyl29ZSZ2+nSwfZ55CO7D/3sXkCPAl
   IS1iwV182BaliF48YjtB6Y1lIY2K5/P5KYRadSMKysXCyddFcw4f2t8u3
   g==;
X-IronPort-AV: E=Sophos;i="6.06,161,1705359600"; 
   d="scan'208";a="35420060"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Feb 2024 10:32:16 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 60DA6280085;
	Thu, 15 Feb 2024 10:32:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/2] arm64: dts: mediatek: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Thu, 15 Feb 2024 10:32:14 +0100
Message-Id: <20240215093214.796821-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
References: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_013224_489599_103DDB46 
X-CRM114-Status: GOOD (  10.92  )
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
index fffdb7bbf889e..0c38f7b517637 100644
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
index 0e5c628d1ec3e..3fab21f59d183 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -41,7 +41,7 @@ hdmi_connector_in: endpoint {
 
 	extcon_usb: extcon_iddig {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 16 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb_p1_vbus: regulator-usb-p1 {
-- 
2.34.1


