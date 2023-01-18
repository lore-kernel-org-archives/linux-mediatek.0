Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F8BC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0tyeVCGLQHUTaZhj2eyO8Q7/skPBVsVWCjbAseVp40=; b=gAa33WrDpcUtVbsxBZxOyH8cnH
	zJ0psFXJIJ8VuUOQjAKFHj1Z1CduF4Yis/zY/S5IWvefn/5M1O0glylCkTiN9oXs5z6BvbD9e3bC6
	2u58i9A8ZMKnQbcqQ277wPwG16POi3Nnri7cLbxisrf2AAvlXFx4BrMKDbwmxnTTCrjs5S7CPcK6Q
	yu/nzZ2QnryiUzLzjURzBFdeHAJy85H18bwcLyZ1hNFsWXLbhofJXhOBiRzOoX07hrhzLKNDunRG1
	WE24C1XfkVLcvLNIBQf1u8VP1jfn2ZicoDfVl7j07ukd0yHIgaIjnLOZo55+Yu3GJJ6Bv2yDB8qAO
	6hd3JQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4c7-0003pq-CD; Wed, 18 Jan 2023 09:20:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4bC-0003M5-FG; Wed, 18 Jan 2023 09:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f0tyeVCGLQHUTaZhj2eyO8Q7/skPBVsVWCjbAseVp40=; b=n4Juh/NrYYEmgXCDl99dsST9GB
	SG/8iQaGxdyTSHGHotjvRtU0whIDPjvGjuQHTHHDBR7yQ7/tvmD+E+EMi21LFwjDX1ViGJHZjMPiw
	2lgATQ3rQSyluQOp7KnWctwdGnSWrvHNbRQLBz8DQYvFQiZPW0tI9M0fziAxJX6kI0UqgB1KVRb9h
	omIX4twNYVBKQWLKv0zAAdkG4ukZwp0eGEeSqRiCUqRxXTyKP7QwM/4lTintKJc8Lx3WEUgrll9XP
	1b8ntYtDyyA26znrlPx4vviXBSWHyxkWqAdcZovGN1DJpZ6gw2QmEj1wVsYMn8A5XkkvTX1ZXgmKW
	gxa+vFgA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI4ay-006DWE-2m;
	Wed, 18 Jan 2023 09:19:03 +0000
X-UUID: 282cb3a6971111edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f0tyeVCGLQHUTaZhj2eyO8Q7/skPBVsVWCjbAseVp40=;
	b=IA59flEyPLe57WgrN2LMyCox9mL7hfIjp4yOerGXiROsuq+u1P60PoisCCkKDZJ5PHAEA+uEAlWOaYxcJHutqOwQy4WxWzsoZvygdkB9Ss8pB0OcQ/oUyJ5s4F75IPsLATNgsejJkgSU0vvUcUwgiAK/xE8u4XmL5IWfP8ZGKx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:0ab90a88-fecf-4a25-a3d6-ca499968ef47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:611e2af6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 282cb3a6971111edbbe3f76fe852e059-20230118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 781357721; Wed, 18 Jan 2023 02:19:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:33 +0800
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
Subject: [PATCH v2 4/9] arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
Date: Wed, 18 Jan 2023 17:18:24 +0800
Message-ID: <20230118091829.755-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_091901_454883_093960E7 
X-CRM114-Status: GOOD (  10.82  )
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

Add ADSP mailbox node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a8ff984f1192..a0b7dacc10cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -640,6 +640,20 @@
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		adsp_mailbox0: mailbox@10686000 {
+			compatible = "mediatek,mt8186-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10686100 0 0x1000>;
+			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		adsp_mailbox1: mailbox@10687000 {
+			compatible = "mediatek,mt8186-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10687100 0 0x1000>;
+			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		nor_flash: spi@11000000 {
 			compatible = "mediatek,mt8186-nor";
 			reg = <0 0x11000000 0 0x1000>;
-- 
2.18.0


