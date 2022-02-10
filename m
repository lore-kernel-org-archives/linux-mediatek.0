Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F71C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=729MKgTOxSCXjGhc2h2srfMQ8QGS7R0eH3A3SNaI77U=; b=yPwXejM4AwQBEj
	njJCMWQRnGvGa+PL7u6IZKrusm9FvCZ8BO9OvERJAR2o4QWg98XkkSYrXUjIj/NwEgcVxAHzmuQ3E
	Xx1WUasA8QPIGsAe2MJgFGG2VEvnZxkeuRDuoE5xPbxAeUtvBkh6oyDae6bKG94FzhN2uDHz3LjUE
	jFXTxGxFI2vwZQpE4DlAM7Syk2foiD7EzEfUtvhQPnr+qMBFHr9vEZveISv7Vd0Ox1KmZL8nsOiRK
	O9U107WqAeYuF+vQBe7hr5C3un+/zgHIn7dJVDRVMGLmfVC5ediDn98WtKb3Sasi6Q22xrzVgX1AU
	mx9dCSoo3/7SH4Sajh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAIX-0041oz-LU; Thu, 10 Feb 2022 14:19:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAIL-0041kH-Ci; Thu, 10 Feb 2022 14:19:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 700821F46563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644502776;
 bh=g15F7ALHJ8lVbIQkW5krJ5yH/z+6t06WcZS8hyKBtcM=;
 h=From:To:Cc:Subject:Date:From;
 b=TF4Doc9RYiO/wLbmcAi5heLv6I2KrzpbKWeVKnuS7FkNecx+cnjtOM5g5uPySLEjB
 Sug5IkO8agBqprdlpKAOV17ChHrN8BQ7BstGG1PKPm+zpXRYffdc0z1cUTExJlnJDM
 oLP5jkxco1y+r41HcfCmxRxDm9Gi7KjIqb5v55o8ElvbXJZr6cHYhcl3T4/NyS86Ci
 0sUDb3EgPXbTGQUFHzUy98rSc87HF8/uWqgDC3Kiz9ipKFerHMoSgprQN+a8hsPxIk
 +ziQaF1vyONJzdb26HS/ZEI8Lao892VZ2F4rdiAvSwa2juIgmNeXS07Ct+VyLPG+p6
 h2/vXoZrEeBJQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] MediaTek pinctrl drivers cleanups
Date: Thu, 10 Feb 2022 15:19:26 +0100
Message-Id: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_061937_583550_5BB6EB7D 
X-CRM114-Status: UNSURE (   6.04  )
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
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     | 17 ++---
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     | 29 +++------
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  9 +--
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 40 +++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 63 ++++++++++++++-----
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 33 +++++++---
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  9 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |  3 +-
 18 files changed, 165 insertions(+), 286 deletions(-)

-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
