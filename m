Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C7C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNjXE0NMrJzIN59/BjxEVSgtEJH2bC1mQg+SqFAOm5U=; b=1ugAmA8ShkzestszOY/PNW1wNn
	d/Y6yLhic4bOrcZ0Miy4A5iKUXJQgwe+69VTZrsHm0VKi6TTrAhfJQpoIIct+Hu1X8WW9IqVauPtC
	HNJ4d4JVupBAgBZKUNhdjDrvlI7ZXSDyMZ+bYlDIA1w2NrNkVNSIKP9LD/hwnBAcwhuy0elG1fGc/
	R3IKgvMjrngR6c0b0Pd9fC3I3t0yS7pMDylqymUCCS+cq1qEn49RimNjiDkpXZMpl/XPjU9o+Ogwa
	pXEhKOqJB1Q3Rup1YBuL6FQ0+uDU9zWHpS9oIfGMGOeZI9LAqSCq1gIZKX6JWbC+ee0pfX/LsW457
	xHqZAeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaMM-00Bqmm-2X;
	Wed, 25 Oct 2023 09:39:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLX-00BqPP-2D;
	Wed, 25 Oct 2023 09:38:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D389A660734F;
	Wed, 25 Oct 2023 10:38:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226717;
	bh=Nrg4W3/4J917pILWnR2UswnN4M0Do4Gs1SY6J/UF33k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jH5lBZHRgcrQysxfV79kKfFefA1PsQ78A0mZRi/sr0+H11XjcLiyM6Cz8C5sK36b6
	 SFcUDjm1rFRXQeNyxraGrEEbdltYAqFvIgHVW0CT9wdHyLSRwLBMwhMFLJKSk83Fhj
	 e6ovtmB2V7WEVisSZ56xfKjw9OLkWxoHQn0eMwWHZWs/Jc8JWXpypM9vbD4sc5eQK5
	 PxRdm6q60UmxaTVaQmxBv60ey8jKJFtImvEosHR0eguTTfULprdY4S+FOcL7vqom+R
	 SJiOul3NCLTKf4HQzC+Q0U2KkwBeZurWRncMeIioRh73kUZiwVmb+J6/Dc7rRxHT9L
	 LLbgy0sKwqUoQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/8] arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
Date: Wed, 25 Oct 2023 11:38:15 +0200
Message-ID: <20231025093816.44327-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023839_880528_E6C20074 
X-CRM114-Status: GOOD (  11.18  )
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

Fix a unit_address_vs_reg warning for the USB VBUS fixed regulators
by renaming the regulator nodes from regulator@{0,1} to regulator-usb-p0
and regulator-usb-p1.

Fixes: c0891284a74a ("arm64: dts: mediatek: add USB3 DRD driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 692e8173c9eb..0e5c628d1ec3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -44,7 +44,7 @@ extcon_usb: extcon_iddig {
 		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
 	};
 
-	usb_p1_vbus: regulator@0 {
+	usb_p1_vbus: regulator-usb-p1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -53,7 +53,7 @@ usb_p1_vbus: regulator@0 {
 		enable-active-high;
 	};
 
-	usb_p0_vbus: regulator@1 {
+	usb_p0_vbus: regulator-usb-p0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vbus";
 		regulator-min-microvolt = <5000000>;
-- 
2.42.0


