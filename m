Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E7C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBeiFM/g74J9FYOPMljB5gSkFxOWHAJj9RIBGuxI2S8=; b=Sryc5uQbpT++rJOmpUs8eBKqfG
	rKV8ow6Ak6dMngCdAU8RgiKuRo+NOJyMl+1uM4KEj4vow9h/+GMnkAU+v5ndNjPIK0Lr3yXDkVnTT
	yYLcyVOFC5AUuBtALYUPM2gj5nEksavdbCtAVDd5G6eNFTF0alSQvPuSQvYz169ZjshFdHfl/ufJB
	WazaOp4pZGxE0MvB5fI1WioccdqYmE20dAY1RT1fV+NsLz03dowEJ9xB9IVrCxMtqRH7agHAbHO8Q
	15QJnfWIfd365atolhOs0j90pwpcswD48G0dE0RPj2+O85kilyvDULgiEmtVQ9KAeBO2IEVfObcvS
	9/ipFXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodi-00Gg4t-2x;
	Thu, 28 Dec 2023 11:33:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodL-00Gfqb-0x;
	Thu, 28 Dec 2023 11:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763181;
	bh=3ZZY3CyyeCXrWyryOHnL40AqUpSsKrEdHmyGgsIpTAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fj/sUvMkC1z/STvO4qzjcvc2RKLueJW0WOOTFHMhm+jytveYzDNu10T4gaa6/C0iD
	 NH/Qw6jQTdzOkmz2Mzue9DW6YH+phw97Lf59zRe3g1EOZ7FUh4MzfhhlNkpcT8GdaD
	 DuwOuVmjI3ZVqeskO30JwejVtaQlsaRL8qw0xakZ6B2v2G1wiYHu0zMjwLp8XIES1C
	 9+i74YU7UNyWpp3pUlwvtG4wxk5ZXoGLGgq8LO2Bz+ccMACZPMvziszZgIa7RPT3Aj
	 mM3tz9VPBAHw/oE9njgkLqBgPwbNj8c7T3K/qS7VyLTPI9kislKo7D4fcNyy8EJR1Q
	 NdR/94LXXKRYQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 264C237813CF;
	Thu, 28 Dec 2023 11:33:00 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 5/6] arm64: dts: mediatek: mt8186: fix VENC power domain clocks
Date: Thu, 28 Dec 2023 13:32:44 +0200
Message-Id: <20231228113245.174706-6-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033303_519066_9CE014D2 
X-CRM114-Status: GOOD (  10.67  )
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
Changes in v2,v3:
- none.

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


