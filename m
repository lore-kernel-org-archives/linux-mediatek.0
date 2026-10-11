Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B23CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=; b=j8igWoIV/L1vDf8kyReplAk+V7
	feGos16Npo+wRKMdn2eGRSUnTJoUy+H/EJhhIwxG2OIDOvxsvL9mvqH/paL00byQ1Rlz6JOn2o7j2
	zf2EwZEbBOvNbeXHgWPbp+jqTJ6hj9MvQCdI3LJrHWllw8meXz72e8U30yS/gKa0VAmqWBuNKSMWf
	apUHeJXDP7TsDTaK3y41WNs+QemvNPEKXMa8bmSqzhdcv1GailZA+GCWRKLmFDzKUI3tzA0TslL5r
	QtJmx4uNvnrM4DqNE3Mbddv6xUkZfFiwQ0SMTfWTjkj3evVraiAtdVZCdKmTIWbnJwworUKwT29oP
	o+BF/9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008ab6-1Cjd;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x03.google.com ([2607:f8b0:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhed-00000008aXg-2OZ1
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:15 +0000
Received: by mail-qk2-x03.google.com with SMTP id af79cd13be357-93c3dfd105eso77630985a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679386; x=1792284186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=l2yQ1BNJjYRuUv3az64IC7nFcoHdfoqNUU+40R3ThjC7RqGOIE9Ys3lg/6cuIfEjiU
         6ADeJdOssrDnE1GBGQesUiqmVxv77wTXkVWmy7DtsAq7psjFBRChGEYGz4+qpPAGe3UJ
         xOrePKIyqVoHxrtZ3q7JRAqulwhpfjgPsKP5Y3Qv8lKkWQKsxeDO1i/sl1RZPcQHuyJI
         PPadQ0J786M+iVvXMIx+GMp3OBQEFdHuFtJNAcxb9lSw6tBAQi8cFIQ9ssHG601+rzZB
         gzKCn9CUw8o0eyThTKvw8UFr8qugA9f+3IKczucY6oA34XhW3SB4CH8HVzF0Axjcud96
         LsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679386; x=1792284186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=SgLxR8v0Kr3NKtf/6Ly/gKFC++WSCfeAsr9CBf4po1dOAhjCbX8U0y/wPYZb0qg6Ho
         LhqOmKvTZliM33SfpVLl9ofsA7o/i3j4Kw0sMdQWyexMGcIZ/jNaUV8f/9IyWMOIFw08
         xwbtZLsCMEuveQDB6YF/0d5WTnM7dNau0UWh+DGVr6dafyowq3TVsxbucufPjtMKkg0F
         lSnkynsEjue5kc/+w4p/rdF6PxUGymRGBnFQ5L3vNq7tcsL20gV3508s2jSXvwi4vo30
         rh8lGdgzOT09/MJUJY6IwXEID0Xz7Y6M29IMY3KWs7IeaROxTRPju15v/Qw8c0lbRL84
         yppw==
X-Forwarded-Encrypted: i=1; AKwUvBzY5UR0vuy/oj2ajFjTv9rbeJgy8nbro7HvP1sh41fruPhhBfmHA+894h+di4E65ZxAr+07CMAxyEWhpzESpA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLyiCCrmaM+EUYxVZ2ohidieXNTdyq4eKzyGWNYe7UztlZrJqjL
	3KKIqiGV+wBd/ziyIKNb2g1yFnlTvS5g0/OAXyH0zJHkynPrH4h8M07/
X-Gm-Gg: AYBFou0sJ9Kvxfl4DZtuYCi4cT3VauJx2l800jSZvxdhdkzhiQXVLDnEo+C74aX7JBd
	OxeJQ9kmajoFTc7YPy7P1ERVDM76CRdYYAiy/Q09RbzysvCPViwQVlafjMLd/2b+v9WE5GmZB/u
	b2SuX1mXR673dhLtMo7zc128i6KMEgAoKJZg1Q7MJ5++4fgCQYsIFbJ0s+9424FIK2u9ramI4f+
	R6o4z0oGgf3605HTgL8o5DJyj2Ep0+kylQ3JffucL45afPTtEhqXtqtjSRDzdlWqJ/KxZBg48+T
	HHVqMVoHjxk7K7l7KFHkGJ4pv23BsMVZchqszFFurud/Io9ZhifKJEmxILoWM6vd/tWwDL9SM9Z
	JKXgzmJikTrTndebqMbopFUB0lKQvAnr/LJw5c4vyCjz98QZ3qmStdd3HS0yOW33Fmein2qVbHy
	wFhu8VLINqwTY1MCLDBNBrAl4iTjyNOpP2mr9W91wz69SGJ4AJk2nmkSpxSd0nPY4tQjU=
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr906360385a.78.1791679386387;
        Sat, 10 Oct 2026 17:43:06 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable
Date: Sat, 10 Oct 2026 20:42:48 -0400
Message-ID: <20261011004248.1117649-4-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_610160_F40A8703 
X-CRM114-Status: GOOD (  13.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_crtc_update_output() only picks the output component of a CRTC
with connector routes when connectors_changed is set in the commit that
enables the CRTC. But connectors_changed only says that the connectors
changed in that commit, not since the CRTC was last enabled. A connector
can be attached to (or moved to) the CRTC while it is inactive, and the
later commit that only sets ACTIVE then has active_changed but not
connectors_changed:

- If the CRTC had never been enabled, the route slot is still NULL and
  mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
  and so on).
- If the CRTC was driven through another route before, e.g. a CRTC
  shared by an HDMI bridge on DSI and a DisplayPort output that is
  switched off (DPMS) while the monitor moves from one to the other,
  the pipeline is set up for the old output.

update_output() only runs from atomic_enable and the lookup is a short
loop over the routes, so do it on every enable.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code. The same change runs on the MT8189
    Chromebook described in patch 1, where one routed CRTC drives either
    HDMI or USB-C DisplayPort: DPMS off/on and suspend/resume with a DP
    monitor attached come back. The sequence that fails without it
    (connector attached or swapped while the CRTC is inactive, then only
    ACTIVE set) was not reproduced on purpose. Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 704931b369b6..0bfd17f68282 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -695,9 +695,6 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	struct mtk_drm_private *priv;
 	unsigned int encoder_mask = crtc_state->encoder_mask;
 
-	if (!crtc_state->connectors_changed)
-		return;
-
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-- 
2.43.0


