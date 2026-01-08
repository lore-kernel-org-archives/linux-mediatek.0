Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4744D185D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umNyXrI2ZeyzxxwZ/1XKsXXm7p8SZAfQvizgPCnLIWs=; b=F6P4g6WvfR7seRt4WGMDwDiYyQ
	QfZ1duelj98l0jqQQDldnk8gC9CI/sWTSR4qNINydJrOIWXy4YW7KU18cgHDtjtqTd3T7DyWOpGZo
	pvcDYsiqqiW+5CT4V9OEGgSgj3Gg3WH7sUVCgsX5LP3P8FrYLmg77/S9ilDX9IKJMxIrNAWuKXb+n
	dKKuYNIA2d1lYnaSeqFVP9nqlpO7325dZZDLxa4FocBPJjYjyPvzOhxpsSFrtOXUcCZWOCj2PXOWV
	YS2Djs5NxLRmdJDyEmoMPglwD4blOMiu9d4eC/JcZlwS+LAix3hS2bYAH1PYG7Q4MkpyJGCx0TIGE
	/PPyxaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmp-0000000GmSu-3GWM;
	Thu, 08 Jan 2026 11:02:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmj-0000000GmLb-3A9u;
	Thu, 08 Jan 2026 11:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767870151;
	bh=2+DvUYmYV9U/Yj8ZST1r0/xHoFeYFSLopr9bIm8GCoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMSvc9ks6g7641gm1YJtSjKbwTP7DWfNV+86VME4OIhW7DFPi7RblvD7CiXkbY8pT
	 Pb+O9clCJuV8nhiCQXDpuKaWJzhi6rGfgBOjA1jAqsa7TgIDz+k0WVvmRq/K3F2+3O
	 z6tpwjseHX/RNSZcOzp3BYm/aw7nA62xftTP0TXueV/xfcEiXhtxGNT50njuNXavD1
	 sFjcDWjVUbS1ZL7Sf4xwBWu1E7safjVralqz2YgV7lNOM34Yp086SfbYChYFhGO52j
	 OS6gaEfxOR+JotyD2akXoOVe9k3SsS4JjY92272to6orZvBJe/diUoeF7jWVlQd/oO
	 oV2ojqGhJqTZA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DABD17E152C;
	Thu,  8 Jan 2026 12:02:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 4/4] arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
Date: Thu,  8 Jan 2026 12:02:23 +0100
Message-ID: <20260108110223.20008-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030234_342564_30974F3B 
X-CRM114-Status: GOOD (  11.32  )
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

Following the changes in the binding for the SafeXcel crypto
engine, add a SoC specific compatible to the existing crypto
node and, while at it, also change the fallback compatible to
inside-secure,safexcel-eip97ies as the eip97 one is deprecated.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 7790601586cc..9693f62fd013 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -231,7 +231,7 @@ trng: rng@1020f000 {
 		};
 
 		crypto: crypto@10320000 {
-			compatible = "inside-secure,safexcel-eip97";
+			compatible = "mediatek,mt7986-crypto", "inside-secure,safexcel-eip97ies";
 			reg = <0 0x10320000 0 0x40000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


