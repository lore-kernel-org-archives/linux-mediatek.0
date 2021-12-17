Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93409C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IE6ogP2tlq9O/u+lsyiHYY8QPKKniuzfIBzGqVTa0ZA=; b=MzWWSZKcz8sv5e
	WvvLO0AEd8LhjUL/a18BjcbMlt9VAqozEgcuAVdfdAonL2LgBuppdduoRx+pYRZq3/5W97bUKoPnO
	TwI0IrkzHO617e9Vbllog3Kmqtn6PNxrwegktmUePwYQztJ6QwKuM5BKuEIinX/2v+bgjWzYRhpLI
	umHEWOxs0pHOXBwfSeUT/i3FoPsJqxxZFJghume23PPW2bsXeJEDvDe4BtMNzo0EzUrlpvbRXl0si
	Q+Sg/dhdeu8h4eH6Gpy93IlgvRqR8SoHvt4RV3ZKrRK/K+udufcHPp4fTMjkOuK7OFbS0cQsY9XOe
	oVCxJbsxyMFAnlE/os3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEs7-00AovL-CU; Fri, 17 Dec 2021 15:10:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myErI-00AoWO-1o
 for linux-mediatek@lists.infradead.org; Fri, 17 Dec 2021 15:09:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id o13so4588981wrs.12
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Dec 2021 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRgDSSqg18AtQJdN5DkiCaClvOYXgXjHhAlXiCj+Dko=;
 b=g9W7RWmQSPiKWrJn+NBbsAydp7P4fHv96fk9JDFNnEZKd0xTJbV+xi4lw0i+dtP0mF
 +x8kzwy9so76cfj/lNK7ApR4d45yQc6H+PAzl9BjXg/8uwuMTkAIR4lxnEjVFqa7aS9a
 uEVHevqd1C2jwwSWpSDmCZ3Wqzg5iqU5Xuy43mR8qTSrVoxqp7y1t/O4Q5AWVS5uDwDy
 0Q456yBlGCZ67FaFNplhPEXOa6ZlApxyBn/iw3U5O2t8OguH9N+PY1phi0b50U3GZVH7
 yZc56LZ7muWMqIR09n5kR0Hv8XC3TvPcVDZosDKdduy7ec1Ap3X73GxGG6GjFVaBm5Ec
 fmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRgDSSqg18AtQJdN5DkiCaClvOYXgXjHhAlXiCj+Dko=;
 b=m2LQhcHLfFgwJqLOAjA7ezY8yfsybSkbeVJd+bCH1jv8x4PzRDNj8H/gIUrvoZfhs7
 B+44ZO+g30vwVOcB9e1LzLfQhQdsQRoCQTmz1mi0HdX+bKkPgo1M7CAoFRFc1kIjaNCN
 SjJv37vsJPy2+xQ6rCEJcT+tVZzvoY4Pkn4sMci7ja6+13qKMWio+Z+0Ldoy1FvWBgXG
 Av39wOjOmE3m19DvN6/ucoOT35wCLk8jfYUg0KKd5pFWd+MqY3gKeyhJev/lcmIegVaS
 AvFitgAX0dycKwUlzR4df11A6WS+kC5EQGrlZP55/vYaQv1hPi+YzG0AlrE5zMIW1SsV
 Bz+g==
X-Gm-Message-State: AOAM530+8L6Z79/owFiwYrFM3F3CHkXJGX15RQ5mZtpMOJeQL7u4oXNq
 yk2PXPfYCyehlw7k6ShzVPS1Lw==
X-Google-Smtp-Source: ABdhPJzsW1ZAuSMTYzAh7uXUsc8BKNG+Z28cgFLomjdg1zeQ6UhSck5TG3zIkixQmqnJ5kgJap7lbg==
X-Received: by 2002:adf:f112:: with SMTP id r18mr3040944wro.655.1639753757614; 
 Fri, 17 Dec 2021 07:09:17 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:17 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 0/8] drm/mediatek: Add mt8195 DisplayPort driver
Date: Fri, 17 Dec 2021 16:08:46 +0100
Message-Id: <20211217150854.2081-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070920_184479_88C40536 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

In v7 I've adressed the comments from the community:
- clean the checkpatch --strict output
- better split up of the patches (some bad fixup were done in v6...)
- use of devm_phy_get()
- make the "ck_cg" clock optional as to not break the other platforms.

There's still some leftover comments from Chun Kuang as can be seen in this thread:
https://lore.kernel.org/linux-mediatek/CABnWg9v-QBAaJ0MffNNSKCNyd8eb1zhETxoZjxQ5c7FNeUkBAg@mail.gmail.com/

- mtk_dp_poweron() stayed in mtk_dp_bridge_attach() as the change breaks eDP
- That request was left un-addressed as I'm not sure what to do with it.
	> > Refer to mtk_hdmi_bridge_atomic_enable() for getting the mode.

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
v6 - https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/

Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/all/20211026155911.17651-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/all/20211029075203.17093-1-nancy.lin@mediatek.com/

Guillaume Ranquet (1):
  drm/mediatek: Add mt8195 eDP support

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
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3072 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  568 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  304 +-
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
 22 files changed, 4434 insertions(+), 82 deletions(-)
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
