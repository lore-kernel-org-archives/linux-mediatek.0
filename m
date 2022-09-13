Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB54C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zAdLH84KRzT733u+BBEAJqBLynbdnbx14NPWiEqO92M=; b=DV00CFwtdw/g6VTxyFl6iRN/uz
	fCSQVxY8jlELmhxn+5TXn++lOMgVAUJkHi+oFz2P4UqhaG4XimsPD1seZlX73VON/9oZZG78UMSH1
	Ve5BMwExlHPbT4jQv+9dnnitRvfXyMY90mFdLOJUsajjsZOGFd1GLRi78dJf2kYQoXbQcCSuJxquZ
	Qb3h8Lh2F4oZB4UQI8uIdfueQK+NzWZcy+VCQWhHtx9wgzFm35N3bYGwBSRYFTYqrFH5qp5ifQ9t1
	966vF7ZGlbcBLR1Ij+R6EnEE6K9f/Y/ycgmxF+6iMwqtCnZhjE9NkxMCnvPAfpmHMsm37ClGh0eI5
	1mJaitPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Um-00BBu0-JS; Tue, 13 Sep 2022 14:02:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6UL-00BB7y-Op; Tue, 13 Sep 2022 14:02:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1274E6600371;
	Tue, 13 Sep 2022 15:02:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663077726;
	bh=YMzqTfx36K6R8VoijWH17yCMGbQdDaXJE9npEtTCxNk=;
	h=From:To:Cc:Subject:Date:From;
	b=is8SAIoah/Lz9cHjty/dsUbPzT+VU1laMksOVCvzyKquI5AMxF8DdkDUzDBXCWcJe
	 SgrtCqZrDfGTM9yyNT32jN6wd3GYuAcWKrfbXUijLiYtet91ZdgdduNt1GyPaiPTma
	 LRasMK2JJz72pbna+/FxwCmJ/+PxiRfPs0VWyS1xdnvRL3EF1kLaZxKAZgIojayYlZ
	 MxPHOIbbUHZ/ce89ItzJXezKawFBh6k+RxS0z7odKpvT6PtnN0kW/gIKLqOHh2HlNQ
	 VCRu+PJRqLSEOxSNr0WRwiJFuiQuJOAvC92OOF4B/S7qcE21i6F5KU6LS8B3pPpmmc
	 OSBbj56aZmyLQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	jason-jh.lin@mediatek.com,
	rex-bc.chen@mediatek.com,
	moudy.ho@mediatek.com,
	allen-kh.cheng@mediatek.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - Display Mutex
Date: Tue, 13 Sep 2022 16:01:19 +0200
Message-Id: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070210_068030_5646D2A6 
X-CRM114-Status: UNSURE (   6.59  )
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

This series adds display mutex arrays and compatibles for the
MediaTek Helio X10 (MT6795).

Tested on Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (2):
  dt-bindings: soc: mediatek: Add display mutex support for MT6795
  soc: mediatek: mutex: Add support for MT6795 Helio X10 display mutex

 .../bindings/soc/mediatek/mediatek,mutex.yaml    |  1 +
 drivers/soc/mediatek/mtk-mutex.c                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.37.2


