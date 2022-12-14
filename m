Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D188DC001B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y+sJr2DzYMq8h7VXUpDgrGooEfhLJbI8F5DbSbmHDY=; b=wgO6M4/2X8CUIO1peY+l5ERo4l
	hvQ6qQGsVgpa5NkN+UBthwl7gMOjb2e4AcKNgxBPgh3YD3Luvqx53456BVsUxse3WseK96iNF2XJj
	8MCzB4PKo4dR19bmGvliPFQHGf8qV33JUvIm2eglFlaB1hb7chjebGywZiHsp6H8kCuyH8vlLsRzf
	LoCKqHKmhNVMcB6+KY2JQgkzqIdbpqUNZMckd0wCRT6yR7MsOogASgPCocnx79+rAb2SEHEwDQ/3+
	MDZVmVoJ9HPIrxOlSPULfG30tMmjgx6qbGr1wx5lVRdP1Xa9mAMM565mQMaL8ihmL9ENwhbdEEmIg
	WwXR8YfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RlT-00GjA7-5f; Wed, 14 Dec 2022 13:25:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RXq-00GbT7-Ti; Wed, 14 Dec 2022 13:11:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C72106602C48;
	Wed, 14 Dec 2022 13:11:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671023492;
	bh=QTKESx542e6FJD6rGcbgjaPumHHCtgmxbjfUwumu8oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8nGE4bfc9ypr98vsy9szzGgqpXVzea10EFDG0sAJTxgBqgCNstIuI+X378rFF+d6
	 YDMmawKSys7soiqcRZpDkV+lbIsV80MR15a1X2rYiM2qTprBHZeedZyEOSBLmtcLCv
	 7Uhcc3vo0eT4H8DpN+5ejl/Wkeh9+2U0sbso+NpNBTIiy8/LJrf+bTAKVm0J6fikp2
	 mbeHCuCUp/tHNwWh6F5vwoybswV0YkKyIO865xsWv8xpIS4tWgMG/CjjhqN1miS6AB
	 XNIQDSVIZMHN7GdCGTQ6TKsatkebbqYmAaosZBHGn8skt4HWKvBajJvuZ3j7o4G3OY
	 xvxYmvUixEB4A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tinghan.shen@mediatek.com,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8195: Add power domain to U3PHY1 T-PHY
Date: Wed, 14 Dec 2022 14:11:17 +0100
Message-Id: <20221214131117.108008-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214131117.108008-1-angelogioacchino.delregno@collabora.com>
References: <20221214131117.108008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_051135_149594_205D74F8 
X-CRM114-Status: UNSURE (   8.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Assign power domain to the U3PHY1 T-PHY in otder to keep this PHY
alive after unused PD shutdown and to be able to completely cut
and restore power to it, for example, to save some power during
system suspend/sleep.

Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index e61944510b8e..131945c44dcc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1549,6 +1549,7 @@ u3phy1: t-phy@11e30000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11e30000 0xe00>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
 			status = "disabled";
 
 			u2port1: usb-phy@0 {
-- 
2.38.1


