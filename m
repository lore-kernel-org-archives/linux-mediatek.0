Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77342C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rBEBzmrl9XoJGiMo1gun/MhfnIgZlga2/d/Y7YOzdo=; b=xAlbmwN++Hzv+W6obyjy+i+lit
	owWA/yOyt0D3Z16n2ROnp2bSfzB9UmH5a4YfXfBdgOyH90QZ3mGXxMzlM0/CFrn337ZLNp3+l7Pb4
	NXCyWeq9qu8XMNjfk19l12FcTHkSCrVLegaRHow6iJ5Tx61ot7blrY8+HlTssulLGnW9bWnTjQSVY
	YyiFFCW87y95Uw9MVwKWQVPgNTtqp6jNl7CQyb9AVZhoZxP6uW4G14anqwIp91XFsQGZ5VRfxHzwj
	QdOZ7CdxGHPXlTtI93oOuZ1wFxXpR7LPaP1O6Otn8Z/YFAA1bpnFUTuIcb3MRsgthtEC26rCVq4IY
	CpeaG0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pehjO-00DV2D-1o;
	Tue, 21 Mar 2023 19:33:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pehij-00DUh9-14
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 19:32:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiX-0008Eh-Q0; Tue, 21 Mar 2023 20:32:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiV-005l6I-VP; Tue, 21 Mar 2023 20:32:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pehiV-006qyG-Bc; Tue, 21 Mar 2023 20:32:19 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/15] PCI: mediatek-gen3: Convert to platform remove callback returning void
Date: Tue, 21 Mar 2023 20:32:03 +0100
Message-Id: <20230321193208.366561-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321193208.366561-1-u.kleine-koenig@pengutronix.de>
References: <20230321193208.366561-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dm2KOnBfcDXLhSk/3xfJfQ1wwRbtFrvgg8+uKO1zBcs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGgYWaKJghlqrsHyZT29xkKwu5zIx0+OO7x5E4 Jnn5kss8P2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBoGFgAKCRCPgPtYfRL+ TsNqB/987bxfqmj7a9c2abs3SkeXq+XtDfRUVuHxPvwMkSuSd/L5R8raZ5Qwd25L6AVnXn1cdqT 9L/QmSLfi7wK/eVuJxJFNVhCHSEyD7dYVJCAdGm8QYpo3tT9LSm5tJ5mAPRqvxadkoK90gZMdwl z1Bq7byTiMSc98ZluH7ldc9JonWrZMZUTN7+fGGNN1GmoxYVNQA4QTs8WuiKPKybnYpFf+njpVf Ixzogqb6bouEnMo0Gy6bRWXD037BvLtzIOffHXfPuJgzuM5UZgME8a57yIWZWJWv77o2MxmyfqU doKcPSh7m05FaFjPwGCzyP0MGNlIspbVvHx/NfgYAcmPMOIU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_123233_484314_1872AE7B 
X-CRM114-Status: GOOD (  15.64  )
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
 drivers/pci/controller/pcie-mediatek-gen3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b8612ce5f4d0..e0e27645fdf4 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -943,7 +943,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_pcie_remove(struct platform_device *pdev)
+static void mtk_pcie_remove(struct platform_device *pdev)
 {
 	struct mtk_gen3_pcie *pcie = platform_get_drvdata(pdev);
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
@@ -955,8 +955,6 @@ static int mtk_pcie_remove(struct platform_device *pdev)
 
 	mtk_pcie_irq_teardown(pcie);
 	mtk_pcie_power_down(pcie);
-
-	return 0;
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
@@ -1069,7 +1067,7 @@ MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
 
 static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
-	.remove = mtk_pcie_remove,
+	.remove_new = mtk_pcie_remove,
 	.driver = {
 		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
-- 
2.39.2


