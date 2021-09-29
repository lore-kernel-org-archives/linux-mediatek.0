Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EE5613CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70EE5613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlp0ghzLieN9o4BajqQ9dvzxJ/vMF0Dbwk+vQ0A0W3M=; b=xDR5wInLjGHv2t
	tpQTCoY6OioScfC9RbLODVIFyIDlZBkI2r50iK6diT6q6EfEF43O6JW7MyIUNHooGwvt7goXW0oHG
	NhPtWR2tUcQwH9hRnlgl9YyCpyFtSy09EQCogmjx49nJt3CvTes8ViOb+kktfyOHqLs8JjnJqcq0Q
	x6s0E4Q0MLeL5luyGorZKTRxE0WxMN2TxlCZopw6vxGP6wIKH/v/VUanue5LAVAcj8YidpBRickz1
	SQ1HrW+reRRjSK0C5NTHCv2x6024Ofx++yANsdCCPlJUi6XHrj9OZmM2LE8iag7xwutXt9i9g3x6f
	kBkvhN+o8WaEbHqjxXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWBD-00AbYQ-1Q; Wed, 29 Sep 2021 09:47:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWAv-00AbRO-Fp
 for linux-mediatek@lists.infradead.org; Wed, 29 Sep 2021 09:46:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so4687006wmi.5
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Sep 2021 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5haxGK3EJ+q+eJBrfkQ+eXhJQ2te14AsLAThAn2/8Q=;
 b=GziBT42uEBOyxTzL3MaLFLjTSpM5GZ9m2UQOkiE75vbYPWzTSFqMlUjv4x4D5HYAoN
 QwBr+zUU1XejkIQKWoZnvkT4pFWTECoV3XgIrcEemykomZkZ7xt/WMmqln8eiVubswQq
 KuG5fmoFhWnutqjVSFovI49AuaLYJ09W76/V3CS0ln9hZ6xgxdZ9xZWYn2iGUpuIjdEZ
 Bad0A6WN0XbKHA9Kp44/IZhZ/oYdoUq/YNzJYPft46zClckn0whCBWJNnxX8Ly43+EHn
 29Kzoakw/o95HU2e5T97r24sDCO9cz3B/c6nSprzQ1AmNSQzgXm57ecT+4Q+RnZFrgkd
 timQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5haxGK3EJ+q+eJBrfkQ+eXhJQ2te14AsLAThAn2/8Q=;
 b=LoBXKcZDZ++Vh3y4PG4eiOP69l4LO/9R+BknXKXpx8m1whM3k3MuAO/MDI64pk5i7w
 RE5J4vnDLpjlkq02ie4vVgP/3LRcgY68x50O6pLBDN/cijBanDelGYxhDy7tf3h9weP8
 xBI9n7PGXS2Ugjd6aZzeLjdZCPl8YF2a0NmPVIZpIrciCGQ1D8vDwt9eJo61DeTihibX
 UB/25BsOvAhSLZYd652OiOz4qxIrKeAE0J0bLts4uR5y1JjVEIdwto0YhXXD0jHDdEp0
 29nPAXY3avdQsgW8EsJqEbLBNi8cEFf1TESw1StA1/RA514zpUajd2eVWrdS5hBzdlSP
 hc1w==
X-Gm-Message-State: AOAM532KYE8D8j/x3ecORH0bJpagL563aCOuegBn7kakODv+cbXVBw3M
 iX8cVYpknSRWYKcAniRSJEmouw==
X-Google-Smtp-Source: ABdhPJyC3NRopicws5HthIY5FLBG0zqnaCsUFBkWGXqq1xclPoxEY/0J3XYfc2dYChiazXINnZJ7WQ==
X-Received: by 2002:a1c:4c0d:: with SMTP id z13mr9140521wmf.58.1632908811439; 
 Wed, 29 Sep 2021 02:46:51 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-2cf3-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6240:2cf3:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h7sm1751938wrx.14.2021.09.29.02.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:46:50 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/4] Mediatek MT8195 HDMI Tx support
Date: Wed, 29 Sep 2021 11:44:21 +0200
Message-Id: <20210929094425.745-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_024653_567625_E2F3922E 
X-CRM114-Status: GOOD (  12.52  )
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

Hi everyone.

This is an attempt at porting the HDMI Tx feature from the mediatek
vendor tree found here:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2912413

Note: This patch series is currently tested on v5.10 and I am currently
working on testing it on v5.15.

This series depends functionally on:
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Guillaume Ranquet (4):
  dt-bindings: phy: Add binding for Mediatek MT8195 HDMI PHY
  dt-bindings: display: mediatek: add MT8195 hdmi bindings
  phy: mediatek: add support for phy-mtk-hdmi-mt8195
  drm/mediatek: add mt8195 hdmi TX support

 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    |   45 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |   98 +
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        |   70 +
 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    4 +-
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2293 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  128 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 ++++
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c    |  793 ++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h    |  204 ++
 13 files changed, 4524 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
