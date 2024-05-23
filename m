Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE32C25B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b5RaZkdxauaYXfbvyvKa6gyD2x+fNrK3XRhxpmIfkZk=; b=Z6KYa0bqLonKhW
	gwg1TPstJOqe8AwdmLcMI19f7jQclw/KPH63YpoqjBhK+wRTHM2+EqqMetAIm9vO46TiE2ZSk2U9K
	bcmRm9Id6TY5GaUEDKhFONRQLokNjCgAqW7+VL7wx+0iLMDJzLUl2beZWL9aFKvQrp9+rGxcZLQbN
	8f4P6CIPXj7r03NrNdmAY4wanWqHcDhPYZPXivrzovoomAylUu5j+LPrU2/LBfnSM4wem7i2gwNnn
	EG0+WtMOKvKEYKl2IMqG7OnD7Lz60RGvwB0hvH7qgTC+20Q+t+6hpbSuQarQX6sYuAbBOZVCX7njo
	poFMUW2SDyLAqLQ/gzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7sx-00000006Euq-3Gh6;
	Thu, 23 May 2024 12:49:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7st-00000006Erj-3SAg
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-351b683f2d8so1646572f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468565; x=1717073365; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5RaZkdxauaYXfbvyvKa6gyD2x+fNrK3XRhxpmIfkZk=;
        b=bGvLVZariC6U/7IH5srD69KrWdkcp1NW6MuXuFWAov6bJu+Qk1KNVqG+6ZA844VEsM
         q/3mxyb1H3LW5C/uvrJ8XLHtf+miHkaOhECLR0o50/Ywppdh1MwlrJZIf9kGqI56c7d6
         sVA9tgsnJkQPfHHZcXuB4dE0xUgIiMnQ70D5+x7yi4/O+F7LG1vlbp7x+bzUaSfWu3C8
         tgjXCc8UCxAIjQ8Bq6YsPlgzAWIKwr+ZP5/YZXzSu0jA2p960EmXDsgQKjQOU3Vkx874
         gWybKCzkj5wDAdrb4rTExbI6Qv4TYaSDVb8Ui+JQIhzBo17BRXawDjNr+msPCLXsayg3
         B8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468565; x=1717073365;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5RaZkdxauaYXfbvyvKa6gyD2x+fNrK3XRhxpmIfkZk=;
        b=QlnotmvQbgguRx/F7pxrW0dL3elm2833Bq1uAUs1SpljypSc8cgYsigTYySTMcrMQT
         vmtnWtoLjrc/vaGCljLOqwVqPLjsUUiPx7TqWkM07/i9WIoE+tMD4mk6pnJ1/Rk6LZDK
         Ie860ckOaH4IJ6R2DKa2SxbVE23ra7yJat8yTDKG/WcHxv4D4aPsVE9P3JD4l+eqBLnj
         Gan+1Kssw0ktfmnzu1DlXd2P3wqpdYfNfprv24m+QhQ6xqwQqeFiE8kBu2akp7WcNWF0
         XuLxWjtUJ4VmlSDWSRMiwhdslC/e1svb41XtMqySfTin5YK1MQLQ4PbpuHxavq8kGKOZ
         lEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtSQ5FCxcP64yJAXV83gf5Ye7a1iYlpKXL+1ROKr9x6F3Pj1P9nc1uDqu7RllKQFIknfZIUI2qMMN3OiVuBxXJW8vHSnOODIMM2uO1e3Dkm7G5
X-Gm-Message-State: AOJu0YxsnmteIRNZEekFM0nFAvnXnL4Yx83LHQDsQNiDs2MPBD4bcQ6+
	ckIL5muBjxY6bCFcVGus2F69EMZWmg6PTMgb5Dw7mikgXH0L08MtqwYYTwKm540=
X-Google-Smtp-Source: AGHT+IHqEiyqrTp7LMxvNs2yc3pjoFF6b/IfjewpD+KY1pkilwCf+jGNlrljBdFDIaw7VPg2BoJfJA==
X-Received: by 2002:adf:f509:0:b0:354:bc5c:6963 with SMTP id ffacd0b85a97d-354d8cccc64mr3588960f8f.16.1716468565082;
        Thu, 23 May 2024 05:49:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 00/15] Add display support for the MT8365-EVK board
Date: Thu, 23 May 2024 14:49:13 +0200
Message-Id: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEk7T2YC/4WOTQ6CMBSEr0K6tqbtK1hdeQ/joj8PaYJAWiQSw
 t1tWRoNi1nMJPPNLCRi8BjJpVhIwMlH33fJyENBbKO7B1LvkieCCeBJ1Pk4tHqm8TUMfRiprSR
 XBhhKfiapZXREaoLubJN7I8aR53wIWPv3tnS7J9/4OPZh3oYnntP/GxOnjJZWVQxdaQHM1ei59
 Sbg0fZPknGT2EGIhACwqFQljRCnHwjYQUB+AaBUDehAfr9Y1/UDgMizT08BAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4708; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=C7fb6vzetq5ZU7eJKZoB5RoOcLjPpbbNJrU4NnwRSZc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztT5Bhxm5XHOggjDXk9dLGPF/rwS5HRGXuNUV8E
 eM1x+yKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURdJyEA
 Cg3bDewemZXZpwMZ+hzD3CnNlWwVQriRJfA5CX9ph6pBGMPNiCEYY7KANNRnxaoUIl7MNQEclY8ejc
 y3Q0AXGTTlWOHpaggbs8cbHVjo+3aog4DleQAlRZ+Y2zCaEt9GQrnrVnAyp4iUDB8Z9KHK9YXUb4er
 ImGYYDKAbGRoa31tg2Vm7zgd5aGwTfqdkDHaqIcT72dvC+4QPXXxwodYR8joFiiGooWRgX5DmZ/+Ur
 dimhH6AlR5y7lXCKyqGF8hVMHwI8s5fNWpV/IIE/av6jKl4o5893ShBb+Ygl8fSvETaI3atvD0WiRH
 hwXDAWeK7gw63JOrp59psmbfmXI9LepAg0rdCG0WZI2RM2OFGee+WyoVI0NINhRWC2WzdM03f5oelC
 1K8ptO9Q7rvO5r4TGYdF23reILcNaHhGgvVGXTa+IpUzi32VH2ZCv6NlG1g+2CR1QZZlGW2ZOU1yyi
 fi0WwWTzydOo+uV/YrO06djxYOrDdO07aZPmHcagUb/A9c1+sgUJG8udE20+Hy9+Lr7kOHg7nbEH6c
 H4NVpjHKjkM5GqQn4sJvKjozTxapmOiBPLzzHHC/DzMv+EdBFgnsptY8lEg5XZagqMBorrKNjEQIc4
 MEewmx6cVDHOFn33OkHzqitJKWDriemTrwBBtqxZke/24biWUOFfqIsoKWgA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054928_166255_1368E765 
X-CRM114-Status: GOOD (  16.15  )
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
Changes in v4:
- Rebase to "next-20240523" branch.
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

[1] https://lore.kernel.org/all/20240521075717.50330-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/lkml/67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com/

---
Alexandre Mergnat (13):
      dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dpi: add compatible for MT8365
      dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains property
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   9 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 14 files changed, 602 insertions(+)
---
base-commit: 5fe1859247a981fa491507de2b1ba63e84addc38
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


