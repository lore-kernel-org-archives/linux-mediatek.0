Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BBDC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B999F64DD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B999F64DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mgf3ZEASYeOJQywTlJAcB43hWzdEOM5yKqmPGpQAf5w=; b=TJvxQ07KRGRnUeOcivjQLzBGJp
	PcUshcvY5tvouhchp12bRqH8QReJGIMemqoHHqo+Avwvd57/z2vRG+LA5IzPfHDoeew3vicz6/VU6
	Ac1FBq92NZMHpynWR0g4IOeM1lGldKdVQpxxiKcU3lUhPRvyS0eEt8tC2KYuNDXaUc/cqQk4ws6ND
	XGlQZ+q6s/kFq0wbaabLPgWHyaAkcD1H/ot34JTL/R0VefWNcFqFYzMc7Vkk4XO/oh4Km/2K/D/NH
	SbvVRz/u733LgHK2BzqiJQQBlEoQeSZ1epkul1sle8AXBoYMGPjUvmkQFHrmt94RpKABgPJIMGxo0
	6+qSfpTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55Oc-0000Th-9o; Thu, 28 Jan 2021 11:23:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55OU-0000QF-4a
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id u67so3799218pfb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MitNH2RViQ9M+l824b3X/mBw9Aai/EXP4oM357HcQBQ=;
 b=ZEqOJcZ0ynUWANxO+EaI+p6TC+ZC7yNGpplc3fOZU8yoDhecz0DxWj2vpouFVQP2me
 6eFAZ1LV+MBQ0CAGtx3XG1Y86rC1cVIh45O2aEZPo+QI6hkseN7xTo8znpXOcFeYnjW7
 pHgNTWWCv3dotgE6JZiZ5kP2SJVKarIHfAFro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MitNH2RViQ9M+l824b3X/mBw9Aai/EXP4oM357HcQBQ=;
 b=TAwb3NPXf93Qi64wABK5tL3BMeImHpmU97FCHokJr3Ha9UobAEOKaeCWI4t+V7TBgs
 0xnB9WV3xpC8O4lCXNctv7lt7CBwEFBufXAYUn0dLlg5ok2T/0ionwxg0jhRyCl2Ou6/
 GKk1DXgoMiJTXwupvJNnbCZCV8zwlcjSv/aNVzCq+Fq7KbtAXsrZi8rvjuIM9N/VmPZV
 0TY9pMnBcic2AxBi9tmh77Giw2YQRVbAkWBj9kMPQGVh5hJcxfolTe/Auht2SZb2+lGx
 0kwMbbMXnkik7R0/JU2bkaEQsFsAuu8ouErvepBFsce85A0dUfRJ3KLKF/4kLKq14uC1
 oKQQ==
X-Gm-Message-State: AOAM531r27KZsj9j8BmMeyOLiFreS86t4q1/h5GWCKZsQwLoNX7wragl
 pxRVpfBbFrpBG16w/dMR20wgDg==
X-Google-Smtp-Source: ABdhPJykNoU5MwajtlO/UqGNGOvj8VeKIu1HgqMarpCtFdqrqZXAI1Ruxgro9gUBNXNDwZCSFiFGAA==
X-Received: by 2002:aa7:87d8:0:b029:1bd:d756:bdc9 with SMTP id
 i24-20020aa787d80000b02901bdd756bdc9mr15240312pfo.68.1611832999795; 
 Thu, 28 Jan 2021 03:23:19 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 0/8] drm/mediatek: add support for mediatek SOC MT8183
Date: Thu, 28 Jan 2021 19:23:06 +0800
Message-Id: <20210128112314.1304160-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062322_278881_E8354538 
X-CRM114-Status: GOOD (  14.59  )
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

Change since v11
- fix review comments in v10
- drop "drm/mediatek: add RDMA fifo size error handle" patch

Change since v10
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
 10 files changed, 380 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
