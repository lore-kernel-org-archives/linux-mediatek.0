Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949CCCD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68ipe2O4pqWvOe4bMgFdv4zPowi9Mafrd5369J3urAM=; b=El4V/dnmYLgrnSAkkOip2kLKU2
	+uTQDYGj8RyQIDt7VvzRhLFuH24vvK5qRzxR5EqfNSsEIqXArHoAXFQ3t43c5tXNlfXatJYJgWpgD
	pxcZW5I2ti92i0lB0/XUfiPEN4gCuEA23LW8WtCgbWEWVTZaN/X1cu3hJVY6H143zqwX222wAv/S2
	xyGAZ7LJljevJWHeo3+a5TNKFhwC/gkOVALFZ/ilfHwoR/eNIPd3YY5fQVn1ZdHx0s2oIhX2lg/1Y
	GJ2XovyGkzhk27q928s/miK1/GgU354SxU3iLyVMAi5gjHwOXvJQAin5aFlemkSk6U7Jx6MN5NTd/
	0PeB6PCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEsg-000000033T1-3SoC;
	Tue, 09 Apr 2024 17:03:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEsN-000000033KK-2wFm
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 17:03:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsE-0003vU-EZ; Tue, 09 Apr 2024 19:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsC-00BKy7-Eu; Tue, 09 Apr 2024 19:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsC-00H4tQ-19;
	Tue, 09 Apr 2024 19:03:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] gpu: Convert to platform remove callback returning void
Date: Tue,  9 Apr 2024 19:02:47 +0200
Message-ID: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=SInnTnTlpk4lC0a1OFt5dfcAXu152vN+6fS/Qz+hcZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXS3eAV7HI2w8HMoMiE4vmmyNOiQhnxVpMoga STlONQCJeyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhV0twAKCRCPgPtYfRL+ Tm+HB/92rq+dGfXMi0jrB/Ig/F+qBugwFODSuTOyjy9rrlH4AbZ4W23SnRx9za6p66ippE8ctgz 9TSLyCzQFTSC1kUwwpfXiF//p46buUY7wyYNB+1r9bavrmtsfuUkxRiJBk3P/tFZ28590ooBHUf 3yanYVUV6taxIgLBgoTtP0VPRWVc7pF/NM9ROjGokRfxYButJMxp2QFvxylGFwzU5kZnrKx2+z7 85Gu6iiva8+Vvl9PYX0+fizhotAEJuzFoGSIVDJcXGWiZLs34HriSVUiRa5zOOwEIS9Ipfm6RJO 0fV6zSjsXrEXUIyQ4e3uTNm5H9eGFEBBhs3DLnhZuy8EwSdC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_100316_574079_31B73604 
X-CRM114-Status: UNSURE (   7.00  )
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

Hello,

with some patches sent earlier[1], this series converts all platform
drivers below drivers/gpu to not use struct platform_device::remove()
any more.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

All conversations are trivial, because the driver's .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches. This is merge
window material.

Best regards
Uwe

Uwe Kleine-König (4):
  drm/imagination: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  gpu: host1x: Convert to platform remove callback returning void
  gpu: ipu-v3: Convert to platform remove callback returning void

 drivers/gpu/drm/imagination/pvr_drv.c  | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
 drivers/gpu/host1x/dev.c               | 6 ++----
 drivers/gpu/ipu-v3/ipu-common.c        | 6 ++----
 drivers/gpu/ipu-v3/ipu-pre.c           | 5 ++---
 drivers/gpu/ipu-v3/ipu-prg.c           | 6 ++----
 6 files changed, 12 insertions(+), 23 deletions(-)

base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
-- 
2.43.0


