Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A72AC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEF8FEuNLVayQdE5QI9MaMd8Q/7gQJSqUO9M+81Oa5M=; b=jDC8oFc6flFToBLJ6/D5FN7cuc
	ZM9P4AoRZ7A6Nwl0iFPl+3J1mKUgbPe3br0vmc55WDSeaA9pZOjx7Rft1k7T6REq46P0dRrNkgGon
	mpxLZcdcAgTt8xgp/HxdJfJoqGfo+aZX4VvLIG5f1feCNsf6nFDXpxrQwJlI4xI6Mx93EDMOVmNGv
	haEteLNeff3/lQQ6AvWqIcAAF6N1g4DnSf9ym3mGLHDK+YkDUfzLs1Xsmk60vu9dnWgIW7WZPFz31
	XDcLEbE1P30GZxtvnFcADNAAM+8WhcMxm2ojD+wwiOsFwnHAmtvOUMNLOysx40aFwH45s++bOuKvH
	dfDIeH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDa-00GqUv-OK; Sat, 18 Feb 2023 11:17:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDX-00GqSk-Tz
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 11:17:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id e4so187017pfi.8
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Feb 2023 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEF8FEuNLVayQdE5QI9MaMd8Q/7gQJSqUO9M+81Oa5M=;
        b=IaruHdGy8cyFLDUGIOX5pZOCfDLvKQZpLOUwXva2yFbitViwuTKQidiLFpOtPWhzcu
         suiJ6uJgAz2TngEijk5zQdejLa23H2xeo9jIswDVjTdRDMV/LGUV9eYlX3+ou4kJqg+8
         Pi9/8dmPnYdds+GD+VqOdlM6LCxjqZ45E1Hbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEF8FEuNLVayQdE5QI9MaMd8Q/7gQJSqUO9M+81Oa5M=;
        b=7qBXe4x8zbEKdU0omotBBOxGaTSqt/C+ug22AH/PqCPOyrOPEAUn4UFmRA/j/0idIG
         FnHZdoaHqNqXgwaajM1LW+eSa/8xi6otvIbGF1AePni//iYRTM+YoEdPRaKzMW2BtBcH
         3L/jm+sBhEAalYLiRJYUe8jnGqcJEqBtNqFfQM4uAnOqVy+LFrXZDoqjKu7kjTyl5mU3
         2ZYB/iUWqOzH8WEhadljcDYWaDGPa1SVwOeSqwRMP+hf5KvqtUf8J8aJyfck6p1o86MS
         MV81P8ViZPaqt75SVweno74alDfgdlvzUBpu6guBWqDL/nYRBi0OYbzGRorbOmCLM43G
         uzmA==
X-Gm-Message-State: AO0yUKX9wmtM2yfPLv+JKnts9P9mxsSwZSsWZLFJSZnwN8AjimFKG9S5
	n8afj+i8dXhm+QLu8ZUL5/5bpw==
X-Google-Smtp-Source: AK7set+WyXQ3bNUcWSBc3Z7xIjr8Et8u/2+vAwZMWp1xbM5SWXK9wjjgnemRxkn9IVSvnVIBAgswew==
X-Received: by 2002:a62:1b48:0:b0:5ab:bf5d:a0d1 with SMTP id b69-20020a621b48000000b005abbf5da0d1mr2435384pfb.7.1676719041279;
        Sat, 18 Feb 2023 03:17:21 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:20 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 0/5] Add generic-display-mux driver and bindings
Date: Sat, 18 Feb 2023 19:17:07 +0800
Message-Id: <20230218111712.2380225-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031724_053087_3C25F301 
X-CRM114-Status: GOOD (  12.69  )
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

This series is developed for and tested on MT8173 board, and the layout is:

                                  /-- anx7688
-- MT8173 HDMI bridge -- GPIO mux
                                  \-- native HDMI

v2: https://lore.kernel.org/all/20230116110820.2615650-1-treapking@chromium.org/
v1: https://patchwork.kernel.org/project/dri-devel/cover/20191211061911.238393-1-hsinyi@chromium.org/

Changes in v3:
- Removed ddc-i2c-bus in the gpio-mux bridge bindings
- Added .get_edid callback in generic-gpio-mux driver
- Removed .get_edid callback in mtk_hdmi.c
- Modified anx7688 driver and binding to add a .get_edid callback

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings
- Dropped attach/mode_set/enable/disable callbacks
- Fixed style issues
- Removed the special case for the HDMI connector
- Made the driver only read the GPIO status in IRQ handler
- Rebased to drm-misc-next
- Update the license: "GPL v2" --> "GPL"

Nicolas Boichat (2):
  dt-bindings: display: bridge: Add GPIO display mux binding
  drm: bridge: Generic GPIO mux driver

Pin-yen Lin (3):
  dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
  drm/bridge: Add .get_edid callback for anx7688 driver
  drm/mediatek: Remove .get_edid callback

 .../bridge/google,cros-ec-anx7688.yaml        |   5 +
 .../bindings/display/bridge/gpio-mux.yaml     |  90 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cros-ec-anx7688.c      |  24 ++
 drivers/gpu/drm/bridge/generic-gpio-mux.c     | 222 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  53 +----
 7 files changed, 365 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
 create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c

-- 
2.39.2.637.g21b0678d19-goog


