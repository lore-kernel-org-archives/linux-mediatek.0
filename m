Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b3tX2JQsqKQxcdbfS9QL7TE7hoT3chXXZFQxSzUvL8M=; b=i5zlVZ9hPgaUWx
	2fUHoS2f5UZs4zfj2IxPPOcvip6abS+KbC7SNrvP9GY6SVQktvugkN4lRZ/WsLgB9XboqilQjIxOt
	M8l4IEmGDpkhF0Mv83WOjoU4d0gn86GYOxnYyd/tIq4b+pDCg/xEGEKQ/Y5ZzGJDM1wuEqmIEbR8F
	2c/Wa3N+AhCL/briEqx0ypITiU/Ldtx4xVufW4Ez+cAijinwZeVyeEhTcaGlZJi9km2EG08Fwc93W
	nSsVWnqUZFtX3SJXXX4uQp2wSBI0kB1DeDgyQrq2QtYuj4azTf1wVsLJx9CJ3YpCKLobHkWisnU4u
	p8yOxscLBhMpj4/u1scA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2qs-005Lqa-26; Wed, 06 Apr 2022 10:25:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WQ-005Dpj-AK; Wed, 06 Apr 2022 10:04:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ADE991F438D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239454;
 bh=g7srURYZOuoeOiWj2FQ3simmvNJ0zom1MOjMcEDysv8=;
 h=From:To:Cc:Subject:Date:From;
 b=nmf9pj3vLhpmo8SD1pnvbqWTLGdw5/y11iJWV+6hwEAL0cONjbn5jeXbNXS37Uwvh
 yLopOhZPHyVJ0dq5KWV9/clgqKc/SoH7xzIPrh6qm7rZ0eGeeXlaksw4mF/NjXnJQB
 uGgaILIqE0mKJ88Ts4MoivOPf9dnGwYWJPLelPo82t8R0mzDPi+LYHqakrKh90r+Ev
 Ca1fATeRBEKKSrBPmDh8w1aCpz3KR12xijS5Li2pKbqJSWTwV9zq9TQ/M1RfMmrG0T
 tpIMntMjy3h87FwIikMEz5HKA7XRfWWBEs7A7gV/GKTh9OQhxAQZZ/WSHLtajCqUzT
 YppmirKxGZj4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/7] MediaTek SPI controller cleanups and documentation
Date: Wed,  6 Apr 2022 12:04:02 +0200
Message-Id: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030418_539255_65FDAB29 
X-CRM114-Status: UNSURE (   6.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series performs some cleanups to the spi-mt65xx driver, removing
all gotos, simplifying the probe function and adding kerneldoc to the
driver structures.

AngeloGioacchino Del Regno (7):
  spi: mt65xx: Simplify probe function with devm_spi_alloc_master
  spi: mt65xx: Switch to device_get_match_data()
  spi: mt65xx: Add and use pointer to struct device in mtk_spi_probe()
  spi: mt65xx: Move pm_runtime_enable() call to remove all gotos
  spi: mt65xx: Simplify probe function with dev_err_probe()
  spi: mt65xx: Add kerneldoc for driver structures
  spi: mt65xx: Fix definitions indentation

 drivers/spi/spi-mt65xx.c | 315 ++++++++++++++++++---------------------
 1 file changed, 145 insertions(+), 170 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
