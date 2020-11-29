Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E754C63777
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 00:44:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAEB20731
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 00:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/swLXFk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sniNRVHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAEB20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3Q5E6XbGWBCYOkppuhf1IRdwtt0gKrhEhDdPcIPlYg=; b=p/swLXFknUq2hwygrL/xHuvnhu
	HOxYw1GGB8Gjxu2n54LE/xQyuU3J7dfHndBKmBO1ahwIUMQ8H1cv+JDHejzC8+qi99j2oJiC+kkTi
	tpxkP3KWpolBkXR1ThyUxtkW4bPCY5vUrQl2Guvg4Mh27nLWyAAcbdhpl/qW84KecCaaavNYlNx2k
	iN+KnI1D71mCrpfAtbWPHKyxiWyWxckgPoPvrT6+hfAJIdZpZt9rtFybiyS8mAJ9pz6+O/a7NkYpV
	6g7thd9Jhqy6vXcRs7kRZJ+m0hBNk2q4D8yjuYwDXdQU9d+dyykkahcHIYcJp3Zfe3hrAEGdQx1Ah
	qtAkz2Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjAos-0007Yp-C4; Sun, 29 Nov 2020 00:44:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjAop-0007YQ-Q5
 for linux-mediatek@lists.infradead.org; Sun, 29 Nov 2020 00:44:00 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8313F20731;
 Sun, 29 Nov 2020 00:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606610637;
 bh=ClpZnG4KbDSawHAMUICuJTAnCLgg14Cq4NIxma0Oi0w=;
 h=From:To:Cc:Subject:Date:From;
 b=sniNRVHCv+Dpo6IewIoB98rGw+1ZziWbV+BV9uzcrhRTeyGEYIS8bD24Spgk5c7Fm
 dw8h41kutKrBaevQBG1WWQGN5FwuXr8Aw03v+Qw/34K+GZYqBpN9A05LyWLGKp8tRl
 c7WwVKU7V94yU66MCQUdIKLKdDYb/zCL+sioQeyY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.11
Date: Sun, 29 Nov 2020 08:43:51 +0800
Message-Id: <20201129004351.16212-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_194400_037475_FE1B3B73 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Robin Murphy <robin.murphy@arm.com>,
 Fabien Parent <fparent@baylibre.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name

Regards,
Chun-Kuang.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.11

for you to fetch changes up to 414562b0ef36ce658f0ffec00e7039c7911e4cdc:

  drm/mediatek: Use correct aliases name for ovl (2020-11-28 16:56:55 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.11

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name

----------------------------------------------------------------
Bernard Zhao (1):
      drm/mediatek: Optimize functions which do not need to return

Enric Balletbo i Serra (1):
      drm/mediatek: Use correct aliases name for ovl

Fabien Parent (3):
      dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
      drm/mediatek: Add disp-color MT8167 support
      drm/mediatek: Add DDP support for MT8167

Jitao Shi (1):
      dt-bindings: display: mediatek: convert the dpi bindings to yaml

Lee Jones (4):
      drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct member description
      drm/mediatek/mtk_drm_drv: Staticise local function invoked by reference
      drm/mediatek/mtk_disp_color: Fix formatting and provide missing member description
      drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member description

Robin Murphy (1):
      drm/mediatek: Drop local dma_parms

Thomas Zimmermann (1):
      drm/mediatek: Introduce GEM object functions

 .../bindings/display/mediatek/mediatek,disp.txt    |  4 +-
 .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 98 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          | 12 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 47 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 36 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  2 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 11 +++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 27 ++----
 12 files changed, 187 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
