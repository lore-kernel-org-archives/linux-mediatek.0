Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B34AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MnyAJ7FMVKmRTrfZTAmcvcqeiFKH8hfLHrQdBLs17c=; b=ZdxEe1d7EQS8VM
	We3lBmYbrz9I3LaSVjRGU0ptyB9fhg2tDAEGqX9euvJ01cRKOZ6aS7uR4pRLQ6NWBDHpc/rgXc81o
	n+sAwAR86R0Xs8dodpJFvdTvtpsWR7vT7yBnAAS6cWXhCSijNG/bbG3FPTlBcBJy3l4TwhFKb8FH2
	hyaoQE9k7nbWhNszEjyQAIKpVStqX3w06gX0pZU5biQJZiG/RlvtN+Lbbn4BfK+YijJejvsiCPXgQ
	fp6OGr3Numt0kwcZ4/GZPHxfPzvnewyYL5N64k+8KjkPd7+l+k9kzjMo7hZFFt/BlADMuX8htomXo
	Cc74emw3D/ygD++DrcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Ns4-009Qzo-EI; Fri, 14 Jan 2022 14:48:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Nrq-009Qu8-4m; Fri, 14 Jan 2022 14:47:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A6C881F46A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642171668;
 bh=cTHqww4IZbi5PdxScVJ5RmgEFWGNWZU4AMAqnvnN1vM=;
 h=From:To:Cc:Subject:Date:From;
 b=D8AJQ4G4r14QCgGUpRCWn6AKwg2pAfphNZFKn9dWfT35vWJoI66KVSW7wOn/gXH8F
 8+A7uBI3Sn2tDAHAu12zTel7evWbULUfMEnbsbcxcD7qYOmoOwRj5QuEa6f11pCGRl
 5TKGmqC9UO3H/KHxP4s6DO9sC+IGFySuqpp0mit5cnsdk9mYk37bFOnzi4dGPnKHZv
 ANmplostgKQQYVTggvCRI3XtxFzRbJFVi+xojzgODipky/Se7m9u57A3wmx0z3RvM+
 VgAMkZairRwIwTkLmvYFbS+bM97KSZJjTomHxGawqHkf0W88KMMwmKbb8P1u8d1H3U
 7bYait9ekDf5w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bjorn.andersson@linaro.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Date: Fri, 14 Jan 2022 15:47:37 +0100
Message-Id: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_064750_465956_3766E0E7 
X-CRM114-Status: GOOD (  10.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During execution of the worker that's used to register rpmsg devices
we are safely locking the channels mutex but, when creating a new
endpoint for such devices, we are registering a IPI on the SCP, which
then makes the SCP to trigger an interrupt, lock its own mutex and in
turn register more subdevices.
This creates a circular locking dependency situation, as the mtk_rpmsg
channels_lock will then depend on the SCP IPI lock.

[   18.014514]  Possible unsafe locking scenario:
[   18.014515]        CPU0                    CPU1
[   18.014517]        ----                    ----
[   18.045467]   lock(&mtk_subdev->channels_lock);
[   18.045474]                                lock(&scp->ipi_desc[i].lock);
[   18.228399]                                lock(&mtk_subdev->channels_lock);
[   18.228405]   lock(&scp->ipi_desc[i].lock);
[   18.264405]

To solve this, simply unlock the channels_lock mutex before calling
mtk_rpmsg_register_device() and relock it right after, as safety is
still ensured by the locking mechanism that happens right after
through SCP.
Notably, mtk_rpmsg_register_device() does not even require locking.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 5b4404b8be4c..d1213c33da20 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
 		if (info->registered)
 			continue;
 
+		mutex_unlock(&subdev->channels_lock);
 		ret = mtk_rpmsg_register_device(subdev, &info->info);
+		mutex_lock(&subdev->channels_lock);
 		if (ret) {
 			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
 			continue;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
