Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39993C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR2FLEqd2JSRm1wKFxudnRfhLAYqKvjzk9wr8Sz7qDM=; b=YSUaqaiTHy2PfYGv1VnU/YrdyC
	c7H595bctP/jH6aQyus+F1eYMcd33M634bdc6Ps0HtbH8ecFsFGlhGDs7tyXpivtKMC+3s7krv14g
	lzkXaufY4Ox0BYhZ2h9AF+5ozpGAAVs9wfZj/sP0Prxh4XfDn8P5xq3S0PlZ/e3OvruhBwSb5NGeu
	th6CxnjdVBk8iOaV4cFtZmVXSkJ3F9aJfrcKA9cWwRTRWLpVnkoT8aNyTkiZqyTMNkD0A9PVd1IfZ
	FrPdYZ2Jbtw/jNluX+mSRTIOlAN8CNV5NE879yJ9hcq+/e2YeM5N3A1+9cYVRf0oKxjnBuObgUKaU
	i9ML5rGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3xR-0099zJ-4v; Mon, 06 Feb 2023 16:03:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3SC-008uG8-Rm; Mon, 06 Feb 2023 15:30:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AA556602FA3;
	Mon,  6 Feb 2023 15:30:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697447;
	bh=7LnucdGUqjfNzMUJ9Y/GzXml6UH8wcuJkaRBmRWmx+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fd7nm/or6LjqdeuMwLrDYQWZ2j8KXmqMt9cx3qgezBiB81B6cWwKBvMcnApDZZjLj
	 yA3VFBp96j3lvqP4PiWpVk6q+yQ9GUOdjfYDKxAjBRGCLPKnra1Uxifjkio1pkBOhV
	 94zvDg9VUm2C0F2jLV6LUmyF/DfyF8UCLrDkWia5bhVBdeF0OlKnAHz7kjtq5w00S8
	 2/nWGvNNHK4oq0fXcP9TP3NHYPNnbx3BG/g0qsuQSrypw+UwGv+aZ0xxKbV4dNkHC7
	 rIjwHYYfXpJ/J18YOC6Dg1yFmTh+mIlB8pymCOv8FXhhuAaHDnqZK5wqU2w+VKuQQm
	 iRI88WRrI5tKw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 44/45] clk: mediatek: Kconfig: Allow module build for core mt8192 clocks
Date: Mon,  6 Feb 2023 16:29:27 +0100
Message-Id: <20230206152928.918562-45-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073049_073114_69CD75E2 
X-CRM114-Status: GOOD (  11.01  )
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

Bootloaders must in a way setup the SoC to boot Linux: this means
that it will be possible to decompress a ramdisk and eventually
insert the core clock driver module from there.
Allow module build for all MT8192 clocks by switching to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 706a7cf86ce0..e8034cbbe169 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -671,7 +671,7 @@ config COMMON_CLK_MT8186_WPESYS
 	  This driver supports MediaTek MT8186 Warp Engine clocks.
 
 config COMMON_CLK_MT8192
-	bool "Clock driver for MediaTek MT8192"
+	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARM64
-- 
2.39.1


