Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84948C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 13:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391AC2076E
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 13:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwTF8tcw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391AC2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F06sALb4A601p438BHWbvci4VKdY6vCtx2/5rJ45alw=; b=TwTF8tcwHG5gDjuoyLkR1Kbt+5
	RJJ87uih9OxUYmfaks1/sClyoHf91WyEeXh1nQJ4GCeVZ0Iq5hS3lKZfAsXfx0AAVnqVjewjUQ0Wy
	Gfj723WBLaGKG2L38SqBtDUL0Hy5On6nGumeZTb8/nYv9osec3Podc3nsM8ig/kY5Yrzx0ly86JGd
	qH3iGgz6zVfukOrwKubsWqPaok9YVVnUCy/jnh6HaqVkgo5Mime1jcdsJ1y9cnt9/I1+BdT7dPJkG
	kf2iPxNz/u74K4B8LKAoBWo45pnnDYrugT+xXh4YiNL9lScTjSVyJLaqXJ3p+idwlzONo2A+yV9nQ
	VJ042NOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKLax-00057U-Es; Mon, 21 Sep 2020 13:11:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKLah-0004wx-G9; Mon, 21 Sep 2020 13:10:50 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 207EF6BC6A522D0DAF07;
 Mon, 21 Sep 2020 21:10:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:32 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH -next] pinctrl: mediatek: simplify the return expression of
 mtk_pinconf_bias_disable_set_rev1()
Date: Mon, 21 Sep 2020 21:10:56 +0800
Message-ID: <20200921131056.92848-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_091050_163568_71D33AF8 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb56c..16bb15226 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -479,14 +479,8 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
 int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
 				      const struct mtk_pin_desc *desc)
 {
-	int err;
-
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
-			       MTK_DISABLE);
-	if (err)
-		return err;
-
-	return 0;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
+				MTK_DISABLE);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
 
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
