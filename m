Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531CC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuyL91qJfMfVqWzCEdtfHDkyTiSjyVs+sIdO0hiAf+Y=; b=MyezQjGy6v2wLr32bpSjk4BSHV
	on97GnvaOMiYUC1umnko1Sr2RO2Q9SwwGGoyKvNHxoOqpz0B83SkZR5UsIx3pymnvY1nhL9k/16h6
	r9r4inVUTaLtcz1s/QkZqlPZiHCftaGDraqWqeTmk4rDmUvXpZS/VqgLP1M1vJx8HdvcyBHpSaXo2
	0eBnxEZh/4GkpcDiWAO+kVQwd2bUWEs7+ALDDvXqDugu48vQdX//BLi5WvfO75ea4llN1FKYpikc/
	uaJuBp1mPyWuVj0oG5CApBYz1pMyCtpxXJwQgAdum7Akc81b/EBhYqdXkO4VcCd21S9bdRfm0GAUI
	rWw2Ym9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrmE-0000000GKYu-12J9;
	Wed, 20 Mar 2024 08:58:26 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrm6-0000000GKMg-1U92;
	Wed, 20 Mar 2024 08:58:20 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id RDA00148;
        Wed, 20 Mar 2024 16:57:48 +0800
Received: from localhost.localdomain (10.94.17.92) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.35; Wed, 20 Mar 2024 16:57:49 +0800
From: Bo Liu <liubo03@inspur.com>
To: <support.opensource@diasemi.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jagan@amarulasolutions.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH v1 03/13] regulator: isl9305: convert to use maple tree register cache
Date: Wed, 20 Mar 2024 04:57:30 -0400
Message-ID: <20240320085740.4604-4-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240320085740.4604-1-liubo03@inspur.com>
References: <20240320085740.4604-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.94.17.92]
tUid: 2024320165748010a309a4741b8c4a311e16fbd748384
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_015818_726849_C521ACC8 
X-CRM114-Status: GOOD (  10.63  )
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
 drivers/regulator/isl9305.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/isl9305.c b/drivers/regulator/isl9305.c
index 0f7560093091..5a234f25e6bb 100644
--- a/drivers/regulator/isl9305.c
+++ b/drivers/regulator/isl9305.c
@@ -134,7 +134,7 @@ static const struct regmap_config isl9305_regmap = {
 	.val_bits = 8,
 
 	.max_register = ISL9305_MAX_REG,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int isl9305_i2c_probe(struct i2c_client *i2c)
-- 
2.18.2


