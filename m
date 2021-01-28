Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6AAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF3B64DDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF3B64DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lKAbPBZDZiNgCFh5YCHCqh0OdHgrXSDbE3ysbSU3qLE=; b=q9uXu56mZswm9166obRadOeEz
	jfgOBU8NIwwppM2ByyYeDMQqweQsIpDZWQFTZg84/t2mJhDi1aBYN8KwgdAVbz/xr9plBplNSzjRL
	abm9pEI8vVijb8brNbRM33FazEXE2BJH5xWehHAQKrFQYf8yuAptCAvFD+c5tOUq39pGw/UX8wYNY
	55XBJL6KF477vNsveApsjR6DjNJbSbIvxBWDayp6okr4yD96Ijf2P9yYFe+F9Wrp2EBAjaScscB3E
	QbsqKv1+iO6thzJBYq1O/wA1Vewr+yaJiX5p0Xu80EJXkweq4OKDCRnaijZhI8qiSJnJTJJQinnIE
	MVrpjlbaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55Oe-0000Um-K6; Thu, 28 Jan 2021 11:23:32 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55OW-0000RO-Gn
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id s23so2816770pgh.11
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eu89qGTwFP4V4tI5Jw2nlSDAYSqs2MPYZr62DflexSA=;
 b=SgW66yAVGV8jb7+r6die2alQTgr8PtesUGVhZcPTecXyX/E5hBS2Ng19+xBk3s3wRF
 YEGIZI4ON2g5fItWvAfYicr70oPSzyyijhgAWNJN+Pw7f/gLrWeSdXxM7f6Os6dkNEOJ
 j/IbwTnZPELR78RUVDitb8Xtgm/bpCMvzteK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eu89qGTwFP4V4tI5Jw2nlSDAYSqs2MPYZr62DflexSA=;
 b=fVN8Iiw9M8Gv4p2xwQVpP/hwI6FLizuX9x25TZT7i8+QffZiMmOm7FDspZ++p/rmff
 Dv+e49c/i4NOjVqVSTmyMqz8431PjUwGLpTsGcCk+8We1TbzFPDtpwBmgQPzbR+4TxxN
 JvXxizZNwF+cWHCk/dvDgiPiVkxjeC9MFEQ8bO0Fq/+IQDnDmy5GEoJ3M2Sg52C6wJk6
 eTseCuWbgiKpWA/Ne/ULp5pO3a8FvajJtacHhIzW0qnktKcSKNaAuC+0aihIRcBmP/XY
 04bWs1ruT76Si+lXnnvHnN0hlmlPbKvBgOTXTcT1atIwfIsnou/zMWPfdnaYAjg+ALIZ
 B5WQ==
X-Gm-Message-State: AOAM530hH+VpTxgZ5bmvLkOirHBFdDmapYEfDgLA4rfg44rwpLBbfFGS
 34UDnY5zFPPNmrNH2xnz1d5a0A==
X-Google-Smtp-Source: ABdhPJwKmdmcbE9OPMHzqr5LpAToRYhlpvlfYvavs0v6LyeSvK5TicG1LDmjwxq+HPL1qIux1oN53g==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id
 x2-20020aa793a20000b02901bf23a3a945mr15462516pff.70.1611833002370; 
 Thu, 28 Jan 2021 03:23:22 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:21 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 1/8] arm64: dts: mt8183: rename rdma fifo size
Date: Thu, 28 Jan 2021 19:23:07 +0800
Message-Id: <20210128112314.1304160-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062324_601850_3C036C65 
X-CRM114-Status: GOOD (  12.42  )
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

property name must include only lowercase and '-'

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7e..6c84ccb709af6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <5120>;
+			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
@@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <2048>;
+			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
