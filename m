Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F80C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB37aquzZvr9XSzT8TFD92Xg4Qq+7C7xrkhda/3+mg0=; b=P56MCvTFEIpepY
	wWR/O43Tgbek29rSP0s9YxDxUKmdZXu0UAkRS5DjjvcseCdl2E/QMNYtrVqttxf1XhTnrNvXXCemU
	tmGkAe2DF4xWDWCXg6kdfNLcBE1Arg6dO5/TWr616AjqKaqMqvQVTZ+z/26uqF01beSUhly4G+WLS
	uCFp3OZCrNwSmJYFZ133X08ehY+gPdP953vHcB4OPh1NFWM0n1hs/vI7H60BWBdTskFGVze41U0bj
	RXc3OpfCJSPdqLGQMUBV1FeE+2qnSpmij2utVqM2VD3bKBAWAfA4zkSCZT4DaAtuyTSOidwPfI+/+
	w8rs5opJu1rJJflurJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VPq-00Fhk8-Pp; Mon, 17 Jan 2022 17:03:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VNa-00FgDF-P0; Mon, 17 Jan 2022 17:01:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 382A6611CB;
 Mon, 17 Jan 2022 17:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1885C36AE3;
 Mon, 17 Jan 2022 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438874;
 bh=6V+sC1g13i8VXCbalZh08XyriymrAMskwoCmd6usGJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWP9gm+rJCqZGRDt0Z/coGVZMV4BD519pNyBvaqG5zpIZy4XI5fxLWge/B/h+AGIo
 Jxi64sv3YHiIXd4Ri7vZyaNX/roxibP/N0tNK8VJjppqJAMVuUcOyrh+SMe+UQpotY
 kuYs/iAk2xPOs0ibKarVvgTmBMoWjYXzw+bFDAnyh/sL+QDDuLc+gMC3ZpRDXL056y
 m13ym5lIOm5xtfpjtQFYbW3hS28CzeDLYN59aEMel7SU+hrEc2bRWIzRanZyASNrP/
 rjCAm1jXJzd6pAUm/OvD6mn0dMP8LdWNWyU62iHd4o3W1+17Y/OkODCqovlOUYJBa0
 6FLKZk837XNzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
 kishon@ti.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 49/52] phy: mediatek: Fix missing check in
 mtk_mipi_tx_probe
Date: Mon, 17 Jan 2022 11:58:50 -0500
Message-Id: <20220117165853.1470420-49-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090114_923303_82D1462C 
X-CRM114-Status: GOOD (  10.37  )
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

From: Miaoqian Lin <linmq006@gmail.com>

[ Upstream commit 399c91c3f30531593e5ff6ca7b53f47092128669 ]

The of_device_get_match_data() function may return NULL.
Add check to prevent potential null dereference.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20211224082103.7658-1-linmq006@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28ad9403c4414..67b005d5b9e35 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
+	if (!mipi_tx->driver_data)
+		return -ENODEV;
 
 	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mipi_tx->regs))
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
