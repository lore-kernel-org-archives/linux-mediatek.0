Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47763C47258
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5734206B8
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ARRy5haj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GiPNnuzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5734206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pxDdeDbTdAKn3n5UYT4TjU+c/6kZSrviFPGMc86AoI=; b=ARRy5haj5sOzPV
	fDMUsHlX7Njpmxv47MzCPqtAB0IzXVzdq/sU9Uv4qbxTwh7lVpQVmbbcMB1+Q8HtfTVOdoS1n4qMC
	ahqgSj0/NGDDBczsDtK9C4RndjzPxooJp/fluzEDUU2XewMQ2E/CoLFvQ7XTTkhxpNTmjcIOEo9ij
	9qT0nY81y387zW8sTpYac0Rs9eNncL8lV/mmZND25OHfo8BR4DHm1453UUBtbEBufk9X5SEh4CQ2U
	TyGWlbrRNspVarYFfwE7zjA6JLaIGJs6s5GiT4R5yee3D2okPAGOi5KbJ6UZahZBVLxOXMabgSbM0
	77RcCyFl3hJsV6Qj4ObQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVolu-0003Sj-3z; Tue, 05 May 2020 04:01:30 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVole-0003BA-AR
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 04:01:15 +0000
Received: by mail-pl1-x643.google.com with SMTP id t16so286069plo.7
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcuOwTL7vWeGU4BHEEgCAhZYtrZvgsB0gLbKKMhZqVM=;
 b=GiPNnuzUK9FnG/VS1XegNdexL4Voi0zdwNKKzBwte2k3acVUCL9EDxBGjFfpHnwGM9
 U3HUEPcRukJqgs/g4K3X1ytfDAtPMZ+zsuhuv2WLphAXSTkov9EC7OsdRqoHK/Q3bYwr
 mwEsCzhKWmouicpjYsefvdkcrfumYNZx1glZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcuOwTL7vWeGU4BHEEgCAhZYtrZvgsB0gLbKKMhZqVM=;
 b=D+OoeLyU0FuwHMMhnjuK4Yx/stRNcBtUExQ2EQxEdCbwZ5JNJ+N6mgSQGbnmLZGFv2
 EHvQRQTTBxZR7097XimjEySB2tPaST3ywHe3QmytyHETt8gWvQX60Dzmx5I/cDPdEDOo
 l58AsaNI5Wz5vUr8AiC3pd5SzCDk8qDaV53dLyrN8j8WMgtwkd7qUkVxddf7g2U2F6Q7
 8Ovc8b4oa3yOoJZXHK7F1uuOjZXoFRMVTxsOpqeHvyDsmm0uJ4tLTL5NjBbvahUDutqU
 HQxQVrWT+883/cfRxpgJJNG6LgTCLEcHYtkLLNa7CWxPMd5Lo7IFTJ6hrEkBJZ70DCDT
 xZzA==
X-Gm-Message-State: AGi0PuYWpYZMU3GF7PHoN3WZ2/GfN0Pp2jzjwAIkMicctr8Uwz7zu7jg
 s5w22tvtbkPPM37rBpXJVuhMcQ==
X-Google-Smtp-Source: APiQypL9b1gOcDXoI9Aau8wQwRN9YSmxnUKqOC75g2zmvbguz1b03VlXqH1TYxFDmN7LQ4AbJ86ZJw==
X-Received: by 2002:a17:90a:9f8a:: with SMTP id
 o10mr489319pjp.118.1588651272798; 
 Mon, 04 May 2020 21:01:12 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id c10sm629631pfm.50.2020.05.04.21.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 21:01:12 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from
 mtk_mdp_comp.h
Date: Tue,  5 May 2020 14:00:44 +1000
Message-Id: <20200505125042.v1.1.If0cdd88c5399a38cff7163298cc8794f8c40a401@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505040048.132493-1-eizan@google.com>
References: <20200505040048.132493-1-eizan@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_210114_372007_00308322 
X-CRM114-Status: UNSURE (   8.26  )
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
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@google.com>,
 eizan@chromium.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These fields are not used and can be removed.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@google.com>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 14991685adb7..facc6104b91f 100644
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
