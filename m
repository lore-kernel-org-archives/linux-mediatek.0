Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4048FC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUEfWAtE79Ct6TQb7hT2ET3KINZxfcThCtc/t6j4RRQ=; b=cHu8wrTzqTptxA/cqvFAi04WMd
	SUZnDscMu8SwtTCLeQAQgPDUR70fcgmgpuU/3lVvDfs8j1lAEmrH/NriqYXRluZ7DTsEf+NbYHGC3
	s2AqVtp8VIIaOjVaeXelHWPNNql34ilCXB9OC1Jy0NE8Cnd8Y/dSrEXkpJNDnxFPMDNEBwC/TCrYd
	nsjmMDqP7STClznNrKZuPAA64Gc2LyDscORZFUoJ5MWT+q7fcBfoujcYxJPn46WzfKPINm1sB0hop
	U87EigNUnJmzAq2CcA9oXo6J86yEChP2XbzsCzdG53xe97qCkfrwSBhozPNNAhACmPW41hJQdugnQ
	wgPnJ9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppD6g-006DA6-0H;
	Wed, 19 Apr 2023 19:04:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppD6c-006D9C-23;
	Wed, 19 Apr 2023 19:04:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppD6U-0003lT-1z;
	Wed, 19 Apr 2023 21:04:30 +0200
Date: Wed, 19 Apr 2023 20:04:23 +0100
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
Subject: [PATCH net-next 0/2] wireless offloading on MediaTek MT7981
Message-ID: <cover.1681930898.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_120438_694349_C8F46AF5 
X-CRM114-Status: UNSURE (   8.84  )
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

Add new compatible and load appropriate wireless offloading firmware on
the MediaTek MT7981 SoC.

Daniel Golle (2):
  dt-bindings: net: mediatek: add WED RX binding for MT7981 eth driver
  net: ethernet: mtk_eth_soc: use WO firmware for MT7981

 .../bindings/arm/mediatek/mediatek,mt7622-wed.yaml         | 1 +
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c                | 7 ++++++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h                 | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.40.0


