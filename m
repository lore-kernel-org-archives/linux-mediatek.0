Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B25C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 23:55:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA4C61374
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 23:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA4C61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qeo+ZLVkw3p48C+WorvPd1j73hoV3xJaxacPqjm/6ao=; b=Ozo0/QnIfIt7al
	crLRj5N+wYf5s3wjvouQZRD7An+TcXHobMGiXdzv+Dxeuh1PQWw02zbVtWEgfH4KCwR5DTtBIABwy
	vBHtBfpEgy7u1b6+BjqULbcrg2yzowmp1fqv7fqxZ8979zq3RDjG8hhmkQc8Rm7w2JH+Et/WE2xPW
	1l/tifSSJL2jdZd74VuJXBZCRv/BoLoWySs65L2+29Vu3QYc8SifbiJq79UoApbtwLHEvTqhOCODM
	t9s+NyMDfgt+1lC4UQbvp088Rpzl70lyOufcfszFfwI+dnsSke+pPk+f1gUeH4w9bQb00z560inBA
	dOD3idqy3jWoSDxWm2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFPyK-00FkkY-5E; Sun, 15 Aug 2021 23:55:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFPyF-00FkkC-Px
 for linux-mediatek@lists.infradead.org; Sun, 15 Aug 2021 23:55:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10A9F61179;
 Sun, 15 Aug 2021 23:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629071714;
 bh=LI53ozqpoNEdsKyU0Gl373eJPPlLxM+pXGycg62tEJY=;
 h=From:To:Cc:Subject:Date:From;
 b=d/Ct5z6pxWo73cdS4KLwq+xLqhR36StQgXFmTVtYsEqu6fNw5hZyuFxDWVxjw/5Po
 9FG6PR5gfuCaIexNhU6/u0xrKNoorUaDW2AduHPHJx5k/HOf8LdWzfCs51IunErsgD
 /SentkRLZuzNC3Wtrj3QUnSxljSuVWHuqXGzq+g/sJyOcF9pm/6AD16v8VK5elIpeL
 LzDTYebyt2Yil4zx30T7fTdLMi8HA9ZdtIZ5YeLDJDrGyTYqTSiO12fdytMG2zFhGI
 RGp8pbxFngYIhdCRAyRQvGIYOWDvwbVTnSwrA50VzadEFOJR6xAXPOLmIBkzpl8Ab9
 ZB9Szq6vQ03KQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [GIT PULL] mediatek drm next for 5.15
Date: Mon, 16 Aug 2021 07:55:10 +0800
Message-Id: <20210815235510.6597-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_165515_921613_672E0AED 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

Hi, Dave & Daniel:

This includes:

1. MT8133 AAL support, adjust rdma fifo threshold formula.
2. Implement mmap as GEM object function.
3. Add support for MT8167.
4. Test component initialization earlier in the function mtk_drm_crtc_create.
5. CMDQ refinement.

Regards,
Chun-Kuang.


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.15

for you to fetch changes up to 6e7dcd92644baebdb137e3af900064ceebcaca23:

  drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-12 08:16:24 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.15

1. MT8133 AAL support, adjust rdma fifo threshold formula.
2. Implement mmap as GEM object function.
3. Add support for MT8167.
4. Test component initialization earlier in the function mtk_drm_crtc_create.
5. CMDQ refinement.

----------------------------------------------------------------
Chun-Kuang Hu (4):
      drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
      drm/mediatek: Remove struct cmdq_client
      drm/mediatek: Detect CMDQ execution timeout
      drm/mediatek: Add cmdq_handle in mtk_crtc

Dafna Hirschfeld (1):
      drm/mediatek: Test component initialization earlier in the function mtk_drm_crtc_create

Fabien Parent (2):
      dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
      drm/mediatek: Add support for main DDP path on MT8167

Thomas Zimmermann (1):
      drm/mediatek: Implement mmap as GEM object function

Yongqiang Niu (4):
      drm/mediatek: Adjust rdma fifo threshold calculate formula
      drm/mediatek: Separate aal sub driver
      drm/mediatek: Add mt8183 aal support
      drm/mediatek: Clear pending flag when cmdq packet is done

 .../bindings/display/mediatek/mediatek,dsi.txt     |   2 +-
 drivers/gpu/drm/mediatek/Makefile                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            | 167 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   9 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 173 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  42 +----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  59 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  44 ++----
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |   3 -
 11 files changed, 386 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
