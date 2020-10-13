Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D9C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:29:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA4F25359
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 17:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTGNepbA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D0TVrEyk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA4F25359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqbLG8c+ZJfgYmIVyKWuq/+MfL20s1LZVN5igmPsjvg=; b=YTGNepbASqM4+zKbOW0HXt0lM
	DvzzgAeT9u80FoL+t/1UOre1fi5oRSVIIMMaKSEDgWgN8V3kdcMk5vyxihtawN/ZsYD9z9JR1RLZR
	zGYHIcoWHcwuCC0ZdDhXQG/PFDlv/QvGklGFQ0LW5ker66ac6eK5v8hj5aZxy7JdyfnqQzTlYL9Hf
	rsX2WPDUvudlVraHTmhGxv52rBlxEsrL3grE8HIHVIqnfGxFYSG7HsKuLJG/OS70e/sjEtcDd7m5S
	ymRlsJhQC3BOfZKwlihaZU5SijDU8rw502/NtDi1FrPht4IqTg9AZGj5MpeKApI+vTWqLHUnlzNxQ
	iXJxReSQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSO6V-0003Qz-N8; Tue, 13 Oct 2020 17:28:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSO6L-0003NC-VL
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 17:28:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id e17so198657wru.12
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlvyC7xO8X+UHJiYhKqKJwROYowmoGRyG38cye9lek4=;
 b=D0TVrEykWlhUm/bhD8ZKE0gqYKXdhzaQPwZnWz2KAvB+bJoSW4qWFnIWLlwPD8HqCV
 07pjsS3ciagYi1TM74PzjqWI/LHA8n4Vmq2SVyVa3BLpXuDL+71kspidJi2ih8Qk1Nnx
 vV5/69FEsmRN85s9O9nXCt/zXoXMfuQYZHQDRYM2h1kdc8BVhudtr40OxORl1pVWBHdo
 Jz8N/i+sFqoHRircz4tWcKo4vXBbCZcpxY3+0byc28QSDoxEqtzXWJaA2Do1uYYWNGks
 6rkMAECv++08P5bTNC6qU3aVYzM2+NnF2RC2mWfhlX1oFGVsit5GA6/PTwhZRBfMi+Jg
 EFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlvyC7xO8X+UHJiYhKqKJwROYowmoGRyG38cye9lek4=;
 b=RuDmgJw9yKB0PTxSeyRqmB9Cr7k+9yRcW5XWm8YSxlJrW1IrCNvXfOtVJmW5sWxlTo
 FXltzNIgaO9acd9lnUsIDg+iMyEtj6uTvBAdMGi7UcXaNh7azkQR0zZAnc4v614kypKj
 nTah5A5h56fyxrESHp9meykVXW88kLk8h4fqrIU4mf7ReJE+SbO8ovqIqzKkN2MwgXwv
 52JrIUwAm/z+wsuWJ7h3F5Xs1pfzuJHJJZHLHaQNttrCkj0ahaC7S77oTUOzYeeRBPTB
 jFbkLIqFbTJs1KEdFZqSnUdBzAKsOlDGoCb9Qtk0HrnEIQzf2tdPACDfj3j8gvUaY35h
 MePQ==
X-Gm-Message-State: AOAM531y/groxCZNYwsgW/AltqxjYcIvWupcG7sBMfDTMuy/eU2Rt1aF
 UVTK8xlsZ4+ttRgu9xYVmFGQHg==
X-Google-Smtp-Source: ABdhPJyqabbY0J2ewYDvY5SXI4bIKi5qYlD68/sg3m435CHU1JYk/TdfVENPchAt/0NsWUmXwDj2Xg==
X-Received: by 2002:adf:80e4:: with SMTP id 91mr795643wrl.223.1602610120882;
 Tue, 13 Oct 2020 10:28:40 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id c14sm315131wrv.12.2020.10.13.10.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:28:40 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
Date: Tue, 13 Oct 2020 19:28:32 +0200
Message-Id: <20201013172832.4055545-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013172832.4055545-1-fparent@baylibre.com>
References: <20201013172832.4055545-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_132842_076109_394A1D37 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c70f195c21be..7762be5cb446 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
 	.sys_cfg20 = HDMI_SYS_CFG20,
 };
 
+static struct mtk_hdmi_conf mt8167_hdmi_driver_data = {
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
