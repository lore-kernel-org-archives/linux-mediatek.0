Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B87CC77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tsMhfrh/hXMUbl8PAIbj5a+sVWJcnijb/6Fe+TBGAyE=; b=qjqYkbQYe8yIVHBk5HWYPKuC3N
	Jhzw8u9wqGC+b+6f8N1zsZtf+IDSOTjPe4UTrzhoA7PG83ejl73JVmdws7H58LyXP1S/+NbZPBWZN
	71FhStD5ffPeouFVsMKYK/g0DWbxvm5KbYq9IwLG1BuqS15kGqqFPo/VLjD1x+oWm8Wc2juahBAok
	0cpN6rSxHBuZM8J7UsAHKGN/S0yQu+/LRqZogpfeEUQ0Z6/KDwYPT6qR4EdbL2Dsdqc17pdBYOuMx
	MXNA1nijCmnt6vpixe+KkeLKlzqh3D/t53qXGDZBb0NTEfEZYoXtvqQyD5NZoUY3cCl0183gwicfC
	y9r6b4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWlf-008UeD-0O;
	Thu, 20 Apr 2023 16:04:19 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWlb-008UdH-1N;
	Thu, 20 Apr 2023 16:04:17 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppWlU-0000Ho-2l;
	Thu, 20 Apr 2023 18:04:09 +0200
Date: Thu, 20 Apr 2023 17:04:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] net: ethernet: mtk_eth_soc: use WO firmware for MT7981
Message-ID: <cover.1681994362.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_090415_460950_331AF4BE 
X-CRM114-Status: UNSURE (   9.42  )
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

In order to support wireless offloading on MT7981 we need to load the
appropriate firmware. Recognize MT7981 by introducing a new DT compatible
and load mt7981_wo.bin if it is set.

Changes since v1:
 * retain alphabetic order in dt-bindings

Daniel Golle (2):
  dt-bindings: net: mediatek: add WED RX binding for MT7981 eth driver
  net: ethernet: mtk_eth_soc: use WO firmware for MT7981

 .../bindings/arm/mediatek/mediatek,mt7622-wed.yaml         | 1 +
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c                | 7 ++++++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h                 | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.40.0


