Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40107C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFE964D99
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCFE964D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7rdcAPdvAPtgyI7lzytQx1d3vkzA+OxIX0XDKX0fAlU=; b=Ervnsv9pKsYMguih+oypL6ZgM
	Rxcz02fCNn7b6y4gbjYEe8Yqk+4Rn0eK/crZ138sM5exDyD7OT7knPiOQn5lsC84mWMAxsFYToudK
	j6qAVO1ilOrm2w9WgGw+U0JeytXSC9dwq2/t+LFy8B1HPaWrVJ3SUmvlr7AJQdw5EBrJBRxIFuhks
	gh4zbj/xvyw/aOtc8ffgnkMrylZHpa4H/xt8Qct1bBUyhEHxDrnFBrKnB9aKUg6f6thabpCcoutSx
	e39XcBhupEUyium5o4YmJ1kDThKecMqLMpp9j6+df+vGHsZnqTguZiP+SHvVMXhuh2vgCXx2KRXzR
	68HSM9/0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Pzp-0005bX-N1; Fri, 29 Jan 2021 09:23:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pz6-0005He-JI
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id f63so5844392pfa.13
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAxvV7R4/vTpyFlTAS6Pj5shqaEt+L+HnuJKV7F1rVo=;
 b=Ror+4QerXQjaE2vsEtt/+J6Osk5wHvps9k7IL561MxxrR0M8AlpNXUTXL7GSZcEmIa
 sGXI1Pk8qyQWP2g3mUunqAmPL2czr29hlfaAkss9eMjS2WmmhBLBicT3gcjqEfOH7qFD
 P37bkpKSfyXEaMLWmGCnk/e0dElc79D15tfe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAxvV7R4/vTpyFlTAS6Pj5shqaEt+L+HnuJKV7F1rVo=;
 b=ebY6+JdVnMnnwAGw5HWODsoXv4KNnPnSOv1gF1Pk5yViJcvVwxPPwvVehc59n0TMTi
 tWD5DFBRc7/1kS3dOixt8GuHfs+qQ3RrNZj3nSpEh7juoKG3R8w8FbvGUSsf9et7GG+d
 jIYSbO8uoHuXxAWjeYiZB1Lfrpo/rggY501Jax6j9d/0pY6rx26DK+lh5NAYN2VKP3Za
 fuY3MJn1WgAk4v9TwxK2ATFlbBLqR63VtdFKikpTaElhdDhzUffQPIb5S7SpQPPS33HH
 MVwO54z6aVh/wTKXMq8o/ZueIjFiLVyO/qYRE/LBaWB9t1dYmSRnnnprHu70+qgmRhVN
 RDnA==
X-Gm-Message-State: AOAM531W2nz5bsPyviCZB+q+UmoUMAlYCU4EouSa1rOaP8buI+ciKieV
 a+PVlN6uGo+dkJkmsYMSbPo9kA==
X-Google-Smtp-Source: ABdhPJy4+2S1A2x1ndwikJR7JIysE1W0izSM4nTbR8FztfNfzjanB9rfmcVpcKhsDDrm7mJ2NRd+CA==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr3869976pgc.185.1611912150169; 
 Fri, 29 Jan 2021 01:22:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 6/8] drm/mediatek: enable dither function
Date: Fri, 29 Jan 2021 17:22:07 +0800
Message-Id: <20210129092209.2584718-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042232_957221_E872AAAB 
X-CRM114-Status: GOOD (  13.25  )
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

Enable dither function to improve the display quality for dither
supported bpc 4, 6, 8. For not supported bpc, use relay mode.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..5761dd15eedf2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -314,9 +315,17 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	bool valid_bpc = (bpc == 4 || bpc == 6 || bpc == 8);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
+	if (valid_bpc)
+		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
+				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
+				      cmdq_pkt);
+	else
+		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
+			      priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
