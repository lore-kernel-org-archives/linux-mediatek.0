Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56097E77199
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kvP0ocu2x9LxWpCJ0lPf6J7peYpI/SZfaug1iJ+9w/c=; b=iBiihpdA1YtYyf
	owY2cgschOaqB6T6s93jcsIefm/cqPJEa9NJoknmMLDcWdjAo8WzN/JMsiqdq1u+iyVPb2Xn7dZhV
	Xp1GxR7aAUYua+RqYFr3yOpPdwkEC7WnDKKUgA0Slk9YNxIKs9035g3OhfGCDw9XmKmjKytbcJLjT
	7/beCytCfATpdkJKW2X04lwLe0cubyUWJB72gbQwvGr3iEvYu+CUJq86uiSGfNUBSwluB93F49AeA
	jLCkkvK+1NopdNawUU6HONPkAa8MugWVjMXQ+E4HlGssReYJGN7Grgyd8jI1gali8vumn6kz4wJ53
	/dICOFhf5/myF/UUM8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvO-0000000BYvc-13eI;
	Thu, 09 Jan 2025 10:38:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvK-0000000BYss-4517
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso730757f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419077; x=1737023877; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvP0ocu2x9LxWpCJ0lPf6J7peYpI/SZfaug1iJ+9w/c=;
        b=RL21D4kD9ENr0xWXH1wmXzriFDhGNV3CRbC0y0jS8ldKRLmlLgC50k7ar97sA1ymN+
         FOq8fxDBaWsgFvM0LaTHiKNaXO+OIvieuY2WQyvLHDsAoqCdtqe0OtvrbE0WuPkFw89G
         1AzE8XHEln0Uj++jLCkHvrPK7stanTrBd1aaOPnLwSe2SX0CHUAXGociFuPB6Uqz8wLq
         96f9LcVnJo3LuQF2uwp9mmLypgesATahzz+/z3LA8NZ3ELDvoiVia/TCpnN2ndwBMnyQ
         DqaD74DVYlBdbk5ZLoBBokfPvwtjBE9NDwTj9Nu1typ0jEuaWAJAJEOVcs83MCrqZ6Qh
         KwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419077; x=1737023877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvP0ocu2x9LxWpCJ0lPf6J7peYpI/SZfaug1iJ+9w/c=;
        b=NtbVIlJnxvj8BrpUY82q9VgvAD7Qu+P3GPBg1kHLjGMKNZbPS5l7QanihGRNjKa4aY
         E3ooR1nQtcAdfUNqxMEzkleuj1wZSEUogcVYiod7/UE3EJ9k9tmqIOUfEsY/ftkvCuH+
         xNxXUAIi2Y97uWKFHEugxXOMo7LF36GrybJU/bGJqi4pyyJ6m4S4qJtbaEZcntH1dMNq
         vrqnMasZkC0WrjNlyr1vNc2yI/sOgP+UlMVPwjKqtCpt6jtDKclc/OjT7hbDfVls8a1s
         +7iW67n+olephA0JDiRB19YejaVJu7zLL/cWupXn+EqikCLix4SyNOYcev92BvODi6rR
         D8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVdW2dG8/ez2Ax3bnJOMEQXfQ1/7u4S+at3e/vJraCylK5Dvk7zUA2L/8nxrJoeR3CSeSBIQUAk+SChohGIwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/kZk17eoC4cNsR5B5h3CwEqDmUvhgf1RLSRff9va3DtK1akVN
	oHX0Sp0HUQCgQa+qMabWH0+XVtXBQ9l4/l4J7xKUHMQ/FeQ9/R04UmmNeFWwe50=
X-Gm-Gg: ASbGncvhnde3Iv1LbcqnAsyW2E89UbkkufwdafW/TUIF/+1AbPOktgfcvzk7OOglgBB
	CCU5FO+CtURUyncqSzuvc/1XzqJs+ko8S3tET8kUz4cMav30/7Mrcy6wmNIYdlADktJFwmnvKBt
	KiCnl2KcQbQn73ho6GAfQRWu1HQdpDaSV0KEBNQlWD5lJKXxOGTvbHJn1vs3/0B1suKGHCehXFb
	wVL0BX7oTmLo8oBgfShnUpSw68wObydg507RDFaJZHCSzUVAIR9UUODBFM=
X-Google-Smtp-Source: AGHT+IELISNupppx9cpb1vt/cvn78T4nSBa0V2lcYjTg/yWhc6hsXOTZsMaI7GZhDdttTDbY9woIRQ==
X-Received: by 2002:a05:6000:188e:b0:388:c61d:43e4 with SMTP id ffacd0b85a97d-38a8733e1d1mr6226842f8f.45.1736419077066;
        Thu, 09 Jan 2025 02:37:57 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:37:56 -0800 (PST)
From: amergnat@baylibre.com
Subject: [PATCH v6 0/6] Add display support for the MT8365-EVK board
Date: Thu, 09 Jan 2025 11:37:53 +0100
Message-Id: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGnf2cC/4XPQW7DIBAF0KtErEsEDFDSVe8RdcHAuEZKbQscq
 1bkuxeyrBx5weKPNO8PD1YoJyrs4/RgmZZU0jjUYN9OLPR++CaeYs1MCQWyPh5TmW5+5eU+TWO
 eebBaOgRBWl5Y3UJfiGP2Q+jb3kxllm0+ZerS77Pp+lVzn8o85vVZvMg2fd2xSC64Cc4KiiYA4
 Cf69ZYw0zmMP6xxizogVCUAAjlnNSr1vkPAAQHtCgDnOqAIeu8KfUDoSlB0ilBa16HcIcwBYdp
 HLsJ0kjQ6MP+Ibdv+AHiBVkDVAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4582; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5W20fbwP0yhTIUIzD2O+qubY2IKKztoY6XqDzHTN/WA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDRer6L3Rc0vGaMU5uZxT0/ejYevQOTzu/HJeH
 Ks941jSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURXhQD/
 91oMqYVb9qFaO3a4nvPg4BgsRIOKAlp/k2j/oAog1R82dSHvSmW+nTJP2X7XS/8splBpYt66wntEoF
 io3+5iwRWMcb0LjWABdaGN4jZhG8yObMzEc8Ql5WEJP/2GzyDxG3fovBzHoFrVtbdGJ1OvC9MsZmo+
 srVxSohOI2YjQBH1NPs/l9v2a5WlyX2fQj4v7L8C4d752AMIka+u8ZTCPogXaiqDb3jC+g+K301MAu
 RiB+ICA6byAyedx5yb7oIxzB6in7wrbMr4WB7NqzqjOekB+IJLpgUmxHAVVd28ph64xDQ1vbJdu0wf
 f0GgplTq6gqDJW1RSV2lsPkyj5K0G7D/Uo4LAGpEQPM+R3k6usuUvs5jZXcwMFIIxuqTaTOOreTBOu
 Z2kMh34kfJGNYm+boGkgmAXXAt9WC9kZ6IXyeaVtRnvdEVbKJurLtLyN8HSOuHbN4FoblAl8I2ZXgg
 g7r1ZaTPPh0+CrkMrGpjceStTtXXa1wIU0S8om9hOuBiJusYvzfj9T/9SNH4he4/tZyBp2iF4sjiGT
 bQ0f7kNxxvPNbtApo8ej1OMKP+ON+HU+zLebikjhYP2RmR0f+66GaR362QTkhXgASRhDWjWcO+SJsp
 UkpxYiLxkCGfMySK89LUfFmdKOOUNs18pnDbC1v3ugjsS/YSLX6dJ7iSU4Rw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023759_006314_50E902A6 
X-CRM114-Status: GOOD (  16.36  )
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 6 files changed, 586 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


