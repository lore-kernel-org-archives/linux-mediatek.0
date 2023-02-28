Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B13CC64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utYIURzb9H+PUOEgIZJBdC1OsrIaBrPSFsBOzSPfNZw=; b=redow8T1Up7QqIb861TbD6s20x
	5UBfve2i6ohjP7aOAW7qR5UyUQDJFgAdJhG8FCNRy0Gh5hQjlNzD9pJe3LLRd3y1X7n52Jf5SCfqg
	WIoJhr8ttBGCu0ENmAxtslprbJE7e5vxQvMyFRZkCvTEgr5v20djGEQlBgAaswmhqjGQ0Y0K/4Xwf
	HiqNo1ZaUG4r37+cQPThOdzzP9BsYIymaj5K/MVKDtMvJXnkPhnU25Q4G1dAXTWXY1zpAmDGed6Xk
	8IpEtD7aLUbzLKucBJVwgU+Hc7Bbfugd1AyFfxDr1JoThJBVGPmuY0In4OTSyzdXw/YSkl/XuAAr4
	edaVfv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxZR-00Cliu-8c; Tue, 28 Feb 2023 10:50:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWV-00Cjxs-Px; Tue, 28 Feb 2023 10:47:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 297D56602FD6;
	Tue, 28 Feb 2023 10:47:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581274;
	bh=2d8a1s6Yhde89pXYtEnq08v+ES25mvl579PIaEXQyEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ima4zDZiIey6aYeTZgcLCNjPNHGjugB/Df1/IfaoIYBEivRgbURpY7DngWKPpL4IN
	 bTPc+7QzSiOv44327eM+ZQGsEs0ewW2kgtQta4Uyp13ddd9/dcA5U/earYcBMoqJf0
	 OE9DgpcdUav5OgHsjnYuA+8LefTbmI3bwb4pNptqhYDU5Ui574U9YpEC0iVCaNQI8P
	 jidOEyEuUASIf5J+FmOL36A74vQj0OFbFX74LCWavpC8cPg498ZUx7daM1/JdlISJy
	 R184Qb853erFpVWQNLbFLeyjghIh/YcJhLQ/M/7gTOaN7tL2Dk4wJ2NcdbJTr7b9/8
	 aSFqUCItI9ftQ==
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
Subject: [PATCH v3 08/18] arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
Date: Tue, 28 Feb 2023 11:47:31 +0100
Message-Id: <20230228104741.717819-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024756_016470_64101F47 
X-CRM114-Status: GOOD (  11.96  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 34631adc52c6..a29cdff8a095 100644
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


