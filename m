Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390B8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHvZCMp7Vft1jzba8JcbDaZQJp5Sg/4WTuXkYRujRXs=; b=MYkv/13jsiWJjl6vrND8xS6xWD
	cOgoGVLrz+rE7SORK2f49k+y1mn1piGiYE2DmmUqfxMRbpkqdKgLdn/XUUqGZK49FxUOokM6kEEAd
	kp+GbneUl3uoUCE17WrXPY32fN/jhgC3t/19KWLHC35Tug3Fm737iL7aP1YCNSkhFKtVYh2cc5KXx
	glfD09lqWNj8tUAe2lUBTbFrFX7+qvt8z7Ntop+zTGrhDcPdyHzRBCqynD5tFQ5XqNryN8TO8MYTi
	1f/iZsRZw8JGYwwj8MXSMDtrEn5Z0Gwvk0cgRSCN0n6nVQvmwecHwG1ioBVYa59f4C5Zxk1Jy0+m5
	5ZdkmoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjfX-0035gg-FB; Thu, 15 Sep 2022 07:52:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjey-0035R5-VZ; Thu, 15 Sep 2022 07:51:46 +0000
X-UUID: 128e6ea250224244a94ae09025a27165-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LHvZCMp7Vft1jzba8JcbDaZQJp5Sg/4WTuXkYRujRXs=;
	b=GtgU92wbhr9bQsl04W8QEy8uKcdEprDH4C9QpnYxJfOcWVIIvHI8iaHwF+/kQxQvIys/Kb3BWyrQZFR/OTZZds3WO1z8/2sxGj98RAbgnMSDXnxdiBt9J//3/genGjzIXXQ6frBz0dD/A6yUWf292X3DGzvqElyHmvz9zqgoxQw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e16f782b-720a-4a93-b9cd-d9eec1961cd7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:e72ab97b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 128e6ea250224244a94ae09025a27165-20220915
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1355513661; Thu, 15 Sep 2022 00:51:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 15:50:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 15:50:32 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
CC: <matthias.bgg@gmail.com>, <granquet@baylibre.com>, <daniel@ffwll.ch>,
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH 3/3] drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
Date: Thu, 15 Sep 2022 15:50:28 +0800
Message-ID: <20220915075028.644-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220915075028.644-1-rex-bc.chen@mediatek.com>
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_005145_033835_DD277ECC 
X-CRM114-Status: GOOD (  10.86  )
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

Warning:
../drivers/gpu/drm/mediatek/mtk_dp.c: In function ‘mtk_dp_video_mute’:
../drivers/gpu/drm/mediatek/mtk_dp.c:947:23: warning: format ‘%x’
expects argument of type ‘unsigned int’, but argument 4 has type ‘long
unsigned int’ [-Wformat=]
  947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/dev_printk.h:129:27: note: in definition of macro ‘dev_printk’
  129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
      |                           ^~~
../include/linux/dev_printk.h:163:31: note: in expansion of macro ‘dev_fmt’
  163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
      |                               ^~~~~~~
../drivers/gpu/drm/mediatek/mtk_dp.c:947:2: note: in expansion of
macro ‘dev_dbg’
  947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
      |  ^~~~~~~
../drivers/gpu/drm/mediatek/mtk_dp.c:947:36: note: format string is defined here
  947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
      |                                   ~^
      |                                    |
      |                                    unsigned int
      |                                   %lx

To fix this issue, we use %s to replace 0x%x.

Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index c72c646e25e9..d58e98b2f83a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1222,8 +1222,8 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 		      mtk_dp->data->smc_cmd, enable,
 		      0, 0, 0, 0, 0, &res);
 
-	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n",
-		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
+	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
+		mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res.a0, res.a1);
 }
 
 static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
-- 
2.18.0


