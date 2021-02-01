Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F3C43381
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:37:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D706264E9C
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D706264E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x1MhIeNn3nS8Dlv1zBLEqp5bD6lVIJ8fj7PEzHL3TQw=; b=MNd9pU3rLJ4Z0EOLMJTBfrsb9p
	J1FSY5Xs1BPYK6cpHKmevwQPQDhGwgkWIYLvseMAr5YhMHTM/ZE9JHd83hKj3H7cC85JrX5NF3Bua
	ycdYcCEoGPJ/nEKwP8I+6bJsPoCmx3+1NFIstH2Lx7OdGawPlz792Ti68YRVSCok2j/0uwi8Fx6Gn
	G9jritWy1EI+R5whX/ZFoYy+aBe0Fr3zt0NfBEf9/2kJeUESiHygsCPMzbSxq7e4GaC3BxcHB6Cta
	k0dm3eUIFvwVhjGwbT22rJEApwZJLImoUySYlaHQFQTKSxAIDLIjF+1AefgTvOiS3FG3dv1Ki/360
	csxWwTXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WaR-0001dT-RJ; Mon, 01 Feb 2021 10:37:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WaN-0001b2-4s
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:37:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s24so10032516pjp.5
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/EH3fEWAPQS3Xf8crYapoATgbi++9o7dF8fi8itpo=;
 b=GvSpQ9KHSTEV3BtrFXzKZ3LVIY2dzpbcfAEmkcSMsAdAS2jsalfwuq6eL1iePNGt96
 gg2Cjr2vDVh7p+8JwUfH7Z0/Z6bfThDA8mpL0fWg5zUsQ5JXFRJt9L7pvBCHJyaRyGio
 i/6A3ji1ouqhJEhaC9dqkaMDSoPcM2xAoMTvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/EH3fEWAPQS3Xf8crYapoATgbi++9o7dF8fi8itpo=;
 b=jM9Jmi+bKv3ZmFIloseW0heU4P7/9mZjuoP/4nob07aoqj+8eS0ig/gNkq8LMx2J1V
 86VcaWrFS2PfxGaxNNUA5ZY6D5R2ARiXjbnu69yyIteExq6D9dYpehe1JQ7nKiE1dnNl
 eckCYgoL1WpFPOAGiQ6AyK9R27IlpWZAevyQAxpuDnSJekREk3TKf172raYjgIllP0Pf
 4tw2FSPmVeD/ZEUw2Myu2fk9CrhIXvAPnou3++LeaD+Etk8fTEku9MVIbKXhvZpubHkb
 ecMLb1ZawmVy3mLQVXjxS99cKcdUvJAqB2XibIgNJ7NBA5G5YixzqvIkrPDGWf9LlT0+
 ZaBw==
X-Gm-Message-State: AOAM532aJPzXWyn7ic1YwS5/O4Pfd2Mbv8JnHL9hEYFueRUI9DA+qljL
 +VgwU60rFX00WRRn0mFC9PHIsQ==
X-Google-Smtp-Source: ABdhPJxv3LXDVs7fBfg/uKaO6x5vyk1u6dhU+xMb6ixBUYJz8bISQZMnKJFdPHiRfCAsn90W3LZJRg==
X-Received: by 2002:a17:902:67:b029:de:c5e0:87ca with SMTP id
 94-20020a1709020067b02900dec5e087camr17600276pla.64.1612175852674; 
 Mon, 01 Feb 2021 02:37:32 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:32 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon,  1 Feb 2021 18:37:19 +0800
Message-Id: <20210201103727.376721-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_053735_225381_D9751594 
X-CRM114-Status: GOOD (  11.05  )
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

This series are based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
and following patch:
("soc: mediatek: add mtk mutex support for MT8183")
https://patchwork.kernel.org/project/linux-mediatek/patch/20210129092209.2584718-8-hsinyi@chromium.org/

This series also depends on component support in mmsys[1]:
- [v4,06/10] soc: mediatek: mmsys: add component OVL_2L2
- [v4,07/10] soc: mediatek: mmsys: add component POSTMASK
- [v4,08/10] soc: mediatek: mmsys: add component RDMA4

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-7-git-send-email-yongqiang.niu@mediatek.com/


Yongqiang Niu (8):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: separate ccorr module
  drm/mediatek: Fix ccorr size config
  drm/mediatek: add matrix_bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c    | 236 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |  17 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c      |  20 ++
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 150 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  | 166 ++++---------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  52 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   2 +
 drivers/soc/mediatek/mtk-mutex.c             |  35 +++
 11 files changed, 564 insertions(+), 125 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
