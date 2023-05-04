Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EBCC77B78
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acDFEn+OX/Lals+Oj6JMe/N36sJFtlZy/T03KlDvs8I=; b=08PKHhcLu73abtcuraA5up0ZWD
	r3+KnzXFukPSNqDWVpKryQTfoTAmDbKYpT8YgoZov2kSLDygkYpdVzJqDomKvMwvUykstGkhA7e2K
	hG8APo0j/pAUjGxw15tRzgBDoFAzAaR88xxvMzsMJ5pP/qhWklP1sU2nFJpHGeASaMzeDVAUX2CgV
	ZxAftJr7QPIMeY0lfQxZZSqFjnpVAE5EdwPxZx64PUqWvC5c9+8P8FFeByAzZN3GfE0THWiykxOk/
	stNw/2F+6vkOjfKM78p8l1oY2/X4C/S4OKEQY8HmLCcAHY8QeP7p1Yl0D/Df/Brb5WdHu+75CPt1x
	v9Se7LMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puetb-008qau-2x;
	Thu, 04 May 2023 19:45:43 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueta-008qaR-1H
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 May 2023 19:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=acDFEn+OX/Lals+Oj6JMe/N36sJFtlZy/T03KlDvs8I=; b=W/uVOI179cfPze045eabDq/SMS
	9hJirPnhbnaYqRwD2Dxccwg/r4LgvgjMUO7RKVRnKXFqpSiSqaKAIo5xuGIgTywIeQCwAzVwOTzzy
	fI5PL8WUqLCkA8GBoyhbRMG3AwMwrnYaOWQYTyHC9mdXXSUYuq+HM4h8zV4oUcumbgKgigqO6bJOE
	MO/F+uM99rhGjD3DK0cIKBBbjf5tvkEXaFP8k5BcalejegWcbp3chOQXkyN384GqKNm/OoAOKTvk/
	CKA9d/VGJ70GHtJEDt6JiKJP2/+n9Ner4ztWrGIz9yxFSNWfvawhi3LERg2yWXWzP4CHNeSm/Bf3f
	lKq6DvjQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puetU-001oxV-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 04 May 2023 19:45:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet3-0007fh-Qn; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet3-0018FV-3q; Thu, 04 May 2023 21:45:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet2-001JhZ-9M; Thu, 04 May 2023 21:45:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/18] remoteproc: mtk_scp: Convert to platform remove callback returning void
Date: Thu,  4 May 2023 21:44:41 +0200
Message-Id: <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4fwYJ+V0Yc/cRh0zfN2t4B8DRfhHdCtAUOLw7MonV6o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnDvcB0TQ0Hk5pLXQyuqPjhpLU0HXw+fmTdY y3sNUtPyISJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJwwAKCRCPgPtYfRL+ Tl8bB/9ect3PcdFDzEv0Uo5vIRhkDoXO+Qy186eSBHWLFJp3IF4YY2zha9wCPoBkfNOfLVzBzQh GnTY9PtOFDcwc/tq4sYYUmK1wXkMxsd09aZ7nF0RXrQJhuPjScCWafJJpbo88isqZl+R26PLz84 OCBqsDcq8BjjqEIxlwYsdMcJeOsaRGZQwCT9cxbZf6rQuBYUFZzlDKyPzRK7Ldec+uP2wBjfw8+ +/H99oPOnN8SjKBwGhW7QmuuxjjM0G228LzDpTW26r2GSN73xC97g0lGuZ1gAL+AZC+iSnzlk+x CQcancZc0y0ox6luFXr82W1706noTohriHIHrS0JA/6mlDos
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_204536_694471_DDADE45E 
X-CRM114-Status: GOOD (  16.34  )
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
 drivers/remoteproc/mtk_scp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e1d93e63d7df..dcc94ee2458d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -913,7 +913,7 @@ static int scp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int scp_remove(struct platform_device *pdev)
+static void scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
 	int i;
@@ -925,8 +925,6 @@ static int scp_remove(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-
-	return 0;
 }
 
 static const struct mtk_scp_of_data mt8183_of_data = {
@@ -1003,7 +1001,7 @@ MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
 
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
-	.remove = scp_remove,
+	.remove_new = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
 		.of_match_table = mtk_scp_of_match,
-- 
2.39.2


