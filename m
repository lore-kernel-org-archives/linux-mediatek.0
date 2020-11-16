Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8767C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B24920B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxJFZ1JN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kqhZccK8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfFikjbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B24920B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W8aLJt1NVBZOsNWulPBuZoGtue+d0MKzWxOgckN225s=; b=uxJFZ1JN/7izusqiYTTF786XH
	25HM+t9EdjiGbz4Y/kW3kiCRpX+Ivvo+Q5sMzd95t7tsyXveMmkq33cMsYdMnsQNqTrb7vvkP5yQq
	DhAIpYtvmk1gmFeddHUhGQkJKOx1Ty9iBpVGM0oai5raYFyRUJDewR0pQZAni8Nt56+FU5Q/3VlDt
	N9yZKRkzKt6R8Xe0QQTD/ZsI/uV27DaNYOYo4VIkZOqcv20JoKhngwgBiM6zquoLWa+ry2VW62Ujt
	/zXb9cJZUlDZSgDD2XrakdpXudsAlbcKsG+WlkefJF0dxLDl41PHxXnn7Mmmlcl23AhdASPboZZmh
	bAa7/qpnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiXy-0005Hx-1Q; Mon, 16 Nov 2020 17:44:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVb-00048A-C2
 for linux-mediatek@merlin.infradead.org; Mon, 16 Nov 2020 17:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=; b=kqhZccK85qZbzn0cPk08Ee7bNp
 c0HK/THCJ2qtLFvQxdeAIHE/8NKYHq0dJ+cbjRUxFnzi6VX3wVAGlT1E9sUQqOTMrbI9bdVKReV4o
 V3o6EQtPTcnpVKVtWtt/l3C4N96kHjH8MbMOzXh7Rmj4YfvyZfiIieTygM4Fz2hWprvSWAqj7JYJC
 IepPab0Pv7kbZgmozC5q4lGXL7pu9UOTn42iQSP1RRRrsSc9zSNqsh02BMS3n6wEMEibyrPbdQlmz
 bbxn3o/ZACP1qiBOl67bwsS0icbU9y9X+DgpCEVlV4ExIGZKP3jjRlWhqZ5EXEB22t+mM9OyCUZdb
 /B0Fl1+g==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVV-0001GP-9P
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id 10so49087wml.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=gfFikjbNe9YkvOd+VXcfbf0J4Wd2441zhnFbQBUFTSfGl/11fLgrzMNsROSrDNKZnB
 56O56aOR/HmR02tQ/3tiNJAhdUCmKv3PyRLNB0tFPnqebgucJjargzJMwuSJqsg4qUDz
 lUADz1TsIKFAEDWw/i6YYk8HVxvDJqeRjFeh11I8P7jIVCANAQ8XqJPeo2AmjbptibFD
 3BUaOo+e/x2FHDxxqyNUMx1CFmyFSNvfDMIXzxiO4enNnSLj6DwZyaW/AX6d3z+XhZkM
 Hol8SB/aqA0USEkFwB5UEN9vO92vFQ3LpEYj0SMeSchExJmGtxQjQooiNX6+MTrjskNO
 qkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCTuXmjwQai/CDFPUzQ3kg8YDOVHQv+4DVCFDqYGwk4=;
 b=ULD6mx0xJlgiOfF2z8LqSKFPCXN+0oX2b0XDD4DIglyYLnLwUMtWzeKNlpo36eLoGJ
 yZIqWuybfOu/SIkCD9Ex31tyDH3QFDKm3pIx9Awq1fxbdmP7va7taehTqxINgUESeczE
 eNDOEyDfptnrcs5noxg7v23gJ4BYfryJEqcy2Dn85TUYVRbj+QmkJuRZk7Sgj3zEPCCB
 d3OQzDNOsCeRew83xzsh9tWPw283BNWofNO9tZz5gU2VErJUn4RyPaPhqg2MSamT5Jje
 WzF/QnuEILILvqA7Dja4dyxL2nTqnM+9GKJ6E9f5iYlyGCtnSD7VP8gbnhJzkuvTkCw4
 cdaQ==
X-Gm-Message-State: AOAM533Dk7NQrq+6CbXW9b5qkRzGXJycg/bo3GBTOE9+M5bW1pT43Vyl
 7wOlpAAuxqnHtXUSU8oGQLNzL5FYt9Bu34bJ
X-Google-Smtp-Source: ABdhPJwrqzcWWtyPydLaEIxmPE66hOyh5iCvJ3dX8GBSzMZleXIeT0J7SjvsguKoHdDSGAfq4DLbJQ==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr48224wme.8.1605548494375;
 Mon, 16 Nov 2020 09:41:34 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/42] drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date
 struct header
Date: Mon, 16 Nov 2020 17:40:41 +0000
Message-Id: <20201116174112.1833368-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_174137_628493_0D1657A1 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This needs someone with in-depth knowledge of the driver to complete.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'pending_needs_vblank' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'event' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'layer_nr' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'pending_async_planes' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'cmdq_client' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'cmdq_event' not described in 'mtk_drm_crtc'
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c:62: warning: Function parameter or member 'hw_lock' not described in 'mtk_drm_crtc'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 193848fd75154..bfe9942305435 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -24,7 +24,7 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-/**
+/*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
  * @enabled: records whether crtc_enable succeeded
@@ -34,6 +34,8 @@
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
+ *
+ * TODO: Needs update: this header is missing a bunch of member descriptions.
  */
 struct mtk_drm_crtc {
 	struct drm_crtc			base;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
