Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D110AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8796F64EED
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 08:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8796F64EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E0Rttr1hRvH7nGDBJEFUTUt9YiMbZgti4Wt/rJZ7CLw=; b=BurPLCFX4sUmOg1QQh/+31VJb
	zdbdhP/E1yAAqXFw0xGCD/IcRtPbKlUBe3vXYQjk0O97dC42/anJ50b0Th4ihKKXFr0pRM1ubiD8p
	3jg2GW0JU2FS9KYplh7OcoPbucX+P+dFr335Fpm3T/xB/3YnNYGs8jRVO/gwzlkvebm1L7P+g2Z45
	BfZ/hbL2yCm5b27Sqbsau7tHJpi4lUSPRoPX36GoGUcrgficQV7lzdnCUKtVdbz+M91+TXpZy/S74
	jjHvU/T4fr4mgiKlGmO4Pt7yYSxKiXqS7TOyEuMnIbXiRRmdU229SSV3LGwbYlmcKbuJzxNXkjDBf
	Lxbqxz/bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qoh-0000qh-Du; Tue, 02 Feb 2021 08:13:43 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qo9-0000Mg-5w
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 08:13:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id g15so14393360pgu.9
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kE2WPdhtm7LXIUh2wEzkDNY4SHQKg7ATXWyFrajYR8=;
 b=Eg6CDrl+RJ4MpFUiUiMgXmZASqgfKOIwbIa61fp78u2rBFEP9o/YcaOVulfsUPtPkM
 otE0nC+mp0q2r6ch9XyJOVJbr7jyyloXXJBiBtCZ/Zd6b3TymhvWMmRVrRLSLVP45mIi
 r4Aa0GvF1SzKkwWMlq/exS6IIzZNNxRDwtN3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kE2WPdhtm7LXIUh2wEzkDNY4SHQKg7ATXWyFrajYR8=;
 b=GTYjFCej6XQ2mxszfjjuyQoe/ZYgfnos+DzxdK4T3cm76iCiw6MusulZCVPAAgAFOl
 hpMkn/vs8Xtf/Kegy2w0Hp58DkGc+4rBRzUO4VmSeXJHeNPVcl8eNUXXRsfkZ2QUzzUB
 2FEkYV3UWninG5YgtsoARh5LU2wcy2aFGSW8HuZ1W/+K5amJZ2xMPVALNaIOvWnEMyZu
 fHDlvvYho5kPaQ2VyTO6nQZ0Og0OhiTWRYaSLd+KpBV5B6g0WPbCb3PiibqAIg7YuM9w
 L7kyurIIF8YRpsy7TIwCmpdw+SEJSypw81RGJvNQc8FHYnAbfvpVjTNVrWigBbZLIVNB
 SbAA==
X-Gm-Message-State: AOAM533DVhZecCTZYDRXXSHvyqbeF0B9l9PZhUFCwUxYs+HyyK6AaN6j
 CFWbyGMPnEU+j7fdY+QQezjRtw==
X-Google-Smtp-Source: ABdhPJxqKLT2Pn2GRfqixmny1yg2Ep3WCjWXRRx3Ovn5OhUAa7//XVPTABEqYbWDoYTs21yJe/rwrg==
X-Received: by 2002:a63:5952:: with SMTP id j18mr20940749pgm.29.1612253570226; 
 Tue, 02 Feb 2021 00:12:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:49 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 3/8] drm/mediatek: add component RDMA4
Date: Tue,  2 Feb 2021 16:12:32 +0800
Message-Id: <20210202081237.774442-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031309_392629_257649EF 
X-CRM114-Status: GOOD (  12.78  )
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

This patch add component RDMA4

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 0a84ae53eb72a..7f5614a6faab8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -526,6 +526,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
 	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,      4, &ddp_rdma },
 	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
