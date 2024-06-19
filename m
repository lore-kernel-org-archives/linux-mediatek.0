Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0519DC2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BivpamxvPz+d94+LYpCyra9/U4HNUaPzhyeoD/xiU5s=; b=rvBGadKhnMTiOVRpz8Bj4Cu/7d
	BvE5DVResMLh57zmfWFAAJevPqOEUI/+Kr/npzpqBc36fA3HEA311f+F2MJWFY2UIFjggdao4C8lQ
	+Tup4yAmRt6o/r2qGp4Pu5T8cSszjGAiUUtyDQ2YmI9wKrYf3yvOxCS7T/Nu8COkLj+ANq0HIkkXA
	coEuFlUOR5MoFv/uNowjx2UQyyhf0KuNTHdkrKz2HswLjpG2/bibAc1K/Fdu4gvovam4797hUtkOt
	LrdIkS8LbOYXiq7TncxRWr5nKWX1z3hjSqkIKfp20zyabwYe764WF9Y/HtUU6mDgN5WA25p+WssPT
	frGbt8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4S-00000000Sck-267f;
	Wed, 19 Jun 2024 08:53:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4N-00000000SXV-0LnX;
	Wed, 19 Jun 2024 08:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718787209;
	bh=Tj3Ro2wAPS6ZAo5FEGtQ81HlMt4MROS7z6+Hz6sXCWg=;
	h=From:To:Cc:Subject:Date:From;
	b=ENU22EDjOQk5Y+EW/OT3/ec7eZZUol0SHRbqwKQXmvsvG+I8BDx3o3t0VnlowIV89
	 z2Vv5t34eFBiMuIt6RCl4ilBL5KL2rv8nYpaOYBdDNcDBtXv2NjjlSTbyM/scuy6z1
	 /DvhTnuNyLS08aqSwiNOtLLON3Va7yadwuI/HXCUAluX42EO+o/fxoMY+BPYQSvzG8
	 dm3Ts+GaVNMY68vBCZmHi8mchiV4snMBOFAVslEereE3SVrS4USdtDMze8u69nSqLf
	 ge398dWfJJ9uIp7m7SlKAYpMw7cJw6j29LPMLqnLzo+ynxvfGsbGPPG2d83WBBWOsq
	 5pNOFShnrzHBQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 161C3378020A;
	Wed, 19 Jun 2024 08:53:28 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jassisinghbrar@gmail.com,
	garmin.chang@mediatek.com,
	houlong.wei@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8188: Fix VPPSYS0/1 node name/compatibles
Date: Wed, 19 Jun 2024 10:53:20 +0200
Message-ID: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_015331_440167_B73D4EF6 
X-CRM114-Status: GOOD (  10.39  )
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

Like VDOSYS0/1, the VPPSYS0 and VPPSYS1 are syscon nodes, as
described by the mediatek,mmsys binding: fix the node name to
be syscon@address and add "syscon" to the list of compatible
strings for both VPPSYS0 and VPPSYS1.

Fixes: 9461e0caac9e ("arm64: dts: Add MediaTek MT8188 dts and evaluation board and Makefile")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 3b02170562ae..77c4f2d104cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1331,8 +1331,8 @@ mfgcfg: clock-controller@13fbf000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8188-vppsys0";
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8188-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
@@ -1349,8 +1349,8 @@ wpesys_vpp0: clock-controller@14e02000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys1: clock-controller@14f00000 {
-			compatible = "mediatek,mt8188-vppsys1";
+		vppsys1: syscon@14f00000 {
+			compatible = "mediatek,mt8188-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.45.2


