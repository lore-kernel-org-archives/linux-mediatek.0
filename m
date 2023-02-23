Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUz2IG5jeCpjElVGdpDv/DJnnYHnsQ+3UYbwkQko2Fs=; b=BcZWxkse92bsuFNXJtA+HbMplW
	nXOxkXv4KvgjzAHehkvFb8gPnGyXYKLczH3kD6f3KQEC+uoCkqAQjrBYe0o97xAJigR/igPoFLIav
	7X7emgu5l/UaBcwm/2yeF0/eUK3bUM7ydRP+eHkYywecP7AkxOrR8mmploTpm41yKQmrxxZeD+2ti
	4uueStxSTKOkC2w3XuulNdD72n+PvKUnoLY6xvuFZtUrw97mpoGzYNZU89SZm1x9XJImi1JhZz2Z1
	yzXM35AjulTokg9PIEZxTIAYbHyDSFwoAEHKYx0jpQE49Z1HiWCw9DSIb7xiK8wF6Eyw+l/2TL8SY
	Tvi1TnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC0O-00GcRn-9R; Thu, 23 Feb 2023 13:51:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtC-00GYMj-B9; Thu, 23 Feb 2023 13:44:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A393F6602206;
	Thu, 23 Feb 2023 13:44:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159841;
	bh=6g8YPvF/fQJS5t/oA/EETjTk+HQtvnCv6Vgp6i8eIQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=olJwAFq8rMEugAKgzqCigXxF1lW8Eay1JbWHmSlV4HDskIQBZrXRRRAWAow44fToM
	 vNkjU+8q22aZ3/MqahFDM8H+XSNRafzhCkx2SkpoSX6b6OZWGqTJvxQ/iBOVp2Lo2E
	 9RKGGai6eQVK0spdDPwBmK60c+fb6eUNdvVq4tvZ+xI9IbM2juHB/De/rUSh3J6PpT
	 483cZXpcC/YXHTg/5dWDLfwLlqn/g1eb0tccKs4zvO9yP0h8twNP0hK3+9tkR9wCCh
	 OZzB5+8KC6sc/lzOQ64UW16bsDx2O6f3guAT5XESplrs/fR2BhlhrxuyIh27Wnh/kE
	 QX7qEFTv3D3ZA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 08/16] arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
Date: Thu, 23 Feb 2023 14:43:37 +0100
Message-Id: <20230223134345.82625-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054402_592737_00424C05 
X-CRM114-Status: GOOD (  11.53  )
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

The mfg_ref_sel clock is a mux used to switch between different "safe"
(and slower) clock sources for the GPU: this is used during MFGPLL
reconfiguration and eventually during idling at very low frequencies.

This clock getting turned off means that the GPU will occasionally be
unclocked, producing obvious consequences such as system crash or
unpredictable behavior: assigning it to the top level MFG power domain
will make sure that this stays on at all times during any operation on
the MFG domain (only GPU-related transactions).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 2a3606f68ae4..018d48f7d3c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -499,8 +499,9 @@ power-domain@MT8192_POWER_DOMAIN_CONN {
 
 				power-domain@MT8192_POWER_DOMAIN_MFG0 {
 					reg = <MT8192_POWER_DOMAIN_MFG0>;
-					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
-					clock-names = "mfg";
+					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>,
+						 <&topckgen CLK_TOP_MFG_REF_SEL>;
+					clock-names = "mfg", "alt";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
-- 
2.39.2


