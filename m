Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250E0C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95280223FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIp0uARI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UztT3n5X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95280223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ekClxXgbw7M3xJdpa6zYo5wv+dk7b4fKErAKGXa8QeY=; b=GIp0uARIPpZTe8aDFafvCTJ98
	n87O0MKWH4UxADkJeFAmqb8g+TB4Ff/RRCWzic/xnTud9PU4hYydx29lwyCaoZkRogdRZsiSrt31Y
	PjwcftbdeynlCaMtYFPBVxoO5xx/T4WMvzCvg/ahGiEOn0AeVVA3Pj1DqG/eHyBqbtMl1X815O9YR
	sWo3ie7am0w6+G+bbfQZsSU1ya/TcJWNlSjwx6qwr4gCrJAwvYz3D20hbbCdCMrqXZwP/aq+wuAyj
	E7cqdPxKXfK0BZR2MlenSMWQJdQWI2GBVRcSTfiFex6y+Sn/V/XCgY3kk4r59LY+kDmx3C7QNMm4/
	4+tMoZ3pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaC2-0004bj-8Z; Thu, 22 Oct 2020 12:59:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa13-0007Bs-KT; Thu, 22 Oct 2020 12:48:30 +0000
X-UUID: 87074758979942a5ab4fd200004a727c-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aER/GLpe3/PEFF5UMv7R5fKpYWc9avuUM9COWVPQLn4=; 
 b=UztT3n5Xb/1YZeAdo88D+2kLuZZPM6wYOkXxUP7/ycjBvqSbverQnmrPxT6ubC3Co82dWIjG4mCOO0SyPMb79VtfzOCyBbeIjsp3nS+LgG61WiuCKuzSDpywBA8cM49okmPubWB9kYxF44TmZZC1qeUF5GiPES832LWvMcTh7Yw=;
X-UUID: 87074758979942a5ab4fd200004a727c-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1811596729; Thu, 22 Oct 2020 04:47:57 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:47:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:47:39 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v2 2/4] soc: mediatek: pm-domains: Add default power off flag
Date: Thu, 22 Oct 2020 20:47:35 +0800
Message-ID: <1603370857-30646-3-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084825_837266_D4B0F904 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For some power domain, like conn on MT8192, it should be default OFF.
Because the power on/off control relies the function of connectivity chip
and its firmware. And if project choose other chip vendor solution,
those necessary connectivity functions will not provided.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index b7ccf94..50a7ae1 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -24,6 +24,7 @@
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
 #define MTK_SCPD_SRAM_ISO		BIT(2)
+#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -506,17 +507,26 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
 	 * software.  The unused domains will be switched off during
 	 * late_init time.
 	 */
-	ret = scpsys_power_on(&pd->genpd);
-	if (ret < 0) {
-		dev_err_probe(scpsys->dev, ret, "failed to power on domain %pOFN\n", node);
-		goto err_unprepare_clocks;
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
+		if (scpsys_domain_is_on(pd))
+			dev_warn(scpsys->dev,
+				 "A default off power domain %pOFN has been ON\n", node);
+	} else {
+		ret = scpsys_power_on(&pd->genpd);
+		if (ret < 0) {
+			dev_err_probe(scpsys->dev, ret, "failed to power on domain %pOFN\n", node);
+			goto err_unprepare_clocks;
+		}
 	}
 
 	pd->genpd.name = node->name;
 	pd->genpd.power_off = scpsys_power_off;
 	pd->genpd.power_on = scpsys_power_on;
 
-	pm_genpd_init(&pd->genpd, NULL, false);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+		pm_genpd_init(&pd->genpd, NULL, true);
+	else
+		pm_genpd_init(&pd->genpd, NULL, false);
 
 	scpsys->domains[id] = &pd->genpd;
 	return 0;
@@ -603,7 +613,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	scpsys_power_off(&pd->genpd);
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+		scpsys_power_off(&pd->genpd);
 
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
