Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF34C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obw9SNt2vy4jPIy9ubTKpjKvVJkfDQwNGTONhOYIj5E=; b=u4riqBuSyxpoTrGaJ+SDU/6sfl
	E+B9hyUVikjpE8JHMV4w5EBLo9+hcLEWSB/n/IzGmc37IGBEe/rSkd+Oo39SoNDTjzrLmRabWmAHd
	LVU2tZ1oEXRSZzNHfJl9NVVcNYGvpIs6DMdZXbi/rrK1S7AvuQF7/xlVjDNpsW5V4gYgmMYBq1Hm6
	GaZEbBuK3l/9doXdCTi9HBtTMfQbIV323fAui96r6UBA+xA72WX60NdnolsxD4sgD2xQ+5ysnfUug
	11eeRd4XUL4FWq2jgYgu5DzY3Fo7QomyufmoVe7s4p+bPaZjpTFi65TmMCJ1fepchxsiS2OSPMG0J
	El7P0Dyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFavn-00BTrE-VL; Wed, 11 Jan 2023 13:14:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFavV-00BTkO-QY; Wed, 11 Jan 2023 13:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=obw9SNt2vy4jPIy9ubTKpjKvVJkfDQwNGTONhOYIj5E=; b=ELaeRyMSlyg8UMND96sI1zAHf+
	bV1/R1lHkluTpfhJEg3U/yPlfbAuzlZM2Jaqd+EsIdQXDLWfRxSO03wvuhbURlmwzswggbXVejnJZ
	am1dEPKVN402MMUuaLQV2SuSwGLNol0cQ+gu4CQbsBTZymdA38/1FHYG7GIFlSlXzVhdiPSxa6CRK
	8lUqEZjFPsd8SOzmekkS22zVoN1+clsmKTYz9bes79HY6Qb1tKVgrKl5gyOY/87EDeozIdnpTzf1k
	LdS4gwZ0/WwiPNZCpbQV+vlJSZ0UmTMlllsF6gIo9igva8pVhKXpqr5Lxn45R7DAJSy6h1Zp1+hlr
	lYLE/llQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFaMU-003foE-1S;
	Wed, 11 Jan 2023 12:37:49 +0000
X-UUID: c200cd4c91ac11eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=obw9SNt2vy4jPIy9ubTKpjKvVJkfDQwNGTONhOYIj5E=;
	b=WchbHvaMMqA3GivP/Bs/ZERjvK7vP+pRitkrAf3UlYLP/JD83mdw9hwls4bBmXFp0SC+dQXjlX6fhfyirtp2jHwvFCHNBYZAiZteWON2hqwHnaJ81DH7ZPZUr3lYSgdivwVmcIAsSWqrUXxoDaKGjwuvW+sfpGJ8PWm7jLfUKv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:de2097bb-f947-4ef0-add3-1c08a1e6f225,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:095d5b54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: c200cd4c91ac11eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1941957683; Wed, 11 Jan 2023 05:37:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 7/9] arm64: dts: mediatek: mt8186: Add DPI node
Date: Wed, 11 Jan 2023 20:37:09 +0800
Message-ID: <20230111123711.32020-8-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_123746_879830_EED48B82 
X-CRM114-Status: GOOD (  11.41  )
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

Add DPI node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c52f9be1e750..eab30ab01572 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1230,6 +1230,23 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
+		dpi0: dpi@1400a000 {
+			compatible = "mediatek,mt8186-dpi";
+			reg = <0 0x1400a000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_DPI>,
+				 <&mmsys CLK_MM_DISP_DPI>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			assigned-clocks = <&topckgen CLK_TOP_DPI>;
+			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			status = "disabled";
+
+			port {
+				dpi_out: endpoint { };
+			};
+		};
+
 		dsi0: dsi@14013000 {
 			compatible = "mediatek,mt8186-dsi";
 			reg = <0 0x14013000 0 0x1000>;
-- 
2.18.0


