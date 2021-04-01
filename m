Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CBBC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:40:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7234B60FE6
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7234B60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KH+8xwmKLjIMvYUNea2q89yd2o5oUF+jVgcHMC9ElcE=; b=quXW0ObS4sw6My6u/yPkOKG2m
	mYZt3UHmHQaRSLznV7/akd8CNzXbefRRYxwgkEaHJyBvyI+VSj0EV1Gld4NT71zy/ODu8mDYpQmXb
	fe/7KnNsb/6ujUOyxJlbON4UApem7GYspfwwfFg1EFdIEvM7MQQwYdpCrNNCjfvDK7DwnqCDuD32a
	PoATexlcHubLphd+IAgu/6Sx8+rzWRMFZSYACEKLZMsxao0YOBrgKa065PlRYFtJQmu+r2780Ou2Y
	QdtAlvfZ2H7wHkT2MkwEeCPIxjyY2tLle2VROiJO0M1ogSJF2OqpVBTNIaZ2afJXeTYYAYv+XUjzr
	/rQZ1cSkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqzq-008hBD-O7; Thu, 01 Apr 2021 06:40:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqzm-008h9w-Lv; Thu, 01 Apr 2021 06:40:00 +0000
X-UUID: 202b93668f9a45328eb2808aafa0b0fd-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k8RQmqEZ03LeubiIIIKlOJIhQmgL/LszDOU6GAWXrwk=; 
 b=Qr7gGRn5pa1R2Ioua+iDBWLaOPMPtsswF2x4d8w27KPxpnom659nbHBGD7DY9tb7wg0hafcNYjl/eah0fYPnnPDhcsWD2CCd5WE1LTt6fAPvwgAb0z3wgADCm0l1HUbJdCwpDJkGjZDs5SMln2X12q6kyCsRSiI9v+au+V23tWg=;
X-UUID: 202b93668f9a45328eb2808aafa0b0fd-20210331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1712712583; Wed, 31 Mar 2021 23:39:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 23:39:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 14:39:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 1 Apr 2021 14:39:51 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Nina Wu <Nina-CM.Wu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Subject: [PATCH v2 3/6] soc: mediatek: devapc: add shared flag to IRQ
Date: Thu, 1 Apr 2021 14:38:04 +0800
Message-ID: <1617259087-5502-3-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_073959_113243_668C291D 
X-CRM114-Status: GOOD (  12.73  )
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

For new ICs, there are multiple devapc HWs for different subsys.
They all share the same IRQ number.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index a0f6fbd..68c3e35 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -268,7 +268,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
-			       IRQF_TRIGGER_NONE, "devapc", ctx);
+			       IRQF_TRIGGER_NONE | IRQF_SHARED, "devapc", ctx);
 	if (ret) {
 		clk_disable_unprepare(ctx->infra_clk);
 		return ret;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
