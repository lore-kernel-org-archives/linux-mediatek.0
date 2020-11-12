Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76ABAC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FA02222F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klk9LYhI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GgqfMJ5N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kn2ivuqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FA02222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANVjWtTMRzsjsyyHwfA/5z1behKxAVxLZJZE+/3cQxY=; b=klk9LYhIgo3fh04yKBk7qtUnG
	RHaS58U9TaL7AJm8Mbg3ZZ59CfsjlgWgYWSt/9eK1hoT8uRrQJ2Z9TAAQYqQq7KlTVmtl01iOI04p
	HS22oVF1T6DoexyKvMVwdru/V0eh4bkgix+pnW9WSyIgVjNSe4ocdcvDUIoWK5pJURgHe9P3fYoop
	eys7mVCos+gORUreFYdYHmWnrjFZhMwwXZ7aJH9TjDttvrj0n7e1nm/bb0+yXISEyydsOrREj6qjR
	Ty5iYtJwDA+YBIVKs3ymI3WU2Mova+RnYg0S0Xnvk9+mR6MR8CvkoIKBgsVnaG535JP1GhmglQju3
	xNNqeWDiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdHsf-0004z3-Ds; Thu, 12 Nov 2020 19:03:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHsb-0004wH-5o
 for linux-mediatek@merlin.infradead.org; Thu, 12 Nov 2020 19:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=; b=GgqfMJ5N8jxkkgjiOmQJq7LVLE
 uPmregxUP1nt4ZuS16DnsRQN/dbgRAoBAn9FXmRVP5aFHjDqi72L2qTXNSekdDr/FNztuPTkWSqog
 CytNGwHcuExlYAKWXYKuz3wrCmQZa+68anSVqi5EeTCDQf/O0zzbOSP+yDINgiJcGs02GHKyQVGH1
 kHvXM5OYwNuxsHWls+F6ONGUYAj+1RyBy6NunKQJSXaGwEl1yaqoLOnLIwl7w0qWsJJkhXU1pRaee
 vPixAKtjbaEKeLH06E9PYnrayW2LXYCA1VWQR8npC+Lfw8Ei/8dSa+eedm6959B6lyYWGLXlcP7pL
 ZG4jicOQ==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHr1-0006Vq-67
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 19:03:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id 33so7151498wrl.7
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=Kn2ivuqgAsK52Jio64tgCg5gEc3heO8c9beyz/bqFQbf5NkBPLY0+mhmwCJ6UNpA3P
 J4x/Rd3GXHQO/a/7YTp80S3ElfDEZFctAwN1fZKTPz8totTDUrGBrl8p88E9wBEhi+Vj
 2zmyC3n++XMwoLh/RL82lSqhrY7fWGLb6m98Nsc77uAzHP7z86dDHPaXrtRzpLI/SHXV
 fVu3eXDW/AUtoktCjuFoknQPCENGgeS9pTL1Nr/1cP8B8IeH4pRObv232EktleSaFXGo
 GYsnK3HMSXR5k+Gcc5sO0FRKxjZa7Lc2K5sSnN+o7DNgZBGnfLxH4JM1NTZ/nwQxlHgY
 2eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=k7I6B/BVB1BAaz4imSEe3A484SDmLQoKf2nNUOeXRygG2tMi4cH2XGQZgRHDOzqEcM
 H4DeUiHIEHdfqCvqescAmuJPnX1PMlvw2IfIbTI0LGqolkLWwRr5jNJPzuj8cjYmIQ1A
 GiWi0lrthZ4FokbjWpNDTyEYN/BqzIvx4lglFAhLdcfHlhgczVNQh9a0FB3+Xh+vcArb
 jHPC77J4zqjOSVhUeC77bo4+sqdXx8rE6MhZPg8wo2Y0H0Ds/FKahy0H8o7ZrNxC4eVX
 g3F/gJUNre+6f6qy8LdeDWSQD20W5venMJ0acIbiFlG/rWLxP+civ2G0MKrsLbcs4JML
 OiEQ==
X-Gm-Message-State: AOAM533beVW9zlX4uQK65qjXzSwAMvMPBx5q16Vx3Ujazy3VY9P7XV16
 ra4M7+IcmSngFIngsVb6VnMp3w==
X-Google-Smtp-Source: ABdhPJyC+zO0DY5MHCIJ0bV9ffOxtDjtwGdlvt4SiEuyNxuXTQ+znllAJ+A8SlC5c9Z7ZtrMrG8zIg==
X-Received: by 2002:a5d:6286:: with SMTP id k6mr1118692wru.216.1605207708584; 
 Thu, 12 Nov 2020 11:01:48 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/30] drm/mediatek/mtk_disp_color: Fix formatting and provide
 missing member description
Date: Thu, 12 Nov 2020 19:00:37 +0000
Message-Id: <20201112190039.2785914-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_190200_209968_2D6C43F4 
X-CRM114-Status: GOOD (  11.96  )
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
