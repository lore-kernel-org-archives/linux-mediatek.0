Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614CC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0esyvSou6XOjJdnHtKHcqUSq5aX2adAFR6jn3DxN+w=; b=X2KTCDz0l5FCmV+HPNDbNCXD8G
	g+zNMAZjoq9jpr3p+0w6eeGBut91+kJzct0BRBwbXzcxgjwPsveO5q73ZERFYm2TQ+Rg1GmNwTEPz
	zAgNdx94nQC6LKIAAldesEPWz+Gy9WGv39G3Re29JBNR00WECj+pWfw2cQMC2zG6xXVHBrmWb7gEz
	tfCSYvj/OdG5tJEbueNpPC1MT/S1bhPZY193NmfsM5jXZVvoZRG9Hx0zwkHByG+mfzG4mX9/DlPM9
	E8BwUPIeNJkWDm9JiEglt19plDnJd+gBbArkY0cxOkfN22/TEXLpIcuZcm6SQTHAfsgMeekWX/9b/
	xVBr3q4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdJ8-0000000BgHY-47Ta;
	Mon, 06 Jul 2026 06:59:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdJ7-0000000BgHL-18k6
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 06:59:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3A8661832;
	Mon,  6 Jul 2026 06:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688A61F000E9;
	Mon,  6 Jul 2026 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321196;
	bh=f0esyvSou6XOjJdnHtKHcqUSq5aX2adAFR6jn3DxN+w=;
	h=From:To:Cc:Subject:Date;
	b=cn2OSR+wY+H9AjbL+MoRf7GMKGr0OKdSdK+RmhcSHvidP80vP1BMprRheDi4J0Asv
	 uEtsljRrCMjYbl3ROwchBrWXWP37/+41GV7QGw+EbTjW0x6mt/ccTfia+PUO2VFlSq
	 KwzGdYXOfT/qbU1WrqcW7Eoff/ER2/9K9r1dLN2xn3+fDqbGirxi9z39MgD7/4OEr4
	 Y3uyfn/zYA6O5kIcKb56aMOvJsGxDsgq08l6wSm/MXpvR2D8hxA/e/DcStKO8823r5
	 Rgst78jQYpiVNL8A/Zg6YlLJy04CBngptYjPr2C0xcj4BTxsoZUmW0Hl8K/DNuiZbq
	 F4o2Ts0hqYy+g==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgdJ4-00000001dMX-0vbh;
	Mon, 06 Jul 2026 08:59:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH] media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup
Date: Mon,  6 Jul 2026 08:59:27 +0200
Message-ID: <20260706065927.389604-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add the missing sanity check after looking up the SCP to avoid
dereferencing a NULL-pointer in case its driver has not yet been bound.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Cc: stable@vger.kernel.org	# 6.1
Cc: Moudy Ho <moudy.ho@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This one applies on top of Guangshuo's fix:

	https://lore.kernel.org/r/20260704173119.254975-1-lgs201920130244@gmail.com

Johan


 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 121b1006ffdc..f412aadb5996 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -296,6 +296,11 @@ static int mdp_probe(struct platform_device *pdev)
 		mdp->scp = platform_get_drvdata(mm_pdev);
 	}
 
+	if (!mdp->scp) {
+		ret = -EPROBE_DEFER;
+		goto err_destroy_clock_wq;
+	}
+
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
 	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
-- 
2.54.0


