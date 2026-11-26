Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1A606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k3OL16da;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbUHrtif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K5FFI394OFMdGPEkQA4YWLY4c1CiFl6MzB/Tecc86+Y=; b=k3OL16daFczvDkCEwnZcuYd7Rg
	E18Tf9ZbbHv2bMoABm068JT5SP47UxlgJNmib+rhCWxy2AFONzYAjQ/rQ2KvY/9rJVy2k+aHRWsFT
	3U8iRlJHoIrxRUE/RNvTjrTsqVSqW9q+SdGMegMtp0G/SS84cgb5gjz/02fGraMbNtEGIzZ8WwxpV
	xz6UM4yPX+XW2SrYhi3vs6tzPLv25NIzUgki3IlraaZ4ztqfUHoRNYRu4JpjTs0uvPRhJvLqkf4GR
	2pw17KMcJoXtoSZZkzW+IAzHJu41o8ob8ea2EDp42i4FJi8wu81QhJK4FeC09jEGgpxy1R5ObKv/f
	w61Ymgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNlF-0000000BjHR-2zMk;
	Thu, 26 Nov 2026 00:54:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkA-0000000BiOa-0Bsw;
	Thu, 26 Nov 2026 00:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD65E41836;
	Thu, 26 Nov 2026 00:53:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654425;
	b=P2GRev9w+pw6kufLVx6cMjQNB7FEHa+7e9E7EBa1zcpJutLO+CA5oEpy3JH/uECShcty
	 mzb/MMMGgoBPBFLpAyBO5gzjoENyzEro0xFLaAcHanWtjB9MZpJaJspZ1sCbv00lTVOKQ
	 jVQd9+u4MkBpaxfJW9Zll9276VmWC1ltmhoQXgp6giMoV2HtvsFvx2fAungqsWVUXFesg
	 a4k6AVfVaRRUDuLMfvtGLME2eeTNu21ouBcOm1cwIfgNSuKEAYwshsouflD8YYLbpd/hJ
	 GiMYK5yv07DEZsXuaNDd83tX9YnDl75tqDNuM5TDFILXJ+Uydoa50kSgiIWtXDXpTDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654425;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K5FFI394OFMdGPEkQA4YWLY4c1CiFl6MzB/Tecc86+Y=;
	b=nkWFsG8fEQmmhulMCMn1VGoDVd93uy8FUDWn6B/k2q0MmqYuTFkzfbZmr0vJgW7is3M+
	 ZwdFJQOj3YJz9oHRjPrHep81zmMWI3nzVAp0r4VOHeyloTHRreZsohah1LOgBvHcd11KC
	 rTVp4f3Pa18eknrY970YHzlFwQ2s78QwZiCA2LblFelOrlzPROPPF+t6V423hI2T2Yr1v
	 Hnub2W6eUBbQ0vdb7K/InEchio8x6goDKUvKg2vw+pu8JzRSIddExSuV2KWwKEHZRkcQD
	 BWxlj4dpPjMDsFHdiiNEnvLnwScBfkfwgNNXg6PCsD5tZuBW0HmsYLAMCGvsZ4pwE6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62A681F0156C;
	Thu, 26 Nov 2026 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654425;
	bh=K5FFI394OFMdGPEkQA4YWLY4c1CiFl6MzB/Tecc86+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=BbUHrtifF5icG0LhBs+/2UsinfE4jMNI35oTTERicdeXLUbY0yzAoW/D3eQ1ROtEx
	 iwjoasmXUDbz7Z7lLlK3DNA57VBve0rKKWKALnbErojUsFHSGmOT5mjSzpSi8kUeTm
	 Ain1n7kHF5eY1TpLLeLrH/7B7JPQ54SEy6x7Tcbe63AuFH3c0idUFTMClx1x15fBli
	 A0prV77s3iLtL9DG+VmvPd5AHscYM8X656pE9zEx9GIwIo4WEHYpCj1wrX7tKyoIRA
	 qKs9eyT2gllRGTG0Y82lVafzYfpEWd3tu5GCMz7AqiqX/vLqeut6if/n5zqz86Vex8
	 Zj3k/A4sDCm+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 37DA24D148;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] iio: adc: mt6359: divide scale by ADC resolution
Date: Thu, 26 Nov 2026 00:53:27 +0000
Message-Id: <20261126005326.71926-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126005326.71926-1-iasnezhkov@gmail.com>
References: <20261126005326.71926-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654406; l=1939;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=7vl4u01SgEwCwc9gl97LuugAuG8wvcClmhuIXz5B3VY=;
 b=M8ELTrNymnSSBWnP8gL6gLxOjdl2/HKVLecz/v7T5ncHp45P7pIx1mRuN2Oe8O5ic9rZfd5TL
 0UqwEjBwP4nCH1dmLbKyCuBz49O1aoUzCyYUkdxvixwGZbEItLupanh
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mt6359_auxadc_read_raw() returns raw ADC counts for IIO_CHAN_INFO_RAW
(12-bit or 15-bit depending on the channel), and returns only
(r_ratio.numerator * vref_mV) / r_ratio.denominator for
IIO_CHAN_INFO_SCALE without dividing by the ADC full-scale range
(1 << chan->scan_type.realbits).

As a result, iio_read_channel_processed() and userspace consumers
multiplying raw * scale obtain millivolt values that are 4096x (12-bit)
or 32768x (15-bit) too large.

Include the 1 << chan->scan_type.realbits divisor in
IIO_CHAN_INFO_SCALE: shift r_ratio.denominator left by realbits for
IIO_VAL_FRACTIONAL when denominator > 1 (r_ratio.denominator is u8 and
realbits is at most 15, so the result fits comfortably in int), and
return IIO_VAL_FRACTIONAL_LOG2 with realbits otherwise so channels with
denominator == 1 use an exact shift and unpopulated descriptors (such
as MT6357 VDCXO where denominator == 0) cannot trigger division by zero.

Found and drafted with an AI coding assistant.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 88b0e26..54c9048 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -772,11 +772,12 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 		*val = desc->r_ratio.numerator * cinfo->vref_mV;
 
 		if (desc->r_ratio.denominator > 1) {
-			*val2 = desc->r_ratio.denominator;
+			*val2 = (int)desc->r_ratio.denominator << chan->scan_type.realbits;
 			return IIO_VAL_FRACTIONAL;
 		}
 
-		return IIO_VAL_INT;
+		*val2 = chan->scan_type.realbits;
+		return IIO_VAL_FRACTIONAL_LOG2;
 	}
 
 	scoped_guard(mutex, &adc_dev->lock) {
-- 
2.54.0 (Apple Git-157)




