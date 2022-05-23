Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DF3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0+09MC8+B1ZbZ7CZoTtyC71S1/Al1MbI/8k79p9DOA=; b=Ox9MirJN0eDLbM
	s6PbZnDYv9Ky2VL8OyGQSgVQ8HZLvPL8cXTngmb/YyMnZwO/4qI6H9apxIn4xkYjJUj6zrNmV5GFx
	2glwKax8aeGKj9IyG3vb6szVuLETMA75UK5P2eZI+3/jl6ko5iEvUgzGULXkpycFWohc7ge5yKZl6
	gAOfiYwLMCsT9lMai7gC5KNKRv/9omkbebeTrcuI0hKA4l7YGJVolnFs4k4g526us0lQlS7hf9ywa
	QV3B6ZNW2OnGKNnBbeYkET06+PMkMO2R454SzWpyNWybJuRWAW0jWCQgCJ1NAmmBITc/XmxcLD/p+
	l2Prvoa3mt1W7WBXkNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6yK-0042jS-U8; Mon, 23 May 2022 12:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6R5-003nAx-D5
 for linux-mediatek@bombadil.infradead.org; Mon, 23 May 2022 11:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=L59GiR9dWwoU3bIhqqTo2XYxtqfhGwikIlZ2jdUecpc=; b=SomgWj5lyYXFA2ocZ8eMOb8JQX
 WoL25LWzW+7itF/lVCe4FRnEjybn8j2M4L/m83rptq5qrdQG9rwzXKIbDv5Be8PG+gRqfkEdDWIsY
 vGxJMPRL3Ml++qi/mLhNsDmM/gv83W371AF5J04+nfYxzYYbTDXTzyJLmwdy6bX0v3sGxJGmt8eUk
 vDfZAe8BqNJFvw2ZC4CSucg0IZ61XzhZEaZIQ863X/aTeAqGMCFK2aKthBc/WcVSLVF0KeNqOPeTi
 9NQbFfOJDzGJ6jlenYAsrABGF5DthTEPG2ujVd5VBSdCEepotc4WbiMOb6/M7Z1OZoPAGx7w+xmQv
 fzETmyEg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5f6-0011Zv-C5
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:51:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id o9so815404wmd.0
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L59GiR9dWwoU3bIhqqTo2XYxtqfhGwikIlZ2jdUecpc=;
 b=2GpBC1024UFGepfN4EeJgCuO1UN/4rP8fzM4ZTL1Oy3Eb3PQ2YbsieGfwd/wr19Az/
 vWLap0skRbcSkUKW+aQZeMenpJ688qxeEMD6FtIdTctSUfNDjNU3ehuSa8LsbZCQyUSK
 Zy+t65L6dGDUIql6D2yeRE+ALRoFTHsQeKMF2wqO2ShIe7QcffeUStrl7exDqGkmebos
 xLpftSD8FbLe/y/SJYDwky1vcICDBek0D4TMe/W6PIp1v0fzs2QFFKULXHPK5y2KoT2H
 8pWePMqWJBCozqwdHN94XLhrb7SeHk7Zo861HG5+ZCYdcczXlH57WTcJRxLCU2WW9NiG
 XpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L59GiR9dWwoU3bIhqqTo2XYxtqfhGwikIlZ2jdUecpc=;
 b=4TBOmIlh/ww5wOxeJAiZmv/yLHzdHuk259dBiHnhz9t7LoyXTRjb9Q/M1+Noarmnm0
 7+Zsi/uQ9PvcHuLvPBFZ+f5+BCjMTjXca66jdb51j2VSIsOlNjwCzq8EsRPgI/kkMlFG
 KtPY/FTfSXXdyQd4VFhmq+JJ929VkHY2JIdfb2wSxXgcWBe0ssVwIj13ZMufhdo3rwvk
 wmJB+i31FlfjBVJsm79GdvHlulNS/s1rjFojXM86x5OShJLlKfIEHdPDBV1jhP6KKQ9v
 SMe/GDeHOpdhwAx6nXAvt/h90+B8B/CjaIVCTL3cz2EBzQ08FibNH/aBYLTPVTEjDxgM
 jg/w==
X-Gm-Message-State: AOAM5302NgoO093LcwzsqBKTXj5urmGktNU1MoVNi+mCgK7+H4lzIcZi
 16MmpLcb43ku6ByDu3K+GZTJ2w==
X-Google-Smtp-Source: ABdhPJwNegNr44So8xq4D2p9JaCnMXp0VvpDOo2fky113Q7b9TeovIyeLXQjxBiFJh/CiujqFzERLQ==
X-Received: by 2002:a05:600c:3048:b0:394:436b:76b6 with SMTP id
 n8-20020a05600c304800b00394436b76b6mr19844563wmh.63.1653303103041; 
 Mon, 23 May 2022 03:51:43 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:42 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 15/21] drm/mediatek: dpi: Only enable dpi after the bridge
 is enabled
Date: Mon, 23 May 2022 12:47:48 +0200
Message-Id: <20220523104758.29531-16-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_115145_258257_22A8FFAD 
X-CRM114-Status: GOOD (  12.66  )
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

Enabling the dpi too early causes glitches on screen.

Move the call to mtk_dpi_enable() at the end of the bridge_enable
callback to ensure everything is setup properly before enabling dpi.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 763bfb700135..a6b6d62a17e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -478,7 +478,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
-	mtk_dpi_enable(dpi);
 	return 0;
 
 err_pixel:
@@ -711,6 +710,7 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
+	mtk_dpi_enable(dpi);
 }
 
 static enum drm_mode_status
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
