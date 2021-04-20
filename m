Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DBBC43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:26:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B3C6023C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B3C6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VtNJeaeX37Ne0U3zPtAFWQsoz/JzIMAimQ6EoIhZcGE=; b=BdDYWRjXxQzT7puNx5+b2EgGp
	oseuV7g0jTWsl0x0jP+w/ajjYOnoHXwuEnIXarCUx4jtBnu9ulS7DnHum0C3HzBgyFsJmP9qumWCS
	woLoSu9LIqog5R9byfAe5jQj6Nnw8VvOKTYlN66duKQODbqwph2dWZ4JpfzTf8FfOE6AKcfu4A6wm
	QhcS5zF+IOSh0wkw5saJ9FTaHwqlPbrlcwXh7dCazESOwIK0SptGS6rsplRSQ8f3YtN7X91VYS2fn
	xxYIsp5t8o6IRiVpAZ7xro5HTS58umXRTLEti8EkHBWevfADlO6c7JxqS09YvuO23m8ecTugoJyXt
	fEOVRpOcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqOp-00CCuJ-CI; Tue, 20 Apr 2021 13:26:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOl-00CCte-AG; Tue, 20 Apr 2021 13:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Q1Yw7il2MClM4mQcrsnzuY1x1dqtCZCR9HbDGp8SKAI=; b=QDjo5+ToMGYkojG+SKpmzFczTy
 fs3PH/C8NpU1um3338jFYzv0ZvZ9dvj8QBaB3Idlb6ZCK4GJO5Z95uESQEBUC+d6dJOAFfd5VzObl
 Z+NfIUrX5MqhEc16l5JvCHz8gFSMELiSrTU8JI4sRA/xxbaGS/5spJk3ueM/SinbXnGsoeGABYV3O
 P0T+vazhGOUsLlNJPHusoH3Uuaecj3KoGbrckT3QZzx2AyXk5kbAQIOFtr8P3jD3+o38YQnyEGjFh
 VswqprZpa/PQ3PDAV2fAORUHBgTHbT1dbRSqRi/DnokjvD6/qb3b1Y2hjKVDrilmPa/quZTwLCGd4
 9eLM1oLg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOf-00C8yb-PA; Tue, 20 Apr 2021 13:26:38 +0000
X-UUID: bc8d070aa680414cad715a97f2e5d8b4-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q1Yw7il2MClM4mQcrsnzuY1x1dqtCZCR9HbDGp8SKAI=; 
 b=f3Fo92J5a+C5ZrVaQ8lZ0Awr10s3MGFx96ETF+J0WbxEwWHtaxh43fLLmHQb0Uads9bOEdVa3+FCcHwYMnjpz/6GZ5cLnL74HB/goT7MrSOypS1Rm1/VCWu/A57KktXy/4I3hYJ2mpeHJ8Vr+J8rBcwPnBYpB0CVDK/G4xYcEnU=;
X-UUID: bc8d070aa680414cad715a97f2e5d8b4-20210420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 113093701; Tue, 20 Apr 2021 06:26:30 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 06:26:29 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:18 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 2/4] drm/panel: boe-tv101wum-n16 seperate the panel power
 control
Date: Tue, 20 Apr 2021 21:26:11 +0800
Message-ID: <20210420132614.150242-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420132614.150242-1-jitao.shi@mediatek.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 45751ACB09465B252BD553B0B387AFEC38F4F85E73F60BF298E6246B4BC675732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062633_854119_6BCF20D2 
X-CRM114-Status: GOOD (  15.56  )
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

Seperate the panel power control from prepare/unprepare.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 72 +++++++++++++------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db9d0b86d542..dc49079a74d1 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -50,6 +50,7 @@ struct boe_panel {
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
 
+	bool prepared_power;
 	bool prepared;
 };
 
@@ -488,22 +489,13 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
 	return 0;
 }
 
-static int boe_panel_unprepare(struct drm_panel *panel)
+static int boe_panel_unprepare_power(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
-	int ret;
 
-	if (!boe->prepared)
+	if (!boe->prepared_power)
 		return 0;
 
-	ret = boe_panel_enter_sleep_mode(boe);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
-		return ret;
-	}
-
-	msleep(150);
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -512,6 +504,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		usleep_range(5000, 7000);
 		regulator_disable(boe->pp1800);
 	} else {
+		msleep(150);
 		gpiod_set_value(boe->enable_gpio, 0);
 		usleep_range(500, 1000);
 		regulator_disable(boe->avee);
@@ -520,17 +513,39 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp1800);
 	}
 
+	boe->prepared_power = false;
+
+	return 0;
+}
+
+static int boe_panel_unprepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	if (!boe->prepared)
+		return 0;
+
+	if (!boe->desc->discharge_on_disable) {
+		ret = boe_panel_enter_sleep_mode(boe);
+		if (ret < 0) {
+			dev_err(panel->dev, "failed to set panel off: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	boe->prepared = false;
 
 	return 0;
 }
 
-static int boe_panel_prepare(struct drm_panel *panel)
+static int boe_panel_prepare_power(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
+	if (boe->prepared_power)
 		return 0;
 
 	gpiod_set_value(boe->enable_gpio, 0);
@@ -558,18 +573,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(boe->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-	ret = boe_panel_init_dcs_cmd(boe);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to init panel: %d\n", ret);
-		goto poweroff;
-	}
-
-	boe->prepared = true;
+	boe->prepared_power = true;
 
 	return 0;
 
-poweroff:
-	regulator_disable(boe->avee);
 poweroffavdd:
 	regulator_disable(boe->avdd);
 poweroff1v8:
@@ -580,6 +587,25 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
+static int boe_panel_prepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	if (boe->prepared)
+		return 0;
+
+	ret = boe_panel_init_dcs_cmd(boe);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+		return ret;
+	}
+
+	boe->prepared = true;
+
+	return 0;
+}
+
 static int boe_panel_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -749,7 +775,9 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 
 static const struct drm_panel_funcs boe_panel_funcs = {
 	.unprepare = boe_panel_unprepare,
+	.unprepare_power = boe_panel_unprepare_power,
 	.prepare = boe_panel_prepare,
+	.prepare_power = boe_panel_prepare_power,
 	.enable = boe_panel_enable,
 	.get_modes = boe_panel_get_modes,
 };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
