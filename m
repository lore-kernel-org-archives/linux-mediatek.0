Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C3EC35254
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC65D20674
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWPjcF9X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="t6ozdDcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC65D20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+c9i2QW8HCm0aUUIgva/ROK8vxG0vTaOQE0QSavK5w=; b=IWPjcF9XnodnpD
	/E6pCaxm6PMG+C6LMcYDmapI+dT6NLGmjkt/+3SeL1vP/rDoKJHwzDtfAkaKRTYFXbV5vxYOuU4xC
	S8HyhkPY/EqFW4UHCHN21wokosmZzH/PFkwN3m0QqA3F/+9N4QIsuL+eEgN87Yte6sJOFW9eKg2tW
	Y7crRTvTZmkGPMcbFghQpOuTgpP6s+1q/xHjo7y6SC/tsE2l5bp+dzQhAdlP4UQZUQbsrBzwUWNwu
	hFqFUm6JTu9XRjxKu9CB6CW5qCOoh/lj/HIkbv42ZObZn+1xsg5ph7jW0tccCvtzkM8M94jchWgNa
	7odOERwcNRu55fm8mIPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izXgM-0003un-O2; Thu, 06 Feb 2020 03:18:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izXgH-0003nU-4J
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 03:18:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id x16so2423819pjq.7
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 19:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=t6ozdDcWXnqlycYXVvxHhOWC41qF8dQhtkxMgc3cj9ys3LWT7swok1SnhBVAqh4iIK
 8NGSfV4wb+JIYUnOBtkwGiKW7JzQK9Fbhjvr2h71WZluUnlT9W0Bgr8EhRAlKqKxDztE
 0d9+GSbN9KCNqXWGRSEM/FSn/rRn+D8W6XEcFtH27mvwDZUFKXCYgdT3hVS5EWHVu/gw
 PF+v4DFja2f+vDZtTesIeq+13RktcT/86fnEUJd6gxFj9jDTQ/A4tu/vpr5NXiqjgmwY
 sKlio/9K9cB+vXBOcyXXIYz+P3CWg0IwHwRwAVQ5UJU7ydufexjk2HoQyc1cdNCiCFN7
 DDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=dR6O9ucXXRPme3hVRVlbvCXUr4k3r7lInIyTI3qZBJtVZJwZp/HWyOOhY3YLHbMbk0
 shyFRf9vBsJSTDmZJvVSMtwrXKiLzWDtFqxKZg6tm/6qAhY7ce6zjnohWe9Xz57xyZeF
 DqfQlncUyWysdhJHfjNWo6QgCJKZGSAU6hy74uaovLbmTby+lXbKURAGW2kvegmHbjLm
 8ZqQrrtVaXx1MERnSY/jsgR24cTba2IwdSH4agyZ5GvioEI9FX4QKbDYhepEQEkr33o9
 Ntdkl9spX7Zdakc/6bnxE0G/EjP6pXtXpuVuIBRVqbqz/9WFhMLWQnE2BHs5Iwq7DgbE
 ijyQ==
X-Gm-Message-State: APjAAAV7xWbSPWk9cRCWCjdNvVriGPUCsqag806+20q3GGM+taWsV3ze
 90mATy7DaSsCy1UaXlo0UBvARpZcySu5
X-Google-Smtp-Source: APXvYqwvYH4hqfpVMgHnlTJXAR9wXcKrV1aylz6TVB7wVNgSuffWm5cIKjVzB2ZMIRRMPL4bBaqkFWGwqZ2Y
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr1290924pgk.196.1580959095995; 
 Wed, 05 Feb 2020 19:18:15 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:50 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 1/3] drm/mediatek: exit earlier if failed to register audio
 driver
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_191817_214010_B4C70EA7 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Exits earlier if register_audio_driver() returns errors.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c79b1f855d89..23c2b0e8693d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.get_eld = mtk_hdmi_audio_get_eld,
 };
 
-static void mtk_hdmi_register_audio_driver(struct device *dev)
+static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
@@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
 					     PLATFORM_DEVID_AUTO, &codec_data,
 					     sizeof(codec_data));
 	if (IS_ERR(pdev))
-		return;
+		return PTR_ERR(pdev);
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
+	return 0;
 }
 
 static int mtk_drm_hdmi_probe(struct platform_device *pdev)
@@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mtk_hdmi_register_audio_driver(dev);
+	ret = mtk_hdmi_register_audio_driver(dev);
+	if (ret) {
+		dev_err(dev, "Failed to register audio driver: %d\n", ret);
+		return ret;
+	}
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
