Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C2C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VEKXdsrN4FCUT2d2eWfWEpHgGeD3ZeJqsDSnHgARRQc=; b=TCvPdFS+7QEK+0iiDQtGWmbQQ6
	c7tvqtUi6hNZkOczX1mLpYJPcYRQ6/3Fn/WeCDjN0ImbpzsdK3BzcFND5W0zVYWEMF9ljyfixmD4t
	RKPq4Dfz59LzwPikLweDM8g0ketwxB8H7DJAODtNktkLFy1T3N7407XmMPN1wzxr4xvSA1UAXWUWI
	I5ZF6j8Jk0OldxOlyZ/ga3Y1h3Rebh9lFVxQNO/NhxU5ptKISUJURlYFRC1h786XdISDWKW4LoCi8
	Xhh2EAOL+0tPKDkqCvRMtbjLuQQHiBDl6VbUZR/rT3dJBUcixZvMYGN6XA1zFRoY0U/fR5ufPzfWo
	17ALroqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1slB-00000007fgv-3y9F;
	Tue, 30 Apr 2024 19:03:25 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sl7-00000007fgL-3j5M;
	Tue, 30 Apr 2024 19:03:24 +0000
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 1skxsYnM1PWAk1skxsYEec; Tue, 30 Apr 2024 21:03:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714503794;
	bh=VEKXdsrN4FCUT2d2eWfWEpHgGeD3ZeJqsDSnHgARRQc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FqFvg2W7mwZwu3pd8aMBdiabZL+lLxGETx8aDFjgfSAYIVqZeJHGXaWc5IHQVTnP2
	 9BNFKKRrxu+4nCH4x7IFk3lBu+89i3N4xdVVP0hWqGqGMclO5VUTOOZM5BNeyKeTI/
	 ZI8Hkh57B0qnHXFLbgBctIaeTYxnQuQOHV7Cpwg2OP4IU+Ya1Nri8gY4Luai/nnydL
	 Uhj0o4DfaBcEmH5Oy+FaQ08CALqKpbQF8uXCtbpc1xIvmua8aU7Irb5X3D5y96GV3J
	 JEtgV6xojiG/ya/AJHoq1EQyU/ZYS/Qy94vaMh5z2sPJ/yOlmoylaqq46AHZat3XRW
	 8UZ6OXjSVQ6dA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 30 Apr 2024 21:03:14 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Alice Chen <alice_chen@richtek.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] leds: mt6370: Remove an unused field in struct mt6370_priv
Date: Tue, 30 Apr 2024 21:02:22 +0200
Message-ID: <22704991f7acca6c2e687ff4bec7822087e1305a.1714503647.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_120322_389987_204F30DB 
X-CRM114-Status: GOOD (  11.13  )
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

So, remove it.

Found with cppcheck, unusedStructMember.

Fixes: 5c38376ef5b4 ("leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Compile tested only.

Changes in v2:
  - Tweak the commit message   [AngeloGioacchino Del Regno]
  - Add a Fixes: tag   [AngeloGioacchino Del Regno]
  - Add a R-b: tag

v1: https://lore.kernel.org/all/e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr/
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


