Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D24C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CCE20B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9/pxS7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iE+GfQv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CCE20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANVjWtTMRzsjsyyHwfA/5z1behKxAVxLZJZE+/3cQxY=; b=M9/pxS7+46hmZNpGilxlgRNf3
	7Bs6U6ZVQTAuxz/GRxvCuaNB3F9g2DMtWuzSBigGLY8pouFqFVvXKVsE+/vQS1jPVt38yTDQv5epl
	8pYF4klojESoo+Vtu/R2XxiuZqPc2qn0x/sq3RrwLd5+Jk1viKnQmYUuJeyZi9BuK1zHJIIK14b/s
	/UhycF5bqKEHcEUJCsUKEnPBW4Cf0QC+jirkne8PLbixv+R0wPdTo1d1x738rMmZoLglL5DvTZp/9
	A1ijLhqHipR5NqqU9/9/FR4LG+u/HmG8QqBzKw4Rt89Pr6bQWOmee6X5yVOukF4LG9LLZ/BK5rrKo
	ylY5XM54w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiXQ-00050z-MR; Mon, 16 Nov 2020 17:43:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVP-00040X-CU
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id s13so32968wmh.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=iE+GfQv7S+GSvLz2XqilNiYCnjVAF3dl0i1NdZt+LoSFIRELaZUc3+iVqUhwSYL0aL
 pjti1ADepOb4FJkdojySoQwMDaPrwh7j6aO88NbHuD+w84SjoGK0W2eUvbUHE5pG9eNr
 pViE4R8pwS1eyXthtq+uAS/Y9RT47NfD5j64F8teilBivL8FdqFk6gOihpy9n8yRTglP
 lisu3mYddSpY3XWHFLYoda6EU319ZkdjHtvRyPZaVUwaz1/TvNiXMv3VWuIHTWT9xLbf
 Rcelarr0lAeUtKHga5xymhwhANiCRxFrOKVXBl4V0qNoneN3zTpuk3fXRa9q4v3ewMbx
 bMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=pzkonU5unQffk0PEs6Yp8cbrAM7k3FO82PTaEkr3kzoXiz6WvFU6Iabni5pjn/J8i7
 yv4erMJpLYiZIofy9f8CnQbOs1z8R0FrvYRgXs1E5Kuo+85OXkyQGA2Q3YxnNYdd9VRg
 3O8PbRscqLPY+ORXdvT8hqQDmhVJdTVbnLURKBK8Zut+WuxPflHK3t7EmWqyma6ZEuUH
 +gLJ5ykFbL11CY1o+RopBpEnvAlSc+VwrQnnembzKI0dWUvdgum7UT4JSEh/g98LaKjg
 uGEW/0R/0AZq0LgRPaa1ZAEZOper6VP59xJm52+P2AOMJJzw3X69UFY4+YIGLk38KPbi
 scEQ==
X-Gm-Message-State: AOAM530O3ETGH9K7W84sAZ8KTjzqBlRkA3jOT10ca0TYRzLMxIJIGiG4
 Ww/g9jqLiupugOaCjNUsmrHDdw==
X-Google-Smtp-Source: ABdhPJyAtdkZ7H/8C+uFfj6r311zF9vn30gnWin/fN7tzo1uOND51VmS8moUU4d/wdcd/nghzYnvaQ==
X-Received: by 2002:a1c:7202:: with SMTP id n2mr39184wmc.38.1605548489918;
 Mon, 16 Nov 2020 09:41:29 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/42] drm/mediatek/mtk_disp_color: Fix formatting and provide
 missing member description
Date: Mon, 16 Nov 2020 17:40:38 +0000
Message-Id: <20201116174112.1833368-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124131_615231_9B573354 
X-CRM114-Status: GOOD (  13.33  )
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'crtc' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'data' not described in 'mtk_disp_color'

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
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845bb..a788ff95ed6e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,8 +30,9 @@ struct mtk_disp_color_data {
 
 /**
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: platform colour driver data
  */
 struct mtk_disp_color {
 	struct mtk_ddp_comp			ddp_comp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
