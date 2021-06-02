Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC8AC47093
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B426F613D8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B426F613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUO8lRv9VEqTtLJJuZ3P17ZIVdwdgAqpKrxmZ/kMN8c=; b=qR6ulXPGgXdA2I
	2jFBaQWgRsIQN8Hx7wzIw+zSQc2rI+7OKrdd5KQBPSUqB65dxK0vzSf3PB8BHWDLO7lAKuKAf0E5s
	/nAKQ9mMrsHlj3Q4prvh9ddMNb7HZZrUcABx8YVNVzk+qgD6e8KZnti8wl1qZ5dDZcWNWWeeCLrkM
	4E3aR8A36vLcQP66u8s68fFswu5AQAQvK13bvplR5fFBSZnUnGRejcrrZqfC+Ozda20gMTCX76dgA
	F/KT/vtAh0pnNUG9MAvh57crv/cVtowZjsQdqWxWZaVZcFY1JiR7XkUWYg1MvSOoqZuiwKjeZzceR
	t4lFd6ja5F1ysPHMfQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRvu-004ZzI-L2; Wed, 02 Jun 2021 14:33:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRvl-004Zti-IH
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 14:33:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1851479wmq.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=rgK5J1pf61mbr4gAJvzrqYg1NFOZAHw11rg/bnOxAWpDOqPQgssVwLXQOHcmWyRWNq
 KUrzFMA+dglu4oU0dzeEzXy07ZCvW94AfH5X5/e9RKxRR1XAH6GP/3krthyYA/J4mmjf
 vHwHDK4gm+XhyqE8mqH4kPw0vuKDs+PsjtWIw3NKpdyomU0wemzWKm7AXlvyA7BuZ4QF
 JYUaq1szJCA4P1XOElhAbD7Xu7IqatvY9Avryr1PqsXDceTGwFE8m+gmpithlNs9iipG
 BuB9solh30GDVOgKfnIPgf3WXRbuzKxO8x9+3kpN7RlC4ipOSTIKGgJe6gEcD6ex0af2
 DN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=tS/R0jSLm1j4FLspQ2xI0IIzb3moUbKkkEvtgKV41pt9WBRsv+tNN+oIyT8mQkXFu0
 T3ogv2hfl2uLBMLZlASAAeCnxyJzKYmLPXv6L6KZ+oza8gfNqMg0HtEIZGS7gIIo/pFl
 GYhDs6vC5tf6cTInZz6h1gGlFZHOz19rTnz8/Fk6UtOlmty7UZ3SCDlQ2UYMcB3JsA/A
 D03scu6yMqEdVWFWR4w9Rl8OdHhgaogAPoG2jE+bdc+kes7zZRUJTKAsYbmYtLStJO09
 Wax/0mB6nCNiVfjku2vDqOScUDYZh9AkpuQvZMacyB+biQ9ealKvWUE3uApjb38uu1Xb
 riWQ==
X-Gm-Message-State: AOAM531ygY0x3lc2YnlUqyUw/Eda/RUjyxhhtQs68C3fSCL6XY/dl6s4
 VV8+DNHWlO0M8+QBTBraEJ8MOg==
X-Google-Smtp-Source: ABdhPJxTfX71DJ4tXTep1p96l5vvEGkQLsO5X8QuRsRF+axwSkdMuH163P9OGjrkgu1nDwfjXeuCjg==
X-Received: by 2002:a1c:acc5:: with SMTP id v188mr31827293wme.60.1622644391022; 
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RESEND 01/26] drm/mediatek/mtk_disp_color: Strip incorrect doc and
 demote header
Date: Wed,  2 Jun 2021 15:32:35 +0100
Message-Id: <20210602143300.2330146-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_073313_621301_98D946DA 
X-CRM114-Status: GOOD (  12.05  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'clk' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'regs' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_color'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 63f411ab393b7..6f4c80bbc0eb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,9 +30,8 @@ struct mtk_disp_color_data {
 	unsigned int color_offset;
 };
 
-/**
+/*
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report irq events to
  * @data: platform colour driver data
  */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
