Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153160A2608
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YG5xHe2X;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=pDkUyqW0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ScFT/OtpxKSo3knUou8IYhnwGsI32WdaoJ4b5AsUsn0=; b=YG5xHe2XmFWV2h
	l9f4exP9qNq8Pdp712fbGYTS95LzYPZGloeg/N3Gmrgg45OMjTpzB0b7/2TYDrQcKw6bTwbcdDhIm
	M6aMMsJvT8m5RNf1s39k8t3KMZufH/xXJVYLhOgWxeI3kRz7DK6P6p/C4Rnc3E7KAnS+GdM6bMWkZ
	OaH/L/dub2v27fgisXFUXv1jSFoSJgtdBqW2CvZIk77GvP84YkEszB6VLVpaLr9ygh2dWHt9Qt6gj
	0amdKl/CgPniji8xZP1dgZDfQ+LJ7wpgQp1ozxCZmO7gP9wKFgGUeujX1Hsfe7CI2VKc+RlhGg2mL
	btQvOHGDVsOB8RC9USJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5C0-0000000CgLi-0gZl;
	Thu, 19 Nov 2026 16:41:00 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5By-0000000CgKH-0PIN;
	Thu, 19 Nov 2026 16:40:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FB3057727C;
	Thu, 19 Nov 2026 17:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1795106453; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ScFT/OtpxKSo3knUou8IYhnwGsI32WdaoJ4b5AsUsn0=;
	b=pDkUyqW05WKCxSsJVLoK9XaiqWAtEkKz6crQuWs/4qzCMnyvIe/weziSyHmWGqHNK9QbG1
	smmYmdl3CqOpPj8TKaLg2y5DgQZFVO7Uwdi1EvzhS7j2q+qzV1XuXqbexgn1cmH3XQ246v
	Lq+HPukbnQ0nTIL1JDctLARKxBVRu4NPPVpkDo4N0PNx37yRVjo1Gpvi/khb8TfvA+qDT4
	nyDkRaJJd4YAk+COtLwSuAi047+E7IuPafoYqwDQxMzgxoZ++rQ/LACOFVEEn8WR+hZfrL
	UA/tgQClPJfqUmgxu/DJthw+4BRSHc6roAOiVEBlDBuZurKURG6zKmiOgdQ+Uw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 1/2] i2c: mt7621: support big endian processors
Date: Thu, 19 Nov 2026 16:40:39 +0000
Message-Id: <20261119164040.2400580-2-cjd@cjdns.fr>
In-Reply-To: <20261119164040.2400580-1-cjd@cjdns.fr>
References: <20261119164040.2400580-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084058_341656_BE912C38 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Data is copied to and from I2C by way of a pair of IOMEM registers.
When sending, the data is copied to an intermediare buffer and then
written to the registers. However, the data is nominally little endian
but the registers are in CPU byte order. Make the buffer explicitly
little endian and use little endian read/write to support I2C on big
endian CPUs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/i2c/busses/i2c-mt7621.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 826abb9252e31..c79a47b293ef4 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -185,7 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 		/* transfer data */
 		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
-			u32 data[2] = { };
+			__le32 data[2] = { };
+			u32 val;
 
 			page_len = (len >= 8) ? 8 : len;
 
@@ -194,9 +195,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 					SM0CTL1_READ : SM0CTL1_READ_LAST;
 			} else {
 				memcpy(data, &pmsg->buf[j], page_len);
-				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
-				if (page_len > 4)
-					iowrite32(data[1], i2c->base + REG_SM0D1_REG);
+				val = le32_to_cpu(data[0]);
+				iowrite32(val, i2c->base + REG_SM0D0_REG);
+				if (page_len > 4) {
+					val = le32_to_cpu(data[1]);
+					iowrite32(val, i2c->base + REG_SM0D1_REG);
+				}
 				cmd = SM0CTL1_WRITE;
 			}
 
@@ -205,9 +209,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				goto err_timeout;
 
 			if (pmsg->flags & I2C_M_RD) {
-				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
-				if (page_len > 4)
-					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
+				val = ioread32(i2c->base + REG_SM0D0_REG);
+				data[0] = cpu_to_le32(val);
+				if (page_len > 4) {
+					val = ioread32(i2c->base + REG_SM0D1_REG);
+					data[1] = cpu_to_le32(val);
+				}
 				memcpy(&pmsg->buf[j], data, page_len);
 			} else {
 				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
-- 
2.39.5


