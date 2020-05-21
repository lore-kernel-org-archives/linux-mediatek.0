Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36AEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671DE20756
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbgefRo4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zaB2mc7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671DE20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pM4RPlfKXX+Hxp1EeDL1gZpV2esUfYEdkSmiKN6EgB8=; b=Dbg
	efRo4mkv176qwyMpf1aYs1FMQBNnYWpZF4VZsHaZQNq0lzhQQAlcwrklE1N4KO2NarcCZ8A1hMahK
	QEsJs3YHqbDtVRPMmJ+/NPe14KWwhJ4COTAeNoe3LfS9ii0z3YdDZt4X7f9EswFf7YppmNY11A8VS
	RccCLgsCCDtQ6MpKIWTRv4e54ruUlA4Kl00ecokjbC7UyChbWQNfUu1hPI84WCbqFOTLCvHKs3S3C
	aM9prSLM15rTFg5nZpKm5oXAp65TutDIQ8v/6Au/7tlHpRy0fCHrFQ/gOE+NFcUUl/tQfMK+CpYE2
	PajcOgkJOwDKgSJbG57qdzv2+DO/V2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbaHw-000513-FG; Thu, 21 May 2020 01:46:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbaHr-000500-D4
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 01:46:23 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7BC7206D4;
 Thu, 21 May 2020 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590025577;
 bh=ShWR05J+GX0ojhK27/EOzzCcTQLksxCASTY1PQgf/mo=;
 h=From:To:Cc:Subject:Date:From;
 b=zaB2mc7Bz/LDeMvhd14Fm+OKQB/TTuToxd3yF8B5RIJen0phXH91cXj0JfnricUVq
 p1I4B4m5DioI2vkKJG1uCN0YbsJhjt3HUDRf5B2bik49y5aKMM9VCDzyJkamrRkRpW
 QGHJwAH4Xrw+/aeJZjNFbQ1JrP8Twx2lgdsapqqk=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL v3] mediatek drm next for 5.8
Date: Thu, 21 May 2020 09:46:12 +0800
Message-Id: <20200521014612.17175-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_184619_462745_3C4AD77D 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
Cc: Bernard Zhao <bernard@vivo.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Anand K Mistry <amistry@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
and some fixup. I drop backmerge patches and related fixup in this version.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.8

for you to fetch changes up to 3852489c79abe31101f07e395c63cce64de0c6d6:

  drm/mediatek: Eliminate the magic number in array size (2020-05-21 00:10:08 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.8

----------------------------------------------------------------
Anand K Mistry (1):
      drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0

Bernard Zhao (2):
      drm/mediatek: Cleanup coding style in mediatek a bit
      drm/mediatek: Eliminate the magic number in array size

Jitao Shi (6):
      dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
      drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
      dt-bindings: display: mediatek: add property to control mipi tx drive current
      dt-bindings: display: mediatek: get mipitx calibration data from nvmem
      drm/mediatek: add the mipitx driving control
      drm/mediatek: config mipitx impedance with calibration data

 .../bindings/display/mediatek/mediatek,dpi.txt     |  6 +++
 .../bindings/display/mediatek/mediatek,dsi.txt     | 10 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 31 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  3 ++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c             | 54 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h             |  4 ++
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c      | 28 +++++++++++
 8 files changed, 143 insertions(+), 11 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
