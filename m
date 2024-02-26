Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B59C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kBcIHteoHnr9Cz5N/WAN5bt6cpSYHYQ7aU0W3fZEze8=; b=ZjoawtN0m96j7Y
	5Rl8F1SlWc/7ezLGpSp8YydqWBxXFV+18g4vy9YSfCoxn3Dk+Rs5FSrOSsh71TUL5tYFV6XrUCMl6
	mHSH1nY9Zb6fH2SiQkk3Z4Xgrg85JNP/QCwnLZe6G0gjgCX6Xp3wBzA4uM5McPEEtG4JQp4GAGHp4
	geIYamIyW07K7qRWRSpoa6XHXPhPYlT/q0F6Q2Z/nqzyK0w79XBOyy+qMEMuYjGPMcgS3q2wr/39L
	cNYN9n2XBMFZ+Vojvi01AGQXS0xW9eh1l7VUegrtxMzxjfd+NsR9qnFDkfEAnogERMOypO06Hu50Z
	jF2H+vsPNRZmyAeqOk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reW1S-0000000GvOV-2ug5;
	Mon, 26 Feb 2024 08:07:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reW1O-0000000GvKa-09Vl
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 08:07:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dc0e5b223eso22250395ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708934849; x=1709539649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBcIHteoHnr9Cz5N/WAN5bt6cpSYHYQ7aU0W3fZEze8=;
        b=kcn2WZ+P/zcpU4yZxSMAYgxoSw47680gll7Xog7bLPvDt+1ePeGUHSGBJdFd9pBCxd
         uiy3quW9Q+i1qaVpUsLELvvcZPuwXSqpqO3R0AmwkLTdW1mh8WXTE+kKTwDieruVo2aJ
         2fHu7N5WnYHJlKU4EjZw0+4eOuYFRJaXLyMew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708934849; x=1709539649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBcIHteoHnr9Cz5N/WAN5bt6cpSYHYQ7aU0W3fZEze8=;
        b=PecxE5UpW7Ss+vcSPbEwXwApYXlzg7CkzncQxLpLyghel0gx6UWDjiuuVjPrGUwfsA
         ad2tPjBmpdzsZTh0tIrEge8KIACmFjoXcTahumw2Ml9FM9Sm1mp9024IHuKBtSLQTasv
         7ruShi3d/ywRLFlh7OVCpX+j5EzHDfncsLAznY7OWrgXCOh6esSRrjCJp6bLxs0HRutj
         npi2DwCo8OkJbWoW2EDE1pvvmtwv90kOYSBMLNSUHf5oHmSfjfX5BCIUNUTT+uJ4iZ8E
         S9ltCLnxLyIqyYMlfwYrMfO1h8NX8OnbJR6bCNo2SU+nCoeduKftGxsJ02PCsvIEybir
         wPZA==
X-Forwarded-Encrypted: i=1; AJvYcCVfuPmw6tzuTFOnfxm/R+G5AIkdWJN54iUJHHCQ2+YiowSg5c1cYaJdSFFFXwz+Pqxu6c1eB1X5IhX9f86Rwf1Kqje61bpY25OGDNgjzsqDDHdI
X-Gm-Message-State: AOJu0Yx9WTekjK+ndC2opK9FXjCmzOExHM75olIDFkRdciJS2AoYEYiY
	RD8vjArjWHtEgxID8YB0KuAmgKj629dTAVpchOWVWokkTxBq3oAzNcohBnLg5w==
X-Google-Smtp-Source: AGHT+IExiQnb+rRMNDHWEdTGrSJHafd60Czmd6wFeh8GaiNgF/iSjktfRAWY7nO1Q8GFmSikhhho1g==
X-Received: by 2002:a17:903:548:b0:1db:bd6b:d1fb with SMTP id jo8-20020a170903054800b001dbbd6bd1fbmr5145701plb.63.1708934849429;
        Mon, 26 Feb 2024 00:07:29 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e3f5:67aa:a8f3:8179])
        by smtp.gmail.com with ESMTPSA id le6-20020a170902fb0600b001dc95cded74sm1953660plb.233.2024.02.26.00.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 00:07:29 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: Support MT8195 OVL compatible in mtk_drm_drv
Date: Mon, 26 Feb 2024 16:06:47 +0800
Message-ID: <20240226080721.3331649-1-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_000734_135269_C798E77F 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Specify the component type for mediatek,mt8195-disp-ovl in the MediaTek
DRM driver on top of commit 76cdcb87d391 ("drm/mediatek: Add MT8195 ovl
driver support").

With this, the compatible can function as an independent fallback for
other display overlays without relying on MT8192.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 14a1e0157cc4..703caba48420 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -739,6 +739,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8192-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8195-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
-- 
2.44.0.rc0.258.g7320e95886-goog


