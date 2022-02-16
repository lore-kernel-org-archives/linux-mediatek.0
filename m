Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F81AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UhSiU9QbNFQ1MRAMn7Q5O4xx11N/iWZ5SVvHtYK0uY=; b=Zm9btC1HPV3tDJ
	Ed6PNaLUCqy0wWvI+iGLwkdtUyXqqKYlHYzU+hSTGash6h4hb2OJNWn8OKWTAXBltBrouTbYUqwhA
	N0Zugm7lYSF7M9dyIoDYeGG2bv6IN6ahBGmrYW89uoYBn5+F6GTTx4+0khStxgUTUAU5hT/ix1fKS
	ZdTPWhB4dOlsaKob0iBTBQHQIItnYYuIBIDVXF17CrOWCoOWG54lTofMfDfZzXFe68vFmpYrbQGLP
	mXYPV1OB0ZVdJlYwJ0EJyQmMWTWMHRRcsaYgd9/AY0umBAQfuVhNkj2qi0cmTDUiMT+Pa3W092ytj
	kF0a03/HDJ6cp2VaUtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKAt0-005Ond-CS; Wed, 16 Feb 2022 03:21:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKAsx-005OmL-EJ; Wed, 16 Feb 2022 03:21:44 +0000
X-UUID: 23f95941257742c2a594b33965b73b4a-20220215
X-UUID: 23f95941257742c2a594b33965b73b4a-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 463107065; Tue, 15 Feb 2022 20:21:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 19:21:38 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 11:21:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 11:21:36 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v5 3/3] pinctrl: canonical rsel resistance selection property
Date: Wed, 16 Feb 2022 11:21:24 +0800
Message-ID: <20220216032124.28067-4-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216032124.28067-1-guodong.liu@mediatek.com>
References: <20220216032124.28067-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_192143_529056_79514EDB 
X-CRM114-Status: GOOD (  11.27  )
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

Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
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
