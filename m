Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A509C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044A56115C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044A56115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ic/PE+XmlsqTw/lqbMgvhCMdvIFo2uKB8d+8F0kajxw=; b=kv0uDUGnBNz29H
	WF/4wogpy9Z5Cn/iR+ht46AU+xMdEDjcu2JN8BR/EtRI7AftY3JUtGzD+xKCqggVu11HebSZu+psK
	mhL+A6la30wIz9Dlkxsoi8cAqwthH34ebH4lLd2XBfuYdB5lIyA1gPMU/0GIB72hepECT594BkPPU
	5FHkAgzFZX4WgFvpAuVHKZWijlP+rL296hEe43sfMaw3BPKznCzoalLyq6iy3nQglDybL72x6MFYB
	E2BwqKJuWMVBTO6dSM2JBqh8SO5xyW90qrKWT3qjmx53WJkdOUghnQPvD2/lk1PsIHK/6XhYHPpB0
	f4ad1/zMhSq9lz15zCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltX4P-006oF9-3y; Wed, 16 Jun 2021 15:03:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltX4M-006oDn-I1
 for linux-mediatek@lists.infradead.org; Wed, 16 Jun 2021 15:03:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8785F61166;
 Wed, 16 Jun 2021 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623855786;
 bh=B/8cyiRgZZDp/y5oNNYykR0cKi9FuWzA1nHSD1KZPxI=;
 h=From:To:Cc:Subject:Date:From;
 b=qw3x2D+bjW8T0v5E585a/65ntpL2tBTKQ2UiYpvUWTwjnI3Rmi3sObEJho1KYU2NZ
 HG88CwDbupkDaSk2u+vWQ7176P5D63KJr3e9TZpnPdnYNaYIpgNfiywdW5VIw+RcGi
 2YdiUSXyzg69YPn5tGwwAi8rds5kiGUGQ2xAOo92LNVCbl6JHS+Um71YynQ7FDfvdY
 8C//A7PRxuL/yxh1vOb+rQ4zYftPvDuqvEXANbP8VZ9+tB9PNp+K8K1KkX+F5gAfDf
 +lGQFFMWfc3K/GT/2TwJ1M6VJ8eRwCGwVuw0wOFQo59Ma+cla6wljrE7uBs+8bt3Ur
 hsfadS98wzxdg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Wang Li <wangli74@huawei.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 5.14
Date: Wed, 16 Jun 2021 23:03:00 +0800
Message-Id: <20210616150301.292-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_080306_653165_9055764B 
X-CRM114-Status: UNSURE (   6.61  )
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

1. Add MT8167 HDMI support
2. Fix PM reference leak
3. Add MT8183 DPI dual edge support

Regards,
Chun-Kuang.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.14

for you to fetch changes up to ec8747c52434b69cea2b18068e72f051e23d3839:

  drm/mediatek: dpi: Add bus format negotiation (2021-06-04 08:58:56 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.14

1. Add MT8167 HDMI support
2. Fix PM reference leak
3. Add MT8183 DPI dual edge support

----------------------------------------------------------------
Neil Armstrong (5):
      dt-bindings: display: mediatek, hdmi: Convert to use graph schema
      dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
      drm/mediatek: hdmi: Add check for CEA modes only
      drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock
      drm/mediatek: hdmi: Add MT8167 configuration

Rex-BC Chen (3):
      drm/mediatek: dpi: Add dual edge sample mode support
      drm/mediatek: dpi: Add output bus formats to driver data
      drm/mediatek: dpi: Add bus format negotiation

Wang Li (1):
      drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()

 .../bindings/display/mediatek/mediatek,cec.yaml    |  52 ++++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml        |  58 +++++++++
 .../bindings/display/mediatek/mediatek,hdmi.txt    | 136 ---------------------
 .../bindings/display/mediatek/mediatek,hdmi.yaml   | 133 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 129 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  17 +++
 7 files changed, 384 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
