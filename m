Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3D7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 05:45:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37474204EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 05:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nWPZL1aM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IYw1w3cH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37474204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d5GcfE6eflVQBndYnsl/MAh7nSSr7n0Ehk+N0IgoTdk=; b=nWPZL1aM9LxqVlpKF817fT0T5t
	gS1ydI1CbYJjH107GjiXvW3c4RKZzhI/IU+4VREUcZhz5gkQgbrE2dndtGSZ5ArVd+XlC88Ln3ivm
	4cCv2CD7uIPx7hWNXrz5D/Xw88S2U0r/xr9Bh9FXp8g0yZHXxzAiotMkWQn3zE9mEE17zpS5JAEQV
	gLoM5+UbHp6zvKqQNBkGJzVNjAwLRhD6HdoJl0HckRR0+R2/0DlPJDrhtHPAPd01BAgygZiCuPhHj
	Nwrx6mw83n70+kT6Ew9KjDvvBKRoOj8F439wIISpyKdet7fC7OGNN1dDCvKTFfSKGAsrRQ2CtF604
	PnFvnaWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zrm-0002qS-I5; Fri, 21 Aug 2020 05:45:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8zrj-0002pU-Ng
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 05:45:28 +0000
X-UUID: d2173ba6c2394fba8732f8f8f59f80b0-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=plhV+IOc33r8xOeQyemErFzpqgMxm8+GRbRdLCyz3ks=; 
 b=IYw1w3cHBysJPBszx3dvF2/yJxCYQdmpJFKN1dWkojOl1xoSyQRDsVqX2GtXBJUumI8TIaYL7OGb8Q538W3wUFWubFrf32uFHlYylX1J2XM0aFk+fkcxr9ZdiTpwaNKL+FgxXzk8yJq728ENE/fPa1uDbehJASrm+zzh5P5kwNo=;
X-UUID: d2173ba6c2394fba8732f8f8f59f80b0-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 37267391; Thu, 20 Aug 2020 21:45:24 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 22:38:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 13:38:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 21 Aug 2020 13:38:38 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: mediatek: remove log message in
 mtk_hw_pin_field_lookup
Date: Fri, 21 Aug 2020 13:38:38 +0800
Message-ID: <1597988318-24944-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 888BF03EA216EF90D2412ABF7D47198C0C2C8BF5E24ACCF6310F5085B41C0D122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_014527_985605_AD270523 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

Originally, mtk_hw_pin_field_lookup() print log message in 2
conditions:
1. when soc does not support target property
2. when target pin does not support target property

Now, mtk_hw_pin_field_lookup() does not print log message according
to the following rationale:
1. Users of pinctrl have the duty to pass correct parameters and
   check return vale. After checking return value, the users can
   determine if log message shall be printed according to users'
   scenario.
2. Prevent message flooding when a bad user continously pass bad
   parameters to pinctrl.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb5..161d4eb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -74,13 +74,10 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 	bool found = false;
 	u32 bits;
 
-	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
+	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range)
 		rc = &hw->soc->reg_cal[field];
-	} else {
-		dev_dbg(hw->dev,
-			"Not support field %d for this soc\n", field);
+	else
 		return -ENOTSUPP;
-	}
 
 	end = rc->nranges - 1;
 
@@ -98,11 +95,8 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 			start = check + 1;
 	}
 
-	if (!found) {
-		dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
-			field, desc->number, desc->name);
+	if (!found)
 		return -ENOTSUPP;
-	}
 
 	c = rc->range + check;
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
