Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4B9C19F4F
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Apr 2024 18:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HfgwZeVvsF2i06wNeH1wK9xQEXXX0R93e8MR9OP26AA=; b=VQ1sJVMbCOo5cWRfaQAYw8zDP2
	gSzzrGHVMoZZG4T/fOuVj/W3GrA0ixxR7kHfGem/B3ezaS/dCWbiJdb4iBVOPqmzX6xU1iGfO3YLb
	mlCEvV8ETnACuCihnz56ac+sujQAJjW09YO0CN2gByWI6C3QgFZUtlRBFRl/sO98EeI4tdmJtrfkP
	ZQrgCBg8MB7uYrAj9FUx8ul8hXxaXouIylEvaE+XsUJ3qj4O0NnAJlk4ELHjNbIOmdCE/ogy1Be3d
	LYkC2jXv+ZlxmOEqGUs8eze8MqeRIlxib0PijVxHFINNgeKAf+GvdJxnDWfGdYVjRsMJ4VZFn8Lv9
	dAVC7XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s19Fk-00000000U9t-0Q3h;
	Sun, 28 Apr 2024 18:27:56 +0000
Received: from smtp-76.smtpout.orange.fr ([80.12.242.76] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s19Fg-00000000U5M-1RRQ;
	Sun, 28 Apr 2024 18:27:54 +0000
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 19FXsdAPqjQGD19FXsx1n6; Sun, 28 Apr 2024 20:27:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714328864;
	bh=HfgwZeVvsF2i06wNeH1wK9xQEXXX0R93e8MR9OP26AA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ts6pYZW6eyTY9+PYyPZtO8/V1mVA5dSfT5RaTPQassuvTFAbgixwqR64lA8/9C+gW
	 mPqbE/pMf3nkUBkQCedwHTTUhG1BRKvOsxxcOPl1Z5FR9UrxaPKigF9UQj+brNaTt0
	 +htzQy8HiFLkGgm93WfMJsRiSQn9v2AjwiPAkbn2wv+7APMff584QDFmxloNUeu3fH
	 Ppb+3OD4uMK3X5xk8LMFu3X6JOxsgE2jbqypbJK4jgiOaIs5MJePNP+WdB86xMx7Nf
	 5+1WUXDfc6bZ38gk9zna2+5jPkPSISpIyM2hCuVA9PYsMUsoW3MzUZ7ipMQObdmUxd
	 Gi9L8nXV+m1ag==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Apr 2024 20:27:44 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] leds: mt6370: Remove an unused field in struct mt6370_priv
Date: Sun, 28 Apr 2024 20:27:31 +0200
Message-ID: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_112752_888165_CB1D787C 
X-CRM114-Status: UNSURE (   8.85  )
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

In "struct mt6370_priv", the 'reg_cfgs' field is unused.

Moreover the "struct reg_cfg" is defined nowhere. Neither in this file, nor
in a global .h file, so it is completely pointless.

Remove it.

Found with cppcheck, unusedStructMember.

So, remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 448d0da11848..359ef00498b4 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -149,7 +149,6 @@ struct mt6370_priv {
 	struct regmap_field *fields[F_MAX_FIELDS];
 	const struct reg_field *reg_fields;
 	const struct linear_range *ranges;
-	struct reg_cfg *reg_cfgs;
 	const struct mt6370_pdata *pdata;
 	unsigned int leds_count;
 	unsigned int leds_active;
-- 
2.44.0


