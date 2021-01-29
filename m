Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CDCC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C5CC64E05
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C5CC64E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dD5LMIcjNIRgpLxEz6Q+S8yun7QmCzJ14jZLXMuUQUg=; b=u+oXu7XMRM/PfZ0GEMXOelgJm
	tpgF78PC6y7od2wflp6Vun0Ckjf2IS4wuYmjtHhL+XpNfm5zwk8dtjEYw0bBNj2Q5Q7HI0/XHDawv
	p0shBZVQqjETUqbeMW0/45UhRGqCanUJFmCMF+G6z1Qr5vaDlDsU4FUUEbSYMRsaxY8mS6KqS7SiC
	LjkdFQUE5JDI34Kvr5DWNjRkTyJ1L9SwE1ixkOT2Y0Rdsva3kP5M9ZLZPN5eVx65dQXGvWfLIOtbz
	ooaC8g0+VGveGw28fC67uv7tQlFFgwj1vMv+qtA0DCvWkwo5VrHm8UaHKUFDYWgDZQojbLNYds+x1
	hZ+8VGuuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OJ6-0002VT-BF; Fri, 29 Jan 2021 07:35:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OIp-0002Np-CK
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 07:34:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id o20so5712754pfu.0
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btgeE7WFp2D5CajIBGg9VSazWzop69EBezIQPArUvCU=;
 b=TZR4kB1G2bNsAE+qgZ8eiVZhoITJ+kJe13lmCYltsK/S+Dl7QIbP0uBsH5bgPI1nlK
 oI6rLHMK4aoIka4pEUX/UaZdqrsDe3GfEj+RLGGD8VCrLhKe/Z2T/mTfIe/z7uJQCymc
 dbHh9mVrEHFEmklKptMB80KUEcUe4A8JcKnH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btgeE7WFp2D5CajIBGg9VSazWzop69EBezIQPArUvCU=;
 b=B4x9W5ky0EDVNDA+zfWEATpraNqJ2HLleX/JxoBI/8EQzvMS8HsaYFf/vj0TwUJmvJ
 4CDVte5OI4zdbQzsWrvnKZst03M8unflu9KPcglCczQQKJ2sZA7KuDDaNpnX13Q85fZl
 5WHBGbAWje89ZWirT32JPl80o4Td8KsyqnVxBEk+hPcdi37ZmnBUBuNREJNYSXjg5CEp
 j51ddI/ylkq81a0pdCHPlo2g1gNpAzDs6O52TQMdxEEnns8BIBVs33oeRXZRzh5rhoAx
 MWEDhR+WTycfVe1bIN6Auu9YHQ1016S8bM21zLNpKjvAjpxdQ4t+It+A8tVjuXx/VCfA
 +O9g==
X-Gm-Message-State: AOAM533AOSLdb7A/Bfotv78LUW2fe9ZqX6YvBgYmQS9z0UZHNIsVVO8E
 lOXukXPE17+R+S6eSpKciDdyJQ==
X-Google-Smtp-Source: ABdhPJwGzKQhp5dhDV4z37t3vWRcdeRiZPfmH1ZQVoT8Y7zVZiDpWmQcW2Y/z2SYPG1flbKPmDszkw==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id
 x2-20020aa793a20000b02901bf23a3a945mr3154824pff.70.1611905684192; 
 Thu, 28 Jan 2021 23:34:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/8] drm/mediatek: add component OVL_2L2
Date: Fri, 29 Jan 2021 15:34:29 +0800
Message-Id: <20210129073436.2429834-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_023447_466990_7D9070B7 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5b7fcedb9f9a8..ccfaada998cf5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -479,6 +479,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
