Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37687C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 02:14:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F9C61179
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 02:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F9C61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7d/bco7ymLaWYIIuN6/Hmx0PFpps3/ZYQjG6ee6soM=; b=pmh5KvrVt7Lb6Z
	bjQ95IWop//6yksnj+AZU+MOwbmkQCWAZfccALX91llREOIvdYXBWffpmlfCpjof2V6Ydg0Ey1sVi
	VKjuRY0LYlveHUQVn3BgO6Uz85q8TcXmosPFXCYrGMAZYmTeug6CJy9NwL55KXEwUfbpjs1dnCy02
	5mo5EaBas3T4pJxD8HojjJrvVo3SKoQqiDPnB4ZUSPZTgsNhAHee9rSGEwIqoPKH2BQzf+DMoJbUA
	cFCPtN921Zwqh5OKlBaSYLOUj65H3Mgc5+rm9Sq50ZG5t06J1ylCZtsIWhv0vMrTyfDt6bRt1SccX
	Di8iOvYee9LYIDw0g8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkd8E-004IOp-Po; Wed, 10 Nov 2021 02:14:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkd81-004INL-7k; Wed, 10 Nov 2021 02:14:23 +0000
X-UUID: 6d7fbd87dc3c400da49a19d95a609f3e-20211109
X-UUID: 6d7fbd87dc3c400da49a19d95a609f3e-20211109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 883638437; Tue, 09 Nov 2021 19:14:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:14:16 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 10 Nov 2021 10:14:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 10 Nov 2021 10:14:14 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>, <sean.wang@mediatek.com>, 
 <seiya.wang@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <guodong.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, "Guodong
 Liu" <guodong.liu@mediatek.corp-partner.google.com>
Subject: [PATCH v3] pinctrl: mediatek: fix global-out-of-bounds issue
Date: Wed, 10 Nov 2021 10:14:11 +0800
Message-ID: <20211110021411.31761-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110021411.31761-1-zhiyong.tao@mediatek.com>
References: <20211110021411.31761-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_181421_310689_CA04A2C4 
X-CRM114-Status: GOOD (  13.33  )
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

From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

When eint virtual eint number is greater than gpio number,
it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 45ebdeba985a..12163d3c4bcb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 	desc = (const struct mtk_pin_desc *)hw->soc->pins;
 	*gpio_chip = &hw->chip;
 
-	/* Be greedy to guess first gpio_n is equal to eint_n */
-	if (desc[eint_n].eint.eint_n == eint_n)
+	/*
+	 * Be greedy to guess first gpio_n is equal to eint_n.
+	 * Only eint virtual eint number is greater than gpio number.
+	 */
+	if (hw->soc->npins > eint_n &&
+	    desc[eint_n].eint.eint_n == eint_n)
 		*gpio_n = eint_n;
 	else
 		*gpio_n = mtk_xt_find_eint_num(hw, eint_n);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
