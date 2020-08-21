Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5C1C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F27E20748
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="06VQHQ9F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PxPIs3H4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F27E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hg03A5T4AYvo50T2UJetNKBib5vPA1Q0/5Kl+D7t5aw=; b=06VQHQ9FaIOddClTd55FScQWG
	71NSGoLoDnUAxWxp6EYepJyKBBt0gfYWGKJHHIVmNy0hfnicIZGiyzn+JAr59lz7E1tnYV6JhM1kI
	26cnf5x/+iNVyIH71ttfJg5sKMblSBJCs2i7Ol56pKTj1S6ruJ2Sy1ZD6zKIDmu9l4REWAKITLykA
	GPK8zfmQ9ejVsAwiBQ9ofaZkqpef0QEjEbZ8bT3w9JGgy+jGaIagfl/IZx47G386xy7IPpy2VUq9O
	8cPnTeWkLbr1JyVTm6dT1977ezyNrUafXWHHOzlKCumLz28Bwjiu+dlT/p5dskTBJHJwCyqJzqE0j
	Gv7/8AAVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Q3-0002Kk-ML; Fri, 21 Aug 2020 10:37:11 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Q0-0002HG-2z
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:08 +0000
Received: by mail-pj1-x1042.google.com with SMTP id d4so638983pjx.5
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDm/JAIM+WvFDRN3OyDY9BUKgF4PZ8nDeNpq4X68CVg=;
 b=PxPIs3H4BhTvFe8AFlmCxkrcECDo8gUsWKwdS8+LdDdjaku27RyUsQOE0Fo24PZhWF
 EZCOaOmgLOYvWYgHnf23S7DO4fMM/nDIlHvUJlGg8zKiXn8phn8TmxlgPbAkctZJhexp
 DapBRyOZqJaxfeEve/ew8PhTTz+oGlqeNHYno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDm/JAIM+WvFDRN3OyDY9BUKgF4PZ8nDeNpq4X68CVg=;
 b=BXvLCBokXNazg6SD4DRTAO3RZwNxXbw51s39IcF74I4aa4dR2MSBBZIQ1Rxt+jN63c
 EPcdzQQ7KhZUpRGqvDuTKwYX6A59Ddkxn1nlqmaz5jljTkeOC2ZFFuVWLTZJeMiWJkWv
 rQRZOBRqEKdSUTIVwBRtoAE0aoWOYVXDm84K5pQw+spm/FrtKFTtZ/qd4AslySrp4Lkq
 tpwi4nAVe78RLXrAQ+T82R8z4NHOhPGhgZQHnapWFjzBWgz6a+MBZrnUjec2YxRHe9Yg
 A6OBq/aG2K/Ly5tbYEzhrEj8irwpG86iDDDO28LyOW5NFKzRg6P1RBMZ8l9ookLiVak9
 LsOA==
X-Gm-Message-State: AOAM533CR1kHpwkKHW2xsfEng2qDHe0N1UcsiJLd2G4wFL6Fu3lQ3VQf
 LndEKr8LkoVOB8UOzSJcBUdSVg==
X-Google-Smtp-Source: ABdhPJzTjJvKF5N6fAdWgQQ7/mCca5C+hWBLaTZ8T3X36z0fCFC+4POQ9XFYBQQZVeEt0qff6gwWxw==
X-Received: by 2002:a17:90a:fa06:: with SMTP id
 cm6mr2030998pjb.129.1598006226419; 
 Fri, 21 Aug 2020 03:37:06 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:05 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 10/17] media: mtk-vcodec: add support for MT8183 encoder
Date: Fri, 21 Aug 2020 19:36:01 +0900
Message-Id: <20200821103608.2310097-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063708_205882_411D7EAD 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable encoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index ba4045d64212..3dd010cba23e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
 
 enum mtk_chip {
 	MTK_MT8173,
+	MTK_MT8183,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 569698f63515..d6438cb4eead 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -62,6 +62,14 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
 	},
 };
 
+static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
+	{
+		.fourcc = V4L2_PIX_FMT_H264,
+		.type = MTK_FMT_ENC,
+		.num_planes = 1,
+	},
+};
+
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
 {
@@ -430,8 +438,22 @@ static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.max_bitrate = 4000000,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.chip = MTK_MT8183,
+	.has_lt_irq = false,
+	.uses_ext = true,
+	.capture_formats = mtk_video_formats_capture_mt8183,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
+	/* MT8183 supports the same output formats as MT8173 */
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 40000000,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
+	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
