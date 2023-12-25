Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5ACC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lLpa3917JD05YA+mD0231DWxTjcZEo6HAsDWGG6CFyA=; b=rlHVpR0F0vqVrePtcTi+cyTn0e
	7vMGzPEpNQeeSmMGHQ8kV8MpNQwkF5Sq0xgeY0RvI4jsnx+WZDmXj3eCNvpH2BnRaFmZIdjtGd6Tk
	q7CmB6c0w7XLncifpx6ZSo97JoPIJuZnZ0i7qSlkqlqgcOqLp1fCk0G/Xi0sCJwBHbjStf/998qlD
	+V4ZWpDYUYNxt3p0O1MHt0r3Lqv/kpDiljpaSTjzgBsF2OF9ocGknDo3W9+Y/IYZ6/Pg7+uFdjr/n
	asf3I13petjFWH8kCXM8r9bieBLgKmmpGFCO0tDThaLTknlCjQeNiH88SLxmIgV48LgxF5f4wJFUT
	Z991IxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHl8A-00AwBv-1c;
	Mon, 25 Dec 2023 13:36:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHl86-00AwBM-39;
	Mon, 25 Dec 2023 13:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703511381;
	bh=IwmmB7WjpTOgIxwbZn9fGmU/1RvI/f6TS4uE1mr5Uko=;
	h=From:To:Cc:Subject:Date:From;
	b=rQwXs4oR7QOzlNkpL89uoyhg3/ZaKB6wfLk2Tn0SmVMllirbtqgeMNOkI3k1sUP2W
	 sfh9B5917RFN16+ZwyDwCzC4ejLeZHvaoEXYCqmlGahippC8uUVoDN6AqgZoA3XyfM
	 18tRdB2+Qc1Y2MsR9hQdIPDFrCGOnHyqA+HhcUHpwVSfbWAemOLty0357oCZVEhRQN
	 0j2AhFCiLeutVafMlRbWJpJkpkYMbUJv3URd/ayY0DWgp04cudNOp4MTFLuw5omIFL
	 Ehz/TnMjQfObkBvmoRyFnj56NA7iPop8K0ki7IiddtjprUaP2ehp1lACW7R/rRgQ4z
	 UbIOqDG4Cm7kQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B50D937813F2;
	Mon, 25 Dec 2023 13:36:20 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] pmdomain: mediatek: fix race conditions with genpd
Date: Mon, 25 Dec 2023 15:36:15 +0200
Message-Id: <20231225133615.78993-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_053627_192258_3C553A81 
X-CRM114-Status: GOOD (  18.00  )
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

If the power domains are registered first with genpd and *after that*
the driver attempts to power them on in the probe sequence, then it is
possible that a race condition occurs if genpd tries to power them on
in the same time.
The same is valid for powering them off before unregistering them
from genpd.
Attempt to fix race conditions by first removing the domains from genpd
and *after that* powering down domains.
Also first power up the domains and *after that* register them
to genpd.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---

This comes as another way to fix the problem as described in this thread:
https://lore.kernel.org/linux-arm-kernel/20231129113120.4907-1-eugen.hristev@collabora.com/

I have not been able to reproduce the problem with either fix anymore
(so far).

I have a few doubts about this one though, if I really covered the
way it's supposed to work, and registering the pmdomains in the recursive
function in the reversed order has any side effect or if it does not
work correctly.
Tested on mt8186 where it appears to be fine.

Eugen

 drivers/pmdomain/mediatek/mtk-pm-domains.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e26dc17d07ad..e274e3315fe7 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -561,6 +561,11 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 			goto err_put_node;
 		}
 
+		/* recursive call to add all subdomains */
+		ret = scpsys_add_subdomain(scpsys, child);
+		if (ret)
+			goto err_put_node;
+
 		ret = pm_genpd_add_subdomain(parent_pd, child_pd);
 		if (ret) {
 			dev_err(scpsys->dev, "failed to add %s subdomain to parent %s\n",
@@ -570,11 +575,6 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 			dev_dbg(scpsys->dev, "%s add subdomain: %s\n", parent_pd->name,
 				child_pd->name);
 		}
-
-		/* recursive call to add all subdomains */
-		ret = scpsys_add_subdomain(scpsys, child);
-		if (ret)
-			goto err_put_node;
 	}
 
 	return 0;
@@ -588,9 +588,6 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 {
 	int ret;
 
-	if (scpsys_domain_is_on(pd))
-		scpsys_power_off(&pd->genpd);
-
 	/*
 	 * We're in the error cleanup already, so we only complain,
 	 * but won't emit another error on top of the original one.
@@ -600,6 +597,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 		dev_err(pd->scpsys->dev,
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
+	if (scpsys_domain_is_on(pd))
+		scpsys_power_off(&pd->genpd);
 
 	clk_bulk_put(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
-- 
2.34.1


