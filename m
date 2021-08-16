Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003CCC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 07:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB07261AE2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB07261AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nd5RNzQe+/4R5zmKVWGMlElSoZ6bZY1D7y740hNrXEo=; b=jIdU9VRR7XF5DL
	V3VnAhGXLmTPcb2vq3v06rZPT1/63AjyyaOrD+SxqGs6upE5nhIgVDG5MzZsrQ7W4gYvKZeJ8uLr7
	vNFqkaSp1MF34AE3syBkdIImepSafNLsw6GBmeD8KnrDJinZrCf7tLkuceD/SLimGgwDEYDgjDVKb
	vTNTjFlsQtgkKzDu30Hzam5LA6y0OzuYHWzl+dzvOS8rC+K14xGk1CuqI+qQkGwa907/dmQUmB25n
	BbXxV8lGlL60MAVf7Qx7ta0YkGydd7rXD4ZJRklxxZfEGb3gNaNDMwcgAJvoP3gMjEJcK3bb1EJWM
	mjrlkcnKfd2Ck69PQqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFXMw-00GRcl-EM; Mon, 16 Aug 2021 07:49:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFXMX-00GRSs-To; Mon, 16 Aug 2021 07:48:54 +0000
X-UUID: e2e499a6fb9f4b2ea9defb2a5113c4a1-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=inSsqYLmLuK24ONJ/3D4jv5VY+paAIalUAcafhg7354=; 
 b=WStAhX+SWsG8BitAq29z1janIqo+NJ4jiSGueBk4AkYUUa4PeS9zuKLsuqczEf8pO+HxRYgMF/HZzs4Iv0x82hIGTvQJEABJQgtjvElKyAiIFIZXCodxCw6gJYCgCtbic8M9x+ajEG/LZI7I4iTt5gXXAr51Znvcungj3j7jXso=;
X-UUID: e2e499a6fb9f4b2ea9defb2a5113c4a1-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242824187; Mon, 16 Aug 2021 00:48:42 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 00:39:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 15:39:12 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 15:39:11 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, Mason Zhang <Mason.Zhang@mediatek.com>
Subject: [PATCH 1/1] mmc: mediatek: fixed clk contrl flow
Date: Mon, 16 Aug 2021 15:38:14 +0800
Message-ID: <20210816073813.11715-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_004850_830647_7268E5F7 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this patch fixed clk contrl flow in set clk rate, no need close clk src,
gate cg is enough, so no need call clk prepare/unprepare.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4dfc246c5f95..d9835b272c1f 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -895,9 +895,9 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
 	 * So if want to only gate src_clk, need gate its parent(mux).
 	 */
 	if (host->src_clk_cg)
-		clk_disable_unprepare(host->src_clk_cg);
+		clk_disable(host->src_clk_cg);
 	else
-		clk_disable_unprepare(clk_get_parent(host->src_clk));
+		clk_disable(clk_get_parent(host->src_clk));
 	if (host->dev_comp->clk_div_bits == 8)
 		sdr_set_field(host->base + MSDC_CFG,
 			      MSDC_CFG_CKMOD | MSDC_CFG_CKDIV,
@@ -907,9 +907,9 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
 			      MSDC_CFG_CKMOD_EXTRA | MSDC_CFG_CKDIV_EXTRA,
 			      (mode << 12) | div);
 	if (host->src_clk_cg)
-		clk_prepare_enable(host->src_clk_cg);
+		clk_enable(host->src_clk_cg);
 	else
-		clk_prepare_enable(clk_get_parent(host->src_clk));
+		clk_enable(clk_get_parent(host->src_clk));
 
 	while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
 		cpu_relax();
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
