Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA67C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4A420759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jy2yNOvJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7C4kgCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E4A420759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xV8pd74Vy0rDaAW5N8420D49vejWVFp5GJMJRIeFxkw=; b=Jy2yNOvJPLTh7FcHKzzDthaye
	s/JYxsqUALwKyhGNMC1Ui3NrPyzdmgJ+S/YETq12JeqgSo7kGhG2lVUwBeKeRhsJea3NWP2GHvL81
	Tho0d8djlaX2AetRYD7wHywtj5T7XqmOY543WLKcB7ux9I7fLOJifPsvAUeFrXPvO8P7pLWy9gM9j
	r2ut/Yu/69QS+tbI2akrZ4O50C35JduU3uynjtLytvH8H4Y8mdsFq1n/b9WVubR93Cq/+nleo8Jil
	SEfG+b8j7H0Bk0F3vY9w2xWmro0Y6u0irIJ9gzGQqMHpXTAIF3aHtynfJTbv3LFrh/RacSA6VpFgu
	XB5MuU7MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9kc-0006gb-C7; Tue, 30 Jun 2020 06:28:14 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9ka-0006eS-DZ
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 06:28:13 +0000
Received: by mail-pl1-x642.google.com with SMTP id j4so8072682plk.3
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vnusw8KVqmLccr+Bdv13JEwKXnPkBiMBiOXb/M8oVMY=;
 b=M7C4kgCjEpA50jHKkWe85wOubmGWK8xwuqsTPKt+wHoE27ZCA1qckzlDHJCq6NmChV
 KvWaoJiBVO6rhLrZB3uImVw8sLEznZpDoVqfqGNaBJOJAdDs9ar2ahNJ9OQ4Biu0mBG+
 tYRqQeUuhqnHrVQCowSF6tPkhBpUrdmQIfI3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vnusw8KVqmLccr+Bdv13JEwKXnPkBiMBiOXb/M8oVMY=;
 b=Rz7kkslH5FMyAxyPI58YYZNsaY4vZedyzH4450m51XJdq92RCknZYGRfXJLNSBYdoV
 e0DzOkDphhEMFqfKZRQZ6aaTGOvaUyXkvSup4apu0i6LzYolpDluKSOtkJnHsLfWgIzN
 fcZtNBefepWXvHOBYiL5IE95tJiz8RB6B1qhmHKR6xCzFCmkrC6VWa+SUrdnhl/dKFLd
 MOSFK7rtxLboe2b+56YzpmaTQGQLM0sAaVL6BT2I1BbBMMr5WNnzqGnr99lS9kFwumHj
 ae6+Q+BfSgPJAgZrqnWzcOdE6Tk/RzE211XmuVGe8sK/3BgZt421h9PfwNZ8Uu4JPTvG
 57Fw==
X-Gm-Message-State: AOAM530Oy25joIIlcgOaA5gr0dnSj9bzluJGqOBVjfHp9v9TTBsM+jUD
 z2F5Gs+S7uprP4fKWV4879fizQ==
X-Google-Smtp-Source: ABdhPJw8i9JTTps6ZptKXBHaxLspml/Eo/P9js2FIrue/Tbn2dxpRndQnCqSmtPZXoqxK5wFrl9TUg==
X-Received: by 2002:a17:90a:70c6:: with SMTP id
 a6mr19142972pjm.16.1593498490609; 
 Mon, 29 Jun 2020 23:28:10 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:28:09 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 8/9] media: mtk-vcodec: enable MT8183 decoder
Date: Tue, 30 Jun 2020 15:27:10 +0900
Message-Id: <20200630062711.4169601-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e723f8573322..e7d90973e626 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -381,12 +381,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_vdec_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_vdec_8183_pdata,
+	},
 	{},
 };
 
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
