Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B996C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KoLlcWRHitZo6BJrrJwli9/MLgex7K5fSuGyfDAOY2o=; b=s0kxm5EdFyeryN5uj/TjL8J7nd
	tKIthIVHwJSsUl6F74iXGGIypZY0mT/fEOiO6u49wSXwJTQRS8mamPdZqrSTOUUtND1U2R597d4dl
	EjZqa57XKE0UTzhQK2QY8gN/w223QndsxSmbe6osoHCnq2WEmpf1bJvdRtIfCBRidskfdEN6kakyK
	bRh/TFrCaRKCRD2RsqZVBtk2CO0SpGKuuQFjlBWkQmldDAy4HiL1ZKBSTmcyOAfonH9YlcJMbTcW3
	4bwzekMpTTSbJdkyB0L7a9iURI5r/kvJVfiDAibs2WMUzcVZGM6cAaSeeuLJYoSdUcWmzphfdc3Bg
	pQ2LPP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oyN-004sNa-17;
	Thu, 01 Jun 2023 20:32:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oyK-004sMQ-1C;
	Thu, 01 Jun 2023 20:32:37 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF4F16605838;
	Thu,  1 Jun 2023 21:32:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685651553;
	bh=5WpcqO9ifnLpSK4823RMglaY7WU6LjX8KXsVqXcIo4s=;
	h=From:To:Cc:Subject:Date:From;
	b=XZFdNEPRwzkK2c5Oc4RvBoc0pm4d2VDuObQZiOdl+YUlaUSGN3S3wjtBaWk7E2myv
	 ToqDaqY3d+NW969Pl+e/oZQbpuNQ+18gHeB1Z4xzy6JAODnKrRCssCfoz5aIQD4Smt
	 1fXf/2iLWd6Q+HqkZxVvG4TAVe0bQ2U0pCwq+s/dq1aqap29BbfbXpiYTbftZFmzNz
	 cPpMl8Jf984hJL4GyH5DwY2I6Icb18pdJ4W0Qco5/LfTpNKAcSpBXVAC4ym1r0C+OC
	 xGMWFCVov/SMe2PVuLhNdsVFNv6Dsy60sYtzDJ5QI6cOHYgHH4UkSKmQe5h9Yn+bX7
	 gD7pFqr85ZPCA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Yong Wu <yong.wu@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192: Add missing dma-ranges to soc node
Date: Thu,  1 Jun 2023 16:32:21 -0400
Message-Id: <20230601203221.3675915-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_133236_575753_23E82B42 
X-CRM114-Status: GOOD (  12.77  )
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

In the series "Adjust the dma-ranges for MTK IOMMU", the mtk-iommu
driver was adapted to separate the iova range based on the larb used,
and a dma-ranges property was added to the soc node in the devicetree of
the affected SoCs allowing the whole 16GB iova range to be used. Except
that for mt8192, there was no patch adding dma-ranges.

Add the missing dma-ranges property to the soc node like was done for
mt8195 and mt8186. This fixes the usage of the vcodec, which would
otherwise trigger iommu faults.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Matthias,

this is a very simple but important fix for the vcodec functionality.
Since the vcodec node for mt8192 was just merged, can we please get this
in in this merge window as well?

Thanks,
Nícolas

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 7ff183c35494..a3612de8e9d1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -401,6 +401,7 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 		ranges;
 
 		gic: interrupt-controller@c000000 {
-- 
2.40.1


