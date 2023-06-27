Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F8EC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jun 2023 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJn5ETyC0ghT/iFS0bIu7beesld3hMcc/RLSs5NmtYg=; b=VgLEWJ9O2vULTP/fKgiIxrOu/t
	dlfmVIwkNZJgNxhVkQoCxmcz+NrB8j1YwHe82MK+2xHjDAMDDhm7346j8+b8PWkpxJt4b4jPJtBf4
	mQpW6uEppBrMawzzk4XFjIpxt+pOYEgNWc36fuBNY/68pvslWLY1/kAfIiAFg79mVlYOBvy0+axVl
	rO6tt6c9eP2NmVV2VlvThgz/jmLz9n1uhBJcM+BEP65anP1ylezaXVSsCUv5rEoG4nG/3DP1orhHN
	MGypv2tCQh3wmFL1agFwgkUHXmy61RnVaeMP3wT2IXJ2aW74Bia7Ac1P4aToS2+4A3H9N30G+1Kdv
	HuPjPxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGX1-00EF7P-1x;
	Tue, 27 Jun 2023 21:47:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGWF-00EEfh-09;
	Tue, 27 Jun 2023 21:46:40 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E6BA660716C;
	Tue, 27 Jun 2023 22:46:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687902397;
	bh=khyVQY+Nu/Z4EDKrg96abLDsAid37RZNAFA7dJoh+K8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEmknKh9uXv6AKN+kRQcmsKlfxopmDPOGU9wtjVeDOZByqNTKWgbBrpoNoUI/tJ/o
	 JpCg6mqBUt8NpYy0cSQujxUuCgPiNI3k/w+SlZjOFZQA73DrJK7NKQNNUvLNnzMKIh
	 okq1nDuFjUBiz8c3QC38vE2njRckaIzgmn5iKFiGOlClmGv1JXBoem+gJEo8SmLlgt
	 s6UXFaOjHpIM10NU4NDzidkVlCX00STy5mojjPJmz999jEU4XsYr84LXg81DzHNPs8
	 VzyCm1mPcA+vQlPjma5/jMcJoS0Ec11mnN6yePr+MifjF3aj6FVbQMbvN3tdkBo7lr
	 kvPOrsasFsA7g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 6/7] arm64: dts: mediatek: mt8173: Drop VDEC_SYS reg from decoder
Date: Tue, 27 Jun 2023 17:45:56 -0400
Message-ID: <20230627214615.1503901-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627214615.1503901-1-nfraprado@collabora.com>
References: <20230627214615.1503901-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_144639_238021_240C616B 
X-CRM114-Status: GOOD (  12.01  )
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

Remove the VDEC_SYS register space from the decoder, so that the node
address becomes that of VDEC_MISC, solving the long-standing conflicting
addresses between this node and the vdecsys clock-controller node:

arch/arm64/boot/dts/mediatek/mt8173.dtsi:1365.38-1369.5: Warning (unique_unit_address_if_enabled): /soc/clock-controller@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)

The driver makes use of this register space, however, so also add a
phandle to the VDEC_SYS syscon to maintain functionality.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v4:
- Added this commit

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..cac4cd0a0320 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1368,10 +1368,9 @@ vdecsys: clock-controller@16000000 {
 			#clock-cells = <1>;
 		};
 
-		vcodec_dec: vcodec@16000000 {
+		vcodec_dec: vcodec@16020000 {
 			compatible = "mediatek,mt8173-vcodec-dec";
-			reg = <0 0x16000000 0 0x100>,	/* VDEC_SYS */
-			      <0 0x16020000 0 0x1000>,	/* VDEC_MISC */
+			reg = <0 0x16020000 0 0x1000>,	/* VDEC_MISC */
 			      <0 0x16021000 0 0x800>,	/* VDEC_LD */
 			      <0 0x16021800 0 0x800>,	/* VDEC_TOP */
 			      <0 0x16022000 0 0x1000>,	/* VDEC_CM */
@@ -1382,6 +1381,8 @@ vcodec_dec: vcodec@16000000 {
 			      <0 0x16027000 0 0x800>,	/* VDEC_HWQ */
 			      <0 0x16027800 0 0x800>,	/* VDEC_HWB */
 			      <0 0x16028400 0 0x400>;	/* VDEC_HWG */
+			reg-names = "misc", "ld", "top", "cm", "ad", "av", "pp",
+				    "hwd", "hwq", "hwb", "hwg";
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
 			iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
@@ -1392,6 +1393,7 @@ vcodec_dec: vcodec@16000000 {
 				 <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
 			mediatek,vpu = <&vpu>;
+			mediatek,vdecsys = <&vdecsys>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_VDEC>;
 			clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
 				 <&topckgen CLK_TOP_UNIVPLL_D2>,
-- 
2.41.0


