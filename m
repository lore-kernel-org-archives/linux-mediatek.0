Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C858AC64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5X0eqramAMz+tYV9t3z/PRvMrYdEJZZalH63bZ/oQU=; b=DJ6wYxhHOeJnf/P5u8Gu8945W/
	k9scb+qjvZnwNbxA3au/PgcutuUyIe5ppeTdP8QcoMqkFkBGDLsdg6+9drr1KRGxN33QyBe4fBnWp
	zKYP3HhGaXbJo50c23VpYNIEBlkrC6CrTJ9OOtZO2xImIJFdyqxBDcnSY/bim8uPk59P9qzKYKCFt
	vRmGOY/+FajlLVHvR88OOonGNyCAYZTMWeMCE7c/cDp84Wuk6TcDxgC8X7OxRAe4fRZH4K26AlWBb
	uPWrlbSZx2jvQwXOP9cqKSCdHDsQ0K09ipjnjKnhQBtu1x8G8AfcQAxrPJwzU2/IxWUzgNZwej5Bp
	Zipazb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJCn-00FeI7-DG; Wed, 01 Mar 2023 09:57:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBO-00FdLa-HQ; Wed, 01 Mar 2023 09:55:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A601E660212B;
	Wed,  1 Mar 2023 09:55:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664533;
	bh=7nrUbCRYVnwYMTUi2s51QYeV3DhvJQJoBM8PfyrS3Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiKrMvBDndF+/nbyd9BX/TRNSJ9R5YKqiJkhLQ9I7aJRrFLJukVqSCAF4jmwSzz50
	 o4UKRFGE2FP3hW9jL8i0lpGBGTa7NOqY8D4us1fnSglIJ3GRltz+u+d97wLsowuQfP
	 XC+AYNziGRftlUVAzlrnNzYVzajkdIOg6lPs8aAnhHIR1DRfHKkaYFi+/tEvfXfDlm
	 J8przl+LtTktHzp1ZNnexLdb1vhi9Q0T2ReOC6WYQrxl9bNhmyOmssatGfv6s3MwwL
	 +8b+v/t7r17jBxOvigvZAQZkbM2CrNBWQcD/FxYgRTjuqMpI/z6rT+PkilyBo77uh6
	 H5A/6gIUtbJVw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v4 06/19] arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
Date: Wed,  1 Mar 2023 10:55:10 +0100
Message-Id: <20230301095523.428461-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015534_740979_B495ECAF 
X-CRM114-Status: GOOD (  10.83  )
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

Use the new GPU related compatible to finally enable GPU DVFS on
the MT8183 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index e01b96adef02..5169779d01df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1752,7 +1752,7 @@ mfgcfg: syscon@13000000 {
 		};
 
 		gpu: gpu@13040000 {
-			compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
+			compatible = "mediatek,mt8183b-mali", "arm,mali-bifrost";
 			reg = <0 0x13040000 0 0x4000>;
 			interrupts =
 				<GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
-- 
2.39.2


