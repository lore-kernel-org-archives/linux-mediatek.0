Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C101C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFodwNjkGZ1lyGhzePUOFTfQWduCdyntXt7qDWL/GFo=; b=hd2atrk1mgOH6pHi+xD3XkdhdS
	h/u2rgBEP/RASxDl7lJ9AmPilCL2fVyYMPNrJKxxIFHhgc2VGwVBCmyMe6ArtYYnnrzjQOb5mJMdG
	R8MGFYyDfo0XSamvtwJ1sy6ohp33wTN04igitlrBh3CALljhImITzQUW6nXlELNd1Q4YiUGhzugjU
	hKZbvhCj95s/l2QkZix/Yl+N9vWEf76qGBGfXCW2zdRYd4DJ7THTbDQL+vdTvBHdeL7ByLph09Rvq
	zisBC+9zi7UHPc6xx5R3eb4sRsKqo3RzVdXsn4tTrVkBzeHjUUQTq5PrDPuwrW2dTsnFTECKe8fg5
	dCjd5kqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2h5-00DoX8-0F; Wed, 05 Oct 2022 11:36:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gc-00DoPM-Jb; Wed, 05 Oct 2022 11:35:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B07E666022F7;
	Wed,  5 Oct 2022 12:35:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969737;
	bh=PxitsQwCWAwAr+2+HSMcJXNyusgMJ8PPadXjCl+pj+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NEheWfddh4LNq6ARzKNjiAA/5fLVUHYP8FRaitDeHkLNj/SkrvbjAFn5uJBJqD9rI
	 yxz2m0W8pzBWIAhnTOxAR3eAYgPjOFABaEfTTFNp2w++Bry2p4gu5s82O6hnT7GSkj
	 Kf6Z8EKdp8PfsuKLEeHFf/MQ/4j70/JDLKzTIHXI6CK3sys5itOL2wZ6CW1EfwRM+T
	 FXHdmRSwpCkqIX8twgKxsRjPWs3Coq+QQ0XxR/Jesg12UTLlFX/wr33O9dsu/45Iup
	 heuKdxarORmrdQtiUNUwIl2YRm6wWhnKAYFxKUv2ZA/J9g0i9Vd7D2S61F4mWnZgk2
	 FtYcUnLWEZ46A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com,
	seiya.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8195: Fix watchdog compatible
Date: Wed,  5 Oct 2022 13:35:14 +0200
Message-Id: <20221005113517.70628-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043538_792551_6BACEAD7 
X-CRM114-Status: GOOD (  10.45  )
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

MT8195's watchdog embeds a reset controller and needs only the
mediatek,mt8195-wdt compatible string as the MT6589 one is there
for watchdogs that don't have any reset controller capability.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0b85b5874a4f..58ed83d97cc3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -683,8 +683,7 @@ power-domain@MT8195_POWER_DOMAIN_AUDIO {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8195-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8195-wdt";
 			mediatek,disable-extrst;
 			reg = <0 0x10007000 0 0x100>;
 			#reset-cells = <1>;
-- 
2.37.2


