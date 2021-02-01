Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C3EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0497D64E9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0497D64E9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rt37AzXd2qnAIMEzojbzJUzKnXu033uMiRPHk9cDoMU=; b=YDeQQor+pmjQARSRhsE4391kJ
	UAo3Xry5ECCw1muuRd+X/WUOMHXCYEzQwH/eqbmsb8o6tUxBbKm4Po5YDBLekZ+U6yzSCp06dY62v
	IIACyidLodChfmNYfSkKtzIc2sPGu+NiZ1V5Vv4DQFlnDQGcnT06lLv4b2UwETOtSranGjqQEesiX
	WbhhdQ6mex1cdAnZ221JAgowo69Q4Jr4J9ovazjCKEu0caUQOkiOY3TeAsiJD9ItyvOl5qikp09m+
	bn1J9ns/DD91tNPTt9AkFBMEmsiB2QAXsp//yGRO4f8pReezTZ7rIK5BzJKU7zCc7w4xZwcU/p9k2
	lobKOi0ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Wam-0001oM-WE; Mon, 01 Feb 2021 10:38:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WaU-0001eB-Kq
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:37:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id q20so11295910pfu.8
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcC3toP6YBtCOgAxsdOHDHDQFB7sOehX2qicMsRRIyg=;
 b=NQWiLn9gqkxfhpJXhPNjH/PYK+Yr9dAPInm3WI34IERnw7bYbgIXtem1FdYDkW8wli
 64K+me37ilsz+RAdLo8ROqmhYolD78CcOhqqyCEuyDv3LO74AjJYWKhulVbPsQ+XOIu2
 0iOQ+0k+PpG79+HPSEUkeOPLejpZRw+LL1QOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcC3toP6YBtCOgAxsdOHDHDQFB7sOehX2qicMsRRIyg=;
 b=TMdFvwVus4LC0v2/xQa57fBgurp05/OKOOh2qsZG6YXZdTMipTlEFQCxyBNm3uTTMh
 TSyw7G4HDsV04jHk3brhfY2lLI7IZcWlu7CW18ua0WC6dAtPLOvQsWrDpCuP0z0b+axg
 9VBVE6zWRWKbATt5POukjrAHVQA5d/d6JtvmmclwfTizyxdAbWeuXKBkBv4A/Bw/+7Av
 Zc1yAyHBUlpaYted1eafuGafEZf9p2ztI+r3piOlrWX1kwyLezYYvAUjD6bBZ3YIVdok
 6lIM1KdJQmSSsOBTnIDBZQ12rfhdAJfn9p0qML3O9zDmKdNxeGElQCmMfyoZ+Efope4B
 0UbQ==
X-Gm-Message-State: AOAM533fwyOSdDsKk3zYx0O4u67zl8vD5wm7brG8xXCirrlKk04aj+Oi
 0MZquEFhr9KUmqRJ5mjhcFQNdQ==
X-Google-Smtp-Source: ABdhPJyUJ0L9tWtBFh4v728vZPdOlcLKa6aRR4/JhTB0dvIReHwHwY4rPdSJH0Uc5AnHITGs61Vddw==
X-Received: by 2002:a63:1c08:: with SMTP id c8mr16542759pgc.228.1612175860174; 
 Mon, 01 Feb 2021 02:37:40 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 3/8] drm/mediatek: add component RDMA4
Date: Mon,  1 Feb 2021 18:37:22 +0800
Message-Id: <20210201103727.376721-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_053743_023121_F80CE176 
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

This patch add component RDMA4

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 7a6efc849694b..d884807809635 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -494,6 +494,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
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
