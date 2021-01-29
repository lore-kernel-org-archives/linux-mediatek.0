Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B488C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE7C64DA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE7C64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMS/1vFJ0gPxldSbeGge7Ja19iwcFP1Y+9uN4JbeGHI=; b=NJyh041OlU6kbrftPauHHSSLeP
	YCesk/jPmqwGuZOtVUzKgrMk9HJOznSDZwdG73+17IX9jITPcSULH0aTnHn5sYp7AX5nYXTWyPtjK
	WfKWNx9AYoIJG3MKQRHsuN3GtV9ZmdzlEYXv1mL3mimKhuRAajXU3/RZsoSnJoKoU80SrnQbT3k2Y
	9bygi6F0IUIH74HL+/R4UNtMoj8Hg+bLxpCYGAkmfMGhx6hKCrAwRtZaDf1+WGvOhBvkEsQ7krgad
	kVlUI/9j/MmyAGDZNPmHfod+LAFZqsnfCthLtE4isgO9r+dGQgZGIhIgYOAghWtDw9y/q8qqSNknN
	ZgJz/oCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OIr-0002Ox-8D; Fri, 29 Jan 2021 07:34:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OIm-0002NF-4D
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 07:34:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id f63so5677181pfa.13
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+JP5pdQIMiJpdb9A5szcfBUiP1gg4B51D5kz0l1qAg=;
 b=E09IVCDKJaw1pM4q9Xnmre77m650iwDkHBLJ3i/9bSNUoekaS/8ot9t6W56VmjAKwa
 QjiDOqS16pIL5sVYk5KttRbM8MdUaKpIQ541ryhlPLJo44VwPoArxWoB+MH/B7/QUGjU
 5V3VMnLqlD7cvK4kj/n/txS4UXBazFby9qp6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+JP5pdQIMiJpdb9A5szcfBUiP1gg4B51D5kz0l1qAg=;
 b=GzEgEalb+7WLZ5dzTsybrIjaIQtWCIVcEhCUNm2pBEndv7qPCECUxaYXU7ymdaGkdr
 H1LV0oSe8mKsY51aJABP+VmbLeLxaA9T/viotFFX/cgp3HD6YBLTtnAwT+kXZo9TUJg4
 9iiPuaUl+7cmMbeeQNmL14aTKo3LQM3HbE+JOGghKoCp1f4hxL3b5lta5w4oYb6pGAcS
 gkJNKY/Pi6cftf5J8Bhz85kk8rJ3h9NVLabV0hbxfsPBbPzvHWOqKdUI7pBdTA6M+27m
 Rba84GXQQuzmzdkaA/fGY/teMyOzYlJK+JyDRLLxr6AO9aanD/Iz32i/3PgaLVNPSRNn
 k3Kw==
X-Gm-Message-State: AOAM530MFfLUjO7XRjDMNEJd61+RO5InGO68L0FM+j8H5FnOeLG7eE/r
 ri90rnsNgRRXxeWHRx0z7jmPtw==
X-Google-Smtp-Source: ABdhPJyTJmer89hnTyIzUeFUMxU3MW8yNhou7rK4sLjU8tB7m00M0/MUS/wOTfNcVHzJo8qqSaZxiA==
X-Received: by 2002:a05:6a00:14c8:b029:1bb:8436:497c with SMTP id
 w8-20020a056a0014c8b02901bb8436497cmr3190934pfu.68.1611905681713; 
 Thu, 28 Jan 2021 23:34:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Fri, 29 Jan 2021 15:34:28 +0800
Message-Id: <20210129073436.2429834-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_023444_303707_FFABEB36 
X-CRM114-Status: GOOD (  12.34  )
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
This series also depends on component support in mmsys[1]:
- [v4,06/10] soc: mediatek: mmsys: add component OVL_2L2
- [v4,07/10] soc: mediatek: mmsys: add component POSTMASK
- [v4,08/10] soc: mediatek: mmsys: add component RDMA4

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-7-git-send-email-yongqiang.niu@mediatek.com/


Change since v3:
- change several function to rebase to mediatek-drm-next
- drop pm runtime patches due to it's not related to mt8192 support
- fix review comments in v3

Changes since v2:
- fix review comment in v2
- add pm runtime for gamma and color 
- move ddp path select patch to mmsys series
- remove some useless patch

Yongqiang Niu (8):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: separate ccorr module
  drm/mediatek: add matrix bits private data for ccorr
  soc: mediatek: add mtk mutex support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 drivers/gpu/drm/mediatek/Makefile            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c    | 244 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |  17 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c      |  37 +++
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 162 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  | 108 ++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  52 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   2 +
 drivers/soc/mediatek/mtk-mutex.c             |  35 +++
 11 files changed, 572 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
