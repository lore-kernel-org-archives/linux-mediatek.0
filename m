Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE915C28B30
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3dSSUDp0kq8Zg5C9MUmkhdPhVDOdSmRPSZzAk4mUfCY=; b=2fIjDI5r+bLc5+
	NvfE6Gl4FzWFQzDKju02QliC6GMzxA/EMX4iN0IC+wSzA/QakkYmhJrx1BxmRmAxWf/9wtk+ZstdM
	GEY75tnbaJiAR17l5VAeXS+yJSC1fKsLNSa6wf1ubA1rI7nFReUK3FvRhj8kj18C7rsJeyj1mTURS
	cI9/PVO/S6HcDgmdKZG8gl/pAUN/harWWWzLT8kuW8EJ2+GLjZ6oSeV6FvgKcKMnzoc6XvkR/kVgj
	mhPqmPKrOotEJVN5Hq7ACEyGUGyIg9FYwh7kwrw4iPH6nnanaJWbF2z1d64Vq2h3X8EndOTdUYUae
	o76JUzNPsnT+lxSwDTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBaX-0000000Baqp-2zoX;
	Thu, 20 Mar 2025 08:49:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBaV-0000000Baov-1WwB
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 08:49:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so3944535e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460553; x=1743065353; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dSSUDp0kq8Zg5C9MUmkhdPhVDOdSmRPSZzAk4mUfCY=;
        b=zBQRgBen1pZ39aaLnvqJ5qJ+F9OyEQ0WnY96/OFv6P2vJ/YH1/+/2fi35AW5V8iACc
         +k1dCgIwVJLuNy/RPzEreLhX1qQy2XP9KkQVi8RdaKR7+HWA6hqRLx2QNAsJjZl43qMB
         1k9KwoEKA2BC+ka4k9q3suIUAIoVfBK2xY/k43epjOtv7vudVDrB3ffGItpO9pi1HNrG
         HaPU2Yu87vOQ8e0C6jlvVlaUUFZ/hegcqqQFo9DxYMVvfhPAl6JJItTOSnLF1odMTlUx
         Mt5zPRkBUM2Z9SFhxHPZik4PSagq7eLLoYQpMiJ02Ux/OWMhsPg9RnXFL9tCzQZMNt1b
         cnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460553; x=1743065353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dSSUDp0kq8Zg5C9MUmkhdPhVDOdSmRPSZzAk4mUfCY=;
        b=Ze6Jl5mcOTpuy/N0qZ1Pr5/q0Tylyn0+AhuXUqz8OPOwViSaKJcZVWpTUO9fTW0DkJ
         kdBFD2MJ2CMLSdIjAMMdh5in8JeS0P5uHXpnN33w+i22b087jrv3+6e/IkNWEBBDVwOK
         Eu4ESn5l1cNeOspRFNQnThsnNFL4lTUD1ErKuK6K5oWNWSjl22dBtmGMpQkHMIh1OMRR
         kwoE/wz5JDC5C+HNRJkFnfoNK2VIOalk6AV5z/CAbJLQveHyIBOf89Kb4aMaPBbuoBmz
         Ty83jHn17IKY2/eRLv5CiuTxiFbBMWvynCtkOM3dl09we3oLUsbEGHbYUmMlhp3j8jOl
         NOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPSJtR96bDLb6RIn5NbuVErqCTi2i64uEBLLps8hV0KGAkeKvkrwnpFeR5Aw/uSVCJfO/xvpR2Y/GGtrAKJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZgOMQmGbP5zti3s7LHHh0yQ1asdJhY42vapfJAcvUjYzK5tZ
	zKY8Hw6V97ocmnFHlEPlDu5VFyCZ2DF5gmjvoA5zHdFvZxDDz9m0J2RA4yQCT9Y=
X-Gm-Gg: ASbGncutZTPBd535D6MRCYGX7B3V+9j3lcN5XeEb0jY+SLXzqEEF0pWIskud5/YIguV
	hpsTX9ANMV9Me3UxL1MKzDotAf3RHKb0PPXUUFhlc2dCIxo2+XJj+44k2UyLpeDGgwzyzGz59O5
	bDo7bLm4OLbTyOsPpyRh3iwfETEM2dA3CAb49CqSUKBuASy2XyUWBCOjGJotHG3/khDOoi2kUf/
	Vdn6t3N/bkRSbJpCIED5W4GCwS9WVclK7iQs2+IsxzaU+ZNtAM1GLC2Js+IPrKJe3lN6hy5FAmD
	Qo2mVFlk9cg+M4pF7BaNjTxx19DD3sDP8DwYjdohu/oQd53E
X-Google-Smtp-Source: AGHT+IESyPaiI1V9B3T+xCXcpOdHP115r4JOZkpshAPm0pBqPbQrvCBH6xJxDvOxDEUrw+x64IGdGA==
X-Received: by 2002:a5d:584c:0:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-399795adb01mr1697690f8f.22.1742460553152;
        Thu, 20 Mar 2025 01:49:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:49:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 0/3] Add display support for the MT8365-EVK board
Date: Thu, 20 Mar 2025 09:48:44 +0100
Message-Id: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzW22cC/4XQS27EIAwG4KuMWJcKMBBmVr1H1QUP0yBNkwjSq
 NEody/MskrFgsVvyZ9tHqRgTljI7fIgGbdU0jzVYF4uxI92+kSaQs1EMAG8PhpSWe52p+V7Wea
 8Uq8lNw4YSn4ltcvZgtRlO/mx9a1YVt7qS8aYfp6T3j9qHlNZ57w/B2+8Vf+fsXHKqPJGMwzKA
 7g3Z/d7chlf/fxFGreJDiEqAeDRGC2dEMMJAR0C2hYAxkTAAPJsC9khZCUwGIGOaxMdPyFUh1D
 tkCtTkaN0BtQJoTuEroTXNsoIMspgToihQwyV0AOD+hVCG/h7yHEcv+U7Pw1bAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5549; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=dFWBZa11361gL22ddaMWSIWli3shFJKSBcr7kHO8OAs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHbKmfCxg9p7exTe9tO4ahnJps7WII3FBjPnb4
 3eBbyQaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURXGrEA
 Cmq6GfCcjI8Ht1UNcjWmd4WfAieGbhW5mYUQQVUZyrkkVUl2sEDA94dd7L1HlTzNmiO9qXciEj+GZ4
 CD5NhyDyHrTXp8bkL0bgGIjHZXf8QqT3ae/1WYtL0HUH4c8sTjcWF8p8fIDmRzE3ql2nSKmTB5w9fb
 6T+oJLElauBuc6eWCq6nJjF4PfdmotiB/2RyRmo+9FNm8jp9PSYjniUQo61mmbssD0zx1fGiDMJcNE
 dfXFLBOhju/EEHdvcAqBD/sHMu+4//dxQ2ZPmJ4CV6lTFeJpJDNX98Vy7tgehwEAs5QfLzqawHpgh4
 tN/2XWMzX1S/pNqcr2DMw2UJwMGHuD+/yr9bmsbSwtadQCWflHc8HNCRiT3qGvXBYdQ2nX1D34SHGS
 yhOSRFKlIKQTcIhsOLJMx+go6P/BiffF3PsPFlnClkdu9Rp8MaohY8YKRNnpPAdQnly1FYZ8OKNJ7L
 XJRh3+RoEC/eZNgm/As3WaJjJYoRU9d3Io5XvOqis3TFJwUMZNhzsyHNlmILLFiPdT3sKqYt/1+UFK
 MrKj41Oe6yoMBlQupg9mQc34O8Wiq5ap7bI/5sfAwwqV8YNojrqnlh71tf7QGQdFBrLoCTonkx6gR3
 tGEGOZO1VwKbIUnxiKIvX8I1iBHJejB8KysIYz8BVCnhPK9vSuOv71qUJbdQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014915_397718_9C1BC975 
X-CRM114-Status: GOOD (  19.11  )
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

Update 03/20/25:
According to Angelo's comment, the DSI fix in the previous version
doesn't fix the root issue.
Then, the "drm/mediatek: dsi: Improves the DSI lane setup robustness"
as been replaced by two other patch to fix the DSI power on sequence
and remove custom power function.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v8:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains example
  - drm/mediatek: add MT8365 SoC support
  - arm64: dts: mediatek: add display blocks support for the MT8365 SoC
  - arm64: dts: mediatek: add display support for mt8365-evk
- Patch removed:
  - drm/mediatek: dsi: Improves the DSI lane setup robustness
- Patch added:
  - drm/panel: startek-kd070fhfid015: add another init step
  - drm/mediatek: dsi: remove custom init part
- Remove MTK custom init function for the DSI driver to avoid conflict
  with what the DRM APIs provide.
- Link to v7: https://lore.kernel.org/r/20231023-display-support-v7-0-6703f3e26831@baylibre.com

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
Alexandre Mergnat (3):
      arm64: defconfig: enable display support for mt8365-evk
      drm/panel: startek-kd070fhfid015: add another init step
      drm/mediatek: dsi: remove custom init part

 arch/arm64/configs/defconfig                       |  2 ++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  2 --
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 16 --------------
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
 5 files changed, 17 insertions(+), 30 deletions(-)
---
base-commit: 72e8ab284ff34785ec292f79610de5fcf3825b32
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


