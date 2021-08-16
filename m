Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E57C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBDC60F35
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EBDC60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2e2T8mpjH3As+XpBGrsYnZNQbJPE4h+/XeUcz1co3N8=; b=k5s5Rhn35npjVM
	8oAdze7g+ulQGpkMtIBNSBkMMqofhMHQIgxIrF4sycxdTl1YXRiqlHAUExFUcOflQbxIBHqzEADp5
	rgnC8ZlqgGh5h6inVplo2Edn5NOSNxNqlNHm3Mo93OmuLMg6nI7Oqtr+w+Tsra57fX1cCPXz2N363
	MaM4e+S04OyV2vQLV41SBf00jf1gY9FJdK3uoc58hXvVcZDqrcrjMWLSy5qkFYcDSPjiS6PYcCbz1
	5sUQ0JyBtbYxUtYuO8RMJrx/6oShc9t9rcxj/FrrA2m0h8jltJlkOH3jgf1DODKvsPI9Yvr5O8ZLg
	0Or6/w3e0GW5tJZBtDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFly6-000V8A-SD; Mon, 16 Aug 2021 23:24:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFly3-000V7m-Rw
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 23:24:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF1960F35;
 Mon, 16 Aug 2021 23:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629156271;
 bh=ggOlp86jLvFXdrrpvLp3lnX0LT4l9jJ9pLj48IP/iV4=;
 h=From:To:Cc:Subject:Date:From;
 b=efUUcFW7iw/ckqVFkFmjkV2G0RsYRtpI7zG9s93qOR4zru0xVfBnQxuzWa+WPlYOA
 vbbIWB2UvDhMhD/3ZKE8sDEQdgcpTgtrrDwxj6jcHABc74gAQNUKTHobFkUi0JPNq2
 lsUn7GFTP8osD7hbmevQBmQ9mA6EUjFEoGQZ3xtjLVgYayudaVqMnZWH7ghxF6FylY
 jcKVp1tfu4gwWWfD7LghweYNB5CqA9YG4MncZpC9e+kCHU0wk+PQTp3RGRfI+lC0cQ
 HIL0iAnv0fPlXISewTHbcG3rcmjKHUJIuqVZqIdgv8Z4Yg4y/8rqrmzD+YDhNnvq3d
 BETYovDTS8vDQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [GIT PULL v2] mediatek drm next for 5.15
Date: Tue, 17 Aug 2021 07:24:27 +0800
Message-Id: <20210816232427.13368-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_162431_976547_72C0C5B9 
X-CRM114-Status: UNSURE (   7.47  )
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

for you to fetch changes up to 9efb16c2fdd647d3888fd8dae84509f485cd554e:

  drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-17 07:08:54 +0800)

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
