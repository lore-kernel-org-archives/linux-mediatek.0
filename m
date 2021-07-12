Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E26C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA841610CA
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA841610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYB1mZhWGAkV6Te1rnd+v0pX1n67ilJiMHmNnuh3iWQ=; b=oB8Xwv7tmIRsLt
	h77VH8+nn25ZXR01NYqtsYzeH9gXilVGGO8AymM/gmbcA/74k/ivklKW+sDSk3PV1wBBcFUgIQaIZ
	M4RdPURzSevtpeiQImNPx90c01oR//JvzxQt73e0AVsGl4NfTT2lZD3fERKjK40kbRD32tUgKDBpn
	pWrQRiA4IzFDAFqThmYvJSt94QvR/AAvH0I9RtDA914Xc/6kz8FuAAmgol+4zxnGxcLG20es/mXfw
	Mjn5ab46m4zBhruw7xjnqRAMcL9tZGop7MfvOCwB1FDzIhuVSq37fo1SUJyVRmQaF2KgbSrtKHges
	1GkrQ78tUS4X+Nu1fYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2sWo-006meG-3S; Mon, 12 Jul 2021 09:47:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2sWm-006mdO-BC
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 09:47:05 +0000
Received: by mail-pg1-x52b.google.com with SMTP id a2so17654760pgi.6
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ka9MgwmW5QsHbE3oC7CaA6AD1jb4S5a4fPDgxsbWrLU=;
 b=WHVTpBseJgLMnGqaa+1RqcoNPqyIUkmougt9lWoVSXdb1vDOPYvj9eqascjIEXhUfU
 qC8HnRP3UKSYTTDn1FHNirspfOX/GrqUkMSGuMwPyC7KDJ2ek5pBGzf+qFGiT3Idzqba
 i7rp4XxeTPaLwnY1OxOE89C796t1Nwq7aSat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ka9MgwmW5QsHbE3oC7CaA6AD1jb4S5a4fPDgxsbWrLU=;
 b=pE9H0kvNVCCIAHGG4ljnzhXQxmiqpR5u+mm9Sttce3a3V4DHYrse7M1oOtiJb3kA2O
 BaM9iwzcZMvXJEA1/kkPOnwvKK+dsdNmD0LmjCQAYRD+XDkmUb37cm7m1yqDyA252Ajm
 EB6VV/XxNfWQ6WaWt7UQiEq0QL+SD0JLLZ3L0iEQedAdCyZW2WDyubbG//x30+xn3ieH
 bxFR0uIZ23Ij+7IO/86JE8M3WOdxlz38vMYFKt3wWBczlOXcMyR70LwpOtHN+QUzQLIC
 VXU/taRPtL6kZnDrzBkDvzbNBdVSHQ2ni7EerZPeqpCoUlNmRDflEhmQ+XxdAQpWpO6u
 T4oA==
X-Gm-Message-State: AOAM532liiAIk4C931P23Of+Y3CzaWIWjAeNl/iGGYhtjJQoR5i16Bki
 gGiyr5RJT915yMRIKtmBMX/89Q==
X-Google-Smtp-Source: ABdhPJzu+zuvDdKs4oR5z4/fiaSC07w3RNE3ZQ7jClgmYHqoH/5VyU8uRrV+hg7Lxiz2yMeqaJj2+g==
X-Received: by 2002:a05:6a00:98b:b029:32a:d9a5:2540 with SMTP id
 u11-20020a056a00098bb029032ad9a52540mr8333872pfg.66.1626083222436; 
 Mon, 12 Jul 2021 02:47:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6e22:4686:299f:5f2a])
 by smtp.gmail.com with ESMTPSA id 10sm14631650pjc.41.2021.07.12.02.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 02:47:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk-dpi: Set out_fmt from config if not the
 last bridge
Date: Mon, 12 Jul 2021 17:46:57 +0800
Message-Id: <20210712094657.1159299-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_024704_444991_CB08B950 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

atomic_get_output_bus_fmts() is only called when the bridge is the last
element in the bridge chain.

If mtk-dpi is not the last bridge, the format of output_bus_cfg is
MEDIA_BUS_FMT_FIXED, and mtk_dpi_dual_edge() will fail to write correct
value to regs.

Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bced555648b01..25c565f9179cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -610,6 +610,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 
 	out_bus_format = bridge_state->output_bus_cfg.format;
 
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		if (dpi->conf->num_output_fmts)
+			out_bus_format = dpi->conf->output_fmts[0];
+
 	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
 		bridge_state->input_bus_cfg.format,
 		bridge_state->output_bus_cfg.format);
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
