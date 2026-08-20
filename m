Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96F8C5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yw9jNsYyc4cRvafqBjufXAIHcED5B6eFEUJV+Hv3PVA=; b=Kxjy0J5FuMkPX8q7T2CcJeQnFU
	KsbBHNB6hhb+jSqGkl9U0qJ/QY/HPREMzMGJNmb4H4lPwUO6uOsq8u91sTg9nWDEjBmSQtCMfozD5
	1n4tYVItwaEtWw7vdD1R3nljlP5zw1DLWyXmlhcpTlmzuonL7YNGYAydmQKByjJzbdbGfMHnhok7e
	rakyrU+rB8fPaSauZ7Yx3//YJuq4ZnvPLa4HMQY8+5woctKbh12aQt/ZpMQGe3Y75SbFJqq71BPHE
	TcaNcTt+sI7mmHfqcw6yGDFdGFJRYA5NmJbtreqYwyqrr14VpGq2ewY5gJjvp97UIpyZuyNUzWRsx
	fya6FOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyZQ-0000000BCee-3Nxk;
	Thu, 20 Aug 2026 08:56:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyZO-0000000BCdk-2zo8
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 08:56:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1678895a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216178; x=1787820978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yw9jNsYyc4cRvafqBjufXAIHcED5B6eFEUJV+Hv3PVA=;
        b=f1gYCaL9qZlRBf97E1y0RbJgiTm4zXkHb0uMdhqoodfnyrB7/tVEvHD31J0pCMYgjv
         gW/E/6z2k30vAH4jw7s4+TcV2Jjo6rTjnU4PBdqWSA/bIoCCsXWcZRtIdiWbV7YZIJkR
         kRgY/yyLQoG030k9J7LFqc+wuFxI/5gF6PuQbpVNuNnCLIPyny8FqMwTOVQJ8XVJ7646
         XvtUck2HnjMLNwg5UdVup6N7lf7/aJhpwsMsHWz8qG3CVAAw+B8YYYZXsWXa1ryvqMx2
         mXx/1bLTMsqf/fM6mxFa2nAcpJn5Ywj0DIoGe/MSmpqKVXKb2XhH8wfp6qtEzU3khM6M
         h79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216178; x=1787820978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw9jNsYyc4cRvafqBjufXAIHcED5B6eFEUJV+Hv3PVA=;
        b=iDZUyVO1HhB5x8r4g3+wfNR/kn2V0fuUhwGwPNMJcp4cK1Y0LNJ1k0EyEHYH2sfs0P
         RtcgUmEc5OimUg8/9w+AqNG/jD0IjN74lq9cUOyZ+F4tosTXaEigsLeLdIz94XICU0EB
         fsfAxi0PQBVa/h+NLH6a2R3DKvhQIKCQXQJ2UCl34sku7IitAaHPGgiT6dn0tuFjdyvC
         mGCc5VeA0PhPDbVWVPvOmF6HHd/i/ZXKHd4X96HMOyC0zhd95nvHFOxLFA0ojK+FyP6a
         s9MMOYQt5pAvDPex5uWo/sSyymcXijs1LpXhwEd61zTU0lcCVIQ5U+nMX9nIQ0DJJrli
         V4xw==
X-Forwarded-Encrypted: i=1; AHgh+RqbEfZb+iwEVbWO9Lx88qt45mbzWQDCuQlZHbNq9ROaE2hWsQj7vQWAuIwak+EILcsnU7pcY4H6W0Al3arH/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kUR2qnblQl1yl0aaQmlWv57Zgptobxzgitv2qswNobC79+mCVF
	y29KePexjBV31Ds2zgqAVp+I+Qh/VEqskwIIJv3M+kUkT3r6VcjGqIk=
X-Gm-Gg: AR+sD11zvRvbbZAV2U6wSi/j4AlHNtl3Lu8XjAgEqw5AtEPnzRQZG8eeLvp+6V/YF/Q
	2HKZ3fv7xwXiV5Q2KxlZ1nwYgcwQbXp6uGeWfEnRXoEqjnzS1ShxHq+tHmFM7TAJ69i4noTLgYE
	Y9/rN6PVcBZzlp0nTbY4kBJPp2KllWFNBwb2w3kJ3xDmLkDdbd8zigw1hslZI4iMJFDbu+pNBTn
	G0L6ZXQY6L39IOsVygb/35xlY1Mb0EWqVM5LUciZuUbId5MMLVXAfgNL5P8I2g6NcJj8DlGyBI8
	pvJNg1zHsLeIWTRb9xXWOp1w1wFLfaV2NBRnZ9EKARLyw5KddgKpgIC6cQ0QIl7mh+ypOHf70KD
	TFYf0JZTyCKrtxvUO+r74Fz5UUHYeQyoZL4NcBaOVLBSv2eVWu0Xi8mpAntKT8DzOC8v5VquINt
	1qcIfUEATJj94qHqNfiihKlysP/n7PSo4/IoQc5N4EThhbcoK8qhfV3V59zFUXES98KoBylVR8Q
	g==
X-Received: by 2002:a17:90b:2d05:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39581470f03mr21556025a91.14.1787216177652;
        Thu, 20 Aug 2026 01:56:17 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf6849sm5701831a91.10.2026.08.20.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:56:17 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] drm/mediatek: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 15:56:09 +0700
Message-ID: <20260820085609.2103835-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_015618_774768_C923CC82 
X-CRM114-Status: GOOD (  10.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index ffe456238a2b..a2acb2d9742e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1412,7 +1412,7 @@ static const struct hdmi_codec_ops mtk_hdmi_v2_audio_codec_ops = {
 	.hook_plugged_cb = mtk_hdmi_v2_audio_hook_plugged_cb,
 };
 
-static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
+static int mtk_hdmi_v2_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -1421,14 +1421,14 @@ static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int mtk_hdmi_v2_resume(struct device *dev)
+static int mtk_hdmi_v2_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
 	return mtk_hdmi_v2_enable(hdmi);
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_v2_pm_ops, mtk_hdmi_v2_suspend, mtk_hdmi_v2_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_hdmi_v2_pm_ops, mtk_hdmi_v2_suspend, mtk_hdmi_v2_resume);
 
 static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
 	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
@@ -1511,7 +1511,7 @@ static struct platform_driver mtk_hdmi_v2_driver = {
 	.driver = {
 		.name = "mediatek-drm-hdmi-v2",
 		.of_match_table = mtk_drm_hdmi_v2_of_ids,
-		.pm = &mtk_hdmi_v2_pm_ops,
+		.pm = pm_sleep_ptr(&mtk_hdmi_v2_pm_ops),
 	},
 };
 module_platform_driver(mtk_hdmi_v2_driver);
-- 
2.53.0


