Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455DC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VixrTTFoGyBOD0OrB8q5ACr+Mh4D5VFG/hDsOWGUjoM=; b=u+yGnGqymXc5lGBDulC9V/HuL1
	3+LYItU3tRteyAGzUhlN8rVsGMj9gODockcStZ3fq/NX2UUzR+LXGNQZHm1KYnFovcinI4q6cC1pU
	4osuGnDtBUW5Ed3zqLMSqr13bRRuz2IYUHuS3b1aBXqqXsKdn7FcGh3nnXDsZBuXw72DNFGSeII/C
	QYpGF+Be0niPJhrcpc0raJnmvMdtN0Odlfk06xOYUE23MO/26Az9HrgUHsNThXi8EHcDnooOugPuI
	9En9yrRixAd4dhc+HLxiyeoO7il30euDERAInEJzMSt9ztpx+Py+4L+b9pzwT15LbBNMAY9fAyJcC
	DqCxD0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSoA-001I2c-B7; Wed, 14 Sep 2022 13:52:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSnt-001Hd0-5H; Wed, 14 Sep 2022 13:51:50 +0000
X-UUID: 94f29629ba5c479d85a0347b71a6aa28-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VixrTTFoGyBOD0OrB8q5ACr+Mh4D5VFG/hDsOWGUjoM=;
	b=tYOEZ9IC3ViSTEN+uwf+/Guaro7xNK1RAeZTC1fOG2bHdEayZh7cr1soxTlHApJj0BGqj/Uv64mXoBwu3LyWlpz5Qbunoyn6PGeDpQ8L5H4iB/NZDb6T+1y8wYWaGPYJHSU4HiwZ0A26tqwh9Bk9kiRPsEwgKw4HE/9vmL06/as=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:af145e8d-e872-4ea6-b8f7-265955c5c7c1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:2cbf6cec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 94f29629ba5c479d85a0347b71a6aa28-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 59583309; Wed, 14 Sep 2022 06:51:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 21:21:05 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Sep 2022 21:21:04 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jitao.shi@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v6,0/3] Add dpi output format control for MT8186
Date: Wed, 14 Sep 2022 21:20:59 +0800
Message-ID: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_065149_222842_CE0F83C7 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on the branch of Linux-next/master.

Changes since v5:
1. Separate the patch that adds edge_cfg_in_mmsys from the patch that
adds mt8186 dpi support.
2. Move the mmsys register definition to mmsys driver.
 
Changes since v4:
1. This series of cancellations is based on the following patches:
   [1] Add MediaTek SoC(vdosys1) support for mt8195
   https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/
   [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
   https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/
2. Added mtk_mmsys_update_bits function in mtk-mmsys.c;
3. MMSYS 0x400 register is modified to MT8186_MMSYS_DPI_OUTPUT_FORMAT;
4. Fix formatting issues.

Changes since v3:
1. Fix formatting issues;
2. Modify the edge output control name & description;
3. Fix the threading problem.

Changes since v2:
1. Modify key nouns in the description;
2. Add the label of jitao to Co-developed-by;
3. Macro definition address lowercase problem and function naming;
4. Add missing a description of this property in the mtk_dpi_conf.

Change since v1:
1. Modify mt8186 compatiable location.
2. Modify MT8186_DPI_OUTPUT_FORMAT name.

When MT8186 outputs dpi signal, it is necessary to add dual edge output
format control in mmsys.

Xinlei Lee (3):
  soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
  drm: mediatek: Adjust the dpi output format to MT8186
  drm: mediatek: Add mt8186 dpi compatible to mtk_dpi.c

 drivers/gpu/drm/mediatek/mtk_dpi.c     | 35 ++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 drivers/soc/mediatek/mt8186-mmsys.h    |  6 +++++
 drivers/soc/mediatek/mtk-mmsys.c       | 20 +++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  2 ++
 5 files changed, 65 insertions(+)

-- 
2.18.0


