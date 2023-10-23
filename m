Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF0FC004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH3GFq5D69xS1Tzi4QqCw1RIdz10bV1qyKuEWVVtejs=; b=Lvoinus2W/PROMBidsPJqoOG56
	8EIaDyqz64b8M8OnHna5sbmLTY8udIAeKjSYw+XwinN/gCROMD+bb5iCL75hhL471xLWwFP0cG8DD
	d3ZWCEtE5NgziQlea+ELUs5Z91E5YtxQznwFMZy7r9oMqd0d0eC2MnEnVAJy/pCVvjnw9zlppv2yL
	99jlq7tZU/E7BWlNoTluF9PqQZBpBZ8YxXUmzT+FoOMfTv3vRHF32o+akFtGG6UIWHSLmcVzkIjna
	XtLZwElIxI1a4QuYleaYr3xvXu6NpnSikTM9HzyMUCC0Tyyz2lCUQRaaFPcEdFQ/Tz1cAGD9jZa7V
	bYGqw77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7w-007aWl-1v;
	Mon, 23 Oct 2023 14:41:56 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw77-007Zp3-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:06 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ce344fa7e4so2389353a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072064; x=1698676864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH3GFq5D69xS1Tzi4QqCw1RIdz10bV1qyKuEWVVtejs=;
        b=i69CTRUeVkBN6Ecd7A28B+jfj4odDhp7GGYZT59MjajcH9mUuzhe9c4qvvG1DG/N4k
         OkB/qKMJ3+Px/5qwBhcRjEHui6jDktJMDNBf6fO2nESpFJBUbEOSdA38IcG/j0U1yuxI
         9AanIMPVJej29fEXG6pbHN/jpxcoAdaAcwAD5PEM9YKe6FxJ1PLqWN9IPE0RlseipsGs
         y+QRC/bAwyzpsjlUaRSNqoqO2W54yQpfaDOCUwcCbSFX5P1YL6zZu5OM40i7N4L9UTrE
         pFI78Wtj6WosQ7v/IBdou1rUQFOlg9NkkLF4+RHpSVKUWIVOvtJTyxKqaYQhzH43It7o
         JLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072064; x=1698676864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH3GFq5D69xS1Tzi4QqCw1RIdz10bV1qyKuEWVVtejs=;
        b=MLFaWru/LMpYSeQGhSRI8zk/9YKxFbgBcyZBBXzD2nrctX6zgLslJwiwOo8A5Tx+Le
         De5zkIAVneuifTRRQJkuZtACfvdFf/F1qh0cSVMKd17LYU3bsJrGXCbNQbz1+y8+Zi0i
         HINb9dSdAPXj8ooKEHzbTKRdRZ7mz/YIYa7iprKopBYMiFAxJyPk8VwHxXDGOmTk9j64
         MgW96oYuW2JDQY7FLsOTvAPpFrEsk7HFQ2Sybh8jZn4OHkgfffApXSuq5cXqNtySzcFP
         OJjACJQXAlZAL9fFE0A2CsWTe+BmqbWc4IRFEvqC4eWnCSnv7oqVcCEMHj8tvq6u0ugA
         fL9w==
X-Gm-Message-State: AOJu0YwFyxaBGviCWfLFvolsQG4fISWOMOQcwdkRnorc1eUoSjZsuLT/
	FllS351dQ+j4T80l2WpyxR3SYw==
X-Google-Smtp-Source: AGHT+IH1IkI6TnT+ttcmCoscPeOrIopE1WBAZEg4r9UimrR6CIMRAoo8nMxYKo95tMWEpnGtVl6eKw==
X-Received: by 2002:a9d:6188:0:b0:6bd:c8c2:b70f with SMTP id g8-20020a9d6188000000b006bdc8c2b70fmr9880668otk.34.1698072063987;
        Mon, 23 Oct 2023 07:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:13 +0200
Subject: [PATCH 13/18] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-13-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=M0lgMNEWbaoZ4qkfmFQ2d2c6SqYe0EzRwVFM4lhot+4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXP9F3RAu1ZKmUXEIyW8a/kP5CK+Jb3tGF7IdoH
 1RqcA3mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURTPOD/
 9t+6pSLsY0qJ4yNYIAy8Yj64n+qV7yRH4vlC9ppkx91ePv2Sf/rsw1+QRG5hlj0j3d5dWf0ZGe/qPt
 DjapblIQRzzn7BcMUQD/gavAeQ+YuLMd4IOyVk4uXEBjys9STpAuYQuKC03y3NcyjL6JWTj2fmFXTq
 FSDDYsV/wNBpk5ALR2J7sE92+GGZXhthAmqro6CeVxpKs8z4H+c8lJOUUGaohZDWJkzoPl3QJssrhq
 XljafCvUMlRJYbGBRWHusF+de6q6F9tY7mJoX2udGUIrH/cZR16ydBWCpSVaFEKmGEioAQXsFQ1JpS
 3/FHHTBX2h2nfGJQ2eT5muUbMii7hB7u5QWiVCF3BFBfzU4ketZCF3bj5Dk9xLBskq1ddV951Z1VJq
 aWbuUgtjoALtwalhNzN12FffvNPsJIBz4z1TjRHf/cK4a6jaXgVBorbrdg3g+HRu0BH+uAGnC6c1j1
 BZhh5BAQvMKdxFZnbk/zwmdsmAwXbfIPVcs2R2rk5mriJ4BOy13/lj/L2c/671sxkorHAFPtQUsi9I
 4XIePB314S80C1hBbP4Le8sz3x/gPiLeaQOFxu1Y38FmqYPDFc9iZvDBov3qmHwo1awkx6YyeMuOrY
 kr/y4GCxn8tSG8oU6g3QQsh+p+1wUWzZ6V47BRTgBHkVb5pT5lxJo6zeFjNg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074105_128360_C999E8D6 
X-CRM114-Status: GOOD (  12.16  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d8bfc2cce54d..81cf0ddcc399 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -668,6 +668,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


