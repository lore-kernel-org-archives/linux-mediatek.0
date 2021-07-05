Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A77C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:48:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0A76135E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0A76135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbtwWb94jaH19zOD+jxZXsW0Ml1bVmxLl9f5zMlBtCI=; b=Vnp1rXFUJB+sB0
	/Uh2v/ey2umEoEoz+po7bS4t+wcaRmNW/ULyv0MbQx7njidYvm0v5WDPp1LKEWXqB+OA8zT2UfatQ
	PqxnKlmKwd9mTpZNSu9tU4uO5Z7oPYvdjvVwNw6CSr9sb4/unh44iVN75/s6yreEp2OOiD0Qe3Tg2
	pwmAf/4RinUozJe4kLnTtFaA5T+uHNsTSeo2So9rBXhgG+KOvg9veyx/a31IS7hbdILUg2wVioKen
	+zqOeYDDFQ4+zruxZQFf+QQQGXYQUtV84tp4XpDH3qvcW9fwSRdoc14qykSub3AaawzhmadrCVcUz
	qPWHoVvrKU1Ui3vzNN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Faj-007eJu-Oz; Mon, 05 Jul 2021 03:48:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FZU-007dh7-4C; Mon, 05 Jul 2021 03:47:01 +0000
X-UUID: 3b148f82c4a240989295aa65b9968d04-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pGlvX4hMXbWfdk9QCXBlueCMGGKH68p9BVRbYZ8Py2E=; 
 b=XBUMrd84yOsn8Qr1NB5GIsnR0XCqzQAz8DhAkG49nOnXg+1BP83XLaJdnsvCm84CrrL7ILGVIidKMuKFlyvHdVh8WifUCwuOFb2jKsrYnLaOMh1ri+rSgwoiOgif0P2d2XaMeJHbVrb+c89ffyzNiEACbXX6p+lwnkZjWeGs1Kc=;
X-UUID: 3b148f82c4a240989295aa65b9968d04-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1229089093; Sun, 04 Jul 2021 20:46:53 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 20:41:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 11:41:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 11:41:30 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v12 04/20] clk: mediatek: Get regmap without syscon compatible check
Date: Mon, 5 Jul 2021 11:38:08 +0800
Message-ID: <20210705033824.1934-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_204700_219715_5F9F67E5 
X-CRM114-Status: GOOD (  11.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Not all clock providers need to be marked compatible with "syscon"
for system configuration usage, so use device_node_to_regmap() to
skip "syscon" check.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 2 +-
 drivers/clk/mediatek/clk-mtk.c    | 2 +-
 drivers/clk/mediatek/clk-mux.c    | 2 +-
 drivers/clk/mediatek/reset.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 79fe09028742..61eeae4e60fb 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -84,7 +84,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 	struct clk *clk;
 	struct regmap *regmap;
 
-	regmap = syscon_node_to_regmap(node);
+	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %ld\n", node,
 		       PTR_ERR(regmap));
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cec1c8a27211..37d2aa32175e 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -106,7 +106,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 	if (!clk_data)
 		return -ENOMEM;
 
-	regmap = syscon_node_to_regmap(node);
+	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %ld\n", node,
 				PTR_ERR(regmap));
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index b0c61709bacc..e97d58db28cc 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -165,7 +165,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	struct clk *clk;
 	int i;
 
-	regmap = syscon_node_to_regmap(node);
+	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %ld\n", node,
 		       PTR_ERR(regmap));
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index cb939c071b0c..e562dc3c10a4 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -98,7 +98,7 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 	int ret;
 	struct regmap *regmap;
 
-	regmap = syscon_node_to_regmap(np);
+	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %ld\n", np,
 				PTR_ERR(regmap));
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
