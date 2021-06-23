Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935FAC48BC2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7D46128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7D46128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez558lKm9y6aC0rmVO8vJQOQZVA6tjBEyXSVogLSFkM=; b=lPcK5DQYH4QR6Y
	UC/O1lAqFNlxfsbXOupHqrC1DiTgytEpd0LMorcOcpdfMeNZDAcBhJfsQhH1+65hW5jNXEJkAN6j/
	Q4jZ69RkC56h1vjwYnAqKyig5CZ5yWfFUENy0L3wcOz0AjFwmqPRSfljmq2PaJaxB9S0QtSmEVh1N
	qKtRfqwEeAT0hbQpQpcKXnz1qWrYOQzDc7QVEo+2KwseYxUa6Kx/aihaDb7lpII6qm5qPZPBFNRdr
	dorCXjHgYz9vDk6CsACQ8hvcLinKatylXARxtpIvSfzhR58rWCodnYMjRqz67MhWz7HWuCqEufCz/
	S4ilLcaXq6ryctFuAvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxRl-009nhA-LP; Wed, 23 Jun 2021 07:37:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxQe-009n8u-Cc; Wed, 23 Jun 2021 07:36:09 +0000
X-UUID: df5e8e10549040c78e258c355fba2f18-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=y21AW5LhBmGFjGhiHZ9bS506BDulgGFYU7KxLEwvtqU=; 
 b=npwKhTLpQDEvr6mcRmKTA+/92Q4qBa4Kz7eoTBKcq3y/+MF1PvCi+VYSu5F2sLE8wxK7D2porYDhgidK9fCl7ZlgMTi1dPdocUJBnffoGquy95vsK3qf1g5XqywDguO4ijkwop3eoVLIT20FaQfupqCM4WNZDIjM/6rpTvb/haE=;
X-UUID: df5e8e10549040c78e258c355fba2f18-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2071721213; Wed, 23 Jun 2021 00:36:01 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 15:35:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
 <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 09/10] media: mtk-mdp3: revise error handling about
 get/probe MDP3
Date: Wed, 23 Jun 2021 15:35:48 +0800
Message-ID: <20210623073549.24170-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_003608_463642_5C2E2962 
X-CRM114-Status: GOOD (  14.18  )
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

This patch is used for review before send upstream patch.
From Alexandre Courbot's review comment: Independent from the main patch.
Revise error handling about get/probe MDP3 driver to make it stable.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index eaf5b07e720f..207b55ace97b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -40,9 +40,9 @@ struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
 	}
 
 	mdp_pdev = of_find_device_by_node(mdp_node);
+	of_node_put(mdp_node);
 	if (WARN_ON(!mdp_pdev)) {
 		dev_err(dev, "mdp pdev failed\n");
-		of_node_put(mdp_node);
 		return NULL;
 	}
 
@@ -113,7 +113,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (!mdp->job_wq) {
 		dev_err(dev, "Unable to create job workqueue\n");
 		ret = -ENOMEM;
-		goto err_destroy_job_wq;
+		goto err_deinit_comp;
 	}
 
 	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
@@ -121,7 +121,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (!mdp->clock_wq) {
 		dev_err(dev, "Unable to create clock workqueue\n");
 		ret = -ENOMEM;
-		goto err_destroy_clock_wq;
+		goto err_destroy_job_wq;
 	}
 
 	mdp->scp = scp_get(pdev);
@@ -179,6 +179,8 @@ static int mdp_probe(struct platform_device *pdev)
 	destroy_workqueue(mdp->clock_wq);
 err_destroy_job_wq:
 	destroy_workqueue(mdp->job_wq);
+err_deinit_comp:
+		mdp_component_deinit(mdp);
 err_return:
 	dev_dbg(dev, "Errno %d\n", ret);
 	return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
