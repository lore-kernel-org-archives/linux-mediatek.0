Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F20C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMbYkEQM+cNzHw1Ml8FzNtfbS4eqHFy8vpKrqCzu1S4=; b=Eih4fOaEXS1+uxkGh9fVNU8vTw
	6MbfcpyodhPZzAkzytZ4y7JpPbylviHQTbbcIHGkVWcDk9zWa9NAOb28BI3Rv8ZU9q+Z7SNtxEQ+F
	5q+QOTrvtLj1A5zhc6dwP/HqaeAFaIULPfbLzDzo/Xf8uwna14dqYXgyqBVHmj4QdTfXPoZRhQxUZ
	otMPPv6wROBek+TunQDU1347oWqOyaH3bUXcdvlEDHlZXVJlvK4v7v0xyM9eZxlMoer9/unMcmB5Y
	3CK3l/h+k5WywquX4ARdPc87+mB3VcKiojw55YfcQUGVPjsAhqZ5SHS6+WYveNQr2tNYCFTjyEPRQ
	eknKKiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQn6-00C9Yb-Nl; Thu, 20 Oct 2022 08:20:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQn4-00C9WJ-Qr
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 08:20:36 +0000
X-UUID: 92501e9ea66d4e33b5f7697f7674b087-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZMbYkEQM+cNzHw1Ml8FzNtfbS4eqHFy8vpKrqCzu1S4=;
	b=Q8tfG8b5X2ZkMhpyyQLDi2oN4hp4WsHI5ImPEcjR5hFJ3uLj0MfNp0tFZpA2/jgPux2LgjcFMtbawLRn89wzMBfY0dGeCF6ueULpjsvAxDZ2x9PGIOZqr9bQ+Ze/1Dod+Q+KjGJtYcw1WBDu/OOr+nkqQR8TCLsoHLVL03SLXr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c968b674-088c-47dc-86a2-4e85a67b3045,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:fee267a4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 92501e9ea66d4e33b5f7697f7674b087-20221020
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585295165; Thu, 20 Oct 2022 01:20:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 16:19:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 16:19:48 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2] media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config
Date: Thu, 20 Oct 2022 16:19:47 +0800
Message-ID: <20221020081947.23836-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_012034_882788_7A745761 
X-CRM114-Status: GOOD (  10.64  )
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

Since REMOTEPROC completely replaces the VIDEO_MEDIATEK_VPU in MDP3,
unused config should be removed to avoid compilation warnings
reported on i386 or x86_64.

Warning messages:
    WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
          Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y]
        && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] &&
        VIDEO_DEV [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])
          Selected by [y]:
          - VIDEO_MEDIATEK_MDP3 [=y] && MEDIA_SUPPORT [=y] &&
        MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] &&
        (MTK_IOMMU [=n] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] &&
        (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC
        [=y]

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v1:
  - Rebase on v6.1-rc1
  - Refer to Angelo's suggestion to revise the commit message
---
 drivers/media/platform/mediatek/mdp3/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
index 50ae07b75b5f..846e759a8f6a 100644
--- a/drivers/media/platform/mediatek/mdp3/Kconfig
+++ b/drivers/media/platform/mediatek/mdp3/Kconfig
@@ -9,7 +9,6 @@ config VIDEO_MEDIATEK_MDP3
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select MTK_MMSYS
-	select VIDEO_MEDIATEK_VPU
 	select MTK_CMDQ
 	select MTK_SCP
 	default n
-- 
2.18.0


