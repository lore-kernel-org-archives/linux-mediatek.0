Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC46C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIKXHN9bwjm76SYMbazR03J6pChEQ/461TOf+rEGiHs=; b=UvmPlL2R/sponaPUa2xLK65n3Y
	t/WOUcZXZwcLgnzPKoLVbf5QT2lQ0NvJ2lVuQrg1Vj5eVqBnTuAcLt4BqaUE1ZRXk0j80HeJE0pOK
	MbydhQdhpqLMhrzD92hndBsOGvRCJbIQxvlEvTndkFIOIPCjVL77tMex3TWe3FMeB3tZ4Rneg52O9
	BtiJhMcqcjah01IuuI6oGGy3meUaNnaTwfHRWMcORo9jQhzYRSsSvSTcOI9kZq7zBjrqBF/gtbBXX
	04shLaFaiKN76SGy0qM94wqLVVUbezgnCExo6UXS4NVY13kCz0pqGwSf8gDsYbqKzZcbKVCMxFB1n
	f+1mN61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPh-00GzSN-US; Wed, 28 Sep 2022 15:55:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPI-00GzGL-Ty; Wed, 28 Sep 2022 15:55:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7AE53B8211B;
	Wed, 28 Sep 2022 15:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F31CC433D6;
	Wed, 28 Sep 2022 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380530;
	bh=qtQPDKCYZ/wlqIizvS08i9p0N53rArTptfBEo4YTjjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XtJko+sP0l0i1L7qt5nSiIXQ7KCikEp9nlQq1hW4glAT8r0Wrd/lFgQoTZvKAFltN
	 +yTfMIWZvMGxdXhEjNencg4ev0p7eOzXg6ELU0/iVUCiqmhC5MHlJyMR4Uzho6Ino0
	 KxVIm51HDEoxEb+ZRPlzO5oEeu4OSkYQpu2TFsrnnb8YXG7x92quvl3Ql3Ly9JIrPM
	 JVabcTgsJn1KlrrMe2W1EpWZHwimZUC1E5zZc9pJSFO6PeTqN/35XY7D1QUf3GMwsF
	 pQnyt/FFcEqwCvnQRbiKBDHddDTMzOXyFdrfdxrVpqlmery+MejCnkHlCgDImM3Khc
	 9gJiiacg6YZWQ==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/8] soc: mediatek: mtk-svs: clean up platform probing
Date: Wed, 28 Sep 2022 17:55:12 +0200
Message-Id: <20220928155519.31977-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085533_149220_BF859513 
X-CRM114-Status: GOOD (  12.84  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

We only ever call the SoC specific probe function from
svs_platform_probe. No need to carry that function in a global
datastructure around.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/soc/mediatek/mtk-svs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..fd0f636e8644 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -319,7 +319,6 @@ static const u32 svs_regs_v2[] = {
  * @banks: svs banks that svs platform supports
  * @rst: svs platform reset control
  * @efuse_parsing: svs platform efuse parsing function pointer
- * @probe: svs platform probe function pointer
  * @efuse_max: total number of svs efuse
  * @tefuse_max: total number of thermal efuse
  * @regs: svs platform registers map
@@ -336,7 +335,6 @@ struct svs_platform {
 	struct svs_bank *banks;
 	struct reset_control *rst;
 	bool (*efuse_parsing)(struct svs_platform *svsp);
-	int (*probe)(struct svs_platform *svsp);
 	size_t efuse_max;
 	size_t tefuse_max;
 	const u32 *regs;
@@ -2347,11 +2345,10 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 	svsp->name = svsp_data->name;
 	svsp->banks = svsp_data->banks;
 	svsp->efuse_parsing = svsp_data->efuse_parsing;
-	svsp->probe = svsp_data->probe;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
 
-	ret = svsp->probe(svsp);
+	ret = svsp_data->probe(svsp);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.37.3


