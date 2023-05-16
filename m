Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06D2C7EE25
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPzav0jfsxssHgrat6+WgpLwcnS2Fwl5mMK7HEYwfqg=; b=VNoltj1IV4frJZpW0DZL7pXfHV
	5Cj7FWsaxg84vQNqsHhvZgKj81oFhuhLLfIwL4KL2mo2zeofszDOmW0kDlVvQRKscj57oq5Z3YMLc
	H0r41ggGwLlfaP1bM7RL6T1sxYqEerMvBoICJ8OxbHLjetkJ6QWwwasrg4xBZaLvs1DcDXDd7KWOX
	8H+KZfdgxlWrvtwDVltmu38D29yQIhqDlyMSjS6C8sdCywUkerMFXT/B2zfKP+pkr464hOeUEtiZB
	ot3dd9seggx06I43vxSpBiUN77mxZFmU9XdpgL617KXXJgEYEZpGYbW/6bGuqR5yTBR36bNGO+2lg
	4SwmJ9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyv6C-005z1m-2I;
	Tue, 16 May 2023 13:52:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyv6A-005z0T-0r;
	Tue, 16 May 2023 13:52:19 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FDFB660585D;
	Tue, 16 May 2023 14:52:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684245136;
	bh=xJrBWD8s7Dcy+bUExkMFrLTynIqKaM6Kc9RZO68PL7w=;
	h=From:To:Cc:Subject:Date:From;
	b=TKO8ZOtQsGAZRDwzPgEZBTLNkec2g4sg8dAEwLncRqxQAkozVxgjFBhhR7azqjmTo
	 SvKX4jZcrb+1RATAtwXqqkBlZ4c7Nro8kbooYR42cloPlgIq3P196k2/S19/ME9k/E
	 YlsRXhk5zMcwlwvIVAGaaS6vwtizGw8ogQmGicsX5Q6Xv0WOIDswhBeitpOk3fziQ1
	 67QEqfbZTFpBaCtgjMIaKYTM5EDvFCrers0GhAk5KIQJd2qEmUSWNIuqIJSY+rZ9n+
	 7zFY6Dztlak3KbT/rihqdBNjiap8PxSVBCHEdQ+TpxQH43kdAchVe1Yb+2nTfvZu6p
	 3hAOakiqszn/A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	mandyjh.liu@mediatek.com,
	miles.chen@mediatek.com,
	zhaojh329@gmail.com,
	daniel@makrotopia.org,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	Garmin.Chang@mediatek.com,
	msp@baylibre.com,
	yangyingliang@huawei.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] clk/mediatek: Adjustments for MSDC rate accuracy
Date: Tue, 16 May 2023 15:52:03 +0200
Message-Id: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_065218_465422_CA6C4109 
X-CRM114-Status: GOOD (  10.09  )
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

Changes in v2:
  - Extended the changes in this series to MT8365 clocks

This series stops unconditionally forcing CLK_SET_RATE_PARENT on
MediaTek muxes, as that should be set in the clock driver for each
clock requiring it, and removes CLK_SET_PARENT from all MSDC core
clocks to allow mtk-sd to select the right clock parent when doing
mclk setting, improving the rate accuracy and avoiding both under
and overclocks of the eMMC/SD/SDIO card, both improving performance
and stability of the attached storage.

This series was successfully tested on MT8173, MT8192, MT8195.

AngeloGioacchino Del Regno (2):
  clk: mediatek: mux: Stop forcing CLK_SET_RATE_PARENT flag
  clk: mediatek: Remove CLK_SET_PARENT from all MSDC core clocks

 drivers/clk/mediatek/clk-mt6765.c          | 20 +++++-----
 drivers/clk/mediatek/clk-mt6779.c          | 24 +++++------
 drivers/clk/mediatek/clk-mt7981-topckgen.c | 12 +++---
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 12 +++---
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 24 +++++------
 drivers/clk/mediatek/clk-mt8183.c          | 22 ++++++-----
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 24 +++++------
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 40 +++++++++++--------
 drivers/clk/mediatek/clk-mt8192.c          | 23 +++++------
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 46 +++++++++++++---------
 drivers/clk/mediatek/clk-mt8365.c          | 38 +++++++++---------
 drivers/clk/mediatek/clk-mux.c             |  2 +-
 12 files changed, 155 insertions(+), 132 deletions(-)

-- 
2.40.1


