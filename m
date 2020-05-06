Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA4FC47256
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68076206F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRN28xJY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kRWBWqQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68076206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQ8igfBmHgTSDvIy9d/69Cg2hVBNbjmH3gZAF/TWoDc=; b=QRN28xJYB4e3Go
	o0G4Pt6gB1+FiAbcPnzoQiIkDbnETxHC5gEc6nE7lQ+vHcUS3vGi4QuGNk8a8fk5CYdbA4jdPuJwz
	H0iuDAKSlnZdvLxmIAWdnD1IV23ANCiuNIBWSvzMu2eeHfBNUMNeF1I6/co3s+f8ZYLuxOHrv2ll4
	/Z9krTFNLwwHkr7YDaJMSG1cGvrF9wnp+UdkD/3yMVDMxsLW1ijy8iiZ8+TOP3lPsVd4bf6aFZz24
	wyV6GPzHecvWawtZpKCj/mHjbcTL8+xOSzDP3pg5f4lQi8LvxXAdA1uFPqopBtagmNxWLzrusdz4k
	zMfLmyfsAvIoYyPQLKgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCwp-0007CY-Vd; Wed, 06 May 2020 05:50:24 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCwg-0006fd-9y
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 05:50:16 +0000
Received: by mail-pg1-x542.google.com with SMTP id r4so622641pgg.4
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldWprC6/gJRy30f4qI0sd87+jEX+5JVD2qRmLKUKSuY=;
 b=kRWBWqQa6ecU6mj/tDkQ5CyX0eu1M74l2wFd/sa8roAbVsA16hSvJ0poORwNmLvTWq
 uUnZcYIowQQ867FiKUZFFwcagHQ8pwFgab6F8bfGIY0UHVI/XB5+RtdjqE+5r7ujhQYu
 t/DgPgoT6wGvpRRdCG/kerbjz/d5Ojyd45T24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldWprC6/gJRy30f4qI0sd87+jEX+5JVD2qRmLKUKSuY=;
 b=LNncY/LWGTavDxmvKaRo+xwy5hoXpFZR/boNG6lcA6DnbPa/mmiFVe7VUGAz3WZbOy
 2MDkrlM9A/pn9Rwe0mRH1TvG67Ecv3OS8NelTo3Jwh/20LkOd9To/D1kgrTQTVZz83WD
 E8cGdyKZXdX52qoF/n9jNiem0WiF/kFHzo7I0ZBQOHlxihEo/A68YQJYolg2VcM/ICYv
 4VbvFma/jxqh36XX70/pPfdboDFHU2pz7QALBX1FG+IpcTI7uIYKGfAcLiKz5wCiAaMe
 jwXGK/p+DXwJpFAnHhIVbOYx1lmZmAbj1gffFg1sb/tAM0SyNbYmulTeaHyymY6S5TpF
 p9uQ==
X-Gm-Message-State: AGi0PuYLs8QftjiVQzqc5UHdYRkb3iu5HIYCE6L6+/9fNr6Wp1NEYq0/
 4IOyfUZEQUZ5ynPZs1u33NQOtg==
X-Google-Smtp-Source: APiQypLBf6Z7OsDBx417Ig2iNo0B8it48czxeprZK9XxePTpiPqDkOB4YpcOD4sdhh224rDHgW0Hsg==
X-Received: by 2002:aa7:9a43:: with SMTP id x3mr6662861pfj.266.1588744213491; 
 Tue, 05 May 2020 22:50:13 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id z13sm3734853pjz.42.2020.05.05.22.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 22:50:13 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from
 mtk_mdp_comp.h
Date: Wed,  6 May 2020 15:49:16 +1000
Message-Id: <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506054920.109738-1-eizan@chromium.org>
References: <20200506054920.109738-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_225014_389230_02D45B7F 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo I Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These fields are not used and can be removed.

Signed-off-by: eizan@chromium.org
Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

Changes in v1: None

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 58abfbdfb82d..c76cd61fb178 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	comp->dev_node = of_node_get(node);
 	comp->id = comp_id;
 	comp->type = mtk_mdp_matches[comp_id].type;
-	comp->regs = of_iomap(node, 0);
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 998a4b953025..3b83bd6e0d8b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
  * struct mtk_mdp_comp - the MDP's function component data
  * @dev_node:	component device node
  * @clk:	clocks required for component
- * @regs:	Mapped address of component registers.
  * @larb_dev:	SMI device required for component
  * @type:	component type
  * @id:		component ID
@@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
 struct mtk_mdp_comp {
 	struct device_node	*dev_node;
 	struct clk		*clk[2];
-	void __iomem		*regs;
 	struct device		*larb_dev;
 	enum mtk_mdp_comp_type	type;
 	enum mtk_mdp_comp_id	id;
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
