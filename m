Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52343C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 06:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aNgUtegRRwDOCNnl56VzJkQ0WTpY8BwvbNY9FIXCAw=; b=eXPzM8oXZHLMIB
	zqcxMYlnySxkRGU/tpRBwM4HD/0PIa+AHBZy9dXaiURNqlQP7+rER/Mkxa1xAC7tDPqV0o5R2+C+g
	YGOhXYWeswXHUBBU+1iaN/5HbKrnsGoqW6i7OPvmrPFbvi3DzjtgG/Fy0KwSM8qyA18EmrgS60R1e
	/j0xBO7q9ca1YK/+ThE5p4X5ktvPqgacIBagG89p2TQ57QOhkrzpi2URgqqHj3KF1uV4nEjAGRns5
	1mP0a2u6n4sCX4ZTU2QDjJRNkFEw5YnQOJsd5lIs7wH7AsKWkKlVBuR66Bgot0Do01ZKp7njanRu+
	l7+2QuNxISDIhEzDVjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI2w7-002nSZ-AD; Thu, 10 Feb 2022 06:28:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI2w5-002nS7-7Y; Thu, 10 Feb 2022 06:28:10 +0000
X-UUID: 2014e16ed8f0416b9c8407b9f6347075-20220209
X-UUID: 2014e16ed8f0416b9c8407b9f6347075-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1886218888; Wed, 09 Feb 2022 23:28:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 22:21:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 14:21:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 14:21:41 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v3 3/3] pinctrl: canonical rsel resistance selection property
Date: Thu, 10 Feb 2022 14:21:22 +0800
Message-ID: <20220210062122.23974-4-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210062122.23974-1-guodong.liu@mediatek.com>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_222809_290159_4F4D363A 
X-CRM114-Status: GOOD (  10.79  )
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

Change "mediatek,rsel_resistance_in_si_unit" to "mediatek,rsel-resistance-in-si-unit"

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d4e02c5d74a8..38c0f0c4cf95 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -989,7 +989,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 	hw->nbase = hw->soc->nbase_names;
 
 	if (of_find_property(hw->dev->of_node,
-			     "mediatek,rsel_resistance_in_si_unit", NULL))
+			     "mediatek,rsel-resistance-in-si-unit", NULL))
 		hw->rsel_si_unit = true;
 	else
 		hw->rsel_si_unit = false;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
