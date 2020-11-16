Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6B7C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DD520B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vn66JELI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBeX27nB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DD520B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iprok3jqgLMQqvWXOMAbLz8FOSDl6lEjHiiDwsmjz/A=; b=Vn66JELIGGapupPRKu21Zuf0z
	ksouJuxHT2eGcBVO70lk71dFE7c6HUwa6DWfKW3NI4nBfp8OHu+nF0vrdvzRg2xVLVOlEX7sLlGA2
	eoDr5uFB3Jh1LjzOb68gPFmkEry8VBEb+wnKpXbdyaBY9R3Xq7QgL2Clo0oSDmwBmZ66pcbiafpyO
	Ym/g3HuVNnHq6FQT4mnXY8sWuZjePMny9FdpIJU13J3Tr3s5cnGCtMhxwdcrhXc8yP9RHYDbaLqel
	zNbd0T9fJCoMjgtjacttV6X+9oIU65xyHgZBlvUbl3tvMZnItIEDpdX4cBsIBrcDLhtDy3ya+NYxJ
	UOwkOyeTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiYB-0005Qm-5k; Mon, 16 Nov 2020 17:44:23 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVT-00042t-Eu
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so48868wme.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=fBeX27nB366IYVH1W9juPZSpXK3wrkLndU8rdMtDvtddcQYffNN/LCMVS3P9DlfHOs
 C5uysVVIQlWEWxVvlzscOvU0YoKxFJPx62xbo8UNuLrVjxrOxb+7OsKEjsql2rq4foOz
 rqRfHEgrw79NMWdcMNTQ7jsrN2mAwn636r7qAAy1KiieowRf+XdzZfdU56Lu/WGbE9N9
 OuDX0zw3ZCX8RMZamB2HI4m6uaOZHYIexPeAlucHjoHho9jOXQv8+wVypU0AflPNRuy6
 MXcezHcvh9WjvmTZ5N/BZ44vefZaKq4vqG761nroGip4JTXBD3yPvgvqiQr4Gf1xsLc6
 ESmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=QMZpByTQpp2xTd+nYRUmxEbP7EXJ1WPwOd0jVr1g/hvvCnGrMAzK2+BRCsbZfg1sPs
 zGU3F1qjOjROdyovmoqhA7zDo5/HayCTFAVHz0nAuYMNiZUj0w/aF7MyCejJc74Q35WU
 OHYI5y3bBInSZn0fNvGvQW+0mDLnncpjug+1pJOGBgmnFjO7LKWlk0rEXWPuGjUSyvWo
 47iwHVHw03EhLkJxQCbJddLw3YuYL39QweSd0t0S5WvCTrdNAc11ayUoaVN5imnsBm5E
 /RTO9dc5GHKA1ENyfIvV1eH9BMhm7kmrhpiGRswibU908wNFEslPMi8cQy5pS4bn0pfM
 05ug==
X-Gm-Message-State: AOAM532erta+ysU8lbm9VnDrG6HLixSaxlYTIv1u7vMZaLsThRRO1DBk
 bMkaD3wsJSy1Mq69j2RbfpYU9w==
X-Google-Smtp-Source: ABdhPJx+DjhnZ+3t53J8dx2EwysUVrWUxuaviQMjGuBmn9hdukh9eFyNPCUzF5Q2JEQuhsfmK3NPfw==
X-Received: by 2002:a1c:4d0f:: with SMTP id o15mr21228wmh.142.1605548493144;
 Mon, 16 Nov 2020 09:41:33 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/42] drm/mediatek/mtk_disp_rdma: Fix formatting and supply
 missing struct member description
Date: Mon, 16 Nov 2020 17:40:40 +0000
Message-Id: <20201116174112.1833368-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124135_997519_410AF287 
X-CRM114-Status: GOOD (  13.43  )
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

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'crtc' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'data' not described in 'mtk_disp_rdma'

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
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319fedf463..d46b8ae1d0800 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -56,8 +56,9 @@ struct mtk_disp_rdma_data {
 
 /**
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: local driver data
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
