Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBC9C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3E5613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3E5613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HONwjQ/UJqmtBQehNdvIyiXehv3+qXX3/dX2MhwOuSw=; b=XrowkjJREDeQfY
	hZFv7SUiBEmDecZH59OGTgVq9hRKw9uwlBqLpDSn7gsD/F3zrwc2lVIs8NxYNOvW/I/5wvtgE0zfa
	PhGFCSRghxXF8pe1qEj8WWBNrsKo0BdNdfy+xwWOxFjs+VGDi56kXyWlji1t/AoBhUiXASgfSQO1b
	kC7macOgHmj10laX9GO4Dy9oUxAqlG0oD+pdM71cBq0+0aUMM8RE6ueYAS3v2ceuL1A0MaiS6G4DH
	ziVLK1zK0fZRpefQitC7yBEbpl6YSma96Z6oHUFYGnZfFeqDMNWuuuXgk/3E5U0jqebV3AWKE2EEa
	PnX817y2BSgfGxyEkkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HF6-007qpm-4A; Mon, 05 Jul 2021 05:34:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HF3-007qme-Sm
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:34:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v7so17273299pgl.2
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Wsby3LClrEo2/xvJaYmxPCAce43LH7aBkEp9Egxfy4=;
 b=ciOeWZgPMFrOVTP7nqd3vh4BK2H/kDoECH0M4NTEkvLjqklwcEvMZ6pOyuiZv+QQ6h
 lDrBMGCeKRXaGAWDSu0UEiP0bU0dHHUbj1LyFXD8974EHU34QZf923FQPLIIHzmY+Flg
 kSfePNmu2lWtckpm/B5Wfe4iQykGWcWzyPyRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Wsby3LClrEo2/xvJaYmxPCAce43LH7aBkEp9Egxfy4=;
 b=FXzrQbP3mke7Mx9+JLa3X5zguq4PDoSN4mztGye3EHuB6+70VNEhoBoN9f5FnTO6fH
 wl9601Cq8ulgrDjlZnEj7E7qakDb6oNOoysBY+sp5r1H8/XhRQZnIwdrLayR72PQhRH/
 ni976f485Ea4lrv/hKpJND3NVhVwiCvPPHiPrUP6GV14kNuZEVSAAmhsJBfniIKwGnOX
 RM8UrCi6xwvl6IrGuLnjBNreD/saUOPeI/qcqU0+3+DV6MGSvAyRyeFp5OOgh68l5niw
 gVPg0R+2tsGv3H1bCQE4Tb2C0s9fcsCwqU1Ojs85xeVeqJ+IZx/6SJ1Zu8EsUtz3Q+Cb
 Z2Ag==
X-Gm-Message-State: AOAM533na3IGsYUBat7KMhMQwwfDv4JAD2Ahptg27ED4r8AI8N7i/zsm
 YPc6kia/orPq4CfdFNt2ybEEuA==
X-Google-Smtp-Source: ABdhPJzP2yjoBz66yyuwQKfBYNR+vQPbMTqUfKLq82KBIzHKMAhnU++++X2fY97oynm7v9ff5u19nQ==
X-Received: by 2002:a63:fb11:: with SMTP id o17mr13787214pgh.177.1625463240848; 
 Sun, 04 Jul 2021 22:34:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:34:00 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 14/14] media: mtk-vcodec: enable MT8183 decoder
Date: Mon,  5 Jul 2021 14:32:58 +0900
Message-Id: <20210705053258.1614177-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223401_937430_30442636 
X-CRM114-Status: GOOD (  11.37  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index c8a84fa11e4a..55ae198dbcf9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -374,12 +374,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
