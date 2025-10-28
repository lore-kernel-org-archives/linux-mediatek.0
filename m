Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093DFCCF9EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vt8yt1R/CJLqUKyywydE44U03prI7YFRYqetbw6j0tQ=; b=1uVmsdwzJtZS0AcaqMqAKOphA/
	Cz+BNfT+FFvUr7OjvU6e57AZ31mHJaHuyX6i9S/omjrZNyfZAlM6Ncx0UwscTUfojf43HBPB2u2QD
	Bdjjkc+MKk085fzBSRIva5T3LaYw1aQWaZUGRDZYXUDQKx8ZZSVIKGPMB+wGBwSPTm2xd/C9AJebJ
	UIKg9mrFVwO1uos/wHQeZrAHpC5+lOLWTWlcVuoGkvbmV0j3JSGNxBQOjw7MPD9fxNUKjEq7gOznW
	CcTKWmkxv96BsnANDwEwgEzx3PqZEMJ4AWtkWV+Cyq5o8kU5Uf9qty67A7hD0qsCTl4rRe1qkTjIS
	wt7Ft0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgZz-0000000FiKV-2bDO;
	Tue, 28 Oct 2025 10:05:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgZy-0000000FiK3-1b5K
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 10:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA9861120;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C50FC4CEE7;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=cboT8hdgAS+dJXCgWDc4oLFGKxlmUgQ1vL9o91ppk8E=;
	h=From:To:Cc:Subject:Date:From;
	b=pV7tbHs3rae0oYm+a+xLllG1b8RhmWWrP5cmFqfk+kAVXD+mq+MIRYEwqq99LG8CJ
	 M7kIqUAjCVUzvACo2SPi0b1nUYiexZI/hpLQXY6uokX2OCQO1JzwY34b6WjHRCeTGu
	 X1gqxh2owYOvDbxKa0ot+GK4YLvzLBuo7Blx/8bwedKHPaaCpN58/b3BWn6DiMwlB7
	 ZIA9ppAUDaF5Y54x78tCYbijhv5VU2k1Pm+rE32gDHDyDSaPG0zOJic7MY2NnVUww0
	 3do9eT6Ed25Zpet+qxYC9u3bGYjfgshBx7SNup7qtLT0kPKlGocJ34gRHaW2Aac+CK
	 imU5EGYswxXUA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014g-3A6c;
	Tue, 28 Oct 2025 11:05:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
Date: Tue, 28 Oct 2025 11:04:52 +0100
Message-ID: <20251028100454.4086-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series fixes VPU device leaks during probe of the mdp driver.

Included is also a minor documentation update to make it clear that the
VPU lookup helper returns the device with an incremented refcount.

Johan


Changes in v2
 - drop incorrect vcodec patch since that reference leak has already
   been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
   firmware interface") which added the codec release callback


Johan Hovold (2):
  media: mediatek: mdp: fix device leak on probe
  media: mediatek: amend vpu_get_plat_device() documentation

 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 drivers/media/platform/mediatek/vpu/mtk_vpu.h      | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.51.0


