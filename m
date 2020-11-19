Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D5CC63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 03:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED109208D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 03:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLqK3yOz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NTjOLM2N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED109208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EdSzq4pLWBUQb8dYpphytKpkTH5xwKTJr6NZyQ6tOo=; b=nLqK3yOzi9dhyWhInBSGnQl6fZ
	UDkrthlgTMNPz5c2rucDrnTpTFNnZ9izDIOr6X7qWlPpuEr4Pa7Voy3H4Z/XzAaNw1RG2kyNXu4qv
	EKMekp771WUPIhck9HXmHEgCNoeTKGNjtzSYGeINLjFFQ5olwJcEBGwbpWofhoU6flf6k+/0PRWpW
	ncO4j5DcfWDidx6MnC+3gqY4SVtt8X1rPfn9E/4hQluDu+IB5VN/mprrzbOXiG93/DZf7w4geFLWc
	lhuNKzscxeTWRAV+EVcuEiSBJOKSH06KxKMo/Ym+g0pvy/DVPdDzIoyArADAXv4ehNuzullpxqFWj
	PzPj4enQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfaNs-0006zO-ST; Thu, 19 Nov 2020 03:13:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfaNh-0006yL-DB; Thu, 19 Nov 2020 03:13:10 +0000
X-UUID: 16d58c90a6254354910c8cc453185a82-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sr/cjtYZPHwms86GhnxHfPVj6p42XwlxKEnV4mCB7Xk=; 
 b=NTjOLM2NuuvMQy6Dyida/v+nGi7/WS/BHEg2QDmFGYXERL1RJk+bNFsl6sPFAL2Bx0wJG8rOa/aFEz2P2Im+U4XiGmPcaitTlCpGAjImnKT5Hp/xrj46iJqJ+KmC0FZau8ZAP5wCGccSjqus5DViy1jn5F+ARKV73AO/jpFLO/o=;
X-UUID: 16d58c90a6254354910c8cc453185a82-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 303398328; Wed, 18 Nov 2020 19:13:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 19:02:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 11:02:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 11:02:55 +0800
From: Yong Mao <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH V1] mmc: mediatek: correct the setting of recheck_sdio_irq
Date: Thu, 19 Nov 2020 11:02:37 +0800
Message-ID: <20201119030237.9414-1-yong.mao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_221309_705459_73593A95 
X-CRM114-Status: GOOD (  12.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yong mao <yong.mao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: yong mao <yong.mao@mediatek.com>

correct the setting of recheck_sdio_irq for each mediatek SoC.

Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index fc5ee5df91ad..d49e5ccfca9e 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -463,7 +463,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt8135_compat = {
 	.clk_div_bits = 8,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
@@ -502,7 +502,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 
 static const struct mtk_mmc_compatible mt2701_compat = {
 	.clk_div_bits = 12,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -528,7 +528,7 @@ static const struct mtk_mmc_compatible mt2712_compat = {
 
 static const struct mtk_mmc_compatible mt7622_compat = {
 	.clk_div_bits = 12,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -541,7 +541,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
 
 static const struct mtk_mmc_compatible mt8516_compat = {
 	.clk_div_bits = 12,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -552,7 +552,7 @@ static const struct mtk_mmc_compatible mt8516_compat = {
 
 static const struct mtk_mmc_compatible mt7620_compat = {
 	.clk_div_bits = 8,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
@@ -565,6 +565,7 @@ static const struct mtk_mmc_compatible mt7620_compat = {
 
 static const struct mtk_mmc_compatible mt6779_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
