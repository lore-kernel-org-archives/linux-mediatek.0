Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387F606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eKRHbuco;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aN9dMpw/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=; b=eKRHbuco2mab1d
	+9hrJdcV5iDvpby5w19SkvM5d/UueQcE97VEpp10xILLMUIe6KP8lSXTZ5RVKtItQXm1CNVXgYI/x
	hg8M1CcppZDnSixQQWFYQjMqqMdG6ZoNt2UJEWkqae89Mi9qawEaxFfnSiKriiusyyjBjPXpAxcSG
	JeywSz9+JhAbYzzo8etK3pLUIWMz4+KtoaIgJiYDvUjHTOkKPtd9Ra+G9iwp7/1jmczc+k4YGJjua
	RqmsBLnc7ELOuQf6WMBHpvlzSQbF8kTCoEeZQ2ELmuPxBXX/eYd1Ieagpmr4i5OEC44ipL3WsKoYQ
	gJo8V+37tTko+5whW1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhj-00000003f5r-1V51;
	Tue, 03 Nov 2026 21:06:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhe-00000003f2g-1ELt
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 21:06:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so57475e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739956; x=1794344756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=aN9dMpw/SnFk7Eu4cY7cXh/zg40JuF1BparjpUdBcsJdqHU63ZsLge/8roHjrj2ZSK
         uwHPSa9b0+g2uUijskOta6LXkt3wZIRUGiIfRbOZABVZ2eSGcy7w9MpDKySwzmMstpd9
         8Ki+CzdcVaYewHsj14I75QRgcMyGY8HEfS7nxKKHU+xPbYkAKd6HFnj8r6PYyCdGLCOY
         xhoYCUnuKlxGWWxVqKxT1yvrCBQRrIco7a2YfoLltg9HCPZUQQ5z/hgEIgZaGvpcJWFl
         GhfE4kbNimYrlUoczlqkDvNkVziQwuIfR/qzHq7bVMNp/x8TpObOVSSK23NkrVbBDs1d
         nufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739956; x=1794344756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=BrDpTAAeObz0VXh2VrEvIMXdgEy52PnFIJQR4tZ/Znb77AOEgDxlVuqjqN5Vu6z0QO
         TYR2Sbqv4IeTThtVmrM/ZsmJynnRZ9egVlQ8clyhRr9DQOFg3S81nQgT73Ix1PZsmZLJ
         RMXeOD+nCh7oXaOdP4mZsJn3S04Dc7E3LZhqY/dFr+v+2Rk2tn9T7WMlsD4xIRUErOHB
         IvUl7OFuUSqdv7tzU95IqhLXs2VcN2XrfRAQwLWY5M2R5QJgjQebCrKgnNqfY1YP/QV9
         uXW6QvOx0x3sR88nTO8KkT7bvX81Taf85OE1GHkx0Ew2xrgVfRF49XKUTdFMBUIBmqsB
         GEhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9WJemyJiMBVsjdQMuQo6Uvl2cKUnLwG8n3rjPX37T2FI7D2033U2Ga9uoCd/bfwvf41DCs5JfyFF2hqSjBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/puTtD/PK0z+yMtfvgU7uhboJ8kTAWG0CHrqw8lsJs9XgJ7n+R
	WFqXfxQwa171k61fQKjc8GmjFfDKmmlDR4Yh1myLQwRC+23qHLa7WZacB8PxjA==
X-Gm-Gg: AYBFou2386KscCpEM3NHglKbKbL5pzz1haaYT9h1db57qFNPTPvJ7W58O/OjS1CdQaj
	eGNz+q6PJ2Dd/nPK2JRT3w7cwA0Rt4Sc4uGE8p8XoQD9jzuddQnW8F55nlwnWVDfwpoyg+Tfc5z
	InW4szRT+DjO/3VgUHbFtlxNb4vDLuKC2PE2h7VY6mztP/fRZHnoGnWSNrXLBvM3g+qVSrPznYK
	XE5Ml4HwRVu5rPqib9J7nNij+0c6FnyY1icUuYE8EJdHyevQMe0pZbjzEKQHkjU994IBuKK7q0J
	oOCZ6JJuryIsr509aoP1NAORt8vlIwO0FJV9jd9paBkn9Y44PlD6bHgQ0d7/jHGJyDLkWD73/+0
	uIO9cduS4Xe17tyAufWN5oh6nkjZ+YI6wzVgr96Ftg1sWIAjdbuqlkKR3Cc2lTi8ZW6jw+DJIr7
	DXeEQ6RtBMjG0qoT5lXoFiuT9nEw7/ZvbpM5BraU/th11rkvQnSABquB6V6i+DPeRrdd9TojRhM
	IQcOyWeOqeY7VH6FOMjylYwI4NsBcAffd+OawvTuDV4zPT9RMCGMJju3y+2SC3SE2+LvwEvNktf
	doFjM9bEFkQqwDMeH9ePbIWaRHanF2tQqXqJsq+5Rpx1yd9YHj6wE7GvUYvfW6r2x4pfHbiRP/X
	qf4vLCq6OMwgLboC/aYmEEyY/m0eQ/JgAfQ==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr345625415e9.4.1793739956406;
        Tue, 03 Nov 2026 13:05:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:55 -0800 (PST)
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
Subject: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Tue,  3 Nov 2026 22:05:41 +0100
Message-ID: <20261103210542.15965-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103210542.15965-1-ansuelsmth@gmail.com>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_130558_346915_638AAE9C 
X-CRM114-Status: GOOD (  17.06  )
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
Changes v2:
- Use match data for storage

 drivers/i2c/busses/i2c-mt7621.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..fa1f32d4f046 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -57,9 +57,14 @@
 /* timeout waiting for I2C devices to respond */
 #define TIMEOUT_MS		1000
 
+struct mtk_i2c_data {
+	bool have_scl_stretch;
+};
+
 struct mtk_i2c {
 	void __iomem *base;
 	struct device *dev;
+	const struct mtk_i2c_data *data;
 	struct i2c_adapter adap;
 	u32 bus_freq;
 	u32 clk_div;
@@ -83,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +99,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->data->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -247,8 +256,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 	.functionality = mtk_i2c_func,
 };
 
+static const struct mtk_i2c_data i2c_mt7621_data = {
+	.have_scl_stretch = true,
+};
+
+static const struct mtk_i2c_data i2c_an7581_data = {
+	.have_scl_stretch = false,
+};
+
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "mediatek,mt7621-i2c", .data = &i2c_mt7621_data },
+	{ .compatible = "airoha,an7581-i2c", .data = &i2c_an7581_data },
 	{ /* sentinel */ }
 };
 
@@ -286,6 +304,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->dev = &pdev->dev;
+	i2c->data = device_get_match_data(&pdev->dev);
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				 &i2c->bus_freq))
-- 
2.55.0


