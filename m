Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AECCD1292
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gOBZVvTbMI4Vvy9nFHPCW2JYo+PpjPrCvqOXxjC2HGc=; b=YRsfpQKjf04u02AHCDVsxdrKMa
	LujotcfQlUnrzLqBzA6zbDj0eYEAd8Zp457tSou+LmM28r0YSbYATM75bbf+YkC9vDlHjR/7jjJJH
	Md/fQzItAAEyWLOpFYjHXcvyI2I7Ydka/lZQG+xsy6Mq11RQJi/ynfEmEEekZLOac0sxQhW43y76N
	Rpy6NLDg5dfPI64TRI/t1kG4On2cMTaaE8HmD3+lrMagQ/KLg3VAvW5B1E26g8cNVuxGQsK/mZgD7
	3ftHBf+iUp8pL/aghUu48Hfz7dcSur6gZ+fy+Gw8or+TpaG9ktivfD4SV/kvfOI041NBDkEjjDP02
	Cy+3lvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYia-0000000DPuT-2sf5;
	Sun, 07 Apr 2024 20:02:20 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYiW-0000000DPsT-2hGT;
	Sun, 07 Apr 2024 20:02:19 +0000
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id tYiBrICUDz1OZtYiBrfStB; Sun, 07 Apr 2024 22:01:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1712520119;
	bh=gOBZVvTbMI4Vvy9nFHPCW2JYo+PpjPrCvqOXxjC2HGc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ndXKCBHemAwbLOKLOO2DOm3giezlAGq19PHmek5chO1wkT5gUZPMjUJikYvKnURdd
	 wGHjgS0P7bENVtSp2WxQxaXAnUsnehEl+PPfoClhHm0ad3IYGBWiZjlq9Xr5h7MU8d
	 h8XmHoL7HbSVSRY4dS4rWUnG5SR2I0CNAewO8hIpMr7fO65TS3F/YugMLCEXaGcTHU
	 SbngVs0Sreh/6oF97hzgyZbuchAFrL34WYM2ykDORy1WiDAkweUrr/gh8Td80eY4me
	 JViE28pwYxzW8uZlisovIEchTebYhV0fsGyuUQAGOVRH42LrmtFDROZP1qooMrHpRV
	 JQQCItc7Q4Piw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Apr 2024 22:01:59 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] thermal/drivers/mediatek/lvts_thermal: Make debugfs related fields more consistent
Date: Sun,  7 Apr 2024 22:01:48 +0200
Message-ID: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_130217_164245_07A7CF2A 
X-CRM114-Status: UNSURE (   9.93  )
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

The debugfs code is only generated if CONFIG_MTK_LVTS_THERMAL_DEBUGFS is
defined.

So 'dom_dentry' should be included in the 'struct lvts_domain' with the
same condition, instead of CONFIG_DEBUG_FS.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fd4bd650c77a..3003dc350766 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -150,7 +150,7 @@ struct lvts_domain {
 	void __iomem *base;
 	size_t calib_len;
 	u8 *calib;
-#ifdef CONFIG_DEBUG_FS
+#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
 	struct dentry *dom_dentry;
 #endif
 };
-- 
2.44.0


