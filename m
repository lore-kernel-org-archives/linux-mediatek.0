Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13718C28B30
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQeXTV1LA9vLFyUSPTOWos3fw/hNZwIQ/slXSCfXZO8=; b=dlPwBeHDULfMCRvO8Z5WRq6dGo
	ZC5uRcx1iLaGvWpflXYWwofbJG4K+OwO6mUuhwmzTqu+JK8wH6ksg+VL3Jv0DoF90CJFK/E3U3mIO
	oJHIbXvre/SfKSqfwV52GSybshFvVtNx1EWKgGxtsdNhyBypnWp1CK/I/TAjIOErt69veh7WCBcY+
	pmamxf/0SL7LsSx7S7HBoXGOFrIUiwTxdgICon2O+ZrwieZxASJKTmuf3IXZMz0BJu7Mdw71kfTAv
	P3n6mgMKevxoaW9NBSN9Lc7wW+QF/5ySaMK42iYpe03I0sIvUgNHhTeitkl/jSrfXDMYl/9jz6kiI
	w5gMHsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBcE-0000000BbBk-0xc6;
	Thu, 20 Mar 2025 08:51:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBaV-0000000Bap8-32te
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 08:49:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43948021a45so4239175e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460554; x=1743065354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQeXTV1LA9vLFyUSPTOWos3fw/hNZwIQ/slXSCfXZO8=;
        b=zaFKBHuwD6QyizKj5/g+7aVATrA0doJ6U1X9mW/9gpJDLetwo64o3AMQGvfdLLOyjI
         ha3P2YIFUUQwYKqGaYDoe6KZW2wgXIbF1KNOxc9TX56zlkNlzRRaDQfXhZZmguaJeGW0
         MPrnmspHbIbezEa7D9c8+CJDAJGsXWC9kCLDsbER3PecVJFzEfAU1m+E0OSffMPvcFk2
         vdMFpMn3d4FJMmW/CBue4CGPRiJP9hD4pU4QQEwGc4BS5+cY5zjqriBJHV7dQNckQTQJ
         yDM0IM0sUPN/Kl+jfnaa0MaY03BVm/QU71l4mhq0E7ZpybZ8uAxF024Ptdq/5nv0H0PL
         TwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460554; x=1743065354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQeXTV1LA9vLFyUSPTOWos3fw/hNZwIQ/slXSCfXZO8=;
        b=LgFdgUDQQDKP8t1i+bpgpI6tInyBMmN+Bp+uI5jtGWkvuz/3/M/xIZfbswGKdEjc2k
         /9IT0nhUXWIVPNxL/OeKRi196hTVhu/RseP1opMgjv0Unr4WHs6Jv0+9O/58XAsOc2xu
         RoBLXW4tvQNrF435N3bQNWPaldTxJjllASV0bflYs/BEpYUbiIqJakjfKMmk8V87kF8a
         Aem2ccY9NZHPWDGmL2wHmd4i3MROLQEZ8KUdpBgvYYiRWxs0L1KRbNt8UzaMmeXWFSEs
         /s6VvLpH7YuqZJMwhCrwMx7QHIX84fU7eMKinOiplVANsuqElUbu865ATS9fBcBL9IQa
         ciuA==
X-Forwarded-Encrypted: i=1; AJvYcCUsEYUSeyDPeg2FK9WGQkCmZMnuqspJFnze4wYxzIDBUAILwRyndY8dyqhWm8mMSZaRADgqrJX+t4KHfBAZWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZRNsJny88XHPsF0EZ8xzdBbqAGAuxexKC8Zfs6hnJ5XR47s/z
	IzWS1prFmzeoIeX0ZH7ez9tBIcMUo1PyG79j0EfOJQrNq8PgPMQFY61z7hr9KW0=
X-Gm-Gg: ASbGncsqTq/JquvbulrCdKUwyzOy+0tIVYJ+pjVzm8fHnixfhY4w3Ch0IgRIomjmk60
	13hgJw9/gbirS+ssRWoz14aYV/oPesNwgpI2TjMvC9hOnpaU3PWT9aa7s9TDOpR9WknBomYOxjD
	Vvd7XIULk993D18OzhYLHDBMK7MeCfzsa5w1g6hxV0SSYbxajO7xywuKFxk7fL4DnAnb7XOZnt8
	jTdNyqTUxM7nsWDo+9j/t4r2ZSFoxp6YtQJZfr3IKLPdLKQqyZjIHNSQx6Dm+9N8WfOvrO4VK0b
	y76kt99S4LauomVKZa4eT1ZRr6o803qOQ6TFge/ZgUT1v1yI
X-Google-Smtp-Source: AGHT+IH58YmM+Ar3OIBnrYDz72JB09Ne3XzaCC0yavAlSFgbWvLySke1g9L5Z6waa+wCIlyWCNTAWg==
X-Received: by 2002:a05:600c:5248:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43d495aba92mr15463345e9.28.1742460554194;
        Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:49:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:45 +0100
Subject: [PATCH v8 1/3] arm64: defconfig: enable display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ZusPf2YtjBEtNve2Icxs25V5Tl/ibrpsGhWI+A0KSgU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aH6usGfN2/1gaTh9wKj+TSHgkhwQ2e617HVo3A
 T2nrw+uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURarMD/
 kBEjarCQjoLriCSN2ub60j2k/Jqp4G5LTX4M3crHIEvT/AJ1/D0ShmhMqlAGFJqzIuOD/uTzvBCH4C
 bvY4jxUtPHFP/4FqhTFtCiB4ieeiipBTC4gDQ3iDwnQtJ3egvFXIU+TYQICa3/lds2dwg3LPfI8lYW
 kTmBMlwM/FxFnUZA//Onw6iJsbRzaKrvCZaHfmhIkKN8cXdO73g41J5uiws/LV9OioWmTwxioi3sfT
 yeQC0vJB+q0EmE5vnp499CedQpZWTJvw5dAGVOr6zP8fJIYS/LyWObKhn5t+mJCHol1lJ+Ty3dDXoD
 5tfUCbkzfXmiZK8Y+pzH2Yl+YSxgeZUyF5g4yS3gNaLO4/LHIsyfFPzqrN8Nu2/T+Vu8xf57gtRiTN
 yvlzEAOgC2gFD6lEdCls5eBIHksYK0ntvzYD7ykbnM9YJ9zI1amHZHpVw3tJ9lJn/Ko1hm9sgXLuKn
 OvS7nxXk6ABvpHrHXIHTttwaqOrMN2+kAxT8Si3Tr+A//FpFpOx+BNJs6CBZ1kaB9CuFFvYHJtvNwA
 GLfDzh1Kdf659ylFdqcCdiT0kjaEmujM+W2KwrWgohbdkT8f5pSvPl2HTVwIrxStU8MXgya8H0ksA3
 Rrn6wVEmTr6rmJmD3UfNG4LkSVcvwzH8JGPe3ChKA7ZNLm2ZbW0s1XUAoDZg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014915_759951_810D0562 
X-CRM114-Status: UNSURE (   9.03  )
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

Enable the DRM HDMI connector support and the MIPI-DSI display
Startek KD070FHFID015 panel to have HDMI and DSI display working
on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e615863..1e2963a13500b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


