Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F96C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 16:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B8361090
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 16:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83B8361090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AKRR6O826SJl0qQBOmfZq84wFOP43RqjFqBaFisg/w=; b=pnl0IR+qikQDPj
	vtglu2gRaqSEyBTb8oI70kB3vsQdayV6nd7LndoE+DMvlc6k8IkH3wvDKoHGtAMZwO9pUhMkLVK+a
	IhXHmkjB3x7U97qxXg6m2+w9lYI9MJd+vQAQmCX9S7d8shBmixVolhW9M9COWP5OTyDr0ml+5PCK9
	3edtMjwe/dmOKLw0JoyGatg7B80Vm37E1GHLQAq/fv9FQA5dQ/otg5DzTN84KG0jmGT42YWWzo+Bs
	mKppPJTeoGez768n8yC5XXDsG8zXnhAzw/zQVNGnod6dhSU2RbUsKqLlrm+Wqg28giNiS/Odgqf22
	yNCEfzXJQJFebnOaL8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL6qm-002jKy-I7; Tue, 31 Aug 2021 16:43:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL6q6-002j46-Qp; Tue, 31 Aug 2021 16:42:26 +0000
X-UUID: f760c76e47464f9d9943a0b03f161cf7-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tF8ETVPRB3RThgMH1mN3+5S9R6WLkN3LHJ0gjFJFHuc=; 
 b=r04YATLEG7P97N2tiTSfrV7Ycgnup/lbATmqHO1J7BraDXHr3sWwmFICGl5NdmBz9IimdUaBx+mQKX2oC0QNMQaemo6U94W2mZd72Nrj6e0UpGHJls56+Vpbma5aqS/WFKrHIiw9S7xggqKqQ3v3zWim5s7vatJdLosIFUdebkw=;
X-UUID: f760c76e47464f9d9943a0b03f161cf7-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 123821281; Tue, 31 Aug 2021 09:42:15 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 09:42:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 00:42:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Sep 2021 00:42:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 1/4] clk: composite: export clk_register_composite
Date: Wed, 1 Sep 2021 00:42:07 +0800
Message-ID: <20210831164210.15455-2-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210831164210.15455-1-miles.chen@mediatek.com>
References: <20210831164210.15455-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_094222_910121_BD5A118A 
X-CRM114-Status: GOOD (  10.43  )
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

To support module build of mediatek clk drivers,
it is necessary to export clk_register_composite.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Hanks Chen <hanks.chen@mediatek.com>
Cc: Wendell Lin <wendell.lin@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 0506046a5f4b..c7b97fb0051b 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -362,6 +362,7 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
 		return ERR_CAST(hw);
 	return hw->clk;
 }
+EXPORT_SYMBOL_GPL(clk_register_composite);
 
 struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
 			const struct clk_parent_data *parent_data,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
