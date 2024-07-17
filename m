Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A70C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rv5h5Afg1dhXQ63cMre+wMIfyIsc5/TOkQPTstUpFJ0=; b=i1QghArqxXtiPfjUh5ROzU6xcs
	y/CtgJARzMlj9ncXM/K8JNYrMMgtXR6Qpt/KE+YRubcG774evmaFa3VLQI01xcdfPX6WpiDUAnfj7
	5RAfFNlyJ2LA/q6xZN50nnFn4XuGyMUOVNA9c41DplP0+R5gZlio8/vVl632itlW+C80e87C0EN3A
	KJB9PHoI3W6oyKi8zKfV5Ifd1HA9uULICHXdy8FNDn1tOfyWQ7D6zqdgPz5DrWzPoZSK45u29hj2O
	lXarbjYKTEAjtaHB4TeeyrzLiHgeV7pma1O8jxdI0jH6DSoDfAs+d0a9yAJR+a9rmAtXmo6arKY/j
	pP7gHHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4B6-0000000DoEv-0WpX;
	Wed, 17 Jul 2024 12:54:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4B3-0000000DoDv-2T5T;
	Wed, 17 Jul 2024 12:54:38 +0000
X-UUID: b678fda8443b11ef955bff358274dad2-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Rv5h5Afg1dhXQ63cMre+wMIfyIsc5/TOkQPTstUpFJ0=;
	b=QEZmVU0iVaX6xJ05zvcBQRqy89zvJmyHiH0qhgtNgTVPjj5Uq1YFaX9FVkxd1dRUWlilZXzE0ECCxXnMQA0dj8eGnxrxltc4Kh8wEsF235Vr4TtBzNGrxDUtsoQAurvKN22UBQL1kp46Qz8YneKeShtVzt3ciHzVsInLiXNkWXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:09d4a949-6c31-40b4-94a5-5401949e25c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:86aa74d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b678fda8443b11ef955bff358274dad2-20240717
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127155559; Wed, 17 Jul 2024 05:54:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 05:54:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:29 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 0/3] media: mediatek: Add support MT8188 AIE
Date: Wed, 17 Jul 2024 20:41:54 +0800
Message-ID: <20240717125426.32660-1-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_055437_655720_052E2860 
X-CRM114-Status: GOOD (  11.34  )
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

From: Yelian Wang <yelian.wang@mediatek.com>

*** BLURB HERE ***

This patch series add YAML DT binding and V4L2 sub-device driver 
for mediatek MT8188 AIE. AIE is the ISP unit in the SoC，it's used
to detect faces on an image stored in dram. Mainly used for the 
camera's Face Detection function of MT8188.

This series is based on linux-next, tag: next-20240716

Yelian Wang (3):
  media: dt-bindings: add MT8188 AIE
  uapi: linux: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver

 .../bindings/media/mediatek-aie.yaml          |   99 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   13 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  130 +
 include/uapi/linux/videodev2.h                |    6 +
 10 files changed, 6911 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.34.1


