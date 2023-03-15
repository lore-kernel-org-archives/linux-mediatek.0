Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D1C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGIeZpAuac1sqQS/lY43vdBtxXFv18Izxal1ZxMTLaA=; b=hHwyOssuo4F0WkYPbAfCmAjefn
	uXbW07RHw6DlQGD/kiUn+LdxzaRpvxEqxSzOy2drLRdiiJO//xwIbPTqP+C7NcwbDBeL/Nns5K+5H
	H0ZM4ZI54T9tYzxfJcY/i1fgs5+Y64m3gYDEuy1Zq0dhQ61CltIq3hJxijDjdjw1B4q92dQnQhSig
	W4tynb7ByuvvQJhFDMPredFDGla2gUSrr8RmMYmjoNOsHFPG6nFO+G40adooXhXSVwOC+dZeAgyKA
	l3ukBcqTGLBolPIGb3dmhAtQNoWculexAktxZAASulMpfkhNMabGSM1HJ4gui+VZfNG+GXcx6CPh8
	izOSeFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSq2-00Dp64-0v;
	Wed, 15 Mar 2023 15:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkU-00DkHQ-2M
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mGIeZpAuac1sqQS/lY43vdBtxXFv18Izxal1ZxMTLaA=; b=D7gdVFjkJp+I5y/MZmkmS/0upD
	npkGnGpfWTK2rmW07lSRjMh42hD6nJ8WBFQjRp4kb/GF9Sx8dYVe/2SFWZz6N2RY7knBmLOj1xeDU
	Fm0rzm4/e9DJaZ/QXP91F75Y/7X14e9ZxlY95Irs0XqMtnqrYVQqYL/Gf4IZFe06Z+JaiZEgBCAHD
	ioI6zGLkPZyQdNeUzOJBHkQI1+aH8JZFiWos1dkV7JBPHzyxvHz7149lMVZdm84WAoOuNV9fleBdA
	2mK51kjicdCvyv4l1/1xmHVMsbtC/7kcphne9qSxWbUSFkw3dSQYJ4I+cTKP38LN+R4u+Q2iaQXDA
	Av4TMqpg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk3-0028ee-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:09:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0008N4-DX; Wed, 15 Mar 2023 16:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-004Kbo-Ul; Wed, 15 Mar 2023 16:08:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057id-2a; Wed, 15 Mar 2023 16:08:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 106/173] ASoC: mediatek: mtk-btcvsd: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:38 +0100
Message-Id: <20230315150745.67084-107-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ahl9KygTwblq68kPHzDYsCEqiARfMFVXvf8GAD2RDMg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5rdLn2/QrNzz4s3XIAZIoZBbbcn3NAB5SYf Pxf3yJ0MV2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeawAKCRDB/BR4rcrs CQ6pCACY1l5JzzFwlvblloFP5e2I/4MbxP1QaVkmoDqg50Sx0sgrREEZzRHuGZO5gqOp5zYXso+ aBrPJRmH4juyzHtrT0AVChmffwf13AJZz1eT6gVgKXYp4mTHpMUN4oArqDPrUirnnWXRAo/N6sN VZGND1DfZo+hoSyiqBLolJlCDrkeoj1k77bhj37X/zlzUTsgWwjoTRSiMRm5UJUG2MwAoH+/UMC G3BmOKbVl/clkIu/PhEcrxpJ9NoQ3MvfhMcbktr0/Tdienya0ezfbi8Hxk7C5iOKNYKWmNwBiG5 NK4l5T6mlT+JXFdiEBaqPfV40WsbzCHHvUMa0pvyfNnc0WpJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150903_576131_B1342FED 
X-CRM114-Status: GOOD (  16.59  )
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
 sound/soc/mediatek/common/mtk-btcvsd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 1c28b41e4311..1ba0633e542f 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1387,13 +1387,12 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_btcvsd_snd_remove(struct platform_device *pdev)
+static void mtk_btcvsd_snd_remove(struct platform_device *pdev)
 {
 	struct mtk_btcvsd_snd *btcvsd = dev_get_drvdata(&pdev->dev);
 
 	iounmap(btcvsd->bt_pkv_base);
 	iounmap(btcvsd->bt_sram_bank2_base);
-	return 0;
 }
 
 static const struct of_device_id mtk_btcvsd_snd_dt_match[] = {
@@ -1408,7 +1407,7 @@ static struct platform_driver mtk_btcvsd_snd_driver = {
 		.of_match_table = mtk_btcvsd_snd_dt_match,
 	},
 	.probe = mtk_btcvsd_snd_probe,
-	.remove = mtk_btcvsd_snd_remove,
+	.remove_new = mtk_btcvsd_snd_remove,
 };
 
 module_platform_driver(mtk_btcvsd_snd_driver);
-- 
2.39.2


