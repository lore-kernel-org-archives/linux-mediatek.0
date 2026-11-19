Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C5E606CC7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qELrywM3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGzroEby
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fjP62IC7BY5+fCteY4TlTF+5AyEq5vMalnJjs0i2F0k=; b=qELrywM3v5i5lPZDBVt7JraFru
	xcDnupx21KB7O9an+wqCf5OtQJeGAGgOQyzI8WX4S9qORTzJEOiYag718LJf2fLnqy7BXuabtK2Md
	FFNtYkUDV6wg+Xf54mAXxyIoxlc1XBqkjQ1xBHMBcjURekbJR1/fYBmUN82v9hepQswoTwPOOfpAv
	VYro3G/QonDiTl8UlqjZF/9/9076xP6AufTp89qTk7QwC791xD2I/e9r7MNMcVdcolR/Bcl1/Yfy2
	Mhe5tzfM6VzRI5TynxsYfr8fp0qMRGsYJ0HuJIdYs7FBdu6tHlTrB7+DmI41wMk3l0NrnXVo8jIsL
	jJ2lbWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU931-0000000DPTm-02Dh;
	Thu, 19 Nov 2026 20:47:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU92y-0000000DPT9-3zhk;
	Thu, 19 Nov 2026 20:47:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C14260D31;
	Thu, 19 Nov 2026 20:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BE11F000C0;
	Thu, 19 Nov 2026 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121275;
	bh=fjP62IC7BY5+fCteY4TlTF+5AyEq5vMalnJjs0i2F0k=;
	h=From:To:Cc:Subject:Date;
	b=XGzroEbyIqfu1F020pLEYGri2yRna/SmU4yPDMxz2Wqj/z1KN7rGZn0GSOLhpYq7L
	 QSg6SjYUgyDMhMEKCg3+aNqudcIsmhBZDWrpZF0/t0mzfhT9gfQZo+Cs/wFoWTSu9x
	 9EBLqWQ5E+u3MaXNR+uRwGns1MurwMZswQqv+e2FBKtY5mGdGDHx2vU3exEwnSoWZs
	 juXbrdCssWoAxWX/jyKVWruN+nXmB6x1c/fHuySNxbYGVJn6HPlyDFlIslXaTWVP7x
	 3no91nBAFXMzjJvLMlgGs9DhKqw8GAlTDwBGfufKDHr6XkdwkYPu2iLKJAmq7Ov3Dl
	 egQy1lD7u+OLw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Olivier Louvignes <olivier@mgcrea.io>,
	Paul Boddie <paul@boddie.org.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Qingliang Li <qingliang.li@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Sean Wang <sean.wang@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	zhouyanjie@wanyeetech.com
Subject: [PATCH v2 0/6] pinctrl: Fix out-of-bounds accesses, divide-by-zero, and error handling
Date: Thu, 19 Nov 2026 20:47:15 +0000
Message-ID: <20261119204748.2558209-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

v1 => v2:
 - Drop patches 05/10, 06/10, 07/10, and 10/10, already applied to pinctrl
   for-next
 - Drop patch 01/10 (sunxi) in favour of the broader Allwinner IRQ-bank
   rework in flight (Andre, Sashiko)
 - mediatek: Guard against NULL eint in mtk_eint_do_suspend() and
   mtk_eint_do_resume() before resetting hw->eint to NULL on error (Sashiko)

v1: https://lore.kernel.org/all/20261103213002.1673560-1-lee@kernel.org/

Cc: Aaron Kling <webgeek1234@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Maoguang Meng <maoguang.meng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Boddie <paul@boddie.org.uk>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: "Ryder.Lee" <ryder.lee@mediatek.com>
Cc: Sam Shih <sam.shih@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: zhouyanjie@wanyeetech.com

Lee Jones (6):
  pinctrl: tegra186: Fix out-of-bounds register bank index for AON drive
    groups
  pinctrl: ingenic: Fix element type of x1600_sfc_funcs array
  pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
  pinctrl: mediatek: Guard against NULL eint in mtk_eint_do_suspend()
    and mtk_eint_do_resume()
  pinctrl: mediatek: Clean up partially initialised hw->eint on error
  pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive
    strength

 drivers/pinctrl/mediatek/mtk-eint.c           |   6 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |   2 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  24 ++++-
 drivers/pinctrl/pinctrl-ingenic.c             |   2 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c      | 102 +++++++++---------
 5 files changed, 79 insertions(+), 57 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


