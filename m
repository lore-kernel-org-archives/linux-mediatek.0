Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28184C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 18:19:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7536320BED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 18:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U60eDGGK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XaJ/M1ab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7536320BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jV5977Y7hAGUR8A5yKBPtHhkjcimP7a4h8pccL9hcEw=; b=U60eDGGK+udTp5ZL/KhPn4+DY
	blQv/tL6pq20qGAncT4jkYy7HjsRejErMjGV8D88j8QSWYNyxA7Wh0d6rIEZ8zftPD8l3WgKj1YV3
	rySmvVVhkdq8W7GoExNYesxOcNlG8oRMhLICEcADTaa0RhQVAu8D2obfX+42qEyXDorUvNaHCimQa
	ah0XwaV+qGbrwkKiVeI7JTlamjwvDVOpWJIJ3ktUrAF6jj9efqKotjmh47fTIqDkNybhF33DdhN8R
	ZiWc9UXCkPUHDju12UOrlg9ubzjZRWpYG9UdjyutAuI4IKBDj40BQyiKQ5PUTq/q635Z4mxx2XuG2
	R+4MFU5jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSOtg-00007f-JY; Tue, 13 Oct 2020 18:19:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSOte-00006Y-7R
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 18:19:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id e17so403723wru.12
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtmadPtoPcokiIT8ReATg1pXkhzL2SuRBo5LddIMSVk=;
 b=XaJ/M1ab0sb3wmangM5YA2nqcNI4cEEK4J6J89RdjZa7KK4sbY6rvX6VV/uDqCY7eO
 BprKBVKFXAG30XVHwS7YwvDUaWfw0dXOKYgetZjYxpT/n+Ia5D7O55KZihuxApT5Pyki
 sbzNbcI3uvDJ1ZBR/KYTICZUnQS/SlRcHS2ZEM/N2HSx665DzSjuHKS7vc8cWnrAYct8
 SbiI2gfLvKdP5sLgqQkcgjoxbuFtBm2XSjhdOeuz/kSJa1/HQIiF84fRT+s+N35dz+dn
 Bl/jOSnjWmGuofs/y0yw1TpV3mHyL/6vgt+zExdqElnlh3fGLf8nFLMl9Vf6SuTYbn3h
 SIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtmadPtoPcokiIT8ReATg1pXkhzL2SuRBo5LddIMSVk=;
 b=HsbsXiWqBUJh7NlKWf/pwcZAr735tJQUliJXnwhCFUx9r+s5qwVi0ZRi/MHvTvghLQ
 3Yx39lwwjdx44M17mNlswBLWflos80bad/mazB4vZP90F+T4MGx09C/tLg800lTCB/Tn
 MQ2cP1gy7AkazIybuuf+uAZMuKe0hsoPD7aLQXfPrV+GjytjDactCSccaWzExS2NVrYB
 NB5w96q3iYAzJATbPvCcCq2mLLZK5btVsgX1o7CgevrNGMcwngR2j8y1cEnhILndNiuA
 s8K48Qv9QpzpUB9YqeEVLMfxstrj9CVYQZlpo3qK9+rHoQABeubs/vn8uhPj63jovhPj
 dEBw==
X-Gm-Message-State: AOAM5339DdmBfzyTkYjC0/Y8NqMuz7J544MuavJGpB4+IDvP6sqOek/K
 NqIdTZqnT83SckeE28dqadL1Ng==
X-Google-Smtp-Source: ABdhPJyYKFgxPBtvreY/bLMuxhTn3K88Do7E39RQO4MJweOu72cwzI7cuyOtwYsoYixEPS6WFk3dGg==
X-Received: by 2002:adf:8541:: with SMTP id 59mr1042100wrh.61.1602613177428;
 Tue, 13 Oct 2020 11:19:37 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id w11sm490261wrs.26.2020.10.13.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 11:19:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
Date: Tue, 13 Oct 2020 20:19:24 +0200
Message-Id: <20201013181924.4143303-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013181924.4143303-1-fparent@baylibre.com>
References: <20201013181924.4143303-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_141938_329125_566F3CF8 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for HDMI on MT8167. HDMI on MT8167 is similar to
MT8173/MT2701 execpt for the two registers: SYS_CFG1C and SYS_CFG20

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Changelog:
v2: fix name of pdata structure

 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 57370c036497..484ea9cd654a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
 	.sys_cfg20 = HDMI_SYS_CFG20,
 };
 
+static struct mtk_hdmi_data mt8167_hdmi_driver_data = {
+	.sys_cfg1c = MT8167_HDMI_SYS_CFG1C,
+	.sys_cfg20 = MT8167_HDMI_SYS_CFG20,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-hdmi",
 	  .data = &mt8173_hdmi_driver_data },
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mt8167_hdmi_driver_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..a0f9c367d7aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -195,6 +195,7 @@
 #define GEN_RGB				(0 << 7)
 
 #define HDMI_SYS_CFG1C		0x000
+#define MT8167_HDMI_SYS_CFG1C	0x800
 #define HDMI_ON				BIT(0)
 #define HDMI_RST			BIT(1)
 #define ANLG_ON				BIT(2)
@@ -211,6 +212,7 @@
 #define HTPLG_PIN_SEL_OFF		BIT(30)
 #define AES_EFUSE_ENABLE		BIT(31)
 #define HDMI_SYS_CFG20		0x004
+#define MT8167_HDMI_SYS_CFG20	0x804
 #define DEEP_COLOR_MODE_MASK		(3 << 1)
 #define COLOR_8BIT_MODE			(0 << 1)
 #define COLOR_10BIT_MODE		(1 << 1)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
