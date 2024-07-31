Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C626CC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Gpk5PWXdFGGxCcZkZWBaxvRMw2swFtz9XALf7Og+kU=; b=0Bfp7ny4rAicJbxw253Isbfe8o
	jLddNeK5CKqC7SgT0HljAc+6hh77a6LWk5zZxk5arJSbdCStbltuaj063DNWGt2ix8WTmX0Ko4ngi
	5gMKLy9zpGzvQncUqH1F4wTx1Fgt92W+RxBDxT+/GhW2dze22epuZ/4Cqu7quOigmu+UqRPuXG1ho
	aJUGpN6UNrcHtMIEgPrVDTcIesqfG+YoJLT52hp0URZxs2uMTcZrw0+9fkPo8xzBN2xZqdEzlAVuK
	lJrdA7fcy2VZyyEpwjDn1ZDak3y97BSVBydu6JYdjTvcgflEV8iLoam2IHWlOdnPzA9oRQNOEuEQI
	sE0qqOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEqT-00000002Fj5-3eqQ;
	Wed, 31 Jul 2024 19:18:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEmD-00000002E8M-04xA;
	Wed, 31 Jul 2024 19:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6291ECE17DE;
	Wed, 31 Jul 2024 19:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D50C116B1;
	Wed, 31 Jul 2024 19:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453258;
	bh=ubh3NLrklndLBiuUONv6qIaq58iV67suw8/xEa83+Qw=;
	h=From:To:Cc:Subject:Date:From;
	b=hz2lxk8Rlt6QZc1C1Lk0LOHWeqWymGDaLPmM2IP6MJuKfOE3BHx5eDqAq6YQ8wALu
	 dz5LesUs5DdW7rwkiVQ0it2/nlnn0e8i63/Sg8cWAuM2hoh6CtvnYJ+6OxyY8HjxfX
	 0TvcegbX0EhP8HTYq3a6C2qNLxIqOuzyKktqQ7nNAxJDjLl9rfqDzlbU5T/5bRxKDd
	 0ngxttAnY83AyKk+adYDpMhjh9UdnUhYiSnFoeht0jKJnSuukpoWPiqdkD2lSnjJrn
	 Sy6/XQ8Sb64+NVzxaFsdCZko+4iv8xMHv33r5WJ9XkymSDKIL9X2C/yYE1qduSaEhB
	 US6+iEUJ87VKQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: Use of_property_read_bool()
Date: Wed, 31 Jul 2024 13:13:01 -0600
Message-ID: <20240731191312.1710417-23-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_121421_253312_91886D29 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use of_property_read_bool() to read boolean properties rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index e12316c42698..87e958d827bf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1044,11 +1044,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 
 	hw->nbase = hw->soc->nbase_names;
 
-	if (of_find_property(hw->dev->of_node,
-			     "mediatek,rsel-resistance-in-si-unit", NULL))
-		hw->rsel_si_unit = true;
-	else
-		hw->rsel_si_unit = false;
+	hw->rsel_si_unit = of_property_read_bool(hw->dev->of_node,
+						 "mediatek,rsel-resistance-in-si-unit");
 
 	spin_lock_init(&hw->lock);
 
-- 
2.43.0


