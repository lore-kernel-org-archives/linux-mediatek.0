Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7AC77B75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lL0EmrGH2zOlyCdVWEOUuq9vn30WvIlvb2Fl9Vq2Nd8=; b=tAc/ghvqUHoXt3JyqWoD/Ty0p9
	BDZFzsJCs7frffupcf32pRwYcW5fFDdHnyRkdY65rybA66A1MaBlE0T4mpBAmnBTp+TfSIJKq7ZxZ
	f60vbvXxxv/djeSzlA0jjLcZTqKNB9shkkQN5j6jMpFQ85J0SJPo2gkL5t1jQTAecfQz4YKBz+V+M
	qhabgSVX+OO4v3BSImFG3q5uHQ3OyZ9kRcAW37z0HPFSZQnSJZ9YEkc9VvVu/v1nioauceOgbG/Yr
	PJFK/qe55W7XDTDFp7FPTxpH2PPpKab4IBRWxpX+2bpE9cY4KAcXAPAB3DiEvhmXicW3P7bn9ZrZn
	SJNkpxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pursn-00AARo-0O;
	Fri, 05 May 2023 09:37:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pursi-00AAQc-27;
	Fri, 05 May 2023 09:37:41 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B4BB6605706;
	Fri,  5 May 2023 10:37:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683279459;
	bh=2X87NpkY0kngumn5SP2qMhUGTOWwMEU1tsdm96Xs+Qc=;
	h=From:To:Cc:Subject:Date:From;
	b=jc0ROQF8wNtaLgrgqX7OM6NQV+eYU4AKHFRtcExzOJ5AUIdKbpH53zuEjh6S3nSy9
	 yw23cMeavsUgZ5ivOb+/QgOnpi1eb++Vp3GC9X/MRsoSLEjxnsU5gWaOiGf+Q3kbFZ
	 4UQh4uMevZhkFEtdZkltxpt466VoLzu2WJzhfalun4iq+R44v+UZ2rl+sWJwBw7sZG
	 qIT0JksKrai685xRuXpd8CH1kH6rTVyruISZjAA6QcRVRj9Xa84+nfmb7l+rBcXj/S
	 qkpZwIEAkQysZWOO7e1e4axSzi1yo1AhTKh+eEPKRrVrwVHhGItnnpUtyZ02OJmMX2
	 4FS/MXyfdihxA==
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
Subject: [PATCH 0/2] clk/mediatek: Adjustments for MSDC rate accuracy
Date: Fri,  5 May 2023 11:37:31 +0200
Message-Id: <20230505093733.221922-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_023740_836188_1CA96184 
X-CRM114-Status: UNSURE (   8.68  )
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
 drivers/clk/mediatek/clk-mux.c             |  2 +-
 11 files changed, 136 insertions(+), 113 deletions(-)

-- 
2.40.1


