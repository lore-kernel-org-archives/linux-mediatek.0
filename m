Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC305C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:29:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E0564DD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E0564DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gkHOBOTNbqxKvkZneKtth/9hPz7p5RqqipWC9zYBL6k=; b=vPlWwa8VnZofn7nW2ZSEYaxxP
	jeVlJ0FcAmFhwd7IVbcJ2f690HFYgcOsyOPHZIm4RGw9b4+qjj9tl08tU5sSiG0SLkd7mn/g7a3w+
	pn2IQu5yT4fa99tmHxzXeM04IFWKAgtDYNfU/sxM3kNZL861fi+WwUfj2R0LNmLSBrAFYN4cGIJ6+
	tFZOWK/c3hXwF4pFtjojXSS/+0+A0oC/xvQCTPzeLxwa6+/a0NZqz1qtI5qVAU6KoaziLy/SapGJv
	u3NFV8SbTnFuFDChwOO28NvimhQvhHj67XfulrlnpFHjHlXu9qVJcAtRL6dCJZH3ZBV2vAHOkb0WU
	p66ZTzOvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51k6-0008Rn-Ve; Thu, 28 Jan 2021 07:29:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51jG-00081D-OU
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 07:28:36 +0000
Received: by mail-pg1-x52e.google.com with SMTP id o63so3702829pgo.6
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 23:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8I1aJ8cpNociv9e9sHpoap3upIqurwNPmFl1+Okcuk=;
 b=nB67nThPpi/ftnLq/NfW+HLtrOuG2C/6VsiSBml0OgKQZP3iUW2/4GCESLneFMUuLw
 dymw+tIJFYsibLKT9wqpWPobegSsJEg+N+ygFmQgPyPltt+rWQjhyi6o0YdgzRVO3J1I
 XV5rtaCn7qD27wMcVjo1MhmOXMwn5Lv0RdtpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8I1aJ8cpNociv9e9sHpoap3upIqurwNPmFl1+Okcuk=;
 b=p7BkvPTCB057ofZysKI5XuMoR40ugxV6XSeRWZSw/kzR4vMNLCcigIqQG7pAqfGgGF
 rr9A9qwX7kh10wAfq0WgXafpXwDRugDMSX2Z/NsgcQ5im8OSxHXlj0BB6+FDr/ddf5Jj
 Ke3+dm2vKzDHIo7JhT0fWP/bS4PuWAdcU5N12q8/bbE6gTcdKTXn1u5G7jNpPPK72rk1
 n53hujIn3motzx6czfH7hGcjl/l/A1NwSC+5zo2ib8wBGOMOexqGR61YMs7m0WrChreW
 3J3+AZqBNE/VkuATOMAA0lIUzAPieRrfKPJOgxcIKSeUlLhhyqVjNSSc1m5wdwlSYe2h
 kH7Q==
X-Gm-Message-State: AOAM531XH5GqypqDEjoziPZQFeIoDzo2m3jVfU8bsNA4Y8QsWZ5J/YCC
 5eAsTsUw6UxPWM2m/AEvHVsdKa6a8zcTcA==
X-Google-Smtp-Source: ABdhPJxm+laxnsIS7KT6hFiDBFIwnZY7aHh+Y6wUJyi1NMcnu38Iz0Z60wiRGLyQJ2RHT1fod7zFxg==
X-Received: by 2002:a63:da17:: with SMTP id c23mr15170315pgh.348.1611818912374; 
 Wed, 27 Jan 2021 23:28:32 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:31 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 8/9] soc: mediatek: add mtk mutex support for MT8183
Date: Thu, 28 Jan 2021 15:28:01 +0800
Message-Id: <20210128072802.830971-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022834_840021_80E69C31 
X-CRM114-Status: GOOD (  13.91  )
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

Add mtk mutex support for MT8183 SoC.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index f531b119da7a9..b348f962f82a4 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -14,6 +14,8 @@
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
+#define MT8183_DISP_MUTEX0_MOD0			0x30
+#define MT8183_DISP_MUTEX0_SOF0			0x2c
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -37,6 +39,18 @@
 #define MT8167_MUTEX_MOD_DISP_DITHER		15
 #define MT8167_MUTEX_MOD_DISP_UFOE		16
 
+#define MT8183_MUTEX_MOD_DISP_RDMA0		0
+#define MT8183_MUTEX_MOD_DISP_RDMA1		1
+#define MT8183_MUTEX_MOD_DISP_OVL0		9
+#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
+#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
+#define MT8183_MUTEX_MOD_DISP_WDMA0		12
+#define MT8183_MUTEX_MOD_DISP_COLOR0		13
+#define MT8183_MUTEX_MOD_DISP_CCORR0		14
+#define MT8183_MUTEX_MOD_DISP_AAL0		15
+#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
+#define MT8183_MUTEX_MOD_DISP_DITHER0		17
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -87,6 +101,11 @@
 #define MT2712_MUTEX_SOF_DSI3			6
 #define MT8167_MUTEX_SOF_DPI0			2
 #define MT8167_MUTEX_SOF_DPI1			3
+#define MT8183_MUTEX_SOF_DSI0			1
+#define MT8183_MUTEX_SOF_DPI0			2
+
+#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
+#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 
 struct mtk_mutex {
 	int id;
@@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
+static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
+	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
+};
+
 static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
 };
 
+/* Add EOF setting so overlay hardware can receive frame done irq */
+static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8183_mutex_driver_data = {
+	.mutex_mod = mt8183_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
+	.no_clk = true,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8167_mutex_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-mutex",
 	  .data = &mt8173_mutex_driver_data},
+	{ .compatible = "mediatek,mt8183-disp-mutex",
+	  .data = &mt8183_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
