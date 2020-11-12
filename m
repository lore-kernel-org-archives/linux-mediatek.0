Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40D9C5519F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D571206FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="018NzDTL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLer8tlT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D571206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cTOqss6Bd6r7J7OKVMzLTV2r566Pygm/hhUT2pjaIro=; b=018NzDTLhrSFp+qZNe2D1yCu7
	swXNrD++8lYvijtyIPQIt7HLBdQTTcvSxv1uGwXx7A51KztLqaVmHwu4qfwUsGjdy1YqaAte341V6
	jYeyA1v5r9DMjPxpYdjclnc7zBr27SWTUVFJ+XKuVA0eK3rSTYZ2sNkUIXSWvi4fQKgREWHfd6Y6P
	souaZLGjU0W0bn3QnNAZV1dVXmvOyzch2KDBdJbIF0rUs4pWffhrcCx8A5/g4YhPMUee/qzXRqPpM
	pu7sOecZH5zeSxvhVDg5+oIXgU8VKNdzk2bGEZg9kyB+M/N66gAKv9a9Jc+bfNJR9gSkOq2rJF1YP
	bjCnzJ3NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdHsD-0004gf-5q; Thu, 12 Nov 2020 19:03:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHqz-00045D-45
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 19:02:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id 23so6759172wmg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 11:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=FLer8tlTJpW9/03wMweKDBS55avbIBPNMLVtPNnoxD4MVGnFei7f6YAUPIu9J2n2Gg
 +Pdyq75fTNEUeCBTcdXceFn0HzcUeXJxghFUDF6I7M4qx6yCAdYvds2tB5Np4BBOv2cI
 t8jYVNyEU0qnCvxYIhyWwRsHymc31CJa6rbyWGWmd4psXhR2pAvKq9sYOjLn5yYqxv0Q
 IdoP1C1LJvHsCcTkD6WmAjsOOSxxFTPTxeo627RMfQDiMpAu/4GwmOBwcNLcpStOKMqY
 Hwtv55Vxa1wzZdsOhTxilW8KPfa0IwU7MpU2MuMucnSHkdEn5I0AxGoJ+GAbffpCBMJI
 tpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=tmOw1HoUxRUOeA5Po4VyHf9XL0baYVGZp07y8Tc3Z7p9uwyumq3nJlJBlTzoIw0rwh
 BWF/OrNyAhgcXHt+hTUC1Rpn6Nsx3B+5lCbVjrR8d6qu12gkI3xnmSs9jhJgDm49JvNK
 oEygSgMe+abGrcMRwSzTuvCLDn51Q3KPPBtc7KGuDe25nya3E0X8kwlROYI1fVYS47Wm
 UcIboce8yp4xZa7niFoCTLRCXo3fEqVW+r+iOb+2slm3ljJgxMGUl40HoTDWoepYxbl9
 GPCTelO7ekdomFuIhjqT7MI0qJHovK1jM34ulHAWc1PNiEy50zAu7yIyX0prK6nEcCVH
 0cUQ==
X-Gm-Message-State: AOAM530Pr3sKLSjW4UuaxgvOvCc9hVzPdFAEhfrVNudXgOzECVDIpxHH
 j6Pbd0uVwkZUOk+bPqcs94h8Kg==
X-Google-Smtp-Source: ABdhPJyAsIo5Mm2tjgv7zGGnj0raCm6z8NlmoYajDaNb+hIDZ+v4dJAu7qWeEXrYmi1tid6oDwkBWg==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr1029949wmg.81.1605207711389;
 Thu, 12 Nov 2020 11:01:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/30] drm/mediatek/mtk_disp_ovl: Fix formatting and provide
 missing member description
Date: Thu, 12 Nov 2020 19:00:39 +0000
Message-Id: <20201112190039.2785914-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_140154_115167_564A2D2D 
X-CRM114-Status: GOOD (  13.15  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'crtc' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'data' not described in 'mtk_disp_ovl'

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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 28651bc579bc9..74ef6fc0528b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,9 @@ struct mtk_disp_ovl_data {
 
 /**
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report vblank events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report vblank events to
+ * @data: platform data
  */
 struct mtk_disp_ovl {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
