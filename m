Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA693ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6fAZjUSUbrTkGOCw5LFlmC1xlGoTF8FJL/IRWB3F4k=; b=wT6/vIdS/xetoNDzYXrZCquVQY
	R/dv37w40GFcurb8T5wcG5utvn6iYXrzhcafSKfYInzOjFF+bhL8HSP6Bom6xA6tYw/FT617xHsEO
	2a2WFDslzuG0LBSlI42wZXwHTK7gHJrn2119eeEPZdXuFM+aY087kImcSmGBdALJoqqnwepjxcZE9
	Nq1aPtUknN9J1qruMZK9D0lAL3dqxAyhEDSmwI+TOHRjkAvzum5IUszg3BmDDd+9sJ5RM7Aeq66Tf
	cpCSFFbLJjRal7LSnoRXbmJ1JgJlOHV02UzdlkdjCNvgyyRACejHfg1aZi+Kj5s7/3wjaGR0hU6Nu
	KUoHc5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK8a-00D4zD-Nr; Mon, 19 Sep 2022 17:00:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK88-00D4LG-8j
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:27 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e17so139190edc.5
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=w6fAZjUSUbrTkGOCw5LFlmC1xlGoTF8FJL/IRWB3F4k=;
        b=VyeY5nKyZ2Xt/Foj79ukjzeYW4F8E4loVlhOJLflWXPXa38+TG6kPPbnPJK5N6wYlp
         l00cwyDPfxCvQZiSOSkA5M2GaDMATf8caLakqM7xgzSCpDc/np8/N3mN6C5k/Z5eGs5M
         wbmqXtAovwQK910RwxBV10RsnW/DTczpNc0tkVi+KPEn5b9+M4uh8g7fSddQOAMawP2K
         4Zb4cHnVWy5+eeIIKaTBXD8QEb6y5h5w+Yw4DlEj8JOI8cWnh+fcrvbfZKYqQXVXfpjW
         s9yJLZzVW357YxZ6NIUfkLNAeku8MQ/rpeEFJ3Nz/EOZYEe8b0ZB5EvQcow/777qr4B0
         ubnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=w6fAZjUSUbrTkGOCw5LFlmC1xlGoTF8FJL/IRWB3F4k=;
        b=aVEER4/SSw//lww42R5VB4dQMXl60K/Oa5isIEwUhZynSosHYQzBt7kUSCoryxjHPM
         14XwfFX62EV/OqvDAwh6stPyc8drV8o0Tc3GPGLt0UspNblnv12MSQY98z/XwyAw0qjb
         QV4SFJS02sgf9WWCfpN03Q6o9iwJrD3WaomgvWGQuAUj8LudqPJqgQ7kpXrjaMAOpk5t
         16NcS0FBbIHWVRGVP/CiZev5bRF3e6k1nU1j4TwArj37ZG6rJ3wJkXcz1HzTa2S51GiS
         +9eZ97d57oisbkhEIrzhEQT4KsdCTO6ipttyLqEtFQoBQQsVchn+ofnBfGwnUdLI+1GD
         yWBw==
X-Gm-Message-State: ACrzQf2Ssu1TGdMm0844kaXD/NeISteP1MxpKp0GR1iMqLLLeOURD7Py
	EBcA1+xI7aRNVlHJ2OYOHoUyYw==
X-Google-Smtp-Source: AMsMyM59bK7bV3ogR0Vq/U6qyHBj+7WUNCJVJ7yTHkO06E3cAutw018u4siyFRxzjVJRBcxdwPWWvA==
X-Received: by 2002:aa7:ca56:0:b0:453:ceea:99d4 with SMTP id j22-20020aa7ca56000000b00453ceea99d4mr7672718edt.54.1663606823801;
        Mon, 19 Sep 2022 10:00:23 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:23 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:15 +0200
Subject: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-17-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_100024_355921_B012C7E0 
X-CRM114-Status: UNSURE (   7.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add dpi support to enable the HDMI path.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 72049a530ae1..27f029ca760b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8192-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8195-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8195-dp-intf",
 	  .data = (void *)MTK_DP_INTF },
 	{ .compatible = "mediatek,mt2701-dsi",

-- 
b4 0.10.0-dev

