Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BEAFD4F2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=; b=BCiQW/XQ2PbEsIdYOdT1SCMb1A
	08szHFdYxeOJzWWGZszXhauS7cvdiWZA/bjwNZsRlCDxYfKDHu7xVRINet0NqOwZlzQpRJlVkrP/l
	rkIVAL+NE+zATnvZq3Hn5U+SY7M9B6MMDiv6HNper3i9WJcQpOJitcqMfzuwBwjnWcBihYbzQghLD
	bSftK2hNbsCIQ7IR6lL3q+woYUgqdqTcKSmPrfF9oomtDFwqrmoHYHSl+vixsJLv5q7T1/DrF6gGV
	HQQmUmgTfvu94Lv34XIgtmL4ey+aCT+Ej/rxMVgQRuhjnXI5pjrm1qC06IZ0rtHrWEqn1EExu04qm
	MrbBRlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LZ-0000000ADzW-3K77;
	Tue, 10 Mar 2026 20:06:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LX-0000000ADwh-0Oz6
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8296dabef74so6713998b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173186; x=1773777986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=BIX3i8y4r4xu9nSLqbyQ99i0COiUtmk4GYOvcQI2HXdoIkx39J4jO0MIDmKGO0dvvp
         LOICfXej46GdhuxHz/ZjhsMWup4qQ/AM/nHIPZpvREzV6t6PM3QU0VGaQEmqQWV19KJz
         cmLwx+UyhvBBb9BfOLWlJ2RKvez8ceGT4dGbbbZNxa4/13cR2R5KlSanpLThBmqpO1ed
         zzjQIeN2Wc7wvNeZVMJnMgK5p0B9t6sE7xwHn43svCLrFUuzJrHw/d0Dht4e4wFo6EPQ
         UZ8k87TnRO+PcxGse8y9ecdjJBe/4PJbGZ9yiEf0VrDYHFhphEpQBbtdZJkuy5IH5PqN
         1MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173186; x=1773777986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=pP8UJBqu/2jM4f84SzgqxO+uejj5yTQPFNmH6OBTt9y6tE2fr77/7sFsHy2qfDNBRR
         EHKzLfeuRfHH4syFZkJDFKuLm4DyRJ2utedQM/nMdeNlWceUpByDrNGhdem11FJW687c
         b66PISGNwkGOOtJ7OrhGF+LIT8K3xdVRE5jTrdcX22uASh86AiGuObneU1GkQmJH3qHJ
         WLXX5F5BZOqur4RY8tQS13KVt6yYn0THn6fOqUX3UUdvTZ0fxYz1BWEuIkjmnAr9UrrN
         ElPOk1d35SCmTpYOm3P0ou27unh65XZZXYg20a3gCz8IeSo7hOrjxIJrIvFOfS2Oql06
         /KBA==
X-Forwarded-Encrypted: i=1; AJvYcCWJppidjQ2NwmjTetfX1cGy+ydPVXecscdztv/TXoaePVP1V0XwTS3KaeMGe7orX9uoTRaJRyIPqR9txmNk5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoEI/AgCj1bBilrdmNS9d+ECcqdM5vSM7Kyueqiyu1T2B5KTaW
	Ieru9Fon7kxYrlbZOT6u7erHB3KA7JbsUFqGPay5bsD1qCHDtiOqLZ3e
X-Gm-Gg: ATEYQzzZoU1knS1v8p0MApXCBH9OI9n7GSeSWbNp0Z73yJ49CE6Edqa/whtUSJtoNFH
	yS4NqvUtMEv0CI6OWJYMmdOU7NQwgXlaDh2iAR1RwWaB6VFIl6mXns4Weq+W7FYENOSvYy+waXf
	DDb9SbYRBPPkzIBbN9Wl7mX1VX6vHGVa7mXLioMHDu70VR0kS7/U7jbcJBU8ikJ1Bq+zmDP6CzG
	yqOpVVCpqWfWOTaS4li+lgtR60eTm+5PGsihHSCQC5Mdozcsd8AmoP85L09k5ftYfgFTq7UOJUs
	XatYcVH8qGeqi8cDHDcgfa8WUwTBkA7Y2ytzuD5GyI1iFItO1uI7G2ELH6fHMcUDGHCBUmWnUcn
	/cC5yJj6WhGAxUg8fJ0jU275j7NCC+J46C6+h4a4ERCXEKiEhTglCidej6Lo6J+hbROoAkrWhqf
	K4hJCKslMjiyGy7iaD5Z8lS0FxTEistq/1XA2WFJofZgQ9z68u
X-Received: by 2002:a05:6a00:13a5:b0:824:374a:1424 with SMTP id d2e1a72fcca58-829f71b3f03mr122810b3a.58.1773173186006;
        Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:25 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 5/7] media: chips-media: coda: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:11 +0530
Message-Id: <20260310200513.2162018-6-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130627_152373_AB21321B 
X-CRM114-Status: GOOD (  13.04  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc()/kzalloc_obj().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 +++++++------------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index b0559303c40f..958e245d0698 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -183,19 +183,17 @@ static void coda_kfifo_sync_to_device_write(struct coda_ctx *ctx)
 
 static int coda_h264_bitstream_pad(struct coda_ctx *ctx, u32 size)
 {
-	unsigned char *buf;
 	u32 n;
 
 	if (size < 6)
 		size = 6;
 
-	buf = kmalloc(size, GFP_KERNEL);
+	unsigned char *buf __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	coda_h264_filler_nal(size, buf);
 	n = kfifo_in(&ctx->bitstream_fifo, buf, size);
-	kfree(buf);
 
 	return (n < size) ? -ENOSPC : 0;
 }
diff --git a/drivers/media/platform/chips-media/coda/coda-jpeg.c b/drivers/media/platform/chips-media/coda/coda-jpeg.c
index 835225383aa1..11f2800014e5 100644
--- a/drivers/media/platform/chips-media/coda/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda/coda-jpeg.c
@@ -584,16 +584,15 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 {
 	int i, j, k, lastk, si, code, maxsymbol;
 	const u8 *bits, *huffval;
-	struct {
-		int size[256];
-		int code[256];
-	} *huff;
 	static const unsigned char *huff_tabs[4] = {
 		luma_dc, luma_ac, chroma_dc, chroma_ac,
 	};
 	int ret = -EINVAL;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[256];
+		int code[256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -607,7 +606,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (i = 1; i <= 16; i++) {
 		j = bits[i - 1];
 		if (k + j > maxsymbol)
-			goto out;
+			return ret;
 		while (j--)
 			huff->size[k++] = i;
 	}
@@ -623,7 +622,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 			code++;
 		}
 		if (code >= (1 << si))
-			goto out;
+			return ret;
 		code <<= 1;
 		si++;
 	}
@@ -632,15 +631,12 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (k = 0; k < lastk; k++) {
 		i = huffval[k];
 		if (i >= maxsymbol || ehufsi[i])
-			goto out;
+			return ret;
 		ehufco[i] = huff->code[k];
 		ehufsi[i] = huff->size[k];
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 #define DC_TABLE_INDEX0		    0
@@ -715,15 +711,14 @@ static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int tab_num)
 
 static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 {
-	struct {
-		int size[4][256];
-		int code[4][256];
-	} *huff;
 	u32 *huff_data;
 	int i, j;
 	int ret;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[4][256];
+		int code[4][256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -732,7 +727,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		ret = coda9_jpeg_gen_enc_huff_tab(ctx, i, huff->size[i],
 						  huff->code[i]);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (!ctx->params.jpeg_huff_data) {
@@ -740,8 +735,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 			kzalloc(sizeof(u32) * CODA9_JPEG_ENC_HUFF_DATA_SIZE,
 				GFP_KERNEL);
 		if (!ctx->params.jpeg_huff_data) {
-			ret = -ENOMEM;
-			goto out;
+			return -ENOMEM;
 		}
 	}
 	huff_data = ctx->params.jpeg_huff_data;
@@ -765,10 +759,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		}
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 static void coda9_jpeg_write_huff_tab(struct coda_ctx *ctx)
-- 
2.34.1


