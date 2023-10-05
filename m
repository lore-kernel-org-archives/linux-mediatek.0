Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E12E92709
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xtq4cvGyj4ibeJvGrdOtUfEP8JHOqMcyoQc/bYmc6/Q=; b=ZoRF+j9ByraEusPwZkE04NBn3I
	SABfISyddCBq32TG0/8EMCXfM1EGNUEssAxy/9/cAk9uL07E+Lgl/VhwzAN4gjWw/971cEWg9YKaX
	4MLxuTX27AIfnCipHDTKnakM4asv0oy8Z6pQsihKNJddVH2XL4+gYqdHa1xFkHyou44SB+Pd0brw0
	V4ydAuv4T/ksoiXvB0HOWocuZg52CAdSoeqOIhcV8d/Gik9ZVnsYuczd4H68PP75PEQUS5lAA8cix
	rvfg8L+mOBL2UN5OcCgFRw/N5JW2On8R3Jg7WexH3hIWKwWc8xsnBoPbq7GfyG2HEHFAmQ1TNd/hc
	umQ54ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQ1O-003r7K-2r;
	Thu, 05 Oct 2023 15:12:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQ1D-003r4j-2O;
	Thu, 05 Oct 2023 15:12:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2DE7660732D;
	Thu,  5 Oct 2023 16:12:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696518722;
	bh=VBFKTjiNCnNwwAoFy02bMZNOemRQrfnC/BPWmnBVK3o=;
	h=From:To:Cc:Subject:Date:From;
	b=DAEtMdH+XM4LZP5BEIsVoqnN4SZGGBi66jbaSvzqPi2OdC1uq2t2SEhy4gzJvTxyX
	 7wYc841bLGO6ucBQvmh4ItMWVIs7/CwUfVaewl14Sm+d6TnOgIV13mQmFbru3t3GX0
	 BhuosJlMH3twywFe62sZjf36HmuyyHfGp0GWLybrF/I9tCPgrSpPFSnIEoNb7Nk1uU
	 ghzFVc30ItxgIMIyJzgF7z/tazGiuDMX9PMphlRcO23irAwnSy1CkyNMb3l2UQn4mb
	 AKIi3ZSZj83MIpcuRe1AEzcpWcOyxFmVXzRInNsBaXAzdraGyiUqla+24yr3DJj0UV
	 ZYPKCDxVuuiig==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: mediatek: mt8186: Change gpu speedbin nvmem cell name
Date: Thu,  5 Oct 2023 17:11:50 +0200
Message-ID: <20231005151150.355536-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_081203_914981_73583D45 
X-CRM114-Status: GOOD (  10.75  )
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

MT8186's GPU speedbin value must be interpreted, or the value will not
be meaningful.
Use the correct "gpu-speedbin" nvmem cell name for the GPU speedbin to
allow triggering the cell info fixup handler, hence feeding the right
speedbin number to the users.

Fixes: 263d2fd02afc ("arm64: dts: mediatek: mt8186: Add GPU speed bin NVMEM cells")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index af6f6687de35..bfc3669141f2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1659,7 +1659,7 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speedbin: gpu-speed-bin@59c {
+			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
 			};
-- 
2.42.0


