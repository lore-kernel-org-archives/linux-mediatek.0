Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BB2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC19064DD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC19064DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IsIuGmBszqq4gYo6wxx7ZkE0JNlAOaY5/qUSdGIPca4=; b=kmoyLlQZgXQwhfB9FGxJHNxN6
	nJwUUcLZsa0N1hwMM5V/HDT8oAcWV1SwdJbtoIR4BAZiOhDL7+qtYrSS62xAqLmeQq8nhmTKicIH3
	6SLTcmzpIjCRm+ozT550K8SScr4TYo2/GItbw4D1KLSqm6HvSyVpiX4Hn6u8CZjSeTInT9d6fA/nP
	UzRiMTvFX7gVNWcqdnKhM0ouP9igv3M+Z0yegEuR+90nV4vsldFeVeBUlqUSU3ZvnFdxlX/EYsxlz
	rQ2jctMw5dpCxhMipjDuKnDiBdn9ifOrxVdQgJmSIha5aQ9/+2ijs2ouc4419xeimbMtAWnhWoaLq
	Ykm4CpfWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51iy-0007uW-9m; Thu, 28 Jan 2021 07:28:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51iv-0007tN-1x
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 07:28:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id u67so3446614pfb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 23:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmjtKFjHTUarfxu+lL0d5qeXmAGAmFw4kcflRE2ZaXY=;
 b=Xua3jaeLyCCPJCGJLfkHkxfybJeVWUizz2w2xBSkuQnee72sJVZE4ASVxjhP0vkCYH
 ye2OxAqlbzK0eRt8/ni2MlpC6d81kSM3dmMAMAUmCU1ZNn9Bqoq6HpCHhbxCl5mz97yh
 ttQgUcWyT2i2Mxci/UXhuIZTuIRLvw5k2GjhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmjtKFjHTUarfxu+lL0d5qeXmAGAmFw4kcflRE2ZaXY=;
 b=NoffDYBtqbawF+EyXCeaX6P+5SwTSZjswVJ5rdwf6qMxiwDyVyO02NuzopEyn53pgP
 uYcHxU8n1HNuH0nqcpFudml2yAGZGp5o5xxa9shFafZSeatD0cTVSyx5/AOPrFDKr0Rq
 6gLZMoZycpspCG1hCDYU8eW1JAWoLsw7B5Die7rMxchUhwz7vQM739myZQv7tUD8VFyK
 Jyt2S1j3tQK9z5MxN+ZmcGal/qjeLOKGcVuHgtBdlIaXUQP+g2TTQ1u1f947HgT0bYNU
 sxtISIeiwl7E9qyDk8tpOtROMetusrwZJwJgnDb8Q9NnYifA5v1iXSHs4IbLubNXqADM
 uy9Q==
X-Gm-Message-State: AOAM530JOccJ0Km4puvxRzSa5K7+eC6tsfg5RlK9po/SWsTkAQWRE/Vc
 lOk9BE2Qbg4+m9cs9KzH9aRuBQ==
X-Google-Smtp-Source: ABdhPJxYLTPTJNXaGu3SVuKP0/pvukQsNt4lBcOztA0/IW/pLYDcOFpjH1DuyKNgFAXe28AJrWhQlg==
X-Received: by 2002:a63:5407:: with SMTP id i7mr15309840pgb.418.1611818890750; 
 Wed, 27 Jan 2021 23:28:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:10 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 1/9] arm64: dts: mt8183: rename rdma fifo size
Date: Thu, 28 Jan 2021 15:27:54 +0800
Message-Id: <20210128072802.830971-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022813_175674_FE137818 
X-CRM114-Status: GOOD (  12.36  )
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

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
