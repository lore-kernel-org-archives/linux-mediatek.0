Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E199C7115A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DJjXeuKhheNOpsysVnyfqqZfxw57KQnuiIsqRWjJXaw=; b=sSoJ3KPouiNnNn
	mHYR55FffgnuhnF8c2FMz8D1LlNfNxFFmH6xYWv4QZPUeDunExZvg1VLj6Vudb6M6657ivooyiusA
	1MGw+gemJE/ZOgew71scaWU93bTJiWfa08CUxhsAsnmxh+bjuwRHlhU6tN8jQLqzVl+7+JDafsPKr
	vzgswLhoizEz5KQJEnJqpFTAf7BZ5jYoilGJVe0by/SrIy2wkRkVSVNAAcKk5OvNLd6GzKmgNWJfN
	K/TOfuZ1hUP35fMKAc3TpzGxpdvlfomHsCKrF+Fr51FTJJgkQvYmRanA6tGBuYmMpvTDg7WRf8XhZ
	PrzbXJtqRrE2VHpPn7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5Vu-00000003q5v-1F91;
	Mon, 16 Jun 2025 08:48:22 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4se-00000003kDV-0gSP;
	Mon, 16 Jun 2025 08:07:49 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 34DDF5FDC5;
	Mon, 16 Jun 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750061266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DJjXeuKhheNOpsysVnyfqqZfxw57KQnuiIsqRWjJXaw=;
	b=v/FbWDXUKLDLRNTjE70UxrD39XipH5Rk/nD0HgNES5rWRtjCah3ormnHSxHclcVgdTHxDb
	/EU0El/eZHFGJD2Wc1BaKfjBJXXUVU0GxJA24wB4yOkU6G7r18owNuJwISdk9VvTzYLJ3t
	QgqwKaEneJDJhPnAXRPDd72kz+IeXsQ=
Received: from frank-u24.. (fttx-pool-194.15.87.210.bambit.de [194.15.87.210])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E91821226D6;
	Mon, 16 Jun 2025 08:07:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [net-next v4 0/3] rework IRQ handling in mtk_eth_soc
Date: Mon, 16 Jun 2025 10:07:33 +0200
Message-ID: <20250616080738.117993-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_010748_374900_1A5F60A4 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series introduces named IRQs while keeping the index based way
for older dts.
Further it makes some cleanup like adding consts for index access and
avoids loading first IRQ which was not used on non SHARED_INT SoCs.

changes:

v4:
- calculate max from last (rx) irq index and use it for array size too
- drop >2 condition as max is already 2 and drop the else continue
- update comment to explain which IRQs are taken in legacy way

v3:
added patches
- #2 (add constants for irq index)
- #3 (skip first IRQ on ! MTK_SHARED_INT)
to the v2 non-series patch
https://patchwork.kernel.org/project/netdevbpf/patch/20250615084521.32329-1-linux@fw-web.de/

Tested on BPI-R4/mt7988 with IRQ names and BPI-R2/mt7623 and BPI-R3/mt7986 with upstreamed
dts via index-mode.
I do not have any MTK_SHARED_INT (mt7621/mt7628) boards to testing.

Frank Wunderlich (3):
  net: ethernet: mtk_eth_soc: support named IRQs
  net: ethernet: mtk_eth_soc: add consts for irq index
  net: ethernet: mtk_eth_soc: change code to skip first IRQ completely

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 63 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++-
 2 files changed, 52 insertions(+), 18 deletions(-)

-- 
2.43.0


