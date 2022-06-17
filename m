Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLNctZ8xKiYJjL9Rw+2bG9IHQga6V6n8Y+Kxrdkuf/Y=; b=F5mKoDgnvdJWHodPt550IBbJF8
	VzzWckIBmmD9gTDlppL6DgjxPzuRvLyBo7mnTNf678sS0FKPHoIqPcmOQWxiEDLUNyaaeo+mBjAHA
	54hXaPRDI04rbpKfa6wywcWL6OF2kQHr8OwN09g46jqW48dTpKiXdEK4l3Nztu0h77V+SoI1Neqha
	gCbJH5j/BF/FzM2LrcBMrrblMAaBk7sGfHd5/3Goc3+VK7V+IjXjpfR6P0VipR2KJI39zurgR0PYb
	lIqzTAjP886iRJd7QT36eqE+p7TqJizaodwMi6OWe/nI2FvAQWSsnjRysq/TPDRklHQ4sBeEYM5sQ
	9JMxwucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2A0F-007HDm-D5; Fri, 17 Jun 2022 11:19:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29uH-007EnU-Nu; Fri, 17 Jun 2022 11:12:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B53C4660179A;
	Fri, 17 Jun 2022 12:12:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655464372;
	bh=gW6UerJ1ORzjD0MbtZbHUrldkZVnFiwBi9ZNmW1eHC4=;
	h=From:To:Cc:Subject:Date:From;
	b=RaLfKMPnFOjxHSKNhZi9a076M0kae3pMwZPels+9MG7T2PpBuOzGeANIeecEnyxv1
	 yBq0dD6q91QPoRPUGw6NB5zX74ty0TcTp0AB8yQnuplI/SELLOWZyokBz6+om4u23l
	 RKzlH8jOExlvcCwKhsYVRBcuZmrI8jyLnCLPKDjtQ/W5gas0NcSQtLBRiiM0fEg0Om
	 wHHIM6Y7u2znG3dFXGhvqGroM3d/ZFqDqvJ8BrMXdApmuLpGuw5LcGWohiubucE6cj
	 YXtNoTcxvN8A5V4eH37yWm1aI9rOP5RxfVpebCKbsZHAw3y0p5/OvulpMCp3c9RNbe
	 f7V8MV84larPA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] MediaTek Kompanio 1200 MT8195 - DisplayPort clocks fixes
Date: Fri, 17 Jun 2022 13:12:46 +0200
Message-Id: <20220617111248.90505-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_041253_945365_F0A67DB8 
X-CRM114-Status: UNSURE (   7.50  )
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

This series fixes the two DPINTF clocks to propagate rate change
requests to their own parent (and also fixes vdo1_dpintf's parent name).

This is needed in order to stay clean in the DisplayPort driver and
avoid adding (now useless) custom handling of clocks reparenting based
on the wanted final clock rate.

Changes in v3:
 - Fixed tags ordering.

AngeloGioacchino Del Regno (2):
  clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's
    parent
  clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's
    parent

 drivers/clk/mediatek/clk-mt8195-vdo0.c | 7 ++++++-
 drivers/clk/mediatek/clk-mt8195-vdo1.c | 6 +++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.35.1


