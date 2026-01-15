Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C0D44C59
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=obRPckYhjEiJNPLv4O3955QSZYUHJdHSvxM4hv9Cxmk=; b=n57PClXn0IoGYx
	biyOPmE8szJWo1mz8Ad47mwLyt0A1LLlvR/UIJ4qnmIOGzwHjpEdYg1bmDAiWG2a53jmSyAbFJJ0y
	YsrlaXU+z4bjkLZcoXAdXDyk66kdEWu5mbRBVP3In74YbcgA2nWNJNyKgdtYJfMzYoRSIFc5HynR5
	9zZeAjkly5QJbJcjmIvjqXExGb3fim9Rmu1zg8cJBmtR/2X1qYlT/pPjcKllsHfcR3yCASANyufua
	dWTAsUN5DacLML3vZg2ETiF18brt3KwAWUoSaRAFxBmo4X8e3OEpMTr7g+weVeaz7hxphEBL0s76b
	wms2MF2OwmOPkupirRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUK-0000000CUv6-0zFE;
	Thu, 15 Jan 2026 14:38:16 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUI-0000000CUtc-0k3S
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:15 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7cfcebf1725so664049a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487892; x=1769092692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obRPckYhjEiJNPLv4O3955QSZYUHJdHSvxM4hv9Cxmk=;
        b=gqcpJ61mR8hGdu1SoU7DRmttNNQJczWBHJXoJIOG+CBgtdIqZoLu/RvQqOdfM9To9U
         8DySIGWgHchCaeGB7Luw7b7KnywdKkdOWTh/Sg//IWpwLvVaoNKzGWif8H2UQnRvOMcI
         8yFZUIZj/P/MaqqywlIKuGrSZYveaGCFCJdmNyRwdouFkka25F9jCllK7ixHQZrc5hrv
         j6I28xJDzHLiP5D8lpmpGwGM+SUJkjft1PoghcK0BSKtAyF5WIiVDPKZ71A0K3EosYzT
         5N3eSIjYZQcX6mJowEld4gshpDG5XsrIYedZQl1Z5qkoBxZ6qjTp186N9J/i2niWbDcy
         MV8A==
X-Forwarded-Encrypted: i=1; AJvYcCWffi2uirSuDqZP5Y1U04rQx3ZtfyAQDVPK8brtvkkHFK8PjQvi+jtQ9TfsZuEbyby0XErVNtMgilrwTi9Cfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/HacJTtRMLld1JIDqwZgIbecdmryV0P+kBWci2Q5qPLp8q3g
	HpkFGBFSX/1LhNAfDp887POthDF+iVW/yYTboJAo0A0xlOr5BJAIxfjC
X-Gm-Gg: AY/fxX55ITa0oBpnoPzxxpJfSJ9kZUY4029FqAZLp5fZxDOuX9hWqtRziQV/lnmXs1v
	9whzP2YF7KqErRjkhfW5bbtpLWDrL6gxVLznYr830WbQM1ovZSWX55MTwK8Lc9gmjAYQqnTP08v
	YQvHF3VsBAXw3tn1VIR3nPEgUKsV+JHKfgxopsjQsKt073Yvz6KVAPbhM33gkZ5SVpzdFQHBI2g
	YfPPUzkwZocuAb0z+CjZocLqn4qcZbV4OzepN67J9cGRybw7V4F2mkB3Vp3souT2K3NnQCY2XUy
	sELNgVtkMhlPK9Pk25UZkfumDAWHL5TZaaK9udSFmp9kKtkgdnHwIKqmcbuOBPTe4b9ir9t67s6
	q9XWDkwPeCC3/kBlJDinY8XlCmgOeG0sAA8eUFON/4XfFI3Y8TQkw33Rm76Ys5CIPO6aLWJOdKm
	OZmJpmHek3neAB
X-Received: by 2002:a05:6808:83cd:b0:45c:73b0:893c with SMTP id 5614622812f47-45c73b0aae1mr3347077b6e.11.1768487892230;
        Thu, 15 Jan 2026 06:38:12 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5dfb6256sm12849514b6e.0.2026.01.15.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:11 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next 0/9] net: convert drivers to .get_rx_ring_count
 (part 2)
Date: Thu, 15 Jan 2026 06:37:47 -0800
Message-Id: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL37aGkC/yXMTQrCMBAG0KuEb91AklrRXEWk9GeM42KUSSyB0
 ruL7frBW5FJmTKiWaG0cOa3IBrfGEzPQRJZnhENggtn531nk1ZlSf3IqV+CJZqvQ3dx7an1aAw
 +Sg+ue3iDULFCteB+SP6OL5rK/8O2/QCuTJhFfAAAAA==
X-Change-ID: 20260115-grxring_big_v2-eed9a5803431
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=leitao@debian.org;
 h=from:subject:message-id; bh=Jym+hB7alQQy54wZeliTw3/vUjoLAwmzKirUqnTIOwM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvR64rLYjr2/iNqLeLLq4WUcZf2UrXiopTlb
 njcXO6FZImJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bZroD/0RDCaNjdoDbu0mv1OiLrdFYjfSMbkXoNZQmy/Ib1BSBZcMkshG7AJyuWcGBafcCmjj03x
 VKqJbxcSyWQ+tpj8TL1dqoqagPpMLEixz4HugR9MHu39GxRHg67sAwg+bPc4+wBaKuZLdJrov+i
 k4fLF83CLgthdt8vpKY08wNYHyNdWcaH9Gf1xQ1hbACXK2Knoyo3vVPYYVqwqG4Mrjc1N6tnItO
 ShNU2XPOjTekErc+spOHazhTgbPOS2cL1cBA5An3oEfBvoryhf7jy/IljJdNYk3YOJxER/wCgWH
 DktqZGJ03Tmty7FkBdzUv01Q7oMMOdia7Xa9xf7HBkWx1OmpOATfQhLnUwSusKwm6zxbDTy6jqL
 5h0No4RHrYc/ivjDAoBCmrG8u8LrAxElbmUm48x6nm7hIF8rSY/U0/FT87qYDJJuFycgyP2cQnR
 mUzjeKJYEDqQw+vGd4Pg9Gjl+EenugTNENvN4aV8R3+z7BaR4NIsrT7N39bXBBxKSIOK9I26bGc
 IkQovYC7ZbWc5SU7+e4ShGDEeeEjC9S8qIdwuLLXtglOSDGpEPrWbZDLSSURHuVTjjIzuEnFupK
 C4GynyaMc4wqYJmfPgo5TVI7Bu+0yzeda7t8AfkbLDXnzDtVS07r4lJVG/ZyrVOJVsUKD89MXcG
 47Q/f6pZkmqcEEg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063814_225178_2D1F576D 
X-CRM114-Status: UNSURE (   6.96  )
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

Commit 84eaf4359c36 ("net: ethtool: add get_rx_ring_count callback to
optimize RX ring queries") added specific support for GRXRINGS callback,
simplifying .get_rxnfc.

Remove the handling of GRXRINGS in .get_rxnfc() by moving it to the new
.get_rx_ring_count().

This simplifies the RX ring count retrieval and aligns the following
drivers with the new ethtool API for querying RX ring parameters.
  * emulex/benet
  * engleder/tsnep
  * mediatek
  * amazon/ena
  * microchip/lan743x
  * amd/xgbe
  * chelsio/cxgb4
  * wangxun/txgbe
  * cadence/macb

Part 1 is already merged in net-next and can be seen in
https://lore.kernel.org/all/20260109-grxring_big_v1-v1-0-a0f77f732006@debian.org/

PS: all of these change were compile-tested only.
---
Breno Leitao (9):
      net: benet: convert to use .get_rx_ring_count
      net: tsnep: convert to use .get_rx_ring_count
      net: mediatek: convert to use .get_rx_ring_count
      net: ena: convert to use .get_rx_ring_count
      net: lan743x: convert to use .get_rx_ring_count
      net: xgbe: convert to use .get_rx_ring_count
      net: cxgb4: convert to use .get_rx_ring_count
      net: macb: convert to use .get_rx_ring_count
      net: txgbe: convert to use .get_rx_ring_count

 drivers/net/ethernet/amazon/ena/ena_ethtool.c      | 22 +++------------
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c       | 15 +++--------
 drivers/net/ethernet/cadence/macb_main.c           | 11 +++++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 11 +++++---
 drivers/net/ethernet/emulex/benet/be_ethtool.c     | 31 ++++++----------------
 drivers/net/ethernet/engleder/tsnep_ethtool.c      | 11 +++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        | 15 ++++++-----
 drivers/net/ethernet/microchip/lan743x_ethtool.c   | 13 +++------
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c | 12 ++++++---
 9 files changed, 58 insertions(+), 83 deletions(-)
---
base-commit: cc75d43783f74fe0a1c288aba9e6ac55f1444977
change-id: 20260115-grxring_big_v2-eed9a5803431

Best regards,
--  
Breno Leitao <leitao@debian.org>


