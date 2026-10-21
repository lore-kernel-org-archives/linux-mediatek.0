Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391E606A323
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUjhnMce;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIA71DZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=; b=IUjhnMceStsP4uj74pmI7vh8Xx
	F0ClICfMJDSzDFYR5MuT5NRRfwDwZM6TLrkvUi1SRY7iz4cjY/5Upm7xciHYonqhCePUOFST6vrJt
	M2Hac6KfGfgP6/EJ8p9PmnDnNhPtmax5E7+f41rH3ipxuL45wOtnj5EmEY0NOzDTFpsbacV3o+ZRP
	zp/uZq1734K/AFlH/wrNZyX7JMh4hOes264YGdSAF0aEwCP8HrscbGSKHdVF11Mzw3ylDVVQuh6fj
	VrPe8L+tkO4Ld8G/lHpHd7Tiqy+2DXd8+c1nUlvLo91xd904r1Hbs6qeMKSUCYQFe+r43yJ5FCYVL
	sH1iTzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYsl-0000000CLuE-2Wym;
	Wed, 21 Oct 2026 16:09:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYsj-0000000CLsy-1bkt
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 16:09:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dc202a60eso465274f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598975; x=1793203775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=LIA71DZEozYDb1TLL3+cU7OKVWNSs0dSTVz2rJJ6P4LIorycREQEViD1fQ+IWFK3fP
         G2C9UfV0RE5xANJztnTdaAcOEB68AbKd/Q84ly8ciYJlPCmc/QHqk1xYCsPAad42hZLi
         FepkPT2ZMFIX8wFn1ijBQ9yhnyqETrfm/gna7X+B4S9IH8B7aWPeDvQFK8LkLknYElJN
         iPxVeXCChRHQK90Pqo1ZEl6moXOCgvP4JpMoVDA5QR1pH8kI0XPV8p/zcd3jSYPxQdLS
         J7ydza5uVMoV6+nmf4+3f92cPLcgz5uHJRMMmp2UMWCmxAbwTzEdtLXjeEeR6SefPGSc
         KNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598975; x=1793203775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=AmTsOY16VrZVoG08hmsPL/502aYGbWttf484verz5arhtCAL4+vySqX1sa2mM2I31A
         5UiKJh3t7zTW0acnZRP2Gsj7v4XmdWr49KFH9ivEkhbEJYoo4G2zYQtB0um9Twi15s7h
         K9fGnbXA4pcoFbQDXWV+VfeM1gbFmfeOKs61+uS8+Q/S3hd2CQLIBaIyGuZnTA4BU3rG
         XcuQ8+rbQL5QwSOEcLUxH037Dve/iVdmIlWvSypvqlgKmhu57tZLgRfkqueX2OoXJG75
         6kArvVcb52/xXsQpkD+aVPeb+tTOXBo+uHG67l6hQFTJXwD51hbrrhfvmeUuJzNw17Sy
         ok8w==
X-Forwarded-Encrypted: i=1; AKwUvBzbO68dQoXcDWnF7X8FBJjzrGdY5d06YuSgQHI0j0mijcCjHwbQkvW64m+H4aKagBksCcPvs0WUR5qDVqxHnA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI4pblfZVz3xxsn+0SARyOJTgOoh8LUuVFbWf2xAJAtffgmMrrw
	sgxxEPJaAwI/WBNl3UX0bOC+BFMme4g6TiUvp7VXaDsQZGUBmhlofyh9
X-Gm-Gg: AYBFou1S6urOJpzV0BH9oHCO9rCHr/C/llY93YhfVo9/d9GBlx6xFyJOLWUVzZDSYVP
	jF6iM/5MNhxgDOYEIb1E62jLSy5Wk85KHuxraj6e6LE5Va0gubep4cQgn6ql6W+nlUjYG/OqCcp
	MLkg6TxcP8NxPMv4jJw0c9GtsYsx1cYaerCrVLvUzVS2AZLTAX35Ba6Dfs6rOBr+fPGvQg9i6WC
	7mbVS78uAy6l9/Qj1K9YWX+gjR549InHpmwYnuRylUcDkrWux64UPaQy7Svv6mkZoavD7NvABwj
	ag+VLVOb5KPfkLIKW1n6udwsIrQthSsIHU6BnxU80UC+hJ+maSCSycH2CosnKHzbHy45/4xpXJN
	ly3mpwzNcLyfQpLjiBXaZ+kyuQpNmGMJTBz0SN7Knkq/gZVAwBEt9jbSegtKAQICqPCgDDG9jUs
	gacFeB4v2Xt8LzBzK+Dq5eqi4k0h7cbNZQPRHEBvHa59jPOa92Vc7Yd1fIaH/xCbVkMhuNgFjMq
	bEad0aMys+kgtk9x6O+OgZGgVh5ec9tt20rOoIWj4hZr4ZjoVZ94XndWpe3UmJVBRTpATo0Dbh6
	HRms9uag4p7U6SkWQxdvjDUuPB0uYXmZcai7rp4UGmizaTzyboe7gm2RJHdl
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr60190065e9.7.1792598975417;
        Wed, 21 Oct 2026 09:09:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm6226569f8f.1.2026.10.21.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:09:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
Date: Wed, 21 Oct 2026 18:09:24 +0200
Message-ID: <20261021160925.286424-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_090937_434190_EEFF57CB 
X-CRM114-Status: GOOD (  11.81  )
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

When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
stack data is copied and written to REG_SM0D1_REG. Equally on the read
part, an unnecessary read is done.

Guard these extra copy/write and read for the page_len to fix leaking
uninitialized stack memory.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 19dde7c4069e..b4d2f9c5514d 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -96,7 +96,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
 	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
-	if (i2c->have_scl_stretch)
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
 		reg |= SM0CTL0_SCL_STRETCH;
 
 	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
@@ -302,9 +303,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Set SCL_STRETCH only for Mediatek SoC */
 	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
-		i2c->have_scl_stretch = true;
+		i2c->have_scl_stretch
 
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
-- 
2.55.0


