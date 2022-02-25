Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F625C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 03:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h1d/nfTcndioGU9tForC3YyycIkSnYuZvwqgmhyRm60=; b=IckryZU9UCNyrZ
	5vfMl7e10i585oj/p331FAsZy8q38S9/96iTOAv60zfqX6XZ7i6bG/cCHsJ/5K2GiZd+bsoBDvqrZ
	Mt8bfr0RgRHLsxksdAa+UUGt+rovqteBfzVAkeknfGng/ViW9wUyS9u+cXSLgyqshphd0dvUKto4q
	5jo357mzoim8aRkcACvchVoKCeQ46fcohHV2uEopnoPLQn1+NEaDEV+zlQelnemicTd4SvTJ+iKaj
	H+g9kQ9Uu2FQwzUfex68pL24gmnxW2B5z+h6Z2q5no3j5hrNGzsoWLa9Hcnx2WnYN82ISD5gkFuYA
	8Ix6PKdRNj1wwEyk96bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNRHD-0036Cx-6v; Fri, 25 Feb 2022 03:28:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNRH1-0036A8-DW
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 03:28:04 +0000
Received: by mail-pg1-x52f.google.com with SMTP id c1so3455055pgk.11
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 19:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZMKM13WOXr0Cj+JFI693E2RT8tiGsgNHY8tIWC/7wA=;
 b=NlEBER48+BAv+pYpPTx0rfeKZ1GwncJgF+xLdGTwRe3mDhFs5KsTN6WYQcXYUt6VPG
 wuhKmKVgs7OG3yHA6LjqWJRNXaplIMBeQWsy/oPEeF4+zBTqs9sltsPPY9QPCKZOXXON
 661cGzrUtj/uEV0VytoAeEu/9v/3lQcw4b/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZMKM13WOXr0Cj+JFI693E2RT8tiGsgNHY8tIWC/7wA=;
 b=cPuoAP+ExYJJqftG6Q9HErjqw9DTueohYl8j1zTjjl61KwifEfxz2TqgKtTjqJkEsY
 HLOo7Ls8+kLbvMMlAXl6ihTmeZcOLQt7UAS6hqHUKbQ7zVOuhK0Imp/5GGsgS+7b9+fr
 oNl4Zt5r6g3CzvzfBljLa019B26OMKk9F19J+dUq2g9tNzEn50U3+tFpYRKLqyV6DGTP
 h3OikviUK2GvT4SyLumUPwpMANOF21bGHYgdJMcoYWMSjCFYftZT6rKhxkzOXOKENL7k
 nP2K3bn/ITAZlgAtCUQdf5osi4uHmwJ/UW2mKyfBgpX3IG3i+FYYp3F2Ew+5qjY2d5zZ
 6b/w==
X-Gm-Message-State: AOAM5327rJAUcTU8E0j1MtE7HYxHkOCitqpdKaASRY9hOg5eqlf/jxqJ
 V4rxDtuPq0BH/k3Yw8UsPW/mUA==
X-Google-Smtp-Source: ABdhPJx+kHFiPrkhdZm5XLElk/g3benE49UUovXBtXArAuVbE2sKuAaWSgZHosRUd7JHRRrHV4UmWw==
X-Received: by 2002:a65:6c0d:0:b0:364:ae2e:9708 with SMTP id
 y13-20020a656c0d000000b00364ae2e9708mr4611904pgu.189.1645759679598; 
 Thu, 24 Feb 2022 19:27:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:d786:892f:a6fa:6f0c])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a056a00150500b004be09fd6ad6sm905097pfu.191.2022.02.24.19.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:27:59 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Fix DPI component detection for MT8192
Date: Fri, 25 Feb 2022 11:27:54 +0800
Message-Id: <20220225032754.140168-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_192803_481675_35B8A0BF 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When support for MT8192 was added, the DPI device was not added to the
list of components to look for. This causes the secondary display
pipeline to not be able to fully bind, and the DRM driver subsequently
defers probing.

Add the DPI device compatible to list of DPI components to fix this.

Fixes: 01365f549c88 ("drm/mediatek: Add support for Mediatek SoC MT8192")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b147797177c6..47ba18cbc5c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -511,6 +511,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8192-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
-- 
2.35.1.574.g5d30c73bfb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
