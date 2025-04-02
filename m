Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDF2C36014
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t155ZZPUicbg4MlR+X9lg7xDqf28T5G7woIho3Jzqo=; b=u4O6OSLGnvwNBUiv3xL3tYyua1
	0X+GdCsXrn0HQ5ZwFbRqy0ybF4zpCZFsI5dabh3NR0DlZFniSKID+fg6VF3Pvbfj74R12gZm9qOgD
	dQd1UByfi4FdF575YNjjKBOteUD8+1sZnVS8RrA8mbr5Q1HXvMxVMQOEkuuEjtN5FCCOSA/htxxub
	4NQUnEf7RTMyb9s5uUbg6RALnl2eX8UCCDoY1+5plpUKe8JIcWX4BHtkLU9aEabhTGiERenbcKJ7k
	I0GkENGFZFxC8yaZchZxUTsq356INkeQhJiQw4PX5tjjlSQAAdlCKweau7RzA9yFzXplB/q9FdZnB
	bv2UPZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu6j-00000005dhd-2ey3;
	Wed, 02 Apr 2025 09:10:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu3B-00000005cw1-3G2d;
	Wed, 02 Apr 2025 09:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584780;
	bh=LrSP6HWCbXK4Bjo8D1kqooNWX+Memzd4hQNwtRsOCSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDwGPBEnIxHePAI0uDznhxI//v/tqK7A7o1tcavd/q7r7aSTfFCj9v7lEpkeQUIv0
	 K8JRSl3B+G6c7iKM8Aw+ZXFtfxHwe+8WQ/ntKPwb4E33nPDbqXn50Z85b4axxuqF1L
	 qnbknoph9ntCI9q4CElHkaIl7IHtNPfaUiV11hfkWd3OaGbASSOIU6uYSmuAPh38Ff
	 sWIMPM7TDaf968ez+3TpqDyaec5ATGdyS2AQLF4zZApiZIlE3EySgALGnIxeClSy8r
	 9h2x0jMeLDSmYIOTud+RROm7rRu2p0EwYIzmVSQBGQLTsWvSpcC40n5Qiz0jgFy86B
	 9CBQa4vQ/wg0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B799217E02BE;
	Wed,  2 Apr 2025 11:06:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
Date: Wed,  2 Apr 2025 11:06:14 +0200
Message-ID: <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020621_984568_089911D3 
X-CRM114-Status: GOOD (  10.64  )
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

The PCIe MAC needs the sram to be powered on for internal IP
access and it has always worked before because the bootloader
on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
before booting the kernel.
Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
P0 and P1 to correctly describe the hardware and to avoid any
issue with bootloaders behaving differently.

Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b33726da900b..0cb96cba727a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
 
 				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
 					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
+					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
+					clock-names = "ss-pextp0-mem";
 					mediatek,infracfg = <&infracfg_ao>;
 					#power-domain-cells = <0>;
 				};
 
 				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
 					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
+					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
+					clock-names = "ss-pextp1-mem";
 					mediatek,infracfg = <&infracfg_ao>;
 					#power-domain-cells = <0>;
 				};
-- 
2.48.1


