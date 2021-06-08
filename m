Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93881C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:07:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57DDB6128D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57DDB6128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bXVZOwUtLqOhrR8ajVE1OnDARkoYtzXNb0MUy4HNd6s=; b=OQJtkvz+UOuKfB
	iFAzE+6OArm8B1mHTdVpiUYdblYl+3jSCDU1Jdr8ZPW4XAqVqlASvlN3PTjLtbMtyR7g46qaYsEiG
	KYcJ1PTHEPjGyCAwVQ1bKLOkcIfNOlz03k4extfrA2Rr6ShgGKy8cIpX5xyJLK+/tXfBsUxo4sfAa
	ZEEanky0Q4K7CZa0uDU8Zknq/lFg973rYmggKUp8PUX+EtnmCbGx/Le5cAqe0fpvasSJ/qn0WCaB2
	qdH/aLJBtWWNS63vOvzf8UNsn01sTpAqHhynT0dirRonDrzfne2/FjpF2kZHtxcC56hhohGn3SOBH
	UGtHsJr5YoWVX7eTp7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdKE-00967p-Mr; Tue, 08 Jun 2021 15:07:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdK0-009662-LU; Tue, 08 Jun 2021 15:07:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72DAD60231;
 Tue,  8 Jun 2021 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623164835;
 bh=lajIHORbgJ+gWe5oTfc6aVhrXAeM6lou0+BZHByrUtU=;
 h=From:To:Cc:Subject:Date:From;
 b=IPLsSo+lStgbkrGD95c1N+i4o+7icKQaErXt7eVH8HXyDaZXinWmoIm3jT4lcLunS
 pUFVHW+VAfY2UfAba1pD9AO5lQAQhI+pn+PLdOj2a1H+iIf0uYf7Qb6SwIvSAAfhkx
 hNky0noLcyfwBcCra0jFW7uyAQW5XC/vbEB4T//mxqmdddWdvHXkTc+sudcAKRhaMq
 LHrusek43suRFhaSbD21Pz0x8TRSEjl1Uhq3o0crVH1xrXr/Gz7j7kNvBGlewioi9P
 7CdAOV9XMSby4QsVxMME0OVFdSMb8R4gLCLcZoxMGGfK8TUHoVwlCURTVcfY3Heu/B
 PDM1RrxCKmX/A==
From: matthias.bgg@kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>, Fabien Parent <fparent@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] pinctrl: mediatek: fix mode encoding
Date: Tue,  8 Jun 2021 17:06:56 +0200
Message-Id: <20210608150656.29007-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_080716_743866_60A608D9 
X-CRM114-Status: GOOD (  10.14  )
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

From: Matthias Brugger <mbrugger@suse.com>

Pin modes are encoded in the SoC data structure. Use that value to set
IES SMT.

Cc: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-mediatek@lists.infradead.org
Fixes: 696beef77521 ("pinctrl: mediatek: move bit assignment")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 525b1aa7f7a6..5f7c421ab6e7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -134,13 +134,13 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			pin, pctl->devdata->port_align, value, arg);
 	}
 
-	bit = BIT(pin & 0xf);
-
 	if (arg == PIN_CONFIG_INPUT_ENABLE)
 		offset = pctl->devdata->ies_offset;
 	else
 		offset = pctl->devdata->smt_offset;
 
+	bit = BIT(offset & pctl->devdata->mode_mask);
+
 	if (value)
 		reg_addr = SET_ADDR(mtk_get_port(pctl, pin) + offset, pctl);
 	else
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
