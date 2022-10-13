Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF7AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+cOdEr4dFCKTviuEVCYO54ebA99qxMq57p3B+s8gQI=; b=zg39LYV08FcGswM685q+HtyDhm
	LxGflItHojB2At8zA1Ehnt8H62qsQoCQVyOFqfmETN7O1/7gs7mjnA/F9J0rtDZIPvYRkEbR4cazE
	M8haJk2AkhdVF7/OebBpVsJemxHNgqV/Ty1TZL2/iDqutRMdid9dQnw14hgdaRpOuJPA4hf83xYi/
	/4QJbku6uk/DUR8xlM9h3/gLc4SflndTVkLN+gCgmX8yab6uFJWKiN8tLGCkz6TByYPkBSm9CCY4p
	MdvIGMCSuQXBNXR/FCJekQsrzimBlRTtv2xSdXac9UvPolN2ahs4ke60NCjGdP5QSbRKWAj+nzzUE
	KUSz3PUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj05b-00CHCn-3v; Thu, 13 Oct 2022 15:25:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02X-00CFeT-GZ; Thu, 13 Oct 2022 15:22:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 161016602373;
	Thu, 13 Oct 2022 16:22:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674548;
	bh=+rfRhqviBfuKmOoLPSppiW+1QAksWGIE/oQLWXDdMpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGkad3uGwfKnQvfXW+y3PBWPg9rcKm6x2zLEgBvyT06kcJCscitnyG0H18rYVm22I
	 QeCwMM+Ik2q9hpcHaXPwaIxoCzScAnvfaiM99GORX+2pkOblr9poP4E8LU3aq679FD
	 +JDMAu3YFukRHXYaBJPb8o62hXF8fZrg/dA+djWt8f/1pkwGgQKOpbLA/EyYBmlXcZ
	 IJxY0l/pt1LKU9hinIaUEAUNug9fXAjLzHGp9L+qqOIQCcFtcWBRegaypUjtV/ymKC
	 k3hzIzak1WfGf7SjC/AOmnwF0pH+xspBt4gyWydItU+wBj7s1r7yPZONeuPaTdSWDN
	 gfV12YXT9w8wQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sam.shih@mediatek.com,
	hanks.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	zhiyong.tao@mediatek.com,
	andrew-sh.cheng@mediatek.com,
	viresh.kumar@linaro.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	mars.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 8/8] arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
Date: Thu, 13 Oct 2022 17:22:12 +0200
Message-Id: <20221013152212.416661-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082229_746323_11A0B018 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Update its unit name to oscillator-26m and remove the unneeded unit
address to fix a unit_address_vs_reg warning.

Fixes: 464c510f60c6 ("arm64: dts: mediatek: add mt6797 support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 15616231022a..c3677d77e0a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -95,7 +95,7 @@ cpu9: cpu@201 {
 		};
 	};
 
-	clk26m: oscillator@0 {
+	clk26m: oscillator-26m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <26000000>;
-- 
2.37.2


