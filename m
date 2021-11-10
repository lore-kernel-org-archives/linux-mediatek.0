Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416CD6115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 416CD6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yZ1PCMRphs3mJo7YAAorK5XYJE+ypkVufp04WmhIvLo=; b=t5myu7kYBxo7Px
	92RSuWw8qNXYWPFe4sJyiCSwnHBpW6nnqtAY4Vmgi7FvPxOwoMJF7hFbB5oUuWvbHluMTPsSgmEwL
	tlb+W+lm3WkrkI/vGC+8WSPC2ZSqeVqZ9HAQBIA5rP1QaG6lhahL0nFs+IeKhz7UhPOzWC6cJfAvS
	qB+rg5N+3JZOU7BkK326xe5+siex9zdsNBNxy6/1UeO93OGL7QjkXRGaxhKiY8Ap+RtQSNCDhHSlz
	cH/FX916STmXN4l/RLXkiCdKwTp/A84Nu548Rlu0LnWivQ5jNRpgf86VL+yJ3NIm1ASas2rBEWcON
	X0QYNZ0Ji0adQ9lO/OIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mknJH-005VpG-9k; Wed, 10 Nov 2021 13:06:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mknJD-005Vmd-CP
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 13:06:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o29so2112843wms.2
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 05:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/R5WPqjln3nc2cE/XgC3/Zu8HpMWzsNF/OUg0G6sX0=;
 b=WKB1fld8Gzbx/Xx9SkyZ55FCgISd8UO55Z1e+eaABxhoJ/6+PVunlvJ4IUL+1vUe6x
 uU7z40k5hVy3n41JotRjUqAkQPJ8U/donDJwarr2G6MqJxm/TPEhVjOATmw87Ywfh3Cu
 LvDjGpmGWxdR9ZaFKUzOWp31iFidcS/LCC4MZQD7+vPmVG16OpDl1tN5CLVM/BB7kls6
 45cjH4rnrJayQVsyzYOUIjEvFyDseS5LKJcwrg+/jvTZoU8mkisuobGIDxRbxP6FhrbQ
 zjENHSQXJ1h3+SO7ikTZ4Q5KZJHmd1s1eaQp7uBhKCiTLMpS1OCETH4jqNR3JaWzQsE8
 o8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/R5WPqjln3nc2cE/XgC3/Zu8HpMWzsNF/OUg0G6sX0=;
 b=m/dJ/OOYRV7JuH6W+KrZCZFAdUME8cli5ARhZ9EweeZWyPlzbdq9ycJ4OMPMb+C7UU
 Y2FUMbADH459ntxHMDy1ZTwUTfKXM3EW1sLFCsxA8GFtOKqQZDhVikUh1W+q169bk4S3
 kai4QqcpwdNtdppaJaldUwSSkLsE6KEkyFOjWX+1U/0PNS1bp/uFDKW24+fzP8UY2PId
 tHtKah3FSEoDklPn0ljyGZnfxTBVWdtuRpTMZoaLYcfW6IXMxF8qiuxhRvv9jNU0jAYu
 QLPlBLNjTn7r7rnNTC1pvIC/r8VpEXpr0fanTmFRqJQKpDKaaRSpLyD4siQp+eLQ861b
 Pxzg==
X-Gm-Message-State: AOAM533Ocv75fXlFtS1jDY2bPAmjIlfG2jYyqtDChKdqBHIqVMD+n2H+
 1I51azd6UN7BMleewy61PAINsA==
X-Google-Smtp-Source: ABdhPJzmzoUAKbBG6J7RHIBNHsZBqw0XMLOxshKlv2g/z1+1yOqxvBG+zIVu1BX5ZrbRaEJCISUfqw==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr16312420wmj.89.1636549591866; 
 Wed, 10 Nov 2021 05:06:31 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id i17sm5952175wmq.48.2021.11.10.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:06:31 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/7] drm/mediatek: Add mt8195 DisplayPort driver
Date: Wed, 10 Nov 2021 14:06:16 +0100
Message-Id: <20211110130623.20553-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_050635_514205_D8832C1F 
X-CRM114-Status: GOOD (  14.20  )
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

Hi everyone,

I'm taking over the subject for the time being as Markus is on vacation.

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

In v6, I've ported fixes from the mediatek team to this series, which can be found in this
vendor tree:
- https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3252762/5

I haven't taken care of the comment made by Vinod in v5 [1] where he asks to use phy_get()
instead of fiddling with the platform data. This will be addressed in v7, Sorry about that.

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/

Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/all/20211026155911.17651-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/all/20211029075203.17093-1-nancy.lin@mediatek.com/

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20211021092707.3562523-7-msp@baylibre.com/#24546569

Markus Schneider-Pargmann (7):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   87 +
 .../display/mediatek/mediatek,dpi.yaml        |   11 +-
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   76 +-
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3094 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  568 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  296 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  219 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 22 files changed, 4452 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
