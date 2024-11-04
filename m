Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90B2D132BB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbWlYjiYcuefwp8MaCoji92pWxYDGQ1qGL/F2vYEiGk=; b=o6lMSuYwFzLvHPU/lxATgLs/7V
	+pxUL4SFwiiEqxCpZHJirzVDDEFMzqsggzWLas1rn7oKkOxU09m6qtrQiB/dzidcCcjc6UQ4C2Z6g
	Ml2AjXecfw6EiYZaH+aW55biw5KqeXhrvS41vc3eW0+sz+Be9gBgM6UTiaJXpx2uFDMo6nCAGy0Gu
	f0OldOk/0EQdCu1BaR60tUWikX+x85ssGux7sCGY1yxr2uVz2u2c0zoHxtfw4zU1/b7xyrXbtRW/m
	Hz8Zc636EiIwMZzTWB4gUtMG9wzYS/MM9RXph9tGvsIWZH1FuZldNXtz54xsbmAtr19ILHewimN/k
	TvsIUh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wQ4-0000000Dj3w-416y;
	Mon, 04 Nov 2024 12:42:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wOS-0000000Dilg-1MTm
	for linux-mediatek@bombadil.infradead.org;
	Mon, 04 Nov 2024 12:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bbWlYjiYcuefwp8MaCoji92pWxYDGQ1qGL/F2vYEiGk=; b=l9LXo4LbPeRLWh3Py4b8GcP+tx
	bXXKYDB5XLhn+BIHX3/U1ovOq8Gime5ozHQI+YSkx+Z9JJs1GWxuVSdAn2uz52tLrOk7B0Lcu384G
	FrVIivCYmH6dKPEp8+0ramB40+Dby45fx4iyhBz2cbumwCHP8pkVlZs70XFT7ofrVn6EGrIbYhQay
	vZv34EU/Abr9ysa/A/WhnsktbRKIaZ98Wh+/VP5jT/wW4NKtykjpozsAmd8SPREMM+RkF7p6bC7At
	lApeBq7FkhXqjIIW44GxJv3SVJiH2cyu5uV8yQzAtcRH9Y61uHvcF+uX80ggcMkagt75vxvXq2xAe
	Oy1yfHew==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wOP-0000000BKPd-08zS
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Nov 2024 12:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8048BA42EF1;
	Mon,  4 Nov 2024 12:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9655C4CED2;
	Mon,  4 Nov 2024 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730724069;
	bh=HUZRVqiCqIrgTa00GuAmGvhav56zInoweQzJ+8ji5V4=;
	h=From:To:Cc:Subject:Date:From;
	b=tKWGsS9erAqZ/C1fDYLoPetAt0+dBpZyYQlmWDxjix8nF8MOd619CMpc2S3tXpYga
	 rrOs+mLQ6hM7tk7lRXYx1sZWEbVYYWohx2LW7B2MtRiUkOaFDb9El5gACfbxrc4n//
	 oH39A3FAsdiYa8LddiA61uttrfVi2QY6af0mVIS62egEm9KQmc6hH7SRRVfngU0CqT
	 dEhRw8zgbBxNGk+B04WRMvc1InAju1uyUXtuT2Kaoad9lbH0nax+VQMZHERntiDsy+
	 +Lsmy9KkfpReixwfB09FkdRYmrfrht7YY1rNrvreLaTRjuq+7r4QQx8+TUoojK2hJs
	 PrtF1Djn1aD+w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [GIT PULL] mediatek drm next for 6.13
Date: Mon,  4 Nov 2024 12:41:03 +0000
Message-Id: <20241104124103.8041-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_124113_318450_AAB17AA3 
X-CRM114-Status: UNSURE (   7.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Add support for OF graphs
2. Fix child node refcount handling and use scoped

Regards,
Chun-Kuang.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.13

for you to fetch changes up to fd620fc25d88a1e490eaa9f72bc31962be1b4741:

  drm/mediatek: Switch to for_each_child_of_node_scoped() (2024-11-04 12:23:15 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.13

1. Add support for OF graphs
2. Fix child node refcount handling and use scoped

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: display: mediatek: Add OF graph support for board path
      drm/mediatek: Implement OF graphs support for display paths

Javier Carrasco (2):
      drm/mediatek: Fix child node refcount handling in early exit
      drm/mediatek: Switch to for_each_child_of_node_scoped()

 .../bindings/display/mediatek/mediatek,aal.yaml    |  40 ++++
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  21 ++
 .../bindings/display/mediatek/mediatek,color.yaml  |  22 ++
 .../bindings/display/mediatek/mediatek,dither.yaml |  22 ++
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  25 +-
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  24 ++
 .../bindings/display/mediatek/mediatek,dsi.yaml    |  27 ++-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |  22 ++
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  19 ++
 .../bindings/display/mediatek/mediatek,merge.yaml  |  23 ++
 .../bindings/display/mediatek/mediatek,od.yaml     |  22 ++
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  22 ++
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  22 ++
 .../display/mediatek/mediatek,postmask.yaml        |  21 ++
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  22 ++
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  21 ++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  43 +++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  21 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 256 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  14 +-
 22 files changed, 685 insertions(+), 27 deletions(-)

