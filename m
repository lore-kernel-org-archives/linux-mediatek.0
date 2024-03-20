Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A898C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYEuuc3Y0Zzr0QdWj4QeqJjY9Ew/htPF8rS+MOzY5GI=; b=rYAT1OcO8lX2D3NPs3JBNbd0SG
	PSvzz1k3ZJ9ppoAHthwXOMVAbtQnQtUXrex+78D+77c1zfgyitX6DWwg4JOHe61lvzBjivg8eyNOt
	NNoZN2hAnOHonQvQfK+kOyPKF3UutnRD7BDkFJuOdcuMpyohOMGv4efJqorO+WEn/TLdw0DQk/1oT
	N4htespCpd/Tw72oQEcuMQ5r1oUDhnhwyyLSkoBNvfAwlorURDaVdgV8MiLkPDh1viE7zd2WK7Jm1
	2b22MBhub+pg8gVvPC420Aq8SjRUKCN7P9RuKUUXIyxGmkczbXa8Lwb8vvMKaWJgNu9l6a4wp8nd9
	cozlHz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrnP-0000000GLJT-0BSo;
	Wed, 20 Mar 2024 08:59:39 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrmA-0000000GKMD-1V0n;
	Wed, 20 Mar 2024 08:58:24 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id RDA00046;
        Wed, 20 Mar 2024 16:57:46 +0800
Received: from localhost.localdomain (10.94.17.92) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.35; Wed, 20 Mar 2024 16:57:46 +0800
From: Bo Liu <liubo03@inspur.com>
To: <support.opensource@diasemi.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jagan@amarulasolutions.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH v1 01/13] regulator: da9121: convert to use maple tree register cache
Date: Wed, 20 Mar 2024 04:57:28 -0400
Message-ID: <20240320085740.4604-2-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240320085740.4604-1-liubo03@inspur.com>
References: <20240320085740.4604-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.94.17.92]
tUid: 2024320165746aad7dc223c642e3cd2cb0c306415dbf7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_015822_849651_BC06A303 
X-CRM114-Status: GOOD (  10.72  )
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
 drivers/regulator/da9121-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 5ee76b533576..96257551bb12 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -872,7 +872,7 @@ static struct regmap_config da9121_1ch_regmap_config = {
 	.rd_table = &da9121_1ch_readable_table,
 	.wr_table = &da9121_1ch_writeable_table,
 	.volatile_table = &da9121_volatile_table,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 /* DA9121 regmap config for 2 channel variants */
@@ -883,7 +883,7 @@ static struct regmap_config da9121_2ch_regmap_config = {
 	.rd_table = &da9121_2ch_readable_table,
 	.wr_table = &da9121_2ch_writeable_table,
 	.volatile_table = &da9121_volatile_table,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int da9121_check_device_type(struct i2c_client *i2c, struct da9121 *chip)
-- 
2.18.2


