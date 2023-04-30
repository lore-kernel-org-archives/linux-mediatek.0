Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F40CC77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6APRiyyfheCffak53fUq9TawjU2Z4kVcZVV8iouhKM=; b=WKKwjqUbZDp216tI4WuYKSe9kv
	I77SOMnhafr1rCDMv2qX/mvCHekYqekcVALc1yKExV33s0YggkY2GLyegFNXqvTilQZj3Sd/oQHsc
	bfhCoHN1rkQwO+Xt+8SBKW2swvEQ3U1GyjfbqiLNRlfNe+FE7xV919+Qii/SHgbY7NbsLq/g3H2Mw
	bKfsqEu0TFYuD5gC2NquNI4e8xoapfsBXbB9JL4N/Ki6n1AgfkL9gLSlokcyK+/QpvuKr6Qha+/wv
	iLktoACsWYDxFWBzEA8qfxRiZ1DZoPyCZZSFrMrWSjpAYsGDqMfXfkkSepmirnt+CmhVgQl65eCr2
	v/vFHR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptCK9-00Efow-0j;
	Sun, 30 Apr 2023 19:03:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptCJz-00Efki-2Y
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Apr 2023 19:03:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptCJk-000107-FR; Sun, 30 Apr 2023 21:02:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptCJi-000BkQ-UO; Sun, 30 Apr 2023 21:02:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptCJi-000CVY-Ak; Sun, 30 Apr 2023 21:02:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2 0/3] clk: mediatek: Convert to platform remove callback returning void
Date: Sun, 30 Apr 2023 21:02:30 +0200
Message-Id: <20230430190233.878921-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10321; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yi38ZNBe422kMp3NmIyzP5FFyPAo88KbdZSHZkyBX5I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkTrtCRUnTKBoeengByFM28SbkcPTBhNIvW+pCb t/0AqVh7LeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZE67QgAKCRCPgPtYfRL+ ToMIB/9QyNh8IE9eMbfGLSrr3lEwIQbdliqScw1cLmj06hr0fbmZlSWOs0uWL2tqCZXQD/agmJN UPQVCIm8TWSUs/TLIxhLUL5oWhxgG1qRhZAaJrYEpDZVDdTFi/k34NjoXEIOtjR/JbSr19u1zNU heX9rkqJBqryb6scrlXaZrFjet+DV/qrvu2cSBo1jndkbzZ0oR3K6znj46IbMZGCIzK4Yc+fTfv p/jt0ZllDtHMRAF6Z96hKq6S8ai0pHG88Bb/0ihmy9iojpB6Du2m/uQQpGw+YpJLgNwIt8QkHZc HZOM00NDL7GbvIZ6ewwu8eFL5UPOvI9QdYpPXJIA6A+YsfJg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_120256_003934_2A418D82 
X-CRM114-Status: UNSURE (   9.90  )
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

this series aims to convert all drivers below drivers/clk/mediatek to
the platform_driver's .remove_new() callback. There was an earlier try
part of a series to convert all of drivers/clk[1], but the mediatek part
conflicted with another rework[2]. The latter has landed in Linus
Torvalds's tree now, so here is a rework.

Best regards
Uwe

[1] https://lore.kernel.org/linux-clk/20230312161512.2715500-2-u.kleine-koenig@pengutronix.de
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=726914

Uwe Kleine-König (3):
  clk: mediatek: Make mtk_clk_simple_remove() return void
  clk: mediatek: Make mtk_clk_pdev_remove() return void
  clk: mediatek: Convert all remaining drivers to platform_driver's
    .remove_new()

 drivers/clk/mediatek/clk-mt2701-aud.c           |  6 +++---
 drivers/clk/mediatek/clk-mt2701-bdp.c           |  2 +-
 drivers/clk/mediatek/clk-mt2701-eth.c           |  2 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c           |  2 +-
 drivers/clk/mediatek/clk-mt2701-hif.c           |  2 +-
 drivers/clk/mediatek/clk-mt2701-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt2701-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt2701-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt2712-bdp.c           |  2 +-
 drivers/clk/mediatek/clk-mt2712-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt2712-jpgdec.c        |  2 +-
 drivers/clk/mediatek/clk-mt2712-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt2712-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt2712-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt2712-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt2712.c               |  2 +-
 drivers/clk/mediatek/clk-mt6765-audio.c         |  2 +-
 drivers/clk/mediatek/clk-mt6765-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt6765-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt6765-mipi0a.c        |  2 +-
 drivers/clk/mediatek/clk-mt6765-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt6765-vcodec.c        |  2 +-
 drivers/clk/mediatek/clk-mt6779-aud.c           |  2 +-
 drivers/clk/mediatek/clk-mt6779-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt6779-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt6779-ipe.c           |  2 +-
 drivers/clk/mediatek/clk-mt6779-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt6779-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt6779-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt6779-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt6779.c               |  2 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt6795-infracfg.c      |  6 ++----
 drivers/clk/mediatek/clk-mt6795-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt6795-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt6795-pericfg.c       |  6 ++----
 drivers/clk/mediatek/clk-mt6795-topckgen.c      |  2 +-
 drivers/clk/mediatek/clk-mt6795-vdecsys.c       |  2 +-
 drivers/clk/mediatek/clk-mt6795-vencsys.c       |  2 +-
 drivers/clk/mediatek/clk-mt6797-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt6797-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt6797-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt6797-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt7622-aud.c           |  6 +++---
 drivers/clk/mediatek/clk-mt7622-eth.c           |  2 +-
 drivers/clk/mediatek/clk-mt7622-hif.c           |  2 +-
 drivers/clk/mediatek/clk-mt7622-infracfg.c      |  6 ++----
 drivers/clk/mediatek/clk-mt7622.c               |  2 +-
 drivers/clk/mediatek/clk-mt7629-hif.c           |  2 +-
 drivers/clk/mediatek/clk-mt7981-eth.c           |  2 +-
 drivers/clk/mediatek/clk-mt7981-infracfg.c      |  2 +-
 drivers/clk/mediatek/clk-mt7981-topckgen.c      |  2 +-
 drivers/clk/mediatek/clk-mt7986-eth.c           |  2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c      |  2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c      |  2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8135.c               |  2 +-
 drivers/clk/mediatek/clk-mt8167-aud.c           |  2 +-
 drivers/clk/mediatek/clk-mt8167-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c        |  2 +-
 drivers/clk/mediatek/clk-mt8167-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8167-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8167.c               |  2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8173-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8173-infracfg.c      |  6 ++----
 drivers/clk/mediatek/clk-mt8173-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8173-pericfg.c       |  2 +-
 drivers/clk/mediatek/clk-mt8173-topckgen.c      |  2 +-
 drivers/clk/mediatek/clk-mt8173-vdecsys.c       |  2 +-
 drivers/clk/mediatek/clk-mt8173-vencsys.c       |  2 +-
 drivers/clk/mediatek/clk-mt8183-audio.c         |  6 +++---
 drivers/clk/mediatek/clk-mt8183-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8183-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8183-ipu0.c          |  2 +-
 drivers/clk/mediatek/clk-mt8183-ipu1.c          |  2 +-
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c       |  2 +-
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c      |  2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c        |  2 +-
 drivers/clk/mediatek/clk-mt8183-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8183-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8183-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8183.c               |  2 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8186-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c  |  2 +-
 drivers/clk/mediatek/clk-mt8186-infra_ao.c      |  2 +-
 drivers/clk/mediatek/clk-mt8186-ipe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-mcu.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-mdp.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt8186-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c      |  2 +-
 drivers/clk/mediatek/clk-mt8186-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8186-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8186-wpe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c |  2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8188-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-ccu.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c  |  2 +-
 drivers/clk/mediatek/clk-mt8188-infra_ao.c      |  2 +-
 drivers/clk/mediatek/clk-mt8188-ipe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt8188-peri_ao.c       |  2 +-
 drivers/clk/mediatek/clk-mt8188-topckgen.c      |  6 ++----
 drivers/clk/mediatek/clk-mt8188-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vdo0.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vdo1.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vpp0.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vpp1.c          |  2 +-
 drivers/clk/mediatek/clk-mt8188-wpe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8192-aud.c           |  6 +++---
 drivers/clk/mediatek/clk-mt8192-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c  |  2 +-
 drivers/clk/mediatek/clk-mt8192-ipe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-mdp.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt8192-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8192-msdc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c      |  2 +-
 drivers/clk/mediatek/clk-mt8192-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8192-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8192.c               |  2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c    |  6 ++----
 drivers/clk/mediatek/clk-mt8195-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8195-ccu.c           |  2 +-
 drivers/clk/mediatek/clk-mt8195-img.c           |  2 +-
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c  |  2 +-
 drivers/clk/mediatek/clk-mt8195-infra_ao.c      |  2 +-
 drivers/clk/mediatek/clk-mt8195-ipe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8195-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt8195-peri_ao.c       |  2 +-
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c      |  2 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c      |  6 ++----
 drivers/clk/mediatek/clk-mt8195-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-vpp0.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-vpp1.c          |  2 +-
 drivers/clk/mediatek/clk-mt8195-wpe.c           |  2 +-
 drivers/clk/mediatek/clk-mt8365-apu.c           |  2 +-
 drivers/clk/mediatek/clk-mt8365-cam.c           |  2 +-
 drivers/clk/mediatek/clk-mt8365-mfg.c           |  2 +-
 drivers/clk/mediatek/clk-mt8365-mm.c            |  2 +-
 drivers/clk/mediatek/clk-mt8365-vdec.c          |  2 +-
 drivers/clk/mediatek/clk-mt8365-venc.c          |  2 +-
 drivers/clk/mediatek/clk-mt8365.c               |  2 +-
 drivers/clk/mediatek/clk-mt8516-aud.c           |  2 +-
 drivers/clk/mediatek/clk-mt8516.c               |  2 +-
 drivers/clk/mediatek/clk-mtk.c                  | 12 +++++-------
 drivers/clk/mediatek/clk-mtk.h                  |  4 ++--
 161 files changed, 190 insertions(+), 224 deletions(-)

base-commit: 6f7478e3bb2894309ebef08fac91ec896ce667d8
-- 
2.39.2

