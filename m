Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6BC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kWMkER9XxYrPWfA40MxpNxIZIaEqCMilQGDM2DYiOZU=; b=C+dwsVtNCxHBkb4Ype1bfnVaun
	a8biFAN5f9dQP3Cu0IwDl0UbNuk8Uw/etL4BKdcBCcBzJqeqQEug+OlQWax7vOgHptsazWfJQpEpl
	BXKOI6zsBV9fr7AHIYdiR3Pbee5mbfmfBelMC4olU6cfnttt9DTxU8f9dsZFW9hK4jmcbVZnMKspr
	AF5bAVBJx4kbFk/0BD6umdfT0nrfqZpi8IC59XnP4xNniUCLhPzNoPWYr0Udl9vh86iQOfgAWlvnK
	5mDN99MCPvz2I+D3iJah+mszdxXp4xKeCy3gG1mHjxwRVpTTVIyhNiB6SD0dSir3FbiHvxyalITWd
	OnlY2gRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2Je-006S1d-2H; Tue, 16 Aug 2022 19:33:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2JG-006Rnn-Pt; Tue, 16 Aug 2022 19:33:08 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCDE3660159A;
	Tue, 16 Aug 2022 20:33:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660678382;
	bh=NDZOYYtE7Z7aJgkBinWoKrxMwniorPfp7MHSzfu5Mmk=;
	h=From:To:Cc:Subject:Date:From;
	b=dZbky2nCHVH0QRnFC1mUdc0o0fJ2I2afS2OKokeQglstEyosRSwGdiHi4l/MQWb1/
	 +LWG8GI8AoA0jfk32bVYxSjDpjw2+oJ/Ze1/4umZwbevfBrui0ftCdVNSsOT3dX3P6
	 TsiUVH1uYkJGi34+30XCMXJ/697KhVR2xA9Of8OqY+ZKGF/obOlfwJczmEZCEzUjXC
	 oHc3LpP0ce1rpJofE+8lKdwy8LrtO8Dqep5fqWeiPLyuaGXb+s7yUAEAv1JP8Py1U7
	 hvOZ5YrWaYPnB5ry7IQgd69LpShv4++oJe7e+RaCbxrs12mN0Im9FsXdeYDfp2clS9
	 cwKHFCRX3wdqg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH v3 0/2] MediaTek Kompanio 1200 MT8195 - DisplayPort clocks fixes
Date: Tue, 16 Aug 2022 15:32:54 -0400
Message-Id: <20220816193257.658487-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_123307_093866_CFD8A55C 
X-CRM114-Status: UNSURE (   8.20  )
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

Original v3: https://lore.kernel.org/all/20220617111248.90505-1-angelogioacchino.delregno@collabora.com/

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
2.37.1


