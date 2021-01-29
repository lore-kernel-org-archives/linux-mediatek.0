Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6603DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B0364D99
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B0364D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8RiXB6yEpRydSYc8fr2ZceF5BVqZMMyHtL0P2wfBeI0=; b=d0X+34Gchk8M7a1y7JTVV9Nfe
	M+EYpmvEvlJAMvhTqP0cp6A60ZIkGL7bPLfESZ8+vAk0yh7BqKN/FQJF5ITDtHL7jtHU2ehc9NC+T
	EKuuPVc7WimYkUUla/fhoes7aQ+mNUS1ruptiQv7iyqzrNCQrf7Cm/eXdXemqvfqEn8tOc0TQFxhS
	OEDCsAuaVtQcY5SNIcethbBQTp9BYXJRvzr3i429C0PIdADu0b7sOkhXiGext7iIYN5aqNVINXbFE
	ZF/qSkzPf4lxshkjrqq3GdRx9OksYwlQZxMGiw0UbMr83wRLmje+xjFB8p8BY2beql/c3DG9QaMXc
	9Geot1ttQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Pzo-0005b6-1c; Fri, 29 Jan 2021 09:23:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pz3-0005GV-Vw
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id w14so5871958pfi.2
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYKPllHMWXaaXlZ0ycUuc3ILhWc2RI4QmKMXgurARyo=;
 b=jTpgJguT5rc+REw7O6/K0qTwwZVrCE3PjR2qrmceptZeRXHQf1ptuB+EwicOkJQ4jK
 FgMyX0Mjyls5nNcEB64aVPGaHcrKlpd9WFrkafvUu+5fW5f22C2/DRbf/VLQUhZj5LEy
 FxwZD7f+FDj1tRkN+JcM5nGYAtrOxAwiNRm1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYKPllHMWXaaXlZ0ycUuc3ILhWc2RI4QmKMXgurARyo=;
 b=SE9pPmF57doagVVAuosFkSH6NTT8LDnaDn+sXGNnQNwsR5yVE9ZeF9MKPVbVWba7D1
 mw2w5eCQeJ5U2nJSEE8JggS8Kj5ngLqQCrDxMkJMHmf9M1hn+CwHalEg7DnOYJXqHjBn
 8nAfqYwOAXBwBNNFEmWNWamX78Trz+Zqm4KfkFg/i2+RtVgOFuNRY5WEVT7t+CUUkYtf
 7A0Q00+56ybLqPqVYUy99L/KYlOEWwVoIN2gOisLfeyxrO+PI4oK8MTSJITdOTadQoC/
 iisog/Ue3Y9SvOl6rwEzs2vYAJGyQebENkD1p/uLG8c9P/jmBPnI2SjHkz9Rlog7if5q
 zmUA==
X-Gm-Message-State: AOAM533OApQ16e0sMOL64zPrjkkL322bwekjJUQG3dRViBCWzYNGjDCe
 h6c8iz67UR645z0QAC3ASN8ADQ==
X-Google-Smtp-Source: ABdhPJxXiQyYhzjtAjJjlkwydXVP8/KnjoC5ZcXO4RzEoPq3EErvu/qghbd9CDZ++s6D3E3HYFTf+A==
X-Received: by 2002:a62:1a06:0:b029:1bc:21e:ed47 with SMTP id
 a6-20020a621a060000b02901bc021eed47mr3628536pfa.40.1611912147633; 
 Fri, 29 Jan 2021 01:22:27 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:27 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 5/8] drm/mediatek: add has_dither private data for gamma
Date: Fri, 29 Jan 2021 17:22:06 +0800
Message-Id: <20210129092209.2584718-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042230_106589_8D570759 
X-CRM114-Status: GOOD (  12.43  )
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

Not all SoC has dither function in gamma module.
Add private data to control this function setting.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6b520807921e3..5092a27ccc28b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -27,7 +27,7 @@
 #define LUT_10BIT_MASK				0x03ff
 
 struct mtk_disp_gamma_data {
-	u32 reserved;
+	bool has_dither;
 };
 
 /**
@@ -93,8 +93,9 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
 		      DISP_GAMMA_SIZE);
-	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG,
-			      GAMMA_DITHERING, cmdq_pkt);
+	if (gamma->data && gamma->data->has_dither)
+		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc,
+				      DISP_GAMMA_CFG, GAMMA_DITHERING, cmdq_pkt);
 }
 
 void mtk_gamma_start(struct device *dev)
@@ -174,8 +175,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
+	.has_dither = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{ .compatible = "mediatek,mt8173-disp-gamma",
+	  .data = &mt8173_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
