Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C8FC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsoZK8V4Wbc8JNPHVOfLPCijgDv4vmOwmPyPJeVywi0=; b=vt6SGD/n102nOGgIrLPgWeVTIz
	nXPszr8QDsBn20K5SHvQjH1M6S42VFRxlfkypdAOVSR+24eidz0iUCcmCiMnCROfBEfXvvLOkzFlW
	lxw7oHCxnw6YHJ2uBlZq8RHBMZ57Mqq/V64kgINyH/dhXL/sV99GQO56y+6yDCdE8bPZ4xQjv/3j2
	1LVo3ja4la7WreTiMsis68vJEUc8th6Xkt6SAluY3aPMkBMBneXRob7SJuOgVYxqY5SZVnrJYd9mu
	lCutPnXPYTG7sumX6Ixc5MMlX0SqDoDlSxA6GIo/iDJMbginShGkZgyU+9t2omKLHozRY2YGbQZ/h
	hezNL3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDF7-000hOI-I6; Fri, 13 Jan 2023 06:08:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDAR-000eum-3W; Fri, 13 Jan 2023 06:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WsoZK8V4Wbc8JNPHVOfLPCijgDv4vmOwmPyPJeVywi0=; b=ge+M+FOTrcn7WNiGoLCznLsy3S
	+tjWxyxE4/3Vp7aUfZgX0YxH3TPIdpYhGVMTV7TFNKu5Doaf7IxDZ8ATc7jRnMUdeiX65xV9kME6e
	gKWcIDlHyzF+8JA+hMPi3gG2GupKDq9JcDxU3f562IYL8+Wcvliv4/aFCKZitRhE1ZJAj4yDJoitz
	T/mw1Xg0mB2Jzq4zmmavPfT5yP3zOc5AOV8cQWgqrHQrxuqOs6Yq7wFvDWhoZ9bnxM9G4l1ioPKrC
	9eHYsf4N9myxa1Je6BBFPMkWKnu5rfQzXbhPj6mMXlMVO1+yoQCeVZIG4Er1pVPH95glzSp9WVm+O
	toKxwXJg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDAE-004FPd-2e;
	Fri, 13 Jan 2023 06:03:45 +0000
X-UUID: 0a623fba930811eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WsoZK8V4Wbc8JNPHVOfLPCijgDv4vmOwmPyPJeVywi0=;
	b=cIkJCJgBjM6DiWxM+5MotZzQ/ugXXmksZjy4Be5jpsV45u0CDADEcC2LK16DG/4TurMW3w3gheZ7Na8YNAo2MUlU85CNSPftIgG2deAta+/ZOoVulT+YHtymQloWs1wSRJDj0tTK5Tyc84IYGtb3k0jkcdIIKbe1MAjLct5KwPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:a9e9aaa2-ea04-42ff-b040-8b85f3a02878,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:a9e9aaa2-ea04-42ff-b040-8b85f3a02878,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:9bfb8a54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:2301131403462FM8FGM3,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 0a623fba930811eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1002656811; Thu, 12 Jan 2023 23:03:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:03:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:03:17 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH 10/10] arm64: dts: mt8186: Add dma-ranges for the parent "soc" node
Date: Fri, 13 Jan 2023 14:01:33 +0800
Message-ID: <20230113060133.9394-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113060133.9394-1-yong.wu@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_060343_391210_F10BEB3A 
X-CRM114-Status: GOOD (  10.07  )
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

Prepare for the MM nodes whose dma-ranges(iova range) is 16GB.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c326aeb33a10..ea90d2d08316 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -265,6 +265,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 		ranges;
 
 		gic: interrupt-controller@c000000 {
-- 
2.18.0


