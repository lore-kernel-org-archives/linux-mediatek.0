Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B706CC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 08:23:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5329C61381
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 08:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5329C61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dE1xVCdGggZUOegZapkgvsO7yczbgHlpZUCW1CMP7WI=; b=cyzw3TTC30zT0dgCKXRldenSvO
	FfSRv/+OS2KHWcQJJ008OG9PgUmmfg3U53092g68CcYNt8xmHG9w6If9pyFO884flxeYa9BM2eawA
	eFhu7BnKyXgMh7AIKyxsMhw5b3DhHvcF8yU4tae5RMV/xaqYWjzyfXtqzpIiS+q0BBdAueAV6cXwO
	0lsLcsQnhizhgZfpia3hHkGjcLg3VwpEltUQjLvx4wg8wpghuU9KH4pfcP8uqo9ol/c7yrsk4tOlU
	aa/YYQLtF41idHtIBaOfNpXShioXAFP0ffuGeFUuf0OQ9K4sQRkYOzA+MfyKcy+Yom2C+WW/lvbS3
	rMBOepAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTKVg-00GwRQ-A8; Mon, 05 Apr 2021 08:23:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTKVb-00GwQy-TY
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 08:22:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEAAC61380;
 Mon,  5 Apr 2021 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617610972;
 bh=OBjkDZNvCWrnrWazlvd5R4b8wfkUXI/VhfiExOzp7Tk=;
 h=From:To:Cc:Subject:Date:From;
 b=TLDtn4e8CuY2Z2v76iJrz6l6I9JHdI07PL+FkJJsbeHp6fQ3qiG+5JAnP3ZKz82bX
 3s7uRpNL/6eWWlGhx8bs8fZaeXasOBUZk2zROgDKp2EwLTmrSp0E0R0v6sNm2Zd6n9
 BqFPUL7z9MkSzW5hcN3pRFIzw9WkuRqArO9k5M13j/ql04IUox0GjxMcFUP3aeUlJI
 3N3LJ54wekSPWcrqEx5KGvxOomSXBn7+WJ12zD2cWfKecnwJDTpF2/lo4GkbNz0mdA
 TyZhXhOfX0PcpDHc5GCgpLmWL6A3oXwOvxASHluTfYdjKMI8W+wRNIe4btFLsewgr3
 d6iFJtmF0p0oQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Wang Qing <wangqing@vivo.com>, tangchunyou <tangchunyou@yulong.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [GIT PULL] mediatek drm next for 5.13
Date: Mon,  5 Apr 2021 16:22:48 +0800
Message-Id: <20210405082248.3578-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_092256_148635_037C691D 
X-CRM114-Status: UNSURE (   6.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Fine tune the line time for EOTp.
2. Add support mt8192 dpi.
3. Make crtc config-updating atomic.
4. Don't support hdmi connector creation.

Regards,
Chun-Kuang.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.13

for you to fetch changes up to 2e477391522354e763aa62ee3e281c1ad9e8eb1b:

  drm/mediatek: Don't support hdmi connector creation (2021-04-01 22:05:20 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.13

1. Fine tune the line time for EOTp.
2. Add support mt8192 dpi.
3. Make crtc config-updating atomic.
4. Don't support hdmi connector creation.

----------------------------------------------------------------
Boris Brezillon (1):
      drm/mediatek: Add missing MODULE_DEVICE_TABLE()

Chun-Kuang Hu (1):
      drm/mediatek: crtc: Make config-updating atomic

Dafna Hirschfeld (3):
      MAINTAINERS: Add linux-mediatek ML for drm Mediatek drivers
      drm/mediatek: Switch the hdmi bridge ops to the atomic versions
      drm/mediatek: Don't support hdmi connector creation

Jitao Shi (3):
      drm/mediatek: dsi: Use symbolized register definition
      drm/mediatek: dsi: Fine tune the line time caused by EOTp
      dt-bindings: mediatek,dpi: add mt8192 to mediatek,dpi

Rex-BC Chen (2):
      drm/mediatek: dpi: Add check for max clock rate in mode_valid
      drm/mediatek: dpi: Add config for mt8192

Rob Herring (1):
      dt-bindings: display: mediatek, dpi: Convert to use graph schema

Wang Qing (1):
      drm/mediatek: dpi: Delete redundant printing of return value

tangchunyou (1):
      drm/mediatek: cec: Delete redundant printing of return value

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  12 +-
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  32 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  19 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   9 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 175 +++++++++------------
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   1 +
 9 files changed, 130 insertions(+), 126 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
