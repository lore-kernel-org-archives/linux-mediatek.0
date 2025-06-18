Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83934C7115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7RRMFR5bvStrbJAlB1dlE3PbQroltgCFLw5x1wwfKug=; b=skxjCrhLyv5BtW
	JSOq02f+S8FN6EPp59p+w4IUHc8YVnillvMGlwIxc++4ybDgIlAtEGAqnJFICX1Iabt83bpM+9pj+
	wEi5SekWoIBPK4J8trHFw06pEDxnAIeHS8aRWldlQGHaAtFr5IzH4OjfAhbWfTHfS6Jngn6aifVZP
	tMCQ4V1je5hpoRjD0bgk5uM2n8s5dArHMO/KgQgIIj5tk4vyz7/LazfYYpmwO9TgKWU0WEWP345Bz
	9Nl9DC7QDNBAJuCkzZrTJDfbmUO6Szj4cLfKKXxFDWvaRC4wMYgJuJ2uUHqb0HP0INoIuhZxNcq0E
	Oeqqsats/sp8TOALddSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvEZ-0000000Aff2-1wrP;
	Wed, 18 Jun 2025 16:01:55 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsVo-0000000AENE-3AyK;
	Wed, 18 Jun 2025 13:07:34 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 54971614C4;
	Wed, 18 Jun 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750252050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7RRMFR5bvStrbJAlB1dlE3PbQroltgCFLw5x1wwfKug=;
	b=RhzH9ZfbD9Bw1e4a0IYqZtEtXY+8lYnCPrL5sYbd5jSow/OhpdlnoNudzDABQvaS5Z5AVV
	rht0jTKYIgZo4iOBiaqAmm+rcfbbBroW98hPMAiWpcsXEWEZHf/R2PuFo9RAKhn9ODb+9H
	T+97Dy3hwqm5zVU5gl2hm15RrEiCZso=
Received: from frank-u24.. (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 166401226D6;
	Wed, 18 Jun 2025 13:07:30 +0000 (UTC)
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
Subject: [net-next v5 0/3] rework IRQ handling in mtk_eth_soc
Date: Wed, 18 Jun 2025 15:07:11 +0200
Message-ID: <20250618130717.75839-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_060732_966900_2EEA45FA 
X-CRM114-Status: UNSURE (   9.89  )
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
    
    v5:
    - fixed typo and add linebreak in description of patch 1
    - moved comments from previous patch #3 to patch #1 with changes suggested by simon
    - rename consts to be compatible with upcoming RSS/LRO changes
      MTK_ETH_IRQ_SHARED => MTK_FE_IRQ_SHARED
      MTK_ETH_IRQ_TX => MTK_FE_IRQ_TX
      MTK_ETH_IRQ_RX => MTK_FE_IRQ_RX
      MTK_ETH_IRQ_MAX => MTK_FE_IRQ_NUM
    - change commit title and description in patch 3
    
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
  net: ethernet: mtk_eth_soc: skip first IRQ if not used

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 62 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++-
 2 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.43.0


