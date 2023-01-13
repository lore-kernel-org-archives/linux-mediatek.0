Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88D0C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo1bPZn9mojnSvx7crHjrC1dx1gmla43k1snCrM9G5Y=; b=I3+siKmhTQiE0qgKfMUtBz4MBZ
	Sr7Ut7Y1FLtPxJq95+4VOxVlUke+a01ExFzlTH5YrbzziPC3+rCe82qOsK3qU5Tud9GNxwNHxlZ6i
	9DdgmITE9VTNcIv3WgZkHU8zxb46E3EPcECgmONJJ7Di/tA56h1ztESzxIRNjkjlmZSQEDb5Io1jL
	v8fHadtWD66X3Q3aLDIQQIJgV6mQk9RaKW6e3dW57cicvTINkC0R5hXhB2ihtiCaeqSF72KY1p//8
	NgLzduyRrjVIaSSRa6V43972O48DfAG9lnIuAXBtPIR4G4jldSKuYbNt4kmYbAjFnvZc5S7djhr9q
	hgHozFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDCY-000g2J-RH; Fri, 13 Jan 2023 06:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDAJ-000eqf-Gh; Fri, 13 Jan 2023 06:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lo1bPZn9mojnSvx7crHjrC1dx1gmla43k1snCrM9G5Y=; b=JmePTsBQn3IBeW8vt1065RsYQ3
	jEyMmgqaJQ470MxJQD4hvpvkzSjhAZB+umVU4PHT3fck50/HzXNySyWH3bGxV4GciADjbBdvew1Fn
	gwRq6N4J3E7bWJu6Ww8ld6IiJo3gnp29h1pe8jGSanmSwXEt7+KGZNA+BY6NGp8qwJOEvBT97Vqq5
	ocMU0dDy9oB3t+MqXsyYQU2VYgGFvds2uWxE7IvORAmrZ9Fhev/NkEOs8LC9f9uACuf9dCwMTC7hh
	JPuY3gURx9W3XdO2GGdWRyy58PmPiyqOSXaHnbr+rX3FBiyTUuf2Nyq8J+wRaKNujv7LCQ7G4ruBU
	QzzTmG5w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDA6-004FOr-1U;
	Fri, 13 Jan 2023 06:03:37 +0000
X-UUID: 02e388a2930811eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lo1bPZn9mojnSvx7crHjrC1dx1gmla43k1snCrM9G5Y=;
	b=pVCwI0gUkFOmGuNGVOYVYtJ1NHV5YsrEY8RosFAryQj1X1cosOV/1h+N9INzOVm6vGG5WHDWMtRQLeXL+pAYJKySaw+cLbNusbH+5KfgJkNbxVZSu20QBavGbY71m1pVA0CCJ9jFkUN6O8PCSZNmqyYyxGLwI5yEeZk3bK5uRMA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:00733c25-81e8-4bca-a95d-dd666055ca29,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:c6fb258c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 02e388a2930811eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1965124741; Thu, 12 Jan 2023 23:03:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:03:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:03:04 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH 08/10] arm64: dts: mt8195: Add dma-ranges for the parent "soc" node
Date: Fri, 13 Jan 2023 14:01:31 +0800
Message-ID: <20230113060133.9394-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113060133.9394-1-yong.wu@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_060335_684703_13635C9E 
X-CRM114-Status: GOOD (  11.97  )
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

After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
controllers"), the dma-ranges property is not allowed for
the leaf node. But our iommu/dma-ranges is 16GB, we still expect
separate the 16GB dma-range like:
a) display is in 0 - 4GB;
b) vcodec is in 4GB - 8GB;
c) camera is in 8GB - 12GB.
We can not expect all the masters add a parent node for them,
especial for the existed drivers/nodes.
Thus, we add whole the 16GB dma-ranges in the parent "soc" node.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..175eb7a25307 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -299,6 +299,7 @@
 		#size-cells = <2>;
 		compatible = "simple-bus";
 		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
-- 
2.18.0


