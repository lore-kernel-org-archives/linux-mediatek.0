Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D669AC52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwQHkxmgIAgQG84wz3JH/GPW9C8WxOZrto0yc7yZsfE=; b=3GMKDVx04LRQzf
	0VUVBk3Cd3wvuzsk8h/Q0bLpOI0nHmrtOAEpMKTiKZU3XW3L8M9mfCDbJ7V8IcO8tE07MARX66Hvr
	3+kbH52nTg67bOlSY9SI2e8hfDS0W91sc3+AT2VljIfhzslvj4LMo72EZ5AmslPJ5bOlQ0cWfeVU2
	Hgv/0P4sGQvfSXDbgBC1Ex4UzqgOI6GShVesIy08GvVoTFkqCjlNclFPjceWpMetHN8AoZcfT4YOE
	z0hepR18vX0x+91deaX6orfBJvtxqQaZBWorV1ulZOX0loE+BP9mBzd7Xjuk0FJXOyHasOnlbz4lX
	BdP+SfaXHZ/hwXn4r68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrgR-00000003tXh-1I0P;
	Tue, 13 Aug 2024 13:35:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrev-00000003t77-2Pbx;
	Tue, 13 Aug 2024 13:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEBCC616F8;
	Tue, 13 Aug 2024 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682B9C4AF09;
	Tue, 13 Aug 2024 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723556036;
	bh=z+NJxoXGT6DAoM3jpcIPdgMxSjAu22qbMus24gzDpxw=;
	h=From:Subject:Date:To:Cc:From;
	b=pmYjnoYrLCAXhpLUA6LwgPyFir2W7RJXhjAg2B3WS7Y2aG761JlUYoHj4497xm2or
	 8VanwvABUAjAqANhqMgkyhq8bwDOMlhTjjbYJavTD/mxwOSGU3+Wo2oTimalDq+pwc
	 TP0ZXIsaEj+lM2bX6bdxKwPtIb8tJ9Skq1LACKwXL/p9W5W5vY/j8F6jaG2+u0WW2o
	 FETcPeZ216/C/11FgCOSwQhGnunDyJp6N8MNna6s1nAR/abzkcHQ4ui4TRfH2CTERp
	 DInpgca+MDes+PhFoIB6c4MpA4oaP2sH4o3AIu53in9Ah2HN0Lnv6eABtf0/OJ323b
	 DmLgwm0Ws2hdA==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v2 0/3] ipv6: Add
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
Date: Tue, 13 Aug 2024 14:33:46 +0100
Message-Id: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpgu2YC/32NQQqDMBBFryKz7pQkjaJdeY8iJZqJhkqUiQSLe
 PcGD9Dl4/HfPyASe4rwLA5gSj76JWRQtwKGyYSR0NvMoITSopYK/Zqqt7GWcaJ5JY7omrrXjXa
 9oArybmVyfr+aLwi0YaB9gy6bycdt4e91luTl/3STRIHG9KWV7lEOWrQf4kDzfeERuvM8fw8A0
 tO9AAAA
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_063357_691854_4C8DE2D2 
X-CRM114-Status: UNSURE (   8.34  )
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

Hi,

This series adds and uses some new helpers,
ipv6_addr_{cpu_to_be32,be32_to_cpu}, which are intended to assist in
byte order manipulation of IPv6 addresses stored as as arrays.

---
Changes in v2:
- Collected tags from Andrew Lunn and Jijie Shao. Thanks!
- Corrected typo in commit message of 1st patch: cpy -> CPU.
  Thanks to Andrew Lunn.
- Also enhanced same commit message to mention both helpers.
- Link to v1: https://lore.kernel.org/r/20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org

---
Simon Horman (3):
      ipv6: Add ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
      net: ethernet: mtk_eth_soc: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
      net: hns3: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers

 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    | 79 +++++++++++-----------
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |  8 ++-
 drivers/net/ethernet/mediatek/mtk_ppe.c            | 10 +--
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c    |  9 +--
 include/net/ipv6.h                                 | 12 ++++
 5 files changed, 66 insertions(+), 52 deletions(-)

base-commit: dd1bf9f9df156b43e5122f90d97ac3f59a1a5621


