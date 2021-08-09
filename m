Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D93C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC35D60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC35D60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGhGyeCxThZEm/DvsahzxoT+nqnUEYBLjbfqz18TRYw=; b=0AWxtFkhZ9BCrX
	xfmUYtYSAl91qmZNQodOHPeAzY54swZ8pQ1Z51AlJ3zAF6wIzpALxyUmlSUfVLvyoUkpRI04hnRWD
	57yKhkw6Tv9BDnR2UsreJBNQcifU99v2aj84SKzSSx8PrFdsZabqvLCS03nCwy2VVwCljjKGB+fuj
	eMPCs1NnvRsXKO5MRWVFXLTlJVzsTh88lXqQMf90cS6QYSOP8EFElzztfK8p1FYTaogi5lr9c+7Lk
	Ju5De9tEQSLPKy2i1whAINDmkGeaoEMNgaoSjCmLl64if5pfJ9wt0paI5bOYJbLqj75V37nTVt7sH
	HbUCLzzoTcw0tWfaot+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvet-00Gy8s-U5; Mon, 09 Aug 2021 03:08:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCveg-00Gy5Y-Kd; Mon, 09 Aug 2021 03:08:48 +0000
X-UUID: 743bd71f9632482bbf84c7a7319a4916-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EfbFaKG45SBGFraeJ3dS15whyIa3cteg1uCH/YYPU4s=; 
 b=SyrI/49CTOMlzdHCIP0LoUUlhbMupY9RO5FtsO2q/9DCia2GSc0tTU7wykRuokI2budhmSSaZ7O+knl+9teSpWDREIrJv88hD+TFXtZ5O79YoB1D57GRE9P5sylxj6VwSHo8F5Mc2gRinc/6XPRWZq2aSNNCjVma80HilNVpCzI=;
X-UUID: 743bd71f9632482bbf84c7a7319a4916-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 163232461; Sun, 08 Aug 2021 20:08:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 20:08:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 11:08:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 11:08:36 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: 
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, Neal Liu
 <neal.liu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v4 3/7] soc: mediatek: devapc: add shared flag to IRQ
Date: Mon, 9 Aug 2021 11:08:15 +0800
Message-ID: <1628478499-29460-3-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_200846_730623_76FC97E1 
X-CRM114-Status: GOOD (  13.19  )
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
index 86bddb2..abc0962 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -282,7 +282,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
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
