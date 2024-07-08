Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF581C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dte/+I0iJg8Rgq6elcPd5Nz201+FLgfrdI/Z+nuDX7Q=; b=mtUAX+p4bWRUml97ty6TuUogGR
	peYpqp84ufTupBP9mTxg1bCoMDwCRardRz5x1ratmQWvQgGHgT4Rha2wpVLjQCnbevC2JM+kWb4bM
	C7vYXbWetT9DET3YH8Y8T8zqVIIDxB537s2ZEjDqFZJ/WR2EbgLuMMv9bzzxD++CLg3jq8C34UBR9
	RwNNZOlv4QBa5znV1osYVjmTR8SxlNzAJlvZk3LQEyvPt+rS+RsELamEeXmjFlHCKnba8p8tYR25G
	9s40cRL/lMgLhGrwmwaKJ0DSmTvhPVsBJsYtAg5QI7gIxZKtpv6jF4/uUGvo1QHQqoCEB7gClkm37
	eknpLJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQx4u-00000005FK8-3Rqu;
	Mon, 08 Jul 2024 22:43:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQx4f-00000005FJA-3LsX;
	Mon, 08 Jul 2024 22:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 781BF61177;
	Mon,  8 Jul 2024 22:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA330C116B1;
	Mon,  8 Jul 2024 22:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720478588;
	bh=YI/FDJFtajnd8slwfQMrD0EUdlfQnPu/VVa0dm7bxeI=;
	h=From:To:Cc:Subject:Date:From;
	b=PRv1DdvnJe34BM8D9uEt1Msl7NEerAVg12ECI1JI4fw1XAu4qoEvUdexxgrsMp85C
	 KHIR07QD7fgIT8pzoyv+qg4H7KLk6Me9kcLrKJvOBONZtrNpq449MdKMjmHSN8+okz
	 GjxgdXclF9l3nDMorac2QdWz6gBFhHOsxfA+vaGruUU/i0kTvQAayU+dpIfBC652SM
	 +ZU8zw+AJtQmC+nJFRTnZS7Gsokx8BVXXENXYQbLWHqIVE44cGVpGExd9mnhAawEJn
	 UK5hiyz0xRtKMOQOVsqsFQUZqLRKLuvxL847EXem0Vy/Gws9suxCnBGq6i2bjbZZBK
	 FyIn227TgvSrQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	upstream@airoha.com,
	benjamin.larsson@genexis.eu
Subject: [PATCH v2] i2c: mt7621: Add Airoha EN7581 i2c support
Date: Tue,  9 Jul 2024 00:42:38 +0200
Message-ID: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_154309_926265_3491762A 
X-CRM114-Status: UNSURE (   9.95  )
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

Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Ray Liu <ray.liu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- drop patch 2/2
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..4d93c00264fc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -857,7 +857,7 @@ config I2C_MT65XX
 
 config I2C_MT7621
 	tristate "MT7621/MT7628 I2C Controller"
-	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
+	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  MediaTek MT7621/MT7628 SoCs.
-- 
2.45.2


