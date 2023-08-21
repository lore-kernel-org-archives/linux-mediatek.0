Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40CEE49A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q68c5jw0p9HvyOnVHm1hEPITt7oEYR8bWMU7MwSEsEo=; b=SDA8vBvehhgvMmNKCxx/SHR4r4
	Iy1YkB6OyDyOV4pFfb2HKQRhJLonFTlUhQMOzix/pOCYwGp+VV1KuUfcA6kPuyi6JvG9ZqLRAxLQe
	ZqisNkjwGaglgr47uL0MeDeRlbDzae3iiQH3oFexHQzzzkbNb57B9BNlwu8PqxOlCcBftwCkyng8g
	5aMuXD96Kaasxyhyi2D6zqwI+cWoVq5JgSfWaelnzQrMGpNKkm9dcTZxl56fUWvMfg0c+AJnmr+ik
	JRL8DEtJwK66Kz2gohCtrxNmymD6AOKxn1m6i8jNfuii1ISSqxWh+mGUZO9D8XIZjnktrNn90el14
	PEhS5EAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYEKr-00EowD-2U;
	Mon, 21 Aug 2023 23:29:25 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYEKo-00Eoux-1C;
	Mon, 21 Aug 2023 23:29:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qYEKU-0004Ta-2s;
	Mon, 21 Aug 2023 23:29:03 +0000
Date: Tue, 22 Aug 2023 00:28:44 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 0/4] net: ethernet: mtk_eth_soc: improve support
 for MT7988
Message-ID: <cover.1692660046.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_162922_414413_38769A15 
X-CRM114-Status: UNSURE (   7.31  )
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

This series fixes and completes commit 445eb6448ed3b ("net: ethernet:
mtk_eth_soc: add basic support for MT7988 SoC") and also adds support
for using the in-SoC SRAM to previous MT7986 and MT7981 SoCs.

Changes since v1:
 * SRAM is actual memory and doesn't require __iomem
 * Introduce stub ADDR64 operations on 32-bit platforms to avoid
   compiler warning

Daniel Golle (4):
  net: ethernet: mtk_eth_soc: fix register definitions for MT7988
  net: ethernet: mtk_eth_soc: add reset bits for MT7988
  net: ethernet: mtk_eth_soc: add support for in-SoC SRAM
  net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 194 +++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  53 +++++-
 2 files changed, 197 insertions(+), 50 deletions(-)


base-commit: 7eb6deb3f55678216a6a0e956846c04958093ea5
-- 
2.41.0

