Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF3606A8A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hvu9MmWC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEwziJdB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hYihUWQYpNaOwvzyXWFSsLsKCvn9Evlo2JmwSxf7NpI=; b=Hvu9MmWC7BaLpRXKE8Iu/mGEyw
	Lvn8l8MUNPE6MNvkZTzQEtnXsyTuBJ/nNy1GtBC3WZ1OPRDHZu5AZCZ5AT24zjkSLiObtjhwLJDQp
	uet1YM1h5VJdUtRa5/u16l0wJnai+rYgVXLoAWjI4oDWgGVltPjPGTSLM6WtNl7ZhhG9whD7mraBK
	G0ITPV/u4H+evjiNRwniC3SwKJAkiWBmv86+HI/6NAq04sBSL2T5DIzhaplYWAh9gq2aaqOITg0O1
	gHh5OwTYVqFq3Htm5rP2XWBeihKVfyzmeyQ9OapwPwtsK814fj3yAzyLQ1AejAcwHt2wIMKnyPRcx
	BJOJxu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNQG-00000006hYh-1RTc;
	Tue, 17 Nov 2026 17:56:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNQF-00000006hXV-02kN;
	Tue, 17 Nov 2026 17:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DC2045AC4;
	Tue, 17 Nov 2026 17:56:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794938206;
	b=r3ufT+Cj823yyjtxw+k+rpraU1d9SM+zsWzMkTC7RgMQEtG2Dky/Ffq1jI5XdTKrgqsa
	 mGjoLUHpaRjfEpgXa3FGK+n2DHmlNQIAr4bV8WTC0dRf8saI3aSAbar2C/vB3YguySBLt
	 XDC1aEJN96jgAKApvjRVRIjTtTRE+f3PyevVguBB/9alnaRQ8jnIfMo2EvNSb3zv2c36K
	 NlJApBVupUHC75LN040XtbrqAgVpqctTaYh3pksRmMGY82vxEEupcRId9xaE0HX5wSoBu
	 dnuxK0v5pGT66PMlJZ5gOWh542FmCj+Y7Ha4GvbLbBZLRYtq8+mwo1h7zncjDCDWjUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794938206;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hYihUWQYpNaOwvzyXWFSsLsKCvn9Evlo2JmwSxf7NpI=;
	b=lr7/dCXUeoD/c7LTIQ2LioCOHDZH75YMnyUqwkn7rVnHWx6TzbcVp4QzjmzT/9Cef/Ex
	 S1G9ILzSke8k1DHZBozO4Qo09lSnAvl+geVoetFc8btMyyaU8dLojwyYMzDFWsqB2JQgm
	 Wo8QLo6wh/6y9ORGGyRnOxW3OewWZhF3x/SBif6tDRv91UOAHzIlxR/QjgsJ86HRNTtx/
	 7z2vjUmCH4HxzuYl33wbiw4Xhgrput6tKxbUYX8XE1tLpfr6lK3qEAyFEZTmORRikcJlC
	 B7qqJk0ydIjDR68HOVRE3mpxUS8pM2zejsQK1m4Kt00c1kTl22wbA34qERPUaD/flag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 887B31F000C4;
	Tue, 17 Nov 2026 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938206;
	bh=hYihUWQYpNaOwvzyXWFSsLsKCvn9Evlo2JmwSxf7NpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cEwziJdBJ1+7C1uauASeBgCYNgIU+FmCfmXO2JUA9dzWd9gaDsBtr61/36+nJyLhb
	 0hHEBt41RuqJUix9r4aw43vJW8phjixb3EZygMdPvEd5FRFztqdlE93WRUfYwPSiYY
	 1zXjtIrFisipqnueCmc/ZdGCnOziFdRoXS1uo94JJRU/lvWvh3/3j2EV4qvgWe4N0f
	 T2b9+m6xR7NRmbLNz7jCxqB13c9904HeyUKxjlCqtAhGn9W97cfj3yHoSEi1WI2gZD
	 vmZ3pHaustN+ZeJKxI/IPz3ThIgAUPa6SYv0yZSjjWzdMjSuY+P0pN7qs/2M2H+KZu
	 My6kzdC9AIesg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A71C4AA30;
	Tue, 17 Nov 2026 17:56:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 19:56:34 +0200
Subject: [PATCH v2 3/3] iio: adc: mt6359-auxadc: fix scale calculation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-6768-6358-fixes-v2-3-1ffc3c2f3c80@protonmail.com>
References: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
In-Reply-To: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794938202; l=1136;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=dlPuJsQ30iilHCX3ky5K9VEurCW9bPVUqM4NO+pOFjs=;
 b=7iq2aIFVabqKvHpVhkrNE98UvRvNwtTEYyuql4FJ3kV8llZcoCW+TWWlKf0e2TurMkmRjRfqY
 XVTflMRCLfKApjBsZNIt3Vz8qdovb99QqUy2mSf641TdmB1ZK7qeZJ/
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

IIO_CHAN_INFO_SCALE currently returns value without dividing by
2^realbits, overflowing the integer to an invalid value.

Fix this by using IIO_VAL_FRACTIONAL and setting val2 to the ADC
resolution.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 09432d0974cf..3a969c30f633 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -770,13 +770,9 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 
 	if (mask == IIO_CHAN_INFO_SCALE) {
 		*val = desc->r_ratio.numerator * cinfo->vref_mV;
+		*val2 = desc->r_ratio.denominator << chan->scan_type.realbits;
 
-		if (desc->r_ratio.denominator > 1) {
-			*val2 = desc->r_ratio.denominator;
-			return IIO_VAL_FRACTIONAL;
-		}
-
-		return IIO_VAL_INT;
+		return IIO_VAL_FRACTIONAL;
 	}
 
 	scoped_guard(mutex, &adc_dev->lock) {

-- 
2.56.1



