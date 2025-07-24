Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83837C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G145UWRCRex+BS+pR1KpGGq12Cf0I9IsF2ccHjD2WaU=; b=TG7P/HRrFZBGoF
	sprsFzcSfd6BYTn6VRXZxWYVDQKKTSRGr/52fTjfMwi7bht1IC8tqv7vbPBVX40PFLordSCFqEczp
	+bzuDXjA2AorF/eqz7pA8/SiYO4Ljwgb1OqMlQp8UEe85PiGuy3PBSuTY+PzCh3wwXalkQI+K8HZh
	u9dOKL0vM0fywm+BhVnC4aRI9aPFC5QFHzwMA1IDahvA28njYbNjCvcLPW6e/PR061A2J8nS92pII
	G6t8fkNRwOddCFDH2M9EBhSne/C/Kl1nOjoZ59uPFbt8AgUnyLVgk9sJ4gNSsPYz+ycT2XVpAYOOz
	G6/ntwY9BkC+7bWXKngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesa5-000000076yl-2FmD;
	Thu, 24 Jul 2025 09:49:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerV5-00000006tqP-33tm;
	Thu, 24 Jul 2025 08:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346426;
	bh=tywNfUc5hMA17GgyzX00W7JAF7OL9B5T8aE+/2RSWWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNyq6E8Vj3fgcYuIbvQjaLEmve4N2FgVaLzaQLVxQ0jEhimWKlbdGQGD3/fZW877l
	 DkOSQEKUzNEaojXUjC7l3yHFTV0F6x54lD1ft0DjYgnYWf1FwRSkF7d9Al1Ri02+lB
	 GZNNT3USU9B9aKflscPMqTgymt6TbFOAo8vwe/+u8CfI99tJKibx61ZM0UdzV72q88
	 9/a/1Jifv3ZAJy9bjQkfopIPxbbEorurjD7EldiS7NptQBmIbTrjFxSX+CgzymFtpg
	 fmNpJnlnFdSLaOmeHEeYYjQd4NYZe6Ov0YKi/E/oVRak2Pgm3513SVt+NePLtBOlbL
	 8SLXVQKs3WRSQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E495217E0FC2;
	Thu, 24 Jul 2025 10:40:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express T-PHY node address
Date: Thu, 24 Jul 2025 10:38:59 +0200
Message-ID: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014027_912469_ADD9B443 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The PCIe TPHY is under the soc bus, which provides MMIO, and all
nodes under that must use the bus, otherwise those would clearly
be out of place.

Add ranges to the PCIe tphy and assign the address to the main
node to silence a dtbs_check warning, and fix the children to
use the MMIO range of t-phy.

Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 559990dcd1d1..3211905b6f86 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
 			};
 		};
 
-		pcie_phy: t-phy {
+		pcie_phy: t-phy@11c00000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-			ranges;
-			#address-cells = <2>;
-			#size-cells = <2>;
+			ranges = <0 0 0x11c00000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			status = "disabled";
 
-			pcie_port: pcie-phy@11c00000 {
-				reg = <0 0x11c00000 0 0x20000>;
+			pcie_port: pcie-phy@0 {
+				reg = <0 0x20000>;
 				clocks = <&clk40m>;
 				clock-names = "ref";
 				#phy-cells = <1>;
-- 
2.50.1


