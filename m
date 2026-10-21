Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A86606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=va2yQMcO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sN6XpeXQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=; b=va2yQMcOE5v9Muyy45MHfg+NVy
	0DE/QXFzVUNLpuetyoZc6tO71rLS87YX8GFrwZgrk6/OSSiJQPgRx79bDKA7mjRV8s2wwus2FZiXX
	kQK57S3vOkGr3qZRHgGPZsPCCjrSkPYW7SZftW8ColO/aPxQH5o32SyPYKivHy9RGc/AnIJxYHayW
	OoEmv6QZmwL6amyoCZI14IF5Q1fRf9oeNLs7yPUU9ReTTYz1DOy8RQ5a+nfsvBBf0mdniQ/qstxq6
	eEpfc4b8AfdVn2wSCCfwViMeURvWNwj2xc1LbTfH9sqdE8R8asFnelXQgJCUiRAVQEPovWVFofhxi
	tn/9lM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQB-0000000CHpK-3A4B;
	Wed, 21 Oct 2026 15:40:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQ8-0000000CHn1-2piO
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 15:40:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso11560015e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597203; x=1793202003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=sN6XpeXQfujCh/xxKO9z3Apof6gP29QlZeLD8r1b6U3R8XQbhqAtfHH4WKnnsQgxnB
         pqJNDfrkkNVNoO9AN5oA37UbqcGWXkhVwgiKT4qZW5t29Rp7hY/xjrbJq9RYHritRL2J
         nA8dTz952hcI9WJ86m3i7nYvk5dvFTZ+5K8J0jn7yfr0Y5f3qGYCXJDxTlLQZErs7ArZ
         hRI2J8V+miySxVBAHT5D4mm3migC0M+8ZNgStVZnoQCuRyixqAUwk2EnrZOAqnLTzdb+
         rE97TaA6Hxyf2aApa5pfHNX7G4KEkCLL2m+f2oszZfvOFnFWyM7vB7CbaN/FLRjHZLmm
         x9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597203; x=1793202003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=lbZo0HjBL1a8f0g92ULr19EeE5jwKLGpFCCMRSfFRj/Rzhvl8rH4jEUMcckw/BcIyv
         pTKT2bIvYXg9DIVaCilKn8aN9kb3v4xKM0e1F2aE8kYcbEhGywTXRIn293Z7vAqF+YHz
         gtKkSIhuasZKP9S3OnuEWnsDpUiEm7lxSxvX+fX9cP5a1oqTc37szfYNwz6gihcguMcV
         a35xrnR7h+1YUzKMTCgOXJEVqnoc88v1ZAQWiBhoVlvL+2YvLU658ansssj5B7XWRoVO
         kvxB1jgZHDhw8oA+8aWScwgXE6hklx38+nPhB102E4yhZiWxaRf+Ii2IP8nxcQIG2VKU
         Rm5A==
X-Forwarded-Encrypted: i=1; AKwUvBxgqr9dCVgq3V/WIfLAAr2InQhj6bOHYEA3ienIDZVQGBH4dWOiTOyFIP0vSPR/ByWQ/rLQmKx6LqTL1xqdSw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLWkwUl6ZibflOIAxNS0526ixI92vcGEnifL9Pq7nYSiMirf6mY
	OBfVMj1TcRUP4a9ihl1xsXaUZeBYdoRr5aOBYy9+ylETY3jAU3CbJPaC
X-Gm-Gg: AYBFou0tRPivEcYdLmIEeR8JZWBQXpiLBcHofy6cZk94VfTbf94f7aZToPx7ljyRa5N
	OJRP/ZONAFROld8THBAMj/GnnfxImqU6cLKR0DQ0VPtBP/RVT0FMEeLfyJ+uPqNcLuYgyvedsae
	gMhLo8Xau0+mhAZcF9UuNCOO/BLdG1GcHFtZ/vVkZeYVEz2SWey0udUDCxDYH9bGLULB1vdZlYw
	+n7cY+WZYOaUD+Jftp13ePvnrsZExJeXQynyDrF5kUBOGuyBPrVr+TDdq03RNgaTGmnD8U5j5rz
	9bMx8ZzWg6J4K2Jiz2Kr3ffAWUgeaY7IrI8/jrCHct+eu+jP/BxPcCFPlIEdq+esvEj5+3JrjZ9
	CTRSZdlZnMIgGD1NqaCjfJWMQr2y/aeEPNQCwtqdjBKIiSGLUyIA+ZsJ8qRwJojgxuKuDOywdST
	or2Dv1L6RbhTgn6Y48IiIvdlElDYwsunWRraryXR5Tk3bPBuQwv/xmRrSAynmAaAWDaVNaxIl9C
	FJlgtZMBWPYf2FvuFK6LqCMxEhWYWWnNG2+7De+hx8mxwuufF9WZh9K9hNggQ3wYPilEyGXVped
	2K1iQhBnBJAEIP5tzx+c3Ek0GLWUrs9R3csa0yYrSbXoYAeOGgO5A8aUNX6y
X-Received: by 2002:a05:600c:3513:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a1fdd2461cmr53680805e9.13.1792597202563;
        Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:40:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 21 Oct 2026 17:39:52 +0200
Message-ID: <20261021153953.285222-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021153953.285222-1-ansuelsmth@gmail.com>
References: <20261021153953.285222-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_084004_734947_73E545AD 
X-CRM114-Status: GOOD (  16.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
Mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..19dde7c4069e 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -65,6 +65,7 @@ struct mtk_i2c {
 	u32 clk_div;
 	u32 flags;
 	struct clk *clk;
+	bool have_scl_stretch;
 };
 
 static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
@@ -83,6 +84,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +95,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -249,6 +254,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
@@ -296,6 +302,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		i2c->have_scl_stretch = true;
+
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->algo = &mtk_i2c_algo;
-- 
2.55.0


