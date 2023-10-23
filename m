Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62768C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s9ub93Cdf9wtgxlTJaFYfR1eZIPMZ0+ANxwjapwdSNg=; b=BQT37INo8XSXYE
	bB/KOjauVwe6ibcx1n0QqeIVLzneqh2oBRFbZE9bWxADvi/IoIyuJplCnbGtJWWA3jtbAhGhZbRGT
	Tn/opQAuFUcwt+sns22hTeJI7GjNnJRVZraKT0UPUueK/aVuNtVbyTzDKtUFNw6NMcsix52och/Bk
	ko3v/dQJlV9N9FgFHyuwRsOsQbVSP8pYnq9hQDCR8BfeL/KnK/JUu0af4GU4BlYH3K/EId3PLga72
	SEgQvDtbeqICXzotAVAwCCgTfuCW8rM7EEX1m9hoAzbIsGwYhPbCxG/ctbkkRn8e06ln6VxARmc8p
	vvVhET4IbeaG9PZRB/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6V-007ZNh-1t;
	Mon, 23 Oct 2023 14:40:27 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6Q-007ZKc-0l
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:25 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7b5fe8ab5f9so1255134241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072019; x=1698676819; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9ub93Cdf9wtgxlTJaFYfR1eZIPMZ0+ANxwjapwdSNg=;
        b=g2pJDCGAeikUYaGK7CHlwj8fC1xlab+Etg4nTuBHQ6OYS1VZL3fFFNxP28EAc2pQBt
         n3G8Fb6wWlHe9MpufxUGQwyZ9UkDReXwG0sSGwqzwkDPkE9I3yEB7Z5VidpWYmIqex3f
         IhXb5CNW06t8mAzPalUJ3rw/ergS5S7bjhOTHUA69unI4bwAomiw9mb67uqoKm+FbF3L
         5D26kqHBsK07NwUwyACasyyRIPH+UuCZeusg9GJ57X8n8Kpdfwv6GekP/iXG0GErK6o8
         p2u4ErVshqz4ijInMNlGSV9cjJ8kizu9Z4ZT1iGQiY9JYf9IS1PD6tuqUuAXD0zyWY+s
         GH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072019; x=1698676819;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9ub93Cdf9wtgxlTJaFYfR1eZIPMZ0+ANxwjapwdSNg=;
        b=dpn58a9VeFOm0DF+ZgUUOpDYo7gtPNx6v0M8H0P4aZfErLNAkeCvoaEUSyKUbOssgS
         f8QFMlVqDom1TEICaeDpggt9QCIwSi6Fk/cZcJDJ14pBZAVH0TDHGEgb1vkoTF1UQlzW
         exVwEm1iwtO5PEEiDMMuN1BD1TlkOzwKrXAqZ4MXo1Q4Q2AH+WEt6uXyilgNz2K307lg
         7yPV8ckXUus0qzGcvyvj0BqON6S0CE0qVby8B1q5248vXUqA5hjt8E0FZVwUwTu6rkQz
         tiVs0MYQx+stri3yvC1IyZy+pNkt2tjMFXIDE6UBrlOvf+XjZGKq+HjQOml6qufLlTuy
         gFBg==
X-Gm-Message-State: AOJu0YweIUQ3Y3HekNTfzLgencixUT0zfTKCt4RSpJc1SNiSLAiaorW1
	pigRB8lxOMnUOFLm6UCT/he3oQ==
X-Google-Smtp-Source: AGHT+IHJKtPN+s3qbQB04ksDdQlqDmncwY1jaiRVU91xSoTR4TpQokxGMohekSd71DOrL0y+Cj2D8Q==
X-Received: by 2002:a67:b742:0:b0:452:72ed:7020 with SMTP id l2-20020a67b742000000b0045272ed7020mr9517700vsh.32.1698072018696;
        Mon, 23 Oct 2023 07:40:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:18 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 00/18] Add display support for the MT8365-EVK board
Date: Mon, 23 Oct 2023 16:40:00 +0200
Message-Id: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCFNmUC/x2NQQqDQAxFryJZGzAqYnuV4mJmjBoo45BMS4t49
 45d/MX78HgHGKuwwb06QPktJnssQHUFYXNxZZS5MLRN21EZzmLp6b5or5R2zRiGnkbfNdzTDYr
 lnTF6dTFsl5fZMl1/Ul7k8y89pvP8ATvkV+V5AAAA
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3206; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DdZ6/V836kfp880KhEXam0/pg2tqhWjEoh+kbca/7ro=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOTmxXiiwg+V6sYJXd2VtFuu8rpxi/5OZ3Bsqm
 CqwoEM+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURakDD/
 0Y/V7nSPbcGNYbM6NM+UqrWkjU+MFWZUZLEATcbdpLuCUIcgdBNyWF4+ocFPmgoy79rcrLY4jR4w+2
 tRDQaQR5qvgcN608HPRe16pHW9WavVDQUggWNMuGm4ePifBnu9bImn5/FIm89fp+CF8fhkh0QEVY9S
 T6sSplH35tU250AEM4lXGhIwJNhegUQbWfBeixu01aOlVxzOCXOLfLr2aMBkZktYy93zp5B6o4FiEH
 oHexmjDRB2kNmAS08GEQI4mMXQX98ZBb7sgjdh3IbXsHYKTinFUFH5sbr/qDoBrb7FgbPd/nsxQvEo
 1GfhIRNRPvhPsns+1Vf3IbW5bXMrUVDV/2vYTHL6B75ZTKhCDh86E0ykHoqHope+9AajwNwXZnJs7C
 v2ibGrOHI+6896fihV9LKC5YGrooRFqHLNChFrrOEGikLsYYZOc92gZZfNnI6fSCmTTBnQV7pQNGVM
 rcQd5AO0BuXPBAad+mSgYXGa5uZTbKynnMzV8zQXsgGmurakj9aqYDcakn1lyxre0w7+bwIPau4vj5
 z7FerJFtDahPtdvRDp1+D0G2AdgAzfvP/WyG0DMUDQbNaaN9xk+mPtuJkoSeJNz6YCzbhAWHSqeNAa
 h8YHMoFUk/M/2q2U1lJZaCuHBh7UT53hhnVr/H/suz0GKZrdMSGRNieqzBWg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074022_282217_42AB4DCF 
X-CRM114-Status: GOOD (  13.15  )
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

The purpose of this series is to add the display support for the mt8365-evk.

This is the list of HWs / IPs support added:
- Connectors (HW):
  - HDMI
  - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
- HDMI bridge (it66121)
- DSI pannel (startek,kd070fhfid015)
- SoC display blocks (IP):
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

The Mediatek DSI, DPI and DRM drivers are also improved.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (14):
      dt-bindings: display: mediatek: aal: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add binding for MT8365 SoC
      dt-bindings: display: mediatek: color: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dither: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add binding for MT8365 SoC
      dt-bindings: display: mediatek: gamma: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add binding for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add binding for MT8365 SoC
      dt-bindings: pwm: add power-domains property
      dt-bindings: pwm: add binding for mt8365 SoC
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (4):
      dt-bindings: display: mediatek: dpi: add power-domains property
      dt-bindings: display: mediatek: dpi: add binding for MT8365
      drm/mediatek: dpi: add support for dpi clock
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  24 +++
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   2 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 .../devicetree/bindings/pwm/mediatek,pwm-disp.yaml |   9 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 183 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 146 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  50 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  30 ++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 16 files changed, 455 insertions(+), 1 deletion(-)
---
base-commit: d27bed55ce32b0732ef65561851fec3dc8d01852
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


