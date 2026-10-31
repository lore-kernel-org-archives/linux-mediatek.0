Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE2606A31A
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPuz4k6S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJnjp1H5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=; b=DPuz4k6SGnbU4q
	YhVTopCTj6HNyo+PgsMFFthihoYcL4u9aS4c1l1p4gd/ii4gnQvoUimGWmYRvCFF+02If65Az+UCN
	HxGj4ee3m34+P+LF4HuLaK05584X4EywAxFXrIsgAKIQHRIBTVNf+MPjnigHnCQevxPtNPdB+2aXb
	dH9JDa6MLEfKaLFXfld9VNwWcvwwLpQwTQanPhfprCcXgJ588vJKN4dr8HxrfPbSiiGW69k0j7jSx
	eW3ymOwmX/Cxe4Y/CQdCI1qubcGiEMjIVh9xMCiLY41OICQLVtyl5eCe2lR2ZBpTD4+lk4uD/h4cn
	3Wh/odE9D+kKCucD06oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IZ-0000000DDBB-2vHH;
	Sat, 31 Oct 2026 10:26:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IV-0000000DD9L-2XpI
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Oct 2026 10:26:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11835975e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 31 Oct 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442410; x=1794047210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=TJnjp1H57YwHpMUYX9Pnbm75jZ6q+MkanVIJMWw3/20IIFsiCv1r/DXqgV2pX8UX75
         N2IVIrRjOuxjjwV+rFI2c6tS/CYyRVwCbDCRoTVYyAJ3GfaRAc9KGTGZEsOdi5oqs9LA
         ARir6AJlhm5vBxcrpJPruKhqKr5aMdGiQDN2o29WHV3pODf7G6yBPNrYxFhoz+FpG3+y
         kO+QcCJc25Yt26bzGnepGKQms24yXJz3z1Lws7gDMPs6Pq87cMqFsTk/mbsrO/upPOBP
         he/x50r3pHW+WmShJ1z284TSDpl48AHIjwVDSVg++xljhtk8u/NPt0S705F7a2SZyljf
         iKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442410; x=1794047210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=V03k7EaWg1re0wz+Z69HruZJ0Z1OcOvqFZBHiL004aqaEt+jhqOzYHbCLbd/3Ppsyt
         oZObqVvZEoQNHVcpvSS+qClpYeGKYZGGgtjiX39rpkTXSDtzArOYOeAkNdygSIkqqdid
         iOMmNaCFjyVv39+vzX5BrwicV96t/G0NxiM9Gk79CJarabvJE56owW6pYR0KTNgQgkC9
         tBVZ/5nrAMCKtsTNxZK2y4cXRVfhukUAf0r/U+CcCQD4LPfNnlM1xUdGtcA56uwEPXaV
         lJWVWtTi+3hlgaTNf8VxdnKUraxazToanlZyn1PnsNCYzs+NbvQnXEqOntNME+zjIfzb
         e7fQ==
X-Forwarded-Encrypted: i=1; AKwUvByjbgpBSzpmHYjt07K+adVxFq7o/YacIewMPpsr/9QAKA7JNDpSyzIHJmHs57yOF3Z0JjywldYg8uMba+Zuwg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJue2SffCMfGweQMd36iWgf47B4XMEw3y0HzTLMhkdkBA/HHIee
	K13qQnemAml3G0Jeo96A0A54qL18cUpwzSnDcs8wCWiCFQaVv3ymJKQQ
X-Gm-Gg: AYBFou1rrSu/TWgHGBmsZ2Tt+ODj37Kusxdtd5tz0Ewpw8ZwM9Gdib9SNrz0EgULjku
	P5R25bWepM6ZcQgxjDPb9mgbb5BJ3EN03NfFY60Kmi6ZF6YhWYQeKoEOtIWSCB7c0NEEa9b8P2H
	b3mX7pPzf3HT952BVOeSkhBKKlE4Z9S1Og+3pAiwkhNbxRxa5SJLzUnLSlmQsPc+gTEHm5iRBk2
	GyN4yuiBK8D9Lxa7ywEuYsmQlLaHc/pvWnlPQ14srPEVZSEAVnHGSbrlKqpDeMZ/fYV2nFSUKI+
	SJWHTDK3rMt/LxPyiBzT+SRbETBJjaGytTqbSGSL4bcLZ0CsKtbIyRYym+dDk1A1he0B+XagTyX
	LONTMpdM/3q81l89zGCRrM2jaIckc43DlhO8WOvWA+a6/mSH/umUV2SnH82ceNZCyYTPj3uJ0G+
	zYPPlNj+tvzjRy9MQ7iMciW7k4fTif8JR1YC+VX7WHkkAolpYkcY1RiATgO+CDT0/qpFiTp4ME8
	JRA+nr2MPUtBlVGNjbaBIt2WYvcmxht4aO1sYtLl0sZqVRi2XJrD1UzvhA0XuzBuSHh8JY3lZ24
	fDQ56WWjy1ZgkGpMC3AttbgnMui+V5XXuJ2Y4bxCJcIlctXlNl8CtdYWeojUQFDcK2uX9NGC21w
	P247UsfZdoWl0jw==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr110005305e9.24.1793442409529;
        Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:48 -0700 (PDT)
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
Subject: [PATCH v2 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Sat, 31 Oct 2026 11:26:40 +0100
Message-ID: <20261031102641.12649-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031102641.12649-1-ansuelsmth@gmail.com>
References: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_032651_662184_53A051D8 
X-CRM114-Status: GOOD (  16.26  )
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


