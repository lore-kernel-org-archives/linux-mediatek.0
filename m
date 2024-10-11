Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C3CD0EE27
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m894EEj8MKVIaKel5D8cwxspY83xIoj8l4L9T9MgTMM=; b=O/GV5QtdNcZuXS4YinlBugKjQ0
	9jMH4pw0zQvy0+nzUIVQ8/W97NvtF3lQW/giIvBzzmICRt52XnoIQf5FI4eK32tpcUURM92UQrDiN
	FIh219f/wBzZcddx5Ig6hIJ1tF200zbLeVWh8INRQVP7PehZnVtaNyflUVfSORwBWmWF8z7wECjhf
	Buqfb1fd2yDhtDsdOctaI9aO+gNPeSXQ4Jlos4l7fNyOiZDf3UiH3Pf+TuP9W/E9kHOZK3h2B9u7C
	CuZu7AW1vq9Wmp5hPlWjUWwOl3wil/HptVsWPV5jk/qPl6ly8ht5v/KIe5BU5iox6oWAb6G3fx+75
	nDzTs4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLGC-0000000HPLI-10H4;
	Fri, 11 Oct 2024 19:25:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLDX-0000000HOyp-1CTC;
	Fri, 11 Oct 2024 19:22:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1336093f8f.0;
        Fri, 11 Oct 2024 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728674546; x=1729279346; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m894EEj8MKVIaKel5D8cwxspY83xIoj8l4L9T9MgTMM=;
        b=ZR0kuXVmtMA/FHT2od7m4wdGwvd0NJNbRF9gO/CU1fXYFoORVfkElFLSWJSQNiAG0T
         xeDNmQVBb3BLy7A0/15IojIsK5KprzjF3uDj1UCVQSvoSlg6gn7wLQRVXSl+FMQXEOP1
         CvpOjsbxw8Y0FpvW0QPb6gJSbbnaHAmR6M5a90jH+DKlpKwvSuJt//xxFtvL3Y2hqe2W
         3rw6usDT4dzbVR4GxLxhbVyCQukfhUNXTE7VkimWFtfAAyUD0i65Yd/2hG+YraLw9e1J
         TWmiUCSx68QrHu6YhDMzyL7EwP6W2CpCvX6IYoAO31YwwYiIl7W/EWQb/h2Owe6465W2
         9DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674546; x=1729279346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m894EEj8MKVIaKel5D8cwxspY83xIoj8l4L9T9MgTMM=;
        b=aawxM2S6Q0AEsOhZ3qqY+gU6lGdNWOZpXck37BgEbXwvG9bIZfqwoT2vVIVDiOTfPf
         2/ROExKCaqd/86NQrCAB8Io3+SZ1NcbFrmGx9kfhrw5dfQkwmEe1MW9iZeLN7S7vdMxH
         SG2nwDgeeh+XpTHeGQtdGa0VpXNVTufzyhYTvETFrS5tnWqWnivzzwVS9U+Ma4mEUAuI
         FvbLVskwyQetuG8YaAssufj0t2XwLXTXGgY+hkMwaF0qHQIXNdO1GT8XI4Y9wRiAVPnL
         OHBDig93TncDWOb6T4mb85Prpy1l4Y9VKNSoNMeDAixaS9HHhm/NDc+kY0paVMALvxV2
         kk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUETTWIRJjQjPLCH2cxp2r7nCFcz5tUu1MoEfbFnRFl5NR9fc04r8pdahx/ankPpvbGzcsylWj5P0zaZgMAa5E=@lists.infradead.org, AJvYcCXmUzUeMOCrdvKXKnZaRM++/Nsz6Xc7KKddPrIsUEtn73vDA1AfpneVggeIe3Jtys2OkfrHFFJwr4B7MYIj8fHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzhlNG70bewEHFZiCEB6HzNFBm3snu00K4qDW/6rTIOebI8uYo
	Ir4Qm4/P8g63XOcmKVn7gCWB52y1Jnw4SVtVoaqk8ckDZnc//nHl
X-Google-Smtp-Source: AGHT+IET3Ck++IAbg8SE1O1j1TEiGtDgB9CXJmSO93us894bSYi9oAhFM+9i9y/jH/CFuKjQZAnQuA==
X-Received: by 2002:a5d:4082:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-37d5ffb98b0mr440582f8f.40.1728674545757;
        Fri, 11 Oct 2024 12:22:25 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:22:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 21:21:52 +0200
Subject: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=1436;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=NIQyalFfWvXbrf5QDhsF9KSVr5abtwUFulTgkzyXOgM=;
 b=rbU7FqAOUJAaaOiSLWdKxgwrbugJ/grvJuThgHTtqrrqNwfI9iTGPlHUx/XB89McOBEJe5dBu
 yJhiWoNOe+BBmCJt5qEWcN0JkOJoUYWYGOxcxUVTsX0PA3p8LqE99pX
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_122227_376318_79D89AAA 
X-CRM114-Status: GOOD (  12.74  )
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

Introduce the scoped variant of the loop to automatically release the
child node when it goes out of scope, which is more robust than the
non-scoped variant, and accounts for new early exits that could be added
in the future.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0878df832859..9ab656b10a49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -372,12 +372,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
-	struct device_node *node;
 	struct device *drm_dev;
 	unsigned int cnt = 0;
 	int i, j;
 
-	for_each_child_of_node(phandle->parent, node) {
+	for_each_child_of_node_scoped(phandle->parent, node) {
 		struct platform_device *pdev;
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
@@ -406,10 +405,8 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC) {
-			of_node_put(node);
+		if (cnt == MAX_CRTC)
 			break;
-		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {

-- 
2.43.0


