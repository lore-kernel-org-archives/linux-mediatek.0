Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5960E60E9C
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5960E60E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lSARBlp5GxYm0sTSHME02/ifc4qJR0k4oQFNNuXJKtw=; b=FzZU8zqImBpVIV
	p5THpsfBer142rYZopRCU+p9jTo7Cc/rjt8S7aPYg0iT88CuTjd09Orlp9udhotkHpaXtZlvUTZeI
	zxinVEgwBLKFlDig8qDk2pwQKHxsLwPPVtZBIrdINp1VZAlO94MfFwN9B9UCaXqcmUhJOMks+puBg
	SaWxzC0AUiuWgd4uzpAD1SeUNuw4Kvy9GBnORBCbf6QW82NF41Fs4+4RAuMsRuxt4rt1nDDASUYg/
	Mca+Hs/RJ4/Sy2w5cuF2d3tnXdraAHcZImP3gSLZZIx7W58eP1Eknix7jceecut/xOkhMawDOkvqf
	+RPcmEm3dy6I8m8ULuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meKCJ-00CyHb-Q7; Sat, 23 Oct 2021 16:48:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meKCG-00CyGT-0W; Sat, 23 Oct 2021 16:48:42 +0000
X-UUID: 3a46460c41d04377a2901df2938eaf21-20211023
X-UUID: 3a46460c41d04377a2901df2938eaf21-20211023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 503818176; Sat, 23 Oct 2021 09:48:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 09:48:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 24 Oct 2021 00:48:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 24 Oct 2021 00:48:32 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH] mailbox: remove the error message when gce clk is defer
Date: Sun, 24 Oct 2021 00:48:31 +0800
Message-ID: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_094840_084573_5C48756B 
X-CRM114-Status: GOOD (  10.30  )
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

Remove the error message when gce clk is defer.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index fd5576a9f8b4..684b8aa1e445 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device *pdev)
 				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
 				cmdq->clocks[alias_id].id = clk_id;
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
-				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+				if (IS_ERR(cmdq->clocks[alias_id].clk) &&
+				    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
 					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
 					return PTR_ERR(cmdq->clocks[alias_id].clk);
 				}
@@ -586,7 +587,8 @@ static int cmdq_probe(struct platform_device *pdev)
 	} else {
 		cmdq->clocks[alias_id].id = clk_name;
 		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
-		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+		if (IS_ERR(cmdq->clocks[alias_id].clk) &&
+		    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
 			dev_err(dev, "failed to get gce clk\n");
 			return PTR_ERR(cmdq->clocks[alias_id].clk);
 		}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
