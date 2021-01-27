Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642BBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5437205CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5437205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9WNS0rk2eVVJL6W9jo+iQf93ErW3UfiRjcTfX8l7+eU=; b=scnfC+W7pDWyhDkBs7hqEBFBI
	9tlpVvRfktjCkSkc4kRrGn404SgF8Dnm1pZjasnGweWTTDOYql447pd5fvjsuvus5f0P73R3PHcu8
	q8OJpN0VNypVsTCzVG3BkHsC3XTktQJjAP9tfWZlzV7787wgETwoTtsaUu8rVRw9734JRQvcK+qGK
	dpds+4NGA01mquATWLdhGUIIs+j6/EQsGrAROJG7Ezgyd6G1KPSOFTQNAIPw5T3oFqYIFsxMFLQmX
	msIshxl3ooA1YGNr3sOVAvLGwH9TEEPSMe/3oJ5amqSRJqLkgmB6nA9nshkduauClC20wbBQ4tjF5
	zoBcBprIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4cqy-0003hA-Ed; Wed, 27 Jan 2021 04:54:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4cqm-0003c7-H0
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 04:54:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id b8so352453plh.12
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 20:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=c63/2D4Bgx2Pjk09crfuNIuRwe5/wMbu0Ar0zyQsmCvjMtnTas7y/GZBYlWxRjh3Cu
 Nb1V3mC3i2fY9O+EVE8ljfGG/yIlqdt7A80tCikJGekU3DA6bwVdJV2EpvcTM4Bl2Ejs
 w1Y6GR1JZE4dTINAqovV9VIiAh/wsO0SgoYf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcNzJ3Y1xaPDuXcAllHAfyiKBSKXPgrFbgqPU858HRE=;
 b=CyZLRpSHc/0m4uhBRS6OzoI27tKceMfuOf13SYHQ04yU8huFauomsUAT6gZX1thbgB
 msEUMqa/doQMQd2wb0hLSmH9PP0XGXWpbJ5GYr+fwPOsoj7CHMjcZvi8LM+tpOpqbRhr
 agrDMW/etMawIP0rcqXUM2iIdQ/0S22tGQ2OgvmRaHTbIBA8TocqmKkzSb2OG+VmBBh+
 oiyXKpPat/53KShT2g82fFzGsPXYux2hn/D5sVTx9OJ2+cXp2uCQJZZFolhp7+paF4dz
 M8WBsjq4CxR7YoNWDyL41f6M/3CDay9E0SvU/cARjHG1Kqs4Ck8234p8FUISEfJFmcV+
 RBdA==
X-Gm-Message-State: AOAM531WRM4iLFVsDVibkQTuO8p+v+3+8e6VNgAcHZnP/SC91CPsjK2M
 h6iktAv9whUi3kRFXRRubzulAA==
X-Google-Smtp-Source: ABdhPJyCyyCu7ohSjPbSyt1lJg9XiT+gg2+ohCN2CtKu56w6RhygO1w9flQc9+fGYUeBaJfTm6dUew==
X-Received: by 2002:a17:902:7148:b029:df:f45d:41c9 with SMTP id
 u8-20020a1709027148b02900dff45d41c9mr9676516plm.3.1611723277218; 
 Tue, 26 Jan 2021 20:54:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 2/9] arm64: dts: mt8183: refine gamma compatible name
Date: Wed, 27 Jan 2021 12:54:15 +0800
Message-Id: <20210127045422.2418917-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_235440_600484_E71E086F 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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
