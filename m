Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BACFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Yj3BYNOn9wIrcoe8cJxxmv0dF4trO/pXNCjnpdbhmY=; b=T64iCPXa2ssEL6Zvob9M88AyMB
	CZE++GdyLpy06qRpJZig0hRhVukWdwl7L4ln2PgnLWDBFpCsTv6eoMVUPl+Q4zyN14qmKACj30juI
	ju2QIf1YXfKlZEBHLhY0YegEokkPeZHFHwwckGsXOeHtr+GpfMiqKMpsIBjbF0+1IazsRXhdEKvm6
	GPCzNqzLr/JGDMFCd+cKyMO8h0ZsXebFkKaN1QFQiq+RduYPbwrGdIQqZVfTE2Dnw4TROQgh0UkVc
	C5PmEdGsgmsMEhUmgc5lRp0WiH8hT6Urcym2FwGdQH0gGHIqlMNsmTtHQrirmuM88zdMQbKuWWVxc
	KzfYwrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj045-00CGK1-7o; Thu, 13 Oct 2022 15:24:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02S-00CFZZ-4L; Thu, 13 Oct 2022 15:22:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F7166602369;
	Thu, 13 Oct 2022 16:22:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674540;
	bh=sHR9hQ308Hig3a4nvi1jX0nnafCsL5l6MhkjxYPM6T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEChSI6KoSB8QZHNDonu+dSB8IQ0hLxCm2DIwfgZ5L3Ky4DCOKM55iEJrR5ZzkoOU
	 3BbpLh2OCNXI2k2zpRAOsFIV+RwEQgYj/LY/Ab35RaP1n5LRghU/AYRms6QdHsTy+H
	 7IITjdUTC1Zd+psmICFBJ3jxzfPS8lWIL6MI2TLP+WLLwBuMShDx0il3yqv0LeYzmO
	 meKAvP5+iijrS5krbVlLasd1rhNrit47EXjUVzbzzeHD+nUJCK+JjXhCf5x+EqrXTR
	 4kC4/WxbfaHW2dL3X9ciQmO+0+AzvWeiu3aepWe8J3eKQFsJfyU2AhBuVFsDPTNXp4
	 6uDOsmj8aXpNw==
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
Subject: [PATCH 1/8] arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
Date: Thu, 13 Oct 2022 17:22:05 +0200
Message-Id: <20221013152212.416661-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082224_387675_74B52F0B 
X-CRM114-Status: GOOD (  10.22  )
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

Rename the oscillator fixed-clock to oscillator-40m and remove
the unit address to fix warnings.

arch/arm64/boot/dts/mediatek/mt7986a.dtsi:17.23-22.4: Warning
(unit_address_vs_reg): /oscillator@0: node has a unit name,
but no reg or ranges property

Fixes: 1f9986b258c2 ("arm64: dts: mediatek: add clock support for mt7986a")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 72e0d9722e07..599eb50c8a5b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -14,7 +14,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	clk40m: oscillator@0 {
+	clk40m: oscillator-40m {
 		compatible = "fixed-clock";
 		clock-frequency = <40000000>;
 		#clock-cells = <0>;
-- 
2.37.2


