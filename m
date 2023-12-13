Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3116C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nihQ7U4Wglb3e72hjPbejLu+5tA+PgAjmc1jdMcZQl8=; b=IGZ2l83U8I3qU4GCT7hcZ9ZQcW
	qf1W8ZrnmO7kaKolUkpDlhDduyJfOSX73JfXZc4ezFVi9f901/JKrm6uHzhulv/ZiIJrEOJszuzU2
	xkNQ4I2ju848O+11MByIxveC0y9u7TfKC9g7/NZaNCP3kpyA1TxkpfTTv3Oh9/wxQT0wuGyoK+3+W
	lrCZ6SKrHD/g2g1zGlYLk7vlJuwbjjumxR5IVNxpyC0cr8YihVSvaAds7CplMl8tIGRL7YtJTX2n/
	XHQ9zBNz9snHzuYS+cM843aZwJGf/6qQ0FGIvRxuI4RPUqip0Ctl+11gsyr4Ac6rE9RV7QSNRVXbT
	Bg1dalTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOEG-00EZWB-2o;
	Wed, 13 Dec 2023 12:20:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOE8-00EZQs-02;
	Wed, 13 Dec 2023 12:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470031;
	bh=sq6cDRiywOxX1Qe7Bu9qDWkMwmr+XoroGDsSXtkS8x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6E0U3xhmac1cySPgjPJpgD7OF7qxWWrKXkZ1vUr//tIhlx8v3Djz//RDPdwxozHi
	 8lIu7XybvfbJsuZvLhNbR9ASK+wWJyCQMPhr1L/F17gXSCioEBOh1VDOJn6DyLW3iM
	 9w/5gimvYx3Wa3oSnZMd0lccJuCoOugSBWUu9hJRCJrMrniaaaznsL397C/j4TDk+8
	 muzyOFPbUAjGDsV2njWhTcnzp980zt3HX2farmT7dTzKD++SALZZFV2OOX3eEAe87m
	 8jVE5U72HpD+bhinr63DHNsT04AezYbd2tG2QfUO+idS/tRgV+xyvD6q1L6BxB8WGM
	 rCLN0OTT8whgw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 32A253781486;
	Wed, 13 Dec 2023 12:20:30 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8186: fix VENC power domain clocks
Date: Wed, 13 Dec 2023 14:20:16 +0200
Message-Id: <20231213122017.102100-3-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213122017.102100-1-eugen.hristev@collabora.com>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_042036_194319_DC8DB85A 
X-CRM114-Status: GOOD (  11.47  )
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

The larb clock is in fact a subsys clock, so it must be prefixed by
'subsys-' to be correctly identified in the driver.

Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index df0c04f2ba1d..66ead3f23336 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1061,7 +1061,7 @@ power-domain@MT8186_POWER_DOMAIN_VENC {
 						reg = <MT8186_POWER_DOMAIN_VENC>;
 						clocks = <&topckgen CLK_TOP_VENC>,
 							 <&vencsys CLK_VENC_CKE1_VENC>;
-						clock-names = "venc0", "larb";
+						clock-names = "venc0", "subsys-larb";
 						mediatek,infracfg = <&infracfg_ao>;
 						#power-domain-cells = <0>;
 					};
-- 
2.34.1


