Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF121C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:54:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D86C20643
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D86C20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=njLA2W5YXNjouJGn4tT7rce06k/0dTAayEQGDCp2xZc=; b=g6JZ8mj4kXEaRPrp23hMQ0ib+j
	PAYhnRrZAQhlnnqmY7KB1lCWsqGVUD9ayz79Dft9CAJFUY1Yc1SO+BkTHB3U7uxrD2/5mhyDeveP6
	13DvzMAgeqC8WqrLcyhucYij7FIVZcr23YDc9ANzEAUhOM8xZDoK64l3swCgIHG2b43n0br1pxone
	jSU62DCKv9Zvjeh4jV3NayJPlvcJ4AInVcKRxrKIhSx0XUdd3BGUiGmCnTU7xWAp3vtKMnNKA9Jjh
	o8AeDzQgWIpuGZ4dxW/0xck6u8dEuIi8IUemjeySXCRh5uplQ/1NoksG+wS1lQlii7ZiFjh0lvUmV
	OpAFPF3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4cqh-0003bD-1i; Wed, 27 Jan 2021 04:54:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4cqf-0003Vs-8r
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 04:54:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id kx7so543449pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 20:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r9/iygGEsbCXV7twHQtjrSpr12PzDM9c+Fh0z8xYuMw=;
 b=OztU7czy87n2d9gUaGyLG6kNOv+55ojXybNmqvW09YTEfhNZFSwkBidqBAcnqUBEHx
 5ik+VJOtGheuqOho7F768S0CkhayUtcioUenKzwaeN8rwgq3aeWd7Kf56sL2UOH3sVaU
 qjyMe9vw+Y/3V9tZF3dYSy1+IJQbfvfbZaR0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r9/iygGEsbCXV7twHQtjrSpr12PzDM9c+Fh0z8xYuMw=;
 b=rMfI/+Mkz6pjcArALP29pQUirAFhqsl4FjaB2Za5G9d+ESmPbXsIrzycbNN3ZNPB+7
 q3lM1AawR81jTKKCI7NnEfvBgn9qSQalRaMEuWD/auOoMEIcVj8PnNxSJLPwvJlJNiTw
 8kY/+ocKeOOvgmIb9eTCsXGc9v6HgkjbiXDP2p0X3qT0DKONIAvUYe1ZizsQdcCdLdL5
 mU7kqdaEFOil35cS0s0rfQt5PZi0QZTo2TnC+JIiPQgeF+Lyh+qJ/qe5vIi0yvEkzZwA
 0CHCxBMbn6Vo0+09S8ILb1VRtf1NB33FWsXvIEHUzLV/R1AAeDPF1mSIrDMiKUFJS946
 XCDg==
X-Gm-Message-State: AOAM530geLTfjCbQ+hPeKqRwuedV+LuB+GnC/JLgm5pTFF+cOtQbYFL3
 uLa9HcuAxqZvE/y9G/0tlHx7XsGKcfBt9w==
X-Google-Smtp-Source: ABdhPJw1C1zpxPU5435J6VcpDvDLiXPINRvaNkHHQYv/g9eHyTnv61bvxwVHrMY7s3JauV7WzUR0Bw==
X-Received: by 2002:a17:902:d4c3:b029:de:84a5:aaf2 with SMTP id
 o3-20020a170902d4c3b02900de84a5aaf2mr9326915plg.80.1611723270673; 
 Tue, 26 Jan 2021 20:54:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 0/9] drm/mediatek: add support for mediatek SOC MT8183
Date: Wed, 27 Jan 2021 12:54:13 +0800
Message-Id: <20210127045422.2418917-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_235433_373572_A7CB2E40 
X-CRM114-Status: GOOD (  15.13  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
The series is tested on a mt8183 krane device.

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
  drm/mediatek: generalize mtk_dither_set() function

Yongqiang Niu (8):
  arm64: dts: mt8183: rename rdma fifo size
  arm64: dts: mt8183: refine gamma compatible name
  drm/mediatek: add RDMA fifo size error handle
  drm/mediatek: separate gamma module
  drm/mediatek: add has_dither private data for gamma
  drm/mediatek: enable dither function
  drm/mediatek: add DDP support for MT8183
  drm/mediatek: add support for mediatek SOC MT8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   7 +-
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 195 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 131 +++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |  50 +++++
 10 files changed, 402 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
