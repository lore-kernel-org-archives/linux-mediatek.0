Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825ACC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dh7tvnksQzJOEuHee/xqoDVN5a2mxxTRWQXFqCxdnSo=; b=JvowEzqg1kCs6h/ZWzZB7sDcpA
	TqV/xGkVQNhixI3eIZHOzsSscBrCmuflOSAZnXDFhjb4ZnwTTBS6cnXRvpc6p0aWUgbH/wPXNHkxs
	bXJeYFqwwv54znmqLfeG8NfOQhIxZF3cNFgYbaqZLx7GefTxuCrXU6Ey9NQ8SWbmROmfzh8MGUseY
	Jhe99FKgLDX/RzrJIzZeLY4eznDPQlSr3RDxycPRzMd9E1+cDUuDtkXa/HOp376o2m8SQ5C2+yIEP
	YV6ebkt5HNSsrPeIYkFF4Dog0hGjoMBX5Fb8Q/vZc5wWjo5TEFz6UHkE0Ca2zd7lSgZ1OPzve2p6q
	lKn7hs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RlP-00Gj8Z-Sh; Wed, 14 Dec 2022 13:25:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RXq-00GbSo-Tk; Wed, 14 Dec 2022 13:11:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D6156602C47;
	Wed, 14 Dec 2022 13:11:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671023491;
	bh=43IMkVml1qImsFp1W7CKhzsHSHE25K/j0gQkN5BQMew=;
	h=From:To:Cc:Subject:Date:From;
	b=BFkQpN0SqGcGnkvpz31sUKD/KvLZwpXwFibIJ7pudAGxtfMv2894u8cwykZPJtm0S
	 fSum//QYOk3K23y6Eo7gUndJNccZkl+1RRRPBXebSmUHxYspR2x2tzfiZH8Zli23hW
	 8KBPoLu6X2wFWw76hWBliN4Gtt7Cu/nzLWrQmD4fQo+2NrfDjpIqFNlGHkfCe6ysDJ
	 WhVPyk4DO4pztht9KtRciLt9oT/lSQXfkk15zXaPggfZ4W92AUabMf7GBjCAJn/KLr
	 TRIEFimYkWnE09zHZ8g6RIQb1ARWsUI/w4gaGg7EoUho2OqBDX0ccHL82RtvSxVJSB
	 5phAas90/aOcg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tinghan.shen@mediatek.com,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8195: Use P1 clocks for PCIe1 controller
Date: Wed, 14 Dec 2022 14:11:16 +0100
Message-Id: <20221214131117.108008-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_051135_165260_361A7885 
X-CRM114-Status: UNSURE (   8.90  )
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

Despite there being some flexibility regarding the P0/P1 connections,
especially for TL and PERI, we must use P1 clocks on pcie1 otherwise
we'll be dealing with unclocked access.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..e61944510b8e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1258,9 +1258,9 @@ pcie1: pcie@112f8000 {
 
 			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P1>,
 				 <&clk26m>,
-				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>,
 				 <&clk26m>,
-				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_PERI_26M>,
 				 /* Designer has connect pcie1 with peri_mem_p0 clock */
 				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
 			clock-names = "pl_250m", "tl_26m", "tl_96m",
-- 
2.38.1


