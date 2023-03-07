Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE9FC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 05:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=skQAH1wrki2jdU4ERbZ2RamtIdkAj73e5Wp+ZsDAZIU=; b=2lzZzBMrhBVbW9uKDm+eoTOB9M
	ibgA4KTzWPYQtZYs7x6pGbz8W8Z224LYPdA0e2NOsuweAYaX8JY8o4vP5kg/LAbVVdpgzHqVvQSWO
	2Y4t1tnrnr6BJGX/0sDQAASfMlO8H5k2iTYJbuwS65wR85tUY9/Ri5ZX+bVZS28Shb8UfwCmmanIn
	YP8dGnhIWkU4ajL3q+J5N0+lJ3o8TOoaLf3ysaiLdsnvq4UumtP0hMgmW5KwMP8sG8h42xR8nlOlG
	7EbyWVoftLClG56ZM+Fy7s4D3t7EaJaNOQm13PPQnv5bCnGECDR0m/KNsubwSnfPojWKTx469ZC7F
	rJOatrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZQLE-00GIw1-RP; Tue, 07 Mar 2023 05:58:28 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZQL4-00GIu1-48; Tue, 07 Mar 2023 05:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=skQAH1wrki2jdU4ERbZ2RamtIdkAj73e5Wp+ZsDAZIU=;
	b=dQxOWeaWfuWlonSb7loPyvR9fpLIXetKzV8qre5rzqeGpb6E89FtwlkCtDWWcd
	pWv3xwOE6+x5/B4d0y+xoEjZbuPkoABP0YKw2h8niy1dz2H3IRivyyPCw+bKGWA3
	4DXv7PncwpTk30GMNtW3y4HDNQUnEW+U3ili+Q+J20x0o=
Received: from localhost.localdomain (unknown [116.128.244.169])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wAnl1Nd0gZkkjaPCQ--.38627S2;
	Tue, 07 Mar 2023 13:57:51 +0800 (CST)
From: oushixiong <oushixiong1025@163.com>
To: Bin Liu <bin.liu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oushixiong <oushixiong@kylinos.cn>
Subject: [PATCH] mtk-jpegenc: Fix a compilation issue
Date: Tue,  7 Mar 2023 13:57:48 +0800
Message-Id: <20230307055748.1836087-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnl1Nd0gZkkjaPCQ--.38627S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xr17XF48Cr18CF1xZrWrXwb_yoW8JrWrpF
	Wak34vkrW8Grs0grWkJw17JF15Gw1fXFW7Wr17uw1Iq34fJw1xJr1jya4FvFZ2vrW7Cas3
	Jr10v34xGr4qvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfL08UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBzggrD2I0XjhvrQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_215818_507719_1F17E340 
X-CRM114-Status: GOOD (  10.73  )
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

From: oushixiong <oushixiong@kylinos.cn>

‘mtk8195_jpegenc_drvdata’ defined but not used [-Werror=unused-variable]

Signed-off-by: oushixiong <oushixiong@kylinos.cn>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..b875fc664150 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1846,6 +1846,7 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
 	SET_RUNTIME_PM_OPS(mtk_jpeg_pm_suspend, mtk_jpeg_pm_resume, NULL)
 };
 
+#if defined(CONFIG_OF)
 static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.clks = mt8173_jpeg_dec_clocks,
 	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
@@ -1898,7 +1899,6 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
-- 
2.25.1


