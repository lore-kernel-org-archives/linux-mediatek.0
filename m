Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3097C761AF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8r/rxqHBnmlJi+sdym4UZa+vV2zOg3lOCf4rvkDQmk=; b=RCLFgFkEhgsNoagXZhUkZIc0rS
	VOU/ayVKh70XZ9rYgRuBxh5OEp5OoNFCLxP3vNY7tCpAKV4VkKZ75n/8buOqPXhILmoCaxoPU59kP
	Au9wkTLNeCulI3OSX0wzZ8DsNXI1q85AtJzfHD4zbAciagCQP91dB4OFVmT9YObza5hap23K4ZjhI
	v45UVxkD7Ogyq7YdpHQ4eM0JJCoXHN9ckqzpYSmJ5bh5KMvA6pOou1vOz/zOsabCaEV3vPFPr0top
	kFEk3716ONnaSUAD0UoNBqgoY35b6lBDKB8uOFedmSA/larp6XtE/AaofDY9VHij/Dsm3O6ftChzR
	mGr2UJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZg-008k4p-2F;
	Sun, 26 Mar 2023 15:46:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZd-008k2h-23
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 15:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z8r/rxqHBnmlJi+sdym4UZa+vV2zOg3lOCf4rvkDQmk=; b=P9vmuprJn7RZaM8Led9vy93pv7
	MicqVi8gOu/IMQ+UY7d9x+piVeJ1V3bnwHwoCoSKfTV1J+AxSBOppBPPn5uOvPkpVTHug3WsEZ0QK
	N1+TDXrxApxzCa2qj26ojoNsVnu2l6UMdxh8Ta4VD+eIr2Gv+hfTLD1TNC3Whgx9HB8uphK609FbH
	I6ktNmdwicyX89xSEN5avvqYvg6r9B2YsmpbSWc+uiyDkA79Osqlq3+U8ikQtoEcZIAdoTtzXuLik
	vSozurY4xJiVGeJFI+VyDzGoNUG3wfhjlFoL+oxTz4NmtoISn5EgtbRF8uuPK83bThc94CX8rJJNT
	rZdfMnjQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQU-005qln-0f
	for linux-mediatek@lists.infradead.org;
	Sun, 26 Mar 2023 14:33:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ9-0007u7-Ss; Sun, 26 Mar 2023 16:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ8-006raq-0o; Sun, 26 Mar 2023 16:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ7-0088VX-Cx; Sun, 26 Mar 2023 16:32:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 027/117] media: mtk_mdp_core: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:54 +0200
Message-Id: <20230326143224.572654-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y8bSdpHxKUjCtkirbqVmfzAs2Ji59QmvfnVDIgdxzcQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFan6YuIoMjUGZnFCQzpGpWS/hnIDnLhYY6Pb Me2nK1dfZ+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWpwAKCRCPgPtYfRL+ TnOQB/9uXk4tzwoMLL/P51kVbWyicAA9ErSPE7tziq+q6StcUfDCBSAksMFr/C/N4DYWFnXZrAN ZhskqwE0/YIi8VBK9HVCgFn3ceDMqEVaENs4z5Udpr8cOo0MbRSBnOiVXsb9fMQwdsM63SZJ7j8 gpyngUq86GkXUGoiW1TY0aR5C1och9yyzawc4Eck6F2TzJOFimpCvYXiMK2MIDT/Sl9iaivxHOn oOCWhYTOtE96gymBOk17/xnQjQsLljkPRU+cZILEbUP48q8UcidqLzGmdB+Nl5cKarKt3QKWP4D cs64Ib3/Th4jWpkJBflC9/+R/fNKMJvQle91G7GsWT94GPw5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153254_511541_B4262497 
X-CRM114-Status: GOOD (  16.02  )
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
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index d83c4964eaf9..77e310e588e5 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -235,7 +235,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_mdp_remove(struct platform_device *pdev)
+static void mtk_mdp_remove(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
 	struct mtk_mdp_comp *comp, *comp_temp;
@@ -255,7 +255,6 @@ static int mtk_mdp_remove(struct platform_device *pdev)
 	}
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
-	return 0;
 }
 
 static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
@@ -299,7 +298,7 @@ static const struct dev_pm_ops mtk_mdp_pm_ops = {
 
 static struct platform_driver mtk_mdp_driver = {
 	.probe		= mtk_mdp_probe,
-	.remove		= mtk_mdp_remove,
+	.remove_new	= mtk_mdp_remove,
 	.driver = {
 		.name	= MTK_MDP_MODULE_NAME,
 		.pm	= &mtk_mdp_pm_ops,
-- 
2.39.2


