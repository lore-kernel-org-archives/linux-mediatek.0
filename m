Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42075C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0269860BD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0269860BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNAoV3OWlP/SyZDANq3z/qFqtS7CILqaF8VXNYPip0c=; b=SMG1TwAZPPOyYo
	21CaZ3vf2okRNtRnIM0pIB5mdBmAoe2TrWBGJuVpKuKAEPwdEmg/Vqw9jXHdkSPoPb/Xxsbvh384m
	THBYapQs8AGbdRE3eYFQAqi3UXM4GRQUccfYAdsJjvBz6NJJJjiq4mCWXC+MPxwlSksQmFKmuJ5hH
	+TftdMf8pS7ot+jDnBcKDq4VTzhrMTUj8SBq3gnYln2QkV9nBjSrRxYthJws3DyaPv5FS2qNWwbX5
	qkoXOEp4MCND5vgjh4WoSCrbi4r5kq0cyU6fjsrdPpSqzUFra3zv6Yj+NhSoF0X8nZQikfGqs3Kn8
	4Hm093s55l2hm5vzFS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNKQV-001lUV-Ge; Mon, 06 Sep 2021 19:37:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNKQR-001lQj-Kt
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 19:37:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id t18so441040wrb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OTlNHYsCEcnge+pru6u4BNt1gvCAE0oKZkXh5DZT9jg=;
 b=LMqGvFIvlYO28zkJMzCHV1c/99V9BmmzNoU83XywKFwRtqMTh9MaSLOcl4Cy1j/OBa
 21kXlWSdnCt6GFHNigghuHYwDqU8Qfm6/tLdDpZQy/Ci2LC3J68Ly1kUooXYh1Y/HvOZ
 Q4IZvxMnqfJQjOJ4e3/x8NiOcIUBRqyj+8UoeQOZvK4js90AopX2KjOtG3andO+/RO0q
 3AHr4zdwg5egHkSNuH7Teaa8sUMDhev2h67YkxlQf+HjNCL8yTHi70FgITY7Atej2oS9
 wPjNOVKT+aLZSQDLyPBgBLDtNZOX5ibfz/9Glad3lHRnrKPD33lURFgCP9xtr+dxZUYD
 J/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OTlNHYsCEcnge+pru6u4BNt1gvCAE0oKZkXh5DZT9jg=;
 b=q+33l6qRQh7mHI1ZC6U05W+ILk8UQ8XQIW2HCNYlJeSqhNbX/+YuHxkDTYjUk2gPvQ
 in9QmzMaDtNHTRos+MAkR1Fo6a0AAEOUgxtNRUeG6riVXfYc2YhwUtjvAERUdHQean6t
 IObb/hsZVd8mrXmsYIEl4Ig2/J5SN5h4nhbnbHkjW43wuKmIneHmDDVgetV2JSg5Q3yp
 nQ2PfeRbLzqfN5Y+oGCji7tjwBcWvZ0tV4v5eeapDE6vvTfP4vElnlC5KubT96DeUkRg
 65ovBUwscK9VaCgTbkh6jel3Vr/J+9fhZEmxbCaONkhMxT1gjTRQYalLMPo7BF0v5uwn
 SRcQ==
X-Gm-Message-State: AOAM532gewlZKDBPuLJee4rSoljhJ7d29Tg+XuCsi0lXhVqrPvqT+ui2
 ZvAaUg3mxj+VenjCb4dOcdaXJg==
X-Google-Smtp-Source: ABdhPJzM23ncpLSMXzOVQEtFT04UY7liIwsnhRoTeDNFJORA5eY817jki9SktRwp+ctoIB/NTJnS5w==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr14823918wre.29.1630957021429; 
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon,  6 Sep 2021 21:35:23 +0200
Message-Id: <20210906193529.718845-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_123703_746167_3D931F58 
X-CRM114-Status: GOOD (  15.45  )
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

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort driver to work.

It is version 1 of the patch series following the RFC version:
https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/

Note: This patch series is currently tested on v5.10 and I am currently working
on testing it on v5.14.

The series is now based on these patch series and its dependencies:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Changes in v1:
- Added DP binding documentation.
- Addressed feedback from the RFC.
- General cleanups in DPI and DP drivers.
- See individual patches for details on the changes done.

Thanks in advance for any feedback and comments.

Best,
Markus


Markus Schneider-Pargmann (6):
  dt-bindings: mediatek,dpi: Add mt8195 dpintf
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpi.yaml        |   43 +-
 drivers/gpu/drm/drm_edid.c                    |   57 +
 drivers/gpu/drm/mediatek/Kconfig              |    6 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2881 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  580 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  248 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    3 +
 drivers/video/hdmi.c                          |   87 +-
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    4 +
 15 files changed, 3958 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
