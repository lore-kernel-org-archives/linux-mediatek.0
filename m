Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A22FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FmEa2HOAXz/juQw9vfxH8WXKrYEDQk7y2ZNpr4KIRF0=; b=JGVt/oeiMx5/JH
	V7xp90p/0tC0SVsDIwnPIcboY1sVdhN1qKIiGUBhRxW85Xh05sNDIeq7cY4zrzSEPd1C+3UwvQnUf
	PyIH17yD7wN5dxQ0ntsjDbX75k7aaWkoFV9exMZxOHnVy7XcjFhuQ0ovJimE5hrhriAKT3kSIuCkA
	CI6lovoaqDLMfRvrfcLLJVbfjgKYRiUvEkQMYcNk7GqVY5UVvTuGol9ceeENFzR1N7ixzuIl9VvN2
	LnFGlfnBxbBklfO4F+S8tn3QnRLW5azlMlpBPIEVXVPnFZOT0J8HYJSumyNNB6WtWaE5hcsQ6x6tp
	RuqGeSW+IE+2mQjM8Fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMT5W-009L91-J0; Tue, 22 Feb 2022 11:12:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMT5C-009Ky0-TR; Tue, 22 Feb 2022 11:11:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9BAB21F43807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645528309;
 bh=SPtw+f0uHGh08y5gDzh4Xpm3f82+7RZ5orhUcUoZYGQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8d20dSILE8ww4QUrdFkHqSYnNYsuq2cRc0b/Ej7cJTuNW1x35LEMn4ilzCqA1s7d
 Wb+puAdIWbkhmgsingHyjCFZfK+d4pMFANtEEE2+jdDKTm4P9fmWdYuIgjhhLovFY+
 8VICeT1K1kEl58iyJJ3/OQLFLftxktUV9u70O9sQsr5kQa+pIxc0uUJA5d9ioYCYbz
 ULJNq3jU2dLkfH9HRohBkB0H87jTrQydMIwV5n8X6Ntux0056ZvlK1VjJDonMIhgWx
 snMfsBfwgm5mM9CagkAoZlXcQEa/9E40mOBCUqB1hMlv+w3VTMstU52CadZc+wtQam
 UHLC0NmOQIwsg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/5] MediaTek pinctrl drivers cleanups
Date: Tue, 22 Feb 2022 12:11:39 +0100
Message-Id: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_031151_108414_742BDEF7 
X-CRM114-Status: UNSURE (   6.30  )
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

Hello!
This series performs some cleanups to the MediaTek pinctrl drivers
by commonizing some functions (reducing code duplication) hence also
simplifying the probe mechanism by removing unnecessary per-driver
probe functions.

This code was tested against multiple platforms.

Changes in v2:
- Patch 2/5: Changed -ENOENT to -ENODEV as per Chen-Yu's suggestion
- Patch 4/5: Removed unnoticed wrong comment change (Chen-Yu)

AngeloGioacchino Del Regno (5):
  pinctrl: mediatek: paris: Unify probe function by using OF match data
  pinctrl: mediatek: common-v1: Add common probe function
  pinctrl: mediatek: common-v1: Use common probe function
  pinctrl: mediatek: common-v1: Commonize spec_pupd callback
  pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback

 drivers/pinctrl/mediatek/pinctrl-mt2701.c     | 40 ++++--------
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     | 44 +++----------
 drivers/pinctrl/mediatek/pinctrl-mt6765.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt6779.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     | 39 +++---------
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     | 17 ++----
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     | 29 +++------
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 61 ++++++++++++++-----
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 33 +++++++---
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  9 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |  3 +-
 18 files changed, 164 insertions(+), 285 deletions(-)

-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
