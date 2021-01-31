Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE57BC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 05:11:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E5464DCC
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 05:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E5464DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=80TWOx84QTsWb4cGcgLqUZf26sGZYW60Qo4SOi456Yg=; b=LbCqfxMCrH5nPWbWJWxqwwMkX2
	99KjELvF+4WzeFdgb8gHKYlOsL9OXCtCUSBqD/2rce8sBPuVmjYM23FHzKeGeQT/at0IIsR9Ll2CY
	F1uV/LeqKjHBvJm4KqXA2fhw06mJNTlJY1xTRfuMIW7/uhobqpKrfrpNuimgTCt+ebgp80Uy/iKZH
	WQ+xgIuB5k7yM8XQCGoLjshCpiH1emy2OogJubsQtPkk2XrPG6Utt/AGoUNGQoKCY4H7LWcpf3xqF
	GKl0Ckv9J2g0otCMPbHPcIh2C0eD4NbvMcNjmlMZfSkeRKHvE/72apVJEpmcD/M4pKteLqSlk0ljT
	zJ5WbiZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l650y-0004Xa-W1; Sun, 31 Jan 2021 05:11:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l650w-0004WZ-WE
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 05:11:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e9so8113302plh.3
 for <linux-mediatek@lists.infradead.org>; Sat, 30 Jan 2021 21:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j678qJx/JPZkac4bEG/8rI07bilrUpTVTBhhwHGCLyE=;
 b=HVch7Qv7dq+iRZl0F7OTOFc01KRsOkitFn7szOaZ9AduniQxvk4XBoFLuthP8Kv6+0
 Plhwxk/rCbQwhF4rXRcgnKJqGrjCIonm0eYQsveQ2gVikK3JsdbZbzJnH6djhj1w6gIn
 +KOVbeHocLUgCb2ZDLZ7kmf5WqLdirwI4T2OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j678qJx/JPZkac4bEG/8rI07bilrUpTVTBhhwHGCLyE=;
 b=GafmhpipDApk63EEMjy34gARr1C70ph6hGceYqvuaEM32YQiXqqdxmlSxJ4w0mV1RS
 vaZul6+er6FCpZAyrNolImqZvUfHbU9zS8dA0v+XT47VMh8lVBlzQWe+iqnMMhLdA+nl
 tglSE7Ww/iPgEE69s3leLLs+rQFszjyLv3JLwe/bRIjIX028e/9nkVDxPHDaUiO9WO9M
 PHqfSutEy2v2zhE5ISmVZjzqmp/hBB5XUp6smxcpqtSB3Lr9r51C9mY6Lk2yEOtrSEBS
 o8cXam2xx9jBp1HgSVRAtO9ct+8BB67ErRNvpARzq2uViLoGShC3b44tDxQuv1SbNpTj
 jtcQ==
X-Gm-Message-State: AOAM533Zplx1JDNmR3pAK8hXCGy+UWPEEKRPLm6LWkR1fovp7QFzgvfl
 Tl+Rb1ioikLJILIm68TGxeQE6Q==
X-Google-Smtp-Source: ABdhPJw5rGGPEQ8dqERgZpeHNpM1Tn38J69RC4BmBr0NM6uPyiS94+8Vq5WTIlas3qzw4/OIei1tzw==
X-Received: by 2002:a17:90b:60c:: with SMTP id
 gb12mr11373176pjb.125.1612069865252; 
 Sat, 30 Jan 2021 21:11:05 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:35ef:a870:bb74:2590])
 by smtp.gmail.com with ESMTPSA id d22sm11470680pjv.11.2021.01.30.21.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:11:04 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: enable dither function
Date: Sun, 31 Jan 2021 13:10:58 +0800
Message-Id: <20210131051058.3407985-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_001111_103199_F0E8F0E2 
X-CRM114-Status: GOOD (  12.71  )
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

Enable dither function to improve the display quality.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Previous version:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210129092209.2584718-7-hsinyi@chromium.org/
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c730029ac8fc7..0444b429daf00 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -315,8 +316,12 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
