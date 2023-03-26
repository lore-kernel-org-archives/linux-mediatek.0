Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3443C761AF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlk6m/KEPDyJbcUgQACZlkUk4rg5OOUxbhtEfK9bxKk=; b=cASlnpQNUIzgL6uaGj0nAmMT3b
	aQ4F7YwgLxeHKzo8J6kc1nfg37fQ8vLfBifQOIFBJ5eW9joKkwxvqkfEIzE6kt/ZYfyv78/nxM0RV
	3ETKQNPEYwzSoRYzdHlKocXht08NLEPzmam1y3/rIGuZz/wFb2jYY6Poit0BoyI9UAq+HjCKefzCc
	CIRkrPh8evL9XHM10DsZRhKm4t1BJ7SxL8e/oyo3utCYq1jNDfVxxb9w4VmKGK9Rhe89UrThcXt9/
	gAP+RRQyo3YjMpJnSYeOm9T+oCtSOcA2RjIkmbaulilz0Fd84d4u88ou0Wljw7u9VPC+t1luEgo/s
	8T2w3txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRRv-008a01-2u;
	Sun, 26 Mar 2023 14:34:23 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQk-008Yzn-1g
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Jlk6m/KEPDyJbcUgQACZlkUk4rg5OOUxbhtEfK9bxKk=; b=KBpxNzurLW6CXbuvtfcaD+NZBy
	UMcZc7HRzwhSX8eUyTl2yTcexSKnnWmSuGld6FjkUaJMvpi8Vh067f+hq362XdlXtrEFO+kTdZxO7
	d6gumXthpzckp4ucUMijuKQyaRwd1AeVB+20Bi5FeE+/h6/HZeCjf8yP4t2lzsQkFX/0Jrt/5k2qa
	iSf+PGpItwaHIPUbfBj0sHmWbvG2+4OFaP6zjlb0U0zPPKZB9aBIoEIJudu5+d7b1H6+8gHIIYsFh
	YJq8Ifav/L+/Me1Q5r26AeAIL3mGdm/Itc9In2q8faoMufQ9+0IP6RoSLkmzfpp+ReooeGojB6XzF
	+Q1q8pNQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgRQd-006aQt-2z
	for linux-mediatek@lists.infradead.org; Sun, 26 Mar 2023 14:33:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQB-0007zm-6n; Sun, 26 Mar 2023 16:32:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ9-006rbF-LU; Sun, 26 Mar 2023 16:32:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ8-0088Vn-7D; Sun, 26 Mar 2023 16:32:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 031/117] media: mtk_vpu: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:58 +0200
Message-Id: <20230326143224.572654-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5AnskvbJ9P6qn4bjvfh8odB1G7YnnigrgkIsVya1kFw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFasvO2cvWqi/Z6zq3C/m+ICsHa4M+7Z3cNjt ZBzIamySpOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWrAAKCRCPgPtYfRL+ ToTyCACzflSqkfkNslDRxcB7Zlt5Y526OmU7az8FU4sINBxILXtY25jkHnky6BMeeS+In+qLJ3j ogZQT2BX1uJLwC9oVqthcfsca1u1ujUV3ugS0g03UFqvzc1MrdiwcNWd8yEQrrciYoSu26Ju+gc nItJWUAKA49+D6SE+bxte27q0hpfXgCjUf/PLfEpv7wSP/RD9Z2c7QtSK9CGLDKwiCIzw+0UUXo bSg2MJmODWi2mOITVH9Y0bZPtCK0X6z3kyccACRVWK+PBgYNgLVdHraAOG1h2GBQUNSwNuRsClO WnIPUZnDjLzXnR2AbZCXixWhGY6uPuRFzmI8Mk7pcSrwoPg5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153303_141032_6264B4A7 
X-CRM114-Status: GOOD (  13.56  )
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
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 47b684b92f81..5e2bc286f168 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -953,7 +953,7 @@ static const struct of_device_id mtk_vpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_vpu_match);
 
-static int mtk_vpu_remove(struct platform_device *pdev)
+static void mtk_vpu_remove(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
 
@@ -966,8 +966,6 @@ static int mtk_vpu_remove(struct platform_device *pdev)
 	vpu_free_ext_mem(vpu, D_FW);
 	mutex_destroy(&vpu->vpu_mutex);
 	clk_unprepare(vpu->clk);
-
-	return 0;
 }
 
 static int mtk_vpu_suspend(struct device *dev)
@@ -1040,7 +1038,7 @@ static const struct dev_pm_ops mtk_vpu_pm = {
 
 static struct platform_driver mtk_vpu_driver = {
 	.probe	= mtk_vpu_probe,
-	.remove	= mtk_vpu_remove,
+	.remove_new = mtk_vpu_remove,
 	.driver	= {
 		.name	= "mtk_vpu",
 		.pm = &mtk_vpu_pm,
-- 
2.39.2


