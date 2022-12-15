Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CF6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8W8xC7A2RdNuKQ4NVR3bSsxFl9loWg+o9/d5YNtAKs=; b=We7ociSN1+yv53LBvofEb39cPS
	Q7RV0fQbFnTk0nGz532b93qgWNSO8hTb2rTo6Jh9mNKxT1gOOL0TPVDtEW3TOf/3eUR7B0Zv22tdU
	YBZAM3SlQWqkPTBj0YAL01JJCqXOMd5wzpT8CFJ1aSUJzz+MRhXwXd9xYaRQ3Afv9T7j0qTs9Y+eb
	4JOBbH1e9On8K8KmYmq3V10B5gP1UeInM2SM29KlJtm/uxxD3FoVXiNMPm0JZ/iCt+9sg2hGq5qkq
	1Hk/ewWLEPQwiXHiyiPJSNG9QVs4E4Bco+cJv94KDPnFs1G/UNd2u4zq8q589gN5J0wiOS9TlsPyg
	M+tst8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rHl-00AMTV-JP; Thu, 15 Dec 2022 16:40:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rHb-00AMPT-2B; Thu, 15 Dec 2022 16:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8DA69B81BA1;
	Thu, 15 Dec 2022 16:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83905C433D2;
	Thu, 15 Dec 2022 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671122428;
	bh=vM3CUj4GDE5CqX99A6tmi97aIvyuGUgE2Z3VCaT0Z+I=;
	h=From:To:Cc:Subject:Date:From;
	b=OKeIwSrwxWpFiXDfoywHNKECTEwF2U3EqtQss0QWLiHb5jQByez8MJOwDB7pqrSyx
	 TJPayJrHeVZnhLzQHlz6BhvhmDyWTAu2qyZgo811xQrb8qLp0ha0d3k8DfBko2L4uR
	 agwVLPmNojdMe8aMrEiJ4fAotsx1pZxpuaFZ++J4daDKb7d/SyLRgpQJ5BHI2+GnFR
	 +dbGm0pM7DwNttwngEd2qmZkVOZp3oBVh7vzEhnhsewE5DGM8OaQCCtbH/sr9oV6uK
	 5kcTPehvme2Wmt2pc3/Az+vadb8TUwKkbBQbPHiXikTIjg7DyNjDcA36H76dz+dOBx
	 ahVijGzINeMPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: platform: mtk-mdp3: fix Kconfig dependencies
Date: Thu, 15 Dec 2022 17:40:08 +0100
Message-Id: <20221215164021.694343-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_084031_249575_E15F298A 
X-CRM114-Status: GOOD (  13.52  )
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

From: Arnd Bergmann <arnd@arndb.de>

The new mdp3 driver uses 'select' to force-enable a couple of drivers
it depends on. This is error-prone and likely to cause dependency
loops as well as warnings like:

WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
  Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_DEV [=m] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
  Selected by [m]:
  - VIDEO_MEDIATEK_MDP3 [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && (MTK_IOMMU [=m] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC [=y]

This specific warning was already addressed in a previous patch,
but there are similar unnecessary 'select' statements, so turn those
into 'depends on'. This also means the dependency on ARCH_MEDIATEK
is redundant and can be dropped.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Fixes: 9195a860ef0a ("media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/mediatek/mdp3/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
index 846e759a8f6a..602329c44750 100644
--- a/drivers/media/platform/mediatek/mdp3/Kconfig
+++ b/drivers/media/platform/mediatek/mdp3/Kconfig
@@ -3,14 +3,13 @@ config VIDEO_MEDIATEK_MDP3
 	tristate "MediaTek MDP v3 driver"
 	depends on MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV
-	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on HAS_DMA
 	depends on REMOTEPROC
+	depends on MTK_MMSYS
+	depends on MTK_CMDQ
+	depends on MTK_SCP
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-	select MTK_MMSYS
-	select MTK_CMDQ
-	select MTK_SCP
 	default n
 	help
 	    It is a v4l2 driver and present in MediaTek MT8183 SoC.
-- 
2.35.1


