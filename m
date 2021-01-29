Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829AEC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268C764E16
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268C764E16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPy04HLYlFHuLCMkXEi5V26oHVPN848c3glnjFFOH5E=; b=f0yLA0Uj9cRGVN0avp8ruy95u4
	FUXOjJtsNI0ZgEwnaWSRthf8khOryzd8nJSPFct14GPI9OjuC6Gysi2c13UzZ/u7NaLbvKXDS0P43
	502Hr2TinKB0jmD0TJ11XuNZXuR+p3cit20lJ0k0UDSpOvNTqyqDtqzVAq49qjID8NbndE25PPO+O
	yfYa3d/wYxZREIGaJJ2oAddf/5UPlBgFwWXbDKCm9fnpBTuUp00jNpN71Em1ci4LTqH8kk1SqwBrL
	yaUQRA6ieI9wDw4EoVs0dEU4F53pNDMWQoHudhTrxrBYPxnmLj0d2YmJJMUvIayPrmt+pVrkrtixx
	+RtHUpJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Pyx-0005Dp-8w; Fri, 29 Jan 2021 09:22:23 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pyr-0005Bb-Dd
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:19 +0000
Received: by mail-pj1-x1031.google.com with SMTP id my11so6177297pjb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9H0VWPz8wiYo1vl+Zp0v9mb/8mhCfmwT8QuSRQSj+a4=;
 b=ZL6ApXf1MJHPcruREJZRL6mdB9TndAo2tMo4Btp7v0ajKQc2vN/aTOM0MaWUwL1qC1
 cvGLC42n0bfWlpXKwspCfCVrnSxGl0WyVAdDrfTm+537tjKKObNs47sFN9bfPxhW6+aa
 RRxAg4wTdC27yI3gjX/KiK8Y353GzyN1q6tvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9H0VWPz8wiYo1vl+Zp0v9mb/8mhCfmwT8QuSRQSj+a4=;
 b=naSWYROKlhZ4uZ0iSsZ6mVn/K8e8CygenJJeUO8p3yvx2Dk0wCL65jaGJBzSOX29pr
 +24UzRqylOR2r9exnt8ximVSaTTr9h1/+5iRGx3CFaETV3VZul17ratckeIcDNxgLRUd
 J2nGmc8RDIWWg2ShRbj+N0XParIhs/EKkOtWyZrzx0aBfqlpukI7l2mxxvPrRFsDvo/e
 y1tj+q/RC5XXjMuju1oTYelHdM1dwHlZcbiJ8CX6/hsyTFIyI6pDLBlOsxmCvLKo71s6
 ksYygR1G6i8CoDKpX8sKpxa4munzU5GeDMiWLFwc1J2ZV5Cyo1EHYnPkGUtoWT/BZ+Pd
 64Og==
X-Gm-Message-State: AOAM530z5tmGv9Nig4NJub2IG2UySOnkjWiWkq9Ajz48I7cM0CBEqnoW
 oNY4qQW74QwI0iSYyuO6YFkITQ==
X-Google-Smtp-Source: ABdhPJzUtOvC8THdM1G12ENdxz/rSprng43n5BBvPsTEcCImVXomsJQr1Ml/rZ0yQTi1o7FmIV3qaA==
X-Received: by 2002:a17:90b:30d4:: with SMTP id
 hi20mr3649162pjb.41.1611912134871; 
 Fri, 29 Jan 2021 01:22:14 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:14 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 0/8] drm/mediatek: add support for mediatek SOC MT8183
Date: Fri, 29 Jan 2021 17:22:01 +0800
Message-Id: <20210129092209.2584718-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042217_606520_E0720AA9 
X-CRM114-Status: GOOD (  13.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
The series is tested on a mt8183 krane device.

Change since v12
- fix mtk_dither_config

Change since v10, v11
- fix review comments in v9

Change since v9
- change several function to rebase to mediatek-drm-next

Change since v8
- fix some review comment in v8
- separate gamma module for mt8183 has no dither function in gamma
- enable dither function for 5 or 6 bpc panel display
- separate ddp mutex patch from the whole Soc patch

Change since v7
- add dt-binding for mt8183 display
- base mmsys patch
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base dts patch
https://patchwork.kernel.org/project/linux-mediatek/cover/20201127104930.1981497-1-enric.balletbo@collabora.com/
- add mt8183 function call for setting the routing registers
- add RDMA fifo size error handle

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Hsin-Yi Wang (1):
  drm/mediatek: add mtk_dither_set_common() function

Yongqiang Niu (7):
  arm64: dts: mt8183: rename rdma fifo size
  arm64: dts: mt8183: refine gamma compatible name
  drm/mediatek: separate gamma module
  drm/mediatek: add has_dither private data for gamma
  drm/mediatek: enable dither function
  soc: mediatek: add mtk mutex support for MT8183
  drm/mediatek: add support for mediatek SOC MT8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   7 +-
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 198 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 111 ++++-------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  50 +++++
 10 files changed, 379 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
