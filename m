Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7EFC3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ole10ILzMDIbGzbG03hWIpmMjlYwoDjzeuEQC3Dh/BE=; b=Mv94EsIkf32NgRnKe6eFxnmHGJ
	bBj4xWJ3EXlCQYeOFVmVe7kS4fqfM8spTDJ8mciGEljuPr/FcvOVK6t1UyTqCiLUORPhqSFzX7oMU
	atyU0VbMr/LTU20H/4EN4W2/WpWxHYbkLmKraIaKH5iF6++PfpErMbwY/wi8Zs5AFfYdJ6oXhqHmF
	Q3OOhqnnDD66WXSmY+xn8Abs1s2ibtv4ERcArB+IocHvnmZK2Fcb8NdQch91yZTvQnr8YcSbVfo6p
	JSiGfqVBCja6hdZWBRvYc3z+ZEBs3qfo9ujtKGTT5SLFBAfKSSHAF3LpAJDQNv7UFuKK8Ng4yATiA
	LvnhEFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUlv-0000000EU60-49bn;
	Thu, 04 Jul 2024 22:17:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUlX-0000000EU2W-1RlT;
	Thu, 04 Jul 2024 22:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7D12628F9;
	Thu,  4 Jul 2024 22:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258D3C3277B;
	Thu,  4 Jul 2024 22:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720131440;
	bh=0QQgidXtWp8QZnZvqZ4MSjBn79gM4mDK0CmxsML3CGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aL42qxm2sAAPwRaYZRrNqdU6k6gJSFgnGbM808I+DLcIw3Va42vqXh/P3GxCEIyr6
	 9WB4H/u2r5xvKR6+bGsFIm3XLoFobSbe4HjYnjjOOqcBbui3+c+fC20WEe9/5qRu4+
	 Aq7IJjsZMf/6LVD3bAanL0trmopnH62Gmpws4h1n35dgcoLQtliwCOZwyD/Pa6Kx9j
	 oHbSQbG1laNWSNlcnlyZ+xHbhuK465pBgDfNHA64ndG83UeIanyv+OEHJeYNKv6cVl
	 mf8mPS1xylQ+6JuWEF5ziM5Q0vvCGW8u66XZzbtsjjYKZ/6BnJ3u8ASHwb4cuyaBHL
	 gSQC00AyctpiA==
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
Subject: [PATCH 1/2] i2c: mt7621: Add Airoha EN7581 i2c support
Date: Fri,  5 Jul 2024 00:16:14 +0200
Message-ID: <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720130844.git.lorenzo@kernel.org>
References: <cover.1720130844.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_151723_442034_B76200B0 
X-CRM114-Status: GOOD (  10.09  )
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

Tested-by: Ray Liu <ray.liu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
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


