Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2B1C5DF62
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A2921929
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJz19zv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="Mq6TglzN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A2921929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je6vBjzSBz6Rgezpa6DE7vw8FZkqKhmcyNNp9HqBNKE=; b=EJz19zv6X4gyg9
	9oyLza+Ul7da2nbq5IMVAHEQgNwZrtXjimduTd3JDLcTgr5LJUdK+AEzs+8eSMVY/Ou9yE05RmYGg
	/eqP7nZqDQmx7rfrWjLXiaGElK6geIqJdmxm1hp0ixIkZlNQhm8dPUh10IOJw0I6MiFRlKT0zu2BC
	UvCOiQIEMBQ6CojabwNRtCr6UV9KZvMhdk1PPapP2xeTLJG5jS6Y/HyF+aJrOdO0AfOa+yYd0coKg
	Sdv6HjxRLXxIcft8yYw8BnrIOda4f1UqAa5h+1Gly6PxjyIN9auequiWM7awZIa6qsdpfyeUWDT3D
	fRL2Xqu8o1nIb9zd7+uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6BI-0001Pf-ME; Tue, 05 Nov 2019 21:16:04 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66O-00033C-9A
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:11:06 +0000
Received: by mail-yw1-xc43.google.com with SMTP id j190so3065906ywf.8
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkKPVb6pP5aq3OLgQzfYcwJ5aNwtIA26btnxZ0mORbM=;
 b=Mq6TglzNM33XbXY7U0CDyP267OuSAHrU9t/Sm6DqR/tMUQ61hFziZ0yRWSJeugur5+
 rDiepGUZBx3TNu3ZVfa/ay14OgmV9ay+S0QbY+AeRHda6+7AaqpR3TlAtZloi5bE6HTT
 PAtXrU8G/YWwxUEcsW7XJ71obGHphVljhfNcT3Um/caOXlpaBQFOrfPvNYE9MbHWmGJS
 XhqSNf+g8ZLpnScwCo4xMTQN5Cfe3w5agoGjyvbkaPo0IPh7kGmc/q3TA8isg6KZyICV
 cECCGKePRvI6jpsOiDJKHdlsEHT40fovY2XPOeWib4+FkwXFr5Wqh3bpHtJ9E/VtUC8K
 vr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkKPVb6pP5aq3OLgQzfYcwJ5aNwtIA26btnxZ0mORbM=;
 b=OPZcWQI2J9yrsrXhVejw/X19QVxNv9TAsIU4WAuNDkVnT8ituqAgz463mG2EjuvHLO
 HZD4wzmIhiHGB2kBQ4hDX+XVg6OSVFLDPiuCJQtem9McvXbFBwV6QTi+Uni0Fv3PMcBd
 s4pAaWIAIry3g+UCx4JbgQPBFkCECBiC8oobqqbqDcJEDMHSZe3rFKzA7xaJRN4lh0fp
 yB77HDHC8dUoWzfxZg8trtRmbHNoPjGZuSZF1ttbtAARZy26JPX23j/g4nO6Q4JoXuVS
 H3m6r3o0zdXMIaZtvV4+HRZBLSf1ORzTJH2sMhHjCUPY7d60ahvYn5N3G2GZqqbGbnDq
 mRxw==
X-Gm-Message-State: APjAAAVgFShmu9a2uyr0RFckEaTK7f25zPq1BVEjvnaPodVA9fodq6eO
 UzTX5s09BSPTFjB71LdGep+bfQ==
X-Google-Smtp-Source: APXvYqyUCARybzwRjLGPnWuXk2JznQo9jeaLOMjuFbMyCaJBgQqqFWRHOQEwoBTwK7kELxzPui6Q+w==
X-Received: by 2002:a0d:ca12:: with SMTP id m18mr25386699ywd.97.1572988259096; 
 Tue, 05 Nov 2019 13:10:59 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:58 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/7] drm/mediatek: Support reflect-x plane rotation
Date: Tue,  5 Nov 2019 16:10:23 -0500
Message-Id: <20191105211034.123937-7-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131100_431242_9FC88470 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, p.zabel@pengutronix.de,
 frkoenig@chromium.org, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

Add support for REFLECT_X rotations.

Cc: Fritz Koenig <frkoenig@chromium.org>
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Miguel Casas <mcasas@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index fae10aead3d5..f4c4d3fedc5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -53,6 +53,7 @@
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
+#define	OVL_CON_HORZ_FLIP	BIT(10)
 
 struct mtk_disp_ovl_data {
 	unsigned int addr;
@@ -142,7 +143,8 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
 
 static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
 {
-	return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y;
+	return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y |
+	       DRM_MODE_REFLECT_X;
 }
 
 static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
@@ -153,6 +155,7 @@ static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
 
 	rotation = drm_rotation_simplify(state->rotation,
 					 DRM_MODE_ROTATE_0 |
+					 DRM_MODE_REFLECT_X |
 					 DRM_MODE_REFLECT_Y);
 	rotation &= ~DRM_MODE_ROTATE_0;
 
@@ -269,6 +272,11 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 		addr += (pending->height - 1) * pending->pitch;
 	}
 
+	if (pending->rotation & DRM_MODE_REFLECT_X) {
+		con |= OVL_CON_HORZ_FLIP;
+		addr += pending->pitch - 1;
+	}
+
 	writel_relaxed(con, comp->regs + DISP_REG_OVL_CON(idx));
 	writel_relaxed(pitch, comp->regs + DISP_REG_OVL_PITCH(idx));
 	writel_relaxed(src_size, comp->regs + DISP_REG_OVL_SRC_SIZE(idx));
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
