Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868C8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll6YGpIKic/fJIjuCuZafsLUOG8yDcOukKFLjujQHQs=; b=XTQ4W3bupG9rtrBSfGX7S/TURE
	TvxwI51WqyR8dsp+rmaWx4AbFvJE94eRl1GzMQ4H3s+XqoXs9ma1LD7sYmmL9HozPyOrRFOn8Y/8Y
	HPpcY5WJ5CPk7ePRGhaA2jaolFbZ+jgSBRbjTVHqmEj+oJo1oyryra+ZHIRNRRPckMGUVDLNOvOof
	WL3+Pdmrimpq4ct9SEJtTCZrIa7NfoLKU/1PGgyQrYJJUcMzj5WYl2jzpgSJXzdg1uo+2PthSCRFy
	JXeGPP0yK7ZGu1o+ka7W70FTJ1/lR/6NUmnogZqxCLz/fbR/g/r/RCCSnqJOj+WFn5MRgLwygTu4y
	S5I3u3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWkO-00F4MZ-1M;
	Wed, 27 Dec 2023 16:27:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWkD-00F4HE-1u
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Dec 2023 16:26:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIWjz-00059q-UX; Wed, 27 Dec 2023 17:26:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIWjx-001tZW-KD; Wed, 27 Dec 2023 17:26:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rIWjy-001Wmx-21;
	Wed, 27 Dec 2023 17:26:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <treding@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/11] firmware: mtk-adsp-ipc: Convert to platform remove callback returning void
Date: Wed, 27 Dec 2023 17:26:29 +0100
Message-ID: <e2ea8abb4c30190392a86cf05cecd722d0f0b493.1703693980.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703693980.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703693980.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=a63jCU/xmx3JjQAul7+0HQjMC2XzUPEGHuetp5aEk3E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBljFA3VZRLFHuI4OPARK9PwC54oddug682gpz+A znDmlUhrkyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYxQNwAKCRCPgPtYfRL+ ThSDCACWPSchgdcXQcSe1ovZmVZAWx9vNPIVAPhqu3ln3Y0yG+zsXGBC0H7gc9JaRmGlwAY+riC eSc7+8e3umCnEsXjDUEu6wJnGrWaJCNz4XQlWNzvPaZFSY+i7Mu4Ez+p6/+vcyu1KcXoXqvMFO5 67QAssIT+LYqZ/834Rieou/m7tWmsf3nBZavxgKHIqdkP+pH9gqxcaNnaFixFR89MkOfLUJ9aZH l9qeyQnZP819ihTK0OlbOu2YRAc0oB14rJ36x3WDkg+YwHzMTsBiMMubWPbCdQzfoeX27D4TvnG VKoMdv3Bb+9ECeJu3WAOA//PoFDN6f9c40u6nLxdDcFKxoD0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_082657_635233_27EC39DE 
X-CRM114-Status: GOOD (  16.03  )
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/firmware/mtk-adsp-ipc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index 85e94ddc7204..a762302978de 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -116,7 +116,7 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_adsp_ipc_remove(struct platform_device *pdev)
+static void mtk_adsp_ipc_remove(struct platform_device *pdev)
 {
 	struct mtk_adsp_ipc *adsp_ipc = dev_get_drvdata(&pdev->dev);
 	struct mtk_adsp_chan *adsp_chan;
@@ -126,8 +126,6 @@ static int mtk_adsp_ipc_remove(struct platform_device *pdev)
 		adsp_chan = &adsp_ipc->chans[i];
 		mbox_free_channel(adsp_chan->ch);
 	}
-
-	return 0;
 }
 
 static struct platform_driver mtk_adsp_ipc_driver = {
@@ -135,7 +133,7 @@ static struct platform_driver mtk_adsp_ipc_driver = {
 		.name = "mtk-adsp-ipc",
 	},
 	.probe = mtk_adsp_ipc_probe,
-	.remove = mtk_adsp_ipc_remove,
+	.remove_new = mtk_adsp_ipc_remove,
 };
 builtin_platform_driver(mtk_adsp_ipc_driver);
 
-- 
2.43.0


