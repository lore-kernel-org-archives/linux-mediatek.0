Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3749FC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxM+e9fRtt/6oJdPd7/+LxyTrhwy9vVg7QBXKkVQd/8=; b=WXJdN7H4E1ehlKNBmEXuMmh4ST
	z5m2kO7VQyelmROusM1jK7lkAX6djTorREW9fL51TFZ1IEs2stJ6lh+SyyFBqOGaTBiH/61+RXqGR
	yqA0lIoSjgrpfNOTN6Mw40KrtFSMtvOoZpsFtmdRgki1ZpkEV7z2Irn/EnBG6EaNkrr8odFg3yV/I
	YCVMBcWJXD1jM0zzi50otL7UXBSbCVZtA5H+i0+ICYuV6hKU2rpxseHBz+M2P/v5nEzB8FAPgltiL
	hZ7MA9+bCmuWm1xcEdGtw/05W5E1sp/S7/arx+C6P+hT60Lu3fXpjsFCtT1bF18mBkCsJsvr0jBak
	/avSlkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrnT-0000000GLM1-3WZz;
	Wed, 20 Mar 2024 08:59:43 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrmA-0000000GKNN-3I5N;
	Wed, 20 Mar 2024 08:58:24 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id RDA00157;
        Wed, 20 Mar 2024 16:57:57 +0800
Received: from localhost.localdomain (10.94.17.92) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.35; Wed, 20 Mar 2024 16:57:58 +0800
From: Bo Liu <liubo03@inspur.com>
To: <support.opensource@diasemi.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jagan@amarulasolutions.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH v1 11/13] regulator: tps51632: convert to use maple tree register cache
Date: Wed, 20 Mar 2024 04:57:38 -0400
Message-ID: <20240320085740.4604-12-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240320085740.4604-1-liubo03@inspur.com>
References: <20240320085740.4604-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.94.17.92]
tUid: 2024320165757743a7b7d53ec78d719e9f0bb659cce6a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_015823_267255_9321184B 
X-CRM114-Status: GOOD (  10.49  )
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/regulator/tps51632-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps51632-regulator.c b/drivers/regulator/tps51632-regulator.c
index 5199e0437388..3a384bf9d2c5 100644
--- a/drivers/regulator/tps51632-regulator.c
+++ b/drivers/regulator/tps51632-regulator.c
@@ -199,7 +199,7 @@ static const struct regmap_config tps51632_regmap_config = {
 	.readable_reg		= is_read_reg,
 	.volatile_reg		= is_volatile_reg,
 	.max_register		= TPS51632_MAX_REG - 1,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_OF)
-- 
2.18.2


