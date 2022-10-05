Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11374C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/Sip5g22V3Ywqlq7n5n8iiJYVll7574XtxKWLPeChk=; b=PxhsX/VkQHQbLNmC9wXgXXHmTf
	jZ3XY1buejTDSa59F+y0BdTXicdyzhCjzsAOSf/zwLexjqWChYLHTWwxwIWmOtXYPgaEjVsUPbS9N
	Tzu1mkQtGv1y5qWWgSY1hvO1PFjwyjlxzLk0qz3ezyl2C1SttPuYcXsUvhKEN6xmTytTt+sefPmq6
	oEJAZEWE165aU3iMQ62hMFmODobe/BRWS1HHdtwPyo5zC5hdQbFanEkgtWl29P0QtOVsePRvsMbea
	bXKgaNTpCAIGzNf8g9tuNkcUtxGm6gfrY6JLQWFsh77By0pk06DH0Eh+G6/mSHJMYk1+h+Bs84Wuk
	+QQ2MFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gv-00DoU1-T4; Wed, 05 Oct 2022 11:35:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gc-00DoP2-AT; Wed, 05 Oct 2022 11:35:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE1ED66022F1;
	Wed,  5 Oct 2022 12:35:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969736;
	bh=Q22qlsylohLOvHhECyt/assrAuDmWPjWk2cOuhRGCXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sc6dPw450MLDFyHObUnLsbqsQrO4dPvVuEqNpPlk51PTc5TDJoSjKz06ZTyqc1v92
	 ksat8+Bsks9UdmG0UHrQNC6BGTlYFkrUC5FCmyNm+2JIfwiVVH3OBZy2rGC8qxm0wq
	 XO6OxPpVcc8x8RWU402+C7UlSV+4y5ozUp8MgSywBKyNa713PVivvOOUXViayN66oV
	 X/DMSQNrTZKnzR4DnEq8tH/Ex3dmh1s/jm7sUeOMWy8vD+WTAJqnSUdzBTgctCyP+A
	 hQk3RKKdQuA6vB6R+3uzg35DxhfmwGwfKdyYrpgso4LYmkktQwXs+TZzznn0BZTXOI
	 k0waW+yM8ecOw==
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
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8186: Fix watchdog compatible
Date: Wed,  5 Oct 2022 13:35:13 +0200
Message-Id: <20221005113517.70628-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043538_594494_F5D76C13 
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

MT8186's watchdog embeds a reset controller and needs only the
mediatek,mt8186-wdt compatible string as the MT6589 one is there
for watchdogs that don't have any reset controller capability.

Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 64693c17af9e..e4366144cca5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -330,8 +330,7 @@ pio: pinctrl@10005000 {
 		};
 
 		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8186-wdt",
-				     "mediatek,mt6589-wdt";
+			compatible = "mediatek,mt8186-wdt";
 			mediatek,disable-extrst;
 			reg = <0 0x10007000 0 0x1000>;
 			#reset-cells = <1>;
-- 
2.37.2


