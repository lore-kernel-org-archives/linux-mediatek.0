Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F8E7719C
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOb4dYM1XeOQNmpz4gbuJFETpHF0usdU2GeAkqe7Bjs=; b=OYuYunlfzrgLS0
	qal88c6M4TMe/e2gdahPN/Nlq6+tI1OlBlZO2LYGROpmK/z5uHHSmT4xu7r6W3vdT22mcfMBEfqr7
	QujJ23DPollFUk1cZCNnXp8UITr6S1ukWZYtH/1jgBLClMlJzbKyQwEbkmv8gbXCaTtTsl/EEJxvA
	JC0oSobda0uSrznUrDlEmm65GOW7o3C6lgKB9LN7xl46tCJJqRPt0svm0qd79FrfxE6Udrbgfp0pB
	c7YnSAoUyUrMTzFEYmycch9KaWRo3/UWG7/ErNlTHwNn5aR2x7ZSa2RbGi6x4+c12IWJslcNsWHqT
	yE7b5FiukO+NF+8qiSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWG8m-0000000Fem7-3oeS;
	Fri, 10 Jan 2025 14:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6l-0000000FTtY-24Q5
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=gOb4dYM1XeOQNmpz4gbuJFETpHF0usdU2GeAkqe7Bjs=; b=lrdvEDUrWGWcUuyBKGO8T3Wsjy
	HAYv3PoR+wWA3IHl2yqL2aTMs4M2QNtL1PmejECkKO+7XpmYHS06r1pnpbtUxoQ3MN5NjMEyvzSzy
	zvWyG11le3T7inGKkl1xd+k945QVx7FMEuHNvu0E1VNCL57Zx67ZjhzqCZ9x0uMFe+/qllhjJC0lW
	HMjh2MhEjHz/XtZG5DQGVKlcqUjZNtUyYJPk4CSR19h8u/QN9Wtzgal21BjSSlLAuwerqpTTpM1qh
	6P62Gg2r42FYZKZe60jft8OB7Un0wQdwvUOi1ZLRESR1xfVVAMIWt9ESs44VWhK8liVwvjRXVanJC
	ElL6nmVw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6i-00000009m86-0rVg
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43618283d48so15598605e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jan 2025 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515881; x=1737120681; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOb4dYM1XeOQNmpz4gbuJFETpHF0usdU2GeAkqe7Bjs=;
        b=yDgo6K9U73OpL0srSsWqr9FwTWhUM/tJPJdXXW77tZChciKwzq9Zp0DU5+Ig7iKnf/
         FfC6uxxeOmSFkcOiXu3kYUa+ctjEUwjQUzM3+IjisI/76og2xJRNbBjfBtwK+ZJNo6FX
         TZFgx3kRx0W+SsXgToLRl5TotQwknxdoiYN4ygwdQNirfvDjcDczORIwkc+Rrx7xOe4v
         5u5dpzY+eiZcODTiNxx0JJ+cSEVjmr2fr1gqJSikjyk+gsbN3DewEmbb7lOM+b+//rDB
         O0sZWoNRnHvANeP+VnIjpS8eSQ8xF395WrMX07G9XethmrAz9v9AtdTciJRakZhIETon
         gUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515881; x=1737120681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOb4dYM1XeOQNmpz4gbuJFETpHF0usdU2GeAkqe7Bjs=;
        b=o6B2IYBi9DUZ0hUK2y1ifQZSuJ9Ov+jpuvAjTlu3L7WO0/iZ19AJH4UQkVrDnjvWTa
         a2BUboo3C7c5KzvrKd8GEOSqEXHue/IKeiQBOtOdT9Bw9kmk2VST5NWWQC58T415uhyw
         /YwRvD8/n6GUNUUtDo+bi01JqZb+x54d+XH3rrjjhuK4aSchZKE9Yf+Q/Az6FXQXfV4I
         TCSpECcPgt6F6MFICxL86/AIN7dXoCd+a15H4DCAIRGBwL7a2xyTcxON95LTvNd3lan8
         HPMljOxJdxiHZn8w8H2CP6HxUYntclmOmltNMzH1izhRGKuvQu0GFQaLliSg97FZQN8b
         OnAg==
X-Forwarded-Encrypted: i=1; AJvYcCWwjdDIsaP+HdShca7OP2E0WHqM0AI1MDsxFMgKeNMMwY3tFm7NpXzW4/ks7fRLc40UihxzV3rdON5QE+MRsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgB4KD+x3kziai6j1VnzXQDhWE4l7drXUQTtwJnCge7A0+CkJr
	ChwLSiQcr89uxWaLsMpPq2r/XkY3vca5YGAIATLQC8UIoisTAcpt1FyxSgQrMGQ=
X-Gm-Gg: ASbGncuM4GkbM3mYf1zsK54v/CZBs6WhsJQoUOEWIDqMyu9lE10dLuUBE2YKeqbUhtD
	Q9+97qPhpfvZ88aSeTMMB7yUWMLWwLIY7UwoEWeaYmmRH6CkrtGSKuTL/Zl5hZdRqJTW+1vtPcj
	uTAa/ZeWZ5tEYIEmQib7se559yuGDoBW/8q31rOgK/dTCzdCL+K6FLAm18h6XJnTYZ+V/DjO9jQ
	u+naKlpF7tuyD0dcIlLiRVaYQsnVDsT7VUyUTK5+1uBOzX8VW6ttYSNulI3
X-Google-Smtp-Source: AGHT+IHgSDYD+oLBXez7p6Gm0Z9SWiWVmD2PPaCg5Lo8JetzTzttPSXxYsdjGCYoiYqxFKM0JSsVsQ==
X-Received: by 2002:a5d:47c4:0:b0:385:ed16:c8b with SMTP id ffacd0b85a97d-38a87309d20mr11317257f8f.23.1736515881130;
        Fri, 10 Jan 2025 05:31:21 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:20 -0800 (PST)
From: amergnat@baylibre.com
Subject: [PATCH v7 0/6] Add display support for the MT8365-EVK board
Date: Fri, 10 Jan 2025 14:31:10 +0100
Message-Id: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4hgWcC/4XPTW7DIBAF4KtErEsFDBCSVe8RdcHPUCOltgWuF
 Svy3QtZVq5YsHgjzfeGJymYExZyPT1JxjWVNI01nN9OxA92/EKaQs1EMAG8PhpSme92o+Vnnqe
 8UK8lNw4YSn4hdcvZgtRlO/qh7S1YFt7mc8aYHq+m22fNQyrLlLdX8crb9P+OlVNGlTeaYVAew
 H04u92Ty/jup2/SuFV0CFEJAI/GaOmEOB8Q0CGgXQFgTAQMII+ukB1CVgKDEei4NtHxA0J1CNU
 +cmEqcpTOgDogdIfQlfDaRhlBRhnMH2Lf91+2AikpGAIAAA==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4825; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/0JXe0fwWtlGrtBrYJBc+5+8TOE60mCncIXc9dv8OUc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnsrSlHb849yrVjHRbuAtAZoecmTQBJGX5G7lh
 KH2cSzyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURUfzEA
 CYv/Zza/8usW8Ij+qBfzlFEhg6kMzJ65XY/77heiRT4LAzc6eqMzNpN1g7ZEkpjGaql0584Po1m8oT
 anLSFwqw0IFJsrunAyXirWg/RKY7Ytdi9aheiAysFdD8u6QpzTkDpMp77K6OoD6/MhGSdDJa+v4ZAG
 zFYCmZqyWIV8dALLIdC7HSC8O06RjoJuxJ07G7nFeQ9JfsZ7AfXtFnj6mp0BnHpX5uSKKgbR+U0nxN
 7KFMRXrqcx+rKW5tJIrp2JQrx3SV8Jxqbt+XMzXuCR8RS+ElXyzqcemGMNpSkDVpOAHGnJd+kaFbFC
 v5BEetLS9PTdj7dlPBrBhJxZdmLGa/ysWLKB8HmQkjpfXTz425crctcXVFCvyaZhS7W5SMHpPPBH02
 jXRYoTbbkSKCMk2jzipwHLPbKvQcLtJZJtsRRdppXSk0TS5XFaLyYroAd9wzL30QNTD8Z8+KRMmRZG
 2Zpej/jcyGbPYscyv9PpsIHbzrDthvJJIV+zPxxhJ9z5HcukLyFBAxYTewBbTyrW5o9t+AAjGFih1b
 uTSFaxtDb3hm0Uv/UmxYftDo47pY7POhbTjcvIMMcFFEi48qp4WFcUzvisI+zTwG8SorDTC9XY6Hvi
 vCvsmYlfUmf3fEKzfxouAz0PwuuxSw5gu0d14weZfqf4s9OiMIt/2kRI9fQw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133124_525349_04F2F30A 
X-CRM114-Status: GOOD (  17.98  )
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

The series is rebased on top of Angelo's series [1] to
use the OF graphs support.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v7:
- Improve defconfig commit description
- Add comment in the DTS about pins clash with ethernet and HDMI (DPI0)
- Link to v6: https://lore.kernel.org/r/20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com

Changes in v6:
- Fix DPI binding: remove the duplicated property (power-domains).
- Squash defconfig commit.
- Fix the property order in the DTS.
- Link to v5: https://lore.kernel.org/r/20231023-display-support-v5-0-3905f1e4b835@baylibre.com

Changes in v5:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dpi: add compatible for MT8365
  - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
- Enable STARTEK KD070FHFID015 panel in the defconfig.
- Rebase on top of 6.13-rc6.
- Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com

Changes in v4:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains property
  - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
  - clk: mediatek: mt8365-mm: fix DPI0 parent
- Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
  use the mt8192's data. It's a miss.
- Add MT8365 OF graphs support, remove the hardcoded display path and
  rebase on top of Angelo's series [1].
- Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com

Changes in v3:
- Drop "drm/mediatek: add mt8365 dpi support" because it's the same
  config as mt8192 SoC
- Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
  because an equivalent patch has been merge already.
- Add DPI clock fix in a separate commit.
- Improve DTS(I) readability.
- Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com

Changes in v2:
- s/binding/compatible/ in commit messages/titles.
- Improve commit messages as Conor suggest.
- pwm-disp: Set power domain property for MT8365. This one is optionnal
  and can be used for other SoC.
- Fix mediatek,dsi.yaml issue.
- Remove the extra clock in the DPI node/driver and fix the dpi clock
  parenting to be consistent with the DPI clock assignement.
- Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com

[1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/

---
Alexandre Mergnat (4):
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display support for mt8365-evk
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains example
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,dpi.yaml    |   2 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 245 ++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 6 files changed, 594 insertions(+), 1 deletion(-)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


