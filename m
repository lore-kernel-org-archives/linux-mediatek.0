Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47910C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E333F64DD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E333F64DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9WNS0rk2eVVJL6W9jo+iQf93ErW3UfiRjcTfX8l7+eU=; b=hR7HX95ieP5ww4uTGfWJyAJ8z
	B7pCu6AW9RwWPeoW+fgFL1meHuL8TdV3qSP77gyOFjmQDvVDReqJ6TkEO/xJ0Mj9hxm/BBZCdBkfW
	RUcr7WapK0/2HmYMGctbmA+6aVwjqjngny080g6YW3Gily1SLfpM9B4dYr6dMoQdkWyPni2a7uzYP
	372tfEM0KdL6e0hOxbOvSmU9qU5EKVtUsMlIdiBkpQlkS2c8Fz/BeK0EPGx+eiMkhq2b/9kc5s+FL
	LnyuFJfGD4yK/LD5N3u2AsIPlb1gx6YVqr2LI3TrhzL2Wx2T4oFsCd4cWqUrBwVihJ/O3+L8Nc0zd
	FAZUyiiVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51j6-0007xX-Cc; Thu, 28 Jan 2021 07:28:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51iz-0007uM-0H
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 07:28:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id j12so3423125pfj.12
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 23:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=bmxOK+fJooGfsi1izamRIsN0nqeSv63ef+oEkbVp1glFlLrQvZ71goAnFNQsXR0ldr
 bwGyOzNYDkhdnEsJK49o/gs3Up6t1KlcUtli8//Gu4ogsMsFAOIUeBG0CJasgI3DCC5U
 1mRlK0KeM3yJ+80Sg7Lv60SXRIGdKN3OcNUyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=FXRSFaf28+nkyqCTgD9c3mgkczOSHnVbTc1CD7n0SQ8MWa6GxZUOzoJD8lp3vkSGbk
 2wmKgdswJo3qLCn1ajyaXm/ryOs2hIYUStBt7xfAtMCW+Syv6z8IIaWJ/Ig9rSdynXeF
 Nrh7MSXEUnorNF1Fb9Q52k0R+ngw+OhwRNRwWKchvG+R+gITApCmiVBgqDTiEcmscPk6
 b84IrC1ypj3COaFjctS3D50JwqAq04ih49EcFULjSdUxHJjmWo/AgbXL8JKvPZOkWCXh
 unOg5vGR9/re9WxibAheG6n/bsu5jdFIgY7xEFXQxV1MJCqjWmnflZlEPfNOi24ndyxH
 Fb6A==
X-Gm-Message-State: AOAM533+L/SRvzjfZYKJFe2zs4IzIKdPRkGwHzGI8vLdBqmWHP+pz7wd
 7svgqmeXo10rWYM6s3PdE2sUYQ==
X-Google-Smtp-Source: ABdhPJxfvkOtpAtVlA4WoWPSHf48aGiRf3y51TDlCjt1Wf4BDlyuknkFk7E3OdmCdQkhwKxFf7BKNA==
X-Received: by 2002:a63:4e5f:: with SMTP id o31mr15143945pgl.55.1611818893892; 
 Wed, 27 Jan 2021 23:28:13 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:13 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 2/9] arm64: dts: mt8183: refine gamma compatible name
Date: Thu, 28 Jan 2021 15:27:55 +0800
Message-Id: <20210128072802.830971-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022817_126871_58241B09 
X-CRM114-Status: GOOD (  12.88  )
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

mt8183 gamma is different with mt8173
remove mt8173 compatible name for mt8183 gamma

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 6c84ccb709af6..9c0073cfad452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
 		};
 
 		gamma0: gamma@14011000 {
-			compatible = "mediatek,mt8183-disp-gamma",
-				     "mediatek,mt8173-disp-gamma";
+			compatible = "mediatek,mt8183-disp-gamma";
 			reg = <0 0x14011000 0 0x1000>;
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
