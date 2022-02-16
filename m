Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B73AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9BEIm86BvaxN4OwDKLOxlm5MBFmO98iQVG3xlbNCRDU=; b=QX++5cqE0b4YE5
	XogT86kP8hFdYnh3DBCXzizSr5m5R0BzR0eIVVwjwGqwZmU5knMAhVhWAAQuhwUFednWEbAaVAoow
	RYe6WRVvFskffBUZGa1/XsuRYvxF70PIMfJDTcDLhQjDOHl00QJeoDSf0C3MoLSwshRSTj7xzlVoK
	cTupMPZyXr+FvHpQvi6jH/XZ+Wq56Qqvt46lr4zQdG4hQsbNrd+8fL9izQhBJ3N9tIml6G4rDt7V4
	4K9kNYpAdDb4iOP0X0rC2XP0cqFtCKUs2EtDWm6VN5p7ShDPE97hpJSrn0J5zniNTK8uW0+uXyEju
	nP+rKDUtTpZAY6D2Cc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKMrU-007bxR-Vn; Wed, 16 Feb 2022 16:09:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKMrR-007bwD-Mr
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 16:08:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C69EB81F61;
 Wed, 16 Feb 2022 16:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566E2C004E1;
 Wed, 16 Feb 2022 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645027734;
 bh=LF462aaH3bcrioP0UqoTu64rCWeeObTyACLb5jcaKz8=;
 h=From:To:Cc:Subject:Date:From;
 b=NG4g43ajqFFiMobTlFw7l8KIMdJbHw2/Yi/5gKzvLXQEVyo29GdbEnMpgQNbKDiVL
 ZLPMD12H7U5eZBoUur/8veyKWzSXgwb9P3DTcSpdjRKcTzoifYMLd/695+SUfvzDAD
 3XFEpVag+z/R+K41ltbctBJuFTrp/J0qHiUkhJgemvDcYDKYN18Mb/wxEPqFaGQR9r
 5iaEWo6inEa5WEH7P1T1KyMPwWWg/MyhHGHXjh5IeDikV2i5TceKpVl7NGStrXGzIW
 gh5P3AIJN2eyY5C7UTrHCt6JvpCXF6ig6B2X8yC7eYv25//60r6K1zDQVc8w0ipr/8
 7pw8ahc3iAJHA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes for 5.17
Date: Thu, 17 Feb 2022 00:08:47 +0800
Message-Id: <1645027727-19554-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_080857_957895_40ABFC50 
X-CRM114-Status: UNSURE (   6.01  )
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

1. Avoid EPROBE_DEFER loop with external bridge

Regards,
Chun-Kuang.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.17

for you to fetch changes up to 647474b8d980256b26b1cd112d7333a4dbd4260a:

  drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with external bridge (2022-02-09 22:58:34 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.17

1. Avoid EPROBE_DEFER loop with external bridge

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with external bridge

 drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 83 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
