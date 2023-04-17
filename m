Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A8C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+ABx1STEgOXZowtjVk3rExY+Av/YQbVV+a0Hk0pFvA=; b=IgsGneBmEX0f7+ebq6zL7DqWLn
	yEskO/eebm6C01Eu+rmlCVlFjo5rRDd+pPioSOQVRzNOUal6nOGZnD/bPt0GWQNxwHOyCEW5W6WcG
	xfsGAn5Tb5uhWI36utSEr3WvBpsRgMnnk/JMBOkipDYiEHEm0c9bs2f3S5kVKwSqDBgc+3bwQdAao
	OhM+QMM7SepQd/dBXjnQHZ9Wn7FDmzEZfRNoT2r215DCTtTr+OS/B8lnO8Szd91Q23LeL01Umqu8/
	uTeINtMOtfEpZp9TIGhHl/BrAgZ2zmSEeNmFvMonYBJqJGmr2VJO8sMJ/DtC3+H9Y0jtp1Lu5whwl
	pmzcJiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJRA-00FCq5-09;
	Mon, 17 Apr 2023 07:38:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJR6-00FCnW-2o;
	Mon, 17 Apr 2023 07:38:06 +0000
X-UUID: c8351f1adcf211ed8687db9d93187ff1-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=q+ABx1STEgOXZowtjVk3rExY+Av/YQbVV+a0Hk0pFvA=;
	b=LG0nNgdDpH1KjPA93azRShxvxkpczbedpdq3GS9qctDdFKp5YXYqs1U8lVYDaje1EdiMYjqQmTsGgXlKZ0LUL3X+F2o4cBDSpXDE0duB4bRZVbj5R1fKS2Um02AgO/N2Nmrq3P4h4NXmPGDAs3QzvgnBMiGgm5If81JbNkSSl4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:1f6174d4-eeca-44d2-897e-18018f86be6a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:1f6174d4-eeca-44d2-897e-18018f86be6a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:dc964c84-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230417153745BYH8ULLQ,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: c8351f1adcf211ed8687db9d93187ff1-20230417
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 885376805; Mon, 17 Apr 2023 00:38:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 15:37:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 15:37:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>
Subject: [PATCH v10 7/7] MAINTAINERS: iommu/mediatek: Update the header file name
Date: Mon, 17 Apr 2023 15:36:06 +0800
Message-ID: <20230417073606.25729-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417073606.25729-1-yong.wu@mediatek.com>
References: <20230417073606.25729-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_003804_913986_2891345F 
X-CRM114-Status: GOOD (  11.96  )
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

We add the prefix "mediatek," for the lastest ports header file name,
For example, include/dt-bindings/memory/mediatek,mt8188-memory-port.h.
Update the entry from "mt*" to "m*".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8ebab595b2a..833d32c356ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13056,7 +13056,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/iommu/mediatek*
 F:	drivers/iommu/mtk_iommu*
-F:	include/dt-bindings/memory/mt*-port.h
+F:	include/dt-bindings/memory/m*-port.h
 
 MEDIATEK JPEG DRIVER
 M:	Bin Liu <bin.liu@mediatek.com>
-- 
2.25.1


