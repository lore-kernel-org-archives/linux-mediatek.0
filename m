Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EEBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 03:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PM37Djs2MmIM1V0fIhaR9Ne8D5kutQaAtDW0XCW/j+s=; b=MddRqIjJqh/MXTGdhGSM6PAc3X
	QXxIP99RYSwegMRAniq+S/hkFpLfZGx6DxL/JjamL21o/X4hxDu96VbnCCWoiUsF5p3gNiKBGqxk8
	ZRLgS5lVjkmtzIa3wTaaStf8IITGHYev7BXVVS1kEGVVSwXKcYl6w1itzkEhnZ82f1+Fd5Rgr65of
	ZFHtlSxmuXq/KcJHbFGp1k9O/If5oFtf+sOzqho/9izjcwdzSxRjXTOniKV6MJVt+vB3RUf3QWSg2
	KXucq+6Ck4Cpv06CRdqbm90dDZ0t7VSAQTrm1TOMN3NYp1Dn2AZ5uvYoif9y1PfXZtEXSyegtLdLs
	a8bbrIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofYRx-008OxH-T0; Tue, 04 Oct 2022 03:18:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofYRv-008Owv-0w
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 03:18:28 +0000
X-UUID: d74672b585fc420296ef0f2e5b628365-20221003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PM37Djs2MmIM1V0fIhaR9Ne8D5kutQaAtDW0XCW/j+s=;
	b=hYm3XERFYBDN1RKEkVQ/cnZCvLa4OBaKfYWQQuIJRE3kZajk1gwEeimNhCqP0eNDTE1Fm06B2D48E9c1Hm59+l6XETOBcL9o0RRSfaMhcMbXOFvb4ysuCwfOfbf3dd3/TqNAr/6fdpy2Y4phQ3eF/Al2n3P6hfRuFx9z6Iz7Imw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:10bce237-48ea-4395-b17f-1b43f05ef8d1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:beb7e107-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d74672b585fc420296ef0f2e5b628365-20221003
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 542732550; Mon, 03 Oct 2022 20:18:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 10:37:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 4 Oct 2022 10:37:28 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH] media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config
Date: Tue, 4 Oct 2022 10:37:27 +0800
Message-ID: <20221004023727.28946-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_201827_103520_AC85C4DD 
X-CRM114-Status: UNSURE (   9.50  )
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

Since remoteproc completely replaces the VPU in MDP3, unused config
should be removed to avoid compilation warnings reported on i386 or x86_64.

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


