Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38BAC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD3A64E03
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD3A64E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GvPBgJJ4UTkYUbBTzkCJcxhu7tCU3mGwIrS+Nwgxszs=; b=IN3vfk+fF+gJOVzEf2lcAc3R5
	7RQ/2ovBrxYirggi2UXb3y1RDvo4lvuzTdWdvwErcv2qT76RfD0c4SnmxWartlMC7HaGtsMgAUM0f
	6FkiLceR+ceSOCQsJBUfzSmHXW/cK7WHX7Sd5zb1Sl1Zx+4kcVck5FotUGdNHSQMb8V5XeS3GWXJM
	LOzD75WjObKqFaDBNtgvIvh7FgFdU+tdRFjLbbkkY8ZpuT0n99dSV42WFFfwYLqGwKF5ydOSH7QWg
	jevndE84P8tK0AkzK90qURG3VlJlygB6+cFYTNXVkqc7W/G5GcfkKojFtWzRj+SnPvx9cBCfb0Gpw
	7B6Beyvzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OJR-0002cl-GY; Fri, 29 Jan 2021 07:35:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OIv-0002QY-Jz
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 07:34:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id w14so5704646pfi.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 23:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jv+2JS9/1bK95pcHO0im9CAvoGtup1mDnivR04MejrA=;
 b=Wy5bJ3qFy8UxMKk04MxCVxkLzslgVcgIeUbeQqPPmUzi9N0uI/soGqP0zn1SWneXZp
 +FxeEOPdJgn6o8wRppIJC1X/QPu7VCWr2uMkRcm6IVX8GGQcJSEuuYI2nHYoSc25b5wu
 ARK5VW6qltB3qy1xNer6u33+8erAECyJOl40E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jv+2JS9/1bK95pcHO0im9CAvoGtup1mDnivR04MejrA=;
 b=O/WEPrgziEpzyEUHeZ3l0kQU/yxQvkIrV6Qv/3gl/EGbKfPoAPCqfL+/zEKfDEMJWO
 N1SFlXRCjQx55+AYYWH+/TFGqUwqJJy6mxqz6ool9xjc4VbkepjXle8WkCW4FS6dOUQO
 E5w5uRteF9LAnWqy0hXZh7vvsGfAE8RfiJH4xt+P7ULUczOgJQEFu5eqKPpdjuT8jnvv
 9WeApBA0HRvwCDfDv2+7gngoqN/SgEtm2TVBMnrxPkUZ5KnBU6nTo1gku2yvISbKLA5F
 mO5ZYAVxAbmuVXWRl1jdJGmVtCpabza9C61p/OujsDlIK6mfpfBJLjCD2hyRs6tGpvl/
 XDcA==
X-Gm-Message-State: AOAM533Q6B1UATunELIc9ppK6Kj3tgPDFxokx5CyZqa3+Tx2SZFtp5Ge
 qixf/027179Qn4YkPQXo09CvSQ==
X-Google-Smtp-Source: ABdhPJwf69hCMciq2Y+DX8eJKfTvpms85Hit7oril+FLzlt6OiRN8iWLPAuxIiAP5jzf6DYCWVnVGA==
X-Received: by 2002:a65:498e:: with SMTP id r14mr3481282pgs.235.1611905691669; 
 Thu, 28 Jan 2021 23:34:51 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:51 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
Date: Fri, 29 Jan 2021 15:34:32 +0800
Message-Id: <20210129073436.2429834-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_023454_857883_2C682F24 
X-CRM114-Status: GOOD (  12.25  )
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

enable OVL_LAYER_SMI_ID_EN for multi-layer usecase, without this patch,
ovl will hang up when more than 1 layer enabled.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index da7e38a28759b..961f87f8d4d15 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -24,6 +24,7 @@
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
+#define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
@@ -62,6 +63,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool smi_id_en;
 };
 
 /**
@@ -134,6 +136,13 @@ void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
+	if (ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg | OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
 	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
 
@@ -142,6 +151,14 @@ void mtk_ovl_stop(struct device *dev)
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
+	if (ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg & ~OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
+
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
