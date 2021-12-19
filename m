Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF022C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 23:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ocU8xJSuZVlrQ3DPyudgKc5Idi+Eu9iYo4i7xn3+DRc=; b=KA/J6Yn6XXF3Nx
	SRIC3Tkq1xUx0qurU+yj7FmaTipzSqTg5bTzAe5cTdzmTB1gZ50C5Gs7+Tw53wqBOOtlyl1vRIJpL
	+RC+BX14hJtIMToJX/FnwGwvyjVJiG+5f6czLv5dmH64lYOj/JV6alVmZh2oxyqSbSrgBBaDEkevc
	A/E+yiqCXJULQYh3/1HKkCKfKMrwJXFTrFU50bZw4wSyHcLeYymSmgyqa+VgjXCwE3IahoLkUtuNv
	O2pDpt5sUDg9/LALOFASL6P6lvm6pCB4uUeuD50mjfKnoq/qFL1TQQuINwN/KIGLqHtmc52v53MN/
	kB98jUlOutvYTHgk/FWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mz5hL-00HN3z-BQ; Sun, 19 Dec 2021 23:34:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz5hJ-00HN3D-0j
 for linux-mediatek@lists.infradead.org; Sun, 19 Dec 2021 23:34:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39FC460F26;
 Sun, 19 Dec 2021 23:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E260C36AE7;
 Sun, 19 Dec 2021 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639956870;
 bh=CO0C3OU3CKHXH5j2EucGha4YilQfr9w/t+UdQsF9dpE=;
 h=From:To:Cc:Subject:Date:From;
 b=h5aLh0DhaIe8msyuwScM2DwAsgz+X7aEreqiw3iueb2bMVaDdow4A872ypLQ1bxMZ
 6dhs4wU2nypoiE9nBKRI9lk7NRJeiS/o2JW93CyYSi2g2wTSdfvmOEdybyp6HyzlK2
 q8BBsmZB1dqNd0z9R7d3ccrHlEOLdXgtvcbRXwcXXK3eKL/smlRHxQZNYdtzwBdaw/
 ++B0sE8EB9RvJkygsijEyScvcso+JVICWkwyfrri0x9+ZYSCJr+Uc+GrXiovJEhhuS
 H4cbt8oWknaV894drx0+6pHziQ9vghgstqhgIdicEd6e7EYk36VfbbVCwTQ9tzJVAi
 RgWw7IebjQIlQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes for 5.16
Date: Mon, 20 Dec 2021 07:34:21 +0800
Message-Id: <1639956861-14873-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_153433_146735_63F21855 
X-CRM114-Status: UNSURE (   6.79  )
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

1. Perform NULL pointer check for mtk_hdmi_conf.

Regards,
Chun-Kuang.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.16

for you to fetch changes up to 3b8e19a0aa3933a785be9f1541afd8d398c4ec69:

  drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf (2021-12-13 21:01:11 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.16

1. Perform NULL pointer check for mtk_hdmi_conf.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
