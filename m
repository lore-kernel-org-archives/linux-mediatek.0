Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A03AC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMzII5SrguwkSw5E2H8OwaEsF1/6pk8s3bLM9whhAzs=; b=D0LlH0tJ04lmn1xk6Gf133P6wh
	aHaRUophRbLfOoRjAna18snRrWRjPNXrQ2KgL0Eht39iIObqJTh7aIgPTTuni2LZ5/RuM5wMVYCkX
	rGsWiNKmHIX0W6tUPiIjvtiJcgFx6DeE+coYuL6GoZq86hpx/dD2l/Hl3b+8DxfyAqLuDj+qI/vbL
	hbmprMFTs1GKRSi4PQefYBG1ttRS8fBjYgTxK3IH4n47aQv0HqexGn2jLVI4QcWNiXz7RQt2BERA3
	9p8TQObf9LqOu0h1D/usVnM/FkW+bQCS7t9VctJHX2xzRk/A4ckeCJ4Y3De5tUv57pR17vBqmKW4m
	1AJ+LQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUm7-0000000EU8H-3hms;
	Thu, 04 Jul 2024 22:17:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUla-0000000EU3N-2F7u;
	Thu, 04 Jul 2024 22:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F3357CE3899;
	Thu,  4 Jul 2024 22:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF86C3277B;
	Thu,  4 Jul 2024 22:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720131444;
	bh=U9kX6F2NynFqke8lVdenBDLDD0kM/a5L5wxCfA/OF3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVKh5FqVjMkxjqFaASeJTw8Nwe6hJ4n5zXcesQHwii7yTrd5o9zPjOuIrxShRASmi
	 lJcFEg3qzv0EKvS2l1I+59YKcfmeaPeFb41EedD2XWBe39zKrEuGX/VoC92Ehno/Lj
	 +DE4YxXQihhZxeEh0jYxObo6hA9dnObFqNmiAYA4xzCQMJ6gExqJ1dP3pC7N6Gyv/Z
	 ysjk96qGVM5Z/s5HravnF1SxK2sdRqwbXoUueqLCT/N/WLd5FxnllCnot35xW0Zu5h
	 a9ZOhhNunQ/m+MvABdhm2XKIEWgW/KvRmtXSpUISugUMIQP1mzl/5YIUhLFhFr6slU
	 U1d21poUNlLkQ==
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
Subject: [PATCH 2/2] i2c: mt7621: make device_reset optional
Date: Fri,  5 Jul 2024 00:16:15 +0200
Message-ID: <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720130844.git.lorenzo@kernel.org>
References: <cover.1720130844.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_151726_772227_7C15442B 
X-CRM114-Status: GOOD (  10.56  )
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

Rely on device_reset_optional() instead of device_reset() in
mtk_i2c_reset routine since Airoha EN7581 reset controller does not
implement the reset callback and device reset is not mandatory on this
SoC. This will remove the following log:

i2c-mt7621 1fbf8000.i2c0: I2C reset failed!

Tested-by: Ray Liu <ray.liu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 81d46169bc1f..8cd89a2f59df 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -85,7 +85,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.45.2


