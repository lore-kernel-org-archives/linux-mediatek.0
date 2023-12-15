Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC10C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXjBWxOEF7mlppCMxEYI67u55dHKI+aDAAXS3eAqO4I=; b=Jc9deTXxts3gzAIUIrYAFoTsmB
	iYWdag+q14gwtXTe0LCjXYF2k7Ql6CUCBwV7YLbycSfLSljMk2bWDOj3EkBuBe4hhCDp0fuzs4UXN
	s+FE2+B8zOQbfrI2LwPuMN5cdN8d7jbwdEGnn+PBW8NXj20nwgXjVDsSWjoTP/YSsoVraebe57Yfa
	CLLCPTn0QhKR3B320KWY620hDdc+MjJHD7xGQt/CEHoc7/Xr4ad03Mvkwfbj+ftZD03P702AJujJP
	M9Qu3h9wv2wcWOgbLqgclhXW4KOPRl/YLHXIXzs89ySQZ+HfvBURzR5vLe7Ar6VnXGb1PP2XkhQjs
	+b6soD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5i2-002okc-1l;
	Fri, 15 Dec 2023 10:46:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hr-002odl-1x;
	Fri, 15 Dec 2023 10:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637169;
	bh=7++2TugOuHBscBWsZZMksH52fjmuIFEskx09aH3Ys30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzfpBTQBc6jdcVCXkrYHf/DB73UDXAgYxMpB4zdubXqQk6gqm7xufDuIzDI9Eb4Gh
	 X9dQNsWyvFfzw/M606wMrQS974OEISUk9cWmbVzXZe2sMcp+OW3NH+SlJdCmZf1744
	 jr1yafbqlvIpCZxFp/S10MthewqPfztEU2kc93XKMgmJlUkxxkEhrQa9vRcniteDLw
	 vTA7yM6D09SwmYUI7UFoKr09tVbH5yMy+kziVSBn2pWrVGsA7y47i8xEqtPcNwYmH8
	 9tutou3gHpRbCBjO4iKR+7FQPNWit3PfjtZaXnBHOM6UrMRjvTgHgzbCpZbyQj9OnP
	 RMW7KRghQGegA==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C1B0F3781FDA;
	Fri, 15 Dec 2023 10:46:08 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8186: fix VENC power domain clocks
Date: Fri, 15 Dec 2023 12:45:50 +0200
Message-Id: <20231215104551.233679-6-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024611_771118_1FCCC3A5 
X-CRM114-Status: GOOD (  11.15  )
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
Changes in v2:
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


