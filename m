Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA187606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 02:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LBgIEXQV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlzZrQMS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iuAZy1Xqdh6yRTzJc6FLUzIwcR1MgTN4XofneJJ+eTc=; b=LBgIEXQVWfQYa/0VOVQkzq/qJq
	26gVnPuZqnJsh9h9AwwSKgV3aN3e8ESkHpLP4fzPMmNg+asDrFhkHBlQEvZBXLh+r6R3YAf5A1eN1
	M6pOA3XzlbfGAb+WqAMck7Qoye1bAnMyDvxhQmZLCf5PP3l9QUpjLwEyi9bY9eocQGJXEohDTiUWP
	/ttvhM0oU4k1/oqVpYMK0ry7dUzgo/QU0yWPghCjZWxWJoOHO5/zjH5YmG3vy9KJRMtbKgpu9W6Xm
	FmBi+sQK40EbEH3dcDiXwFy+8g1odCDeiIu6pd0BX2xqEwUu5Wmw8AJXN0zBlFDK1nGjva6/4KBqR
	DK6n/sgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWm7R-0000000EoK9-0ncB;
	Fri, 27 Nov 2026 02:55:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWm7P-0000000EoJw-0YOQ;
	Fri, 27 Nov 2026 02:55:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DF0F43A1C;
	Fri, 27 Nov 2026 02:55:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748122;
	b=wnuMqB6vezTLGQXhbZZK5xd/b9z29BhJFTN0YJf1IhrjK0ESOrme+MORZTumWScqG1g/
	 tKtUWoJVWyAoO+Og5Z5Xb6CIu1KbWlBuQvGy0J7CT5gYXvgGq+U2R0f2jq+4tlToTQBd6
	 xcgwIKnEYn/3TUliWNZ4HX3rRstxGY38xCArDHxV4HYBGik2M+ZUdwHwS7Xmnw0DTjOmX
	 dVGDrvEbgF1nSM2LozR5GXDdSQqLz00SY67mMsyaxp/E8CiRK6K6Kmv3+ELnRl3ZPRzsr
	 Trl+TUB+IqefVC7FoFujEv9yMvHXOwrCQ+PGrWjoB6rTHsPP6J1CnN8682cnQdd4DLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748122;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=iuAZy1Xqdh6yRTzJc6FLUzIwcR1MgTN4XofneJJ+eTc=;
	b=zDSrVkdi7z0t0G5ioYP7UgryPaLyLGCI1N+E5uk/e1lE63l0ctpXXSyfgxkRJ3SRWxCp
	 Zg5ScBWGnyUTIASVxbEay7F2FBwwPleMEEDgIBNG3jmFK5tOc7u/M46tpMKnXs/wy8p8P
	 dCz4LgktPmeIWnkX5VOdJtkIC23Z8BPojDKP+Niq5E1GutSYP51Aw2dac2mDmkJuBfr32
	 Ai+qZe+d3phMh2HI+eZ5E1BwzRN5XuuZZ+NMV+KBbhfzuqpqZNmqvJkJMlFPFbHMAXkr8
	 ZMLsluYn7Bt4Y2JxJHYjEtzakJ1HwQ71kJi4/jwBtSE6ezx3ynAoQqqYhHgvOb8stlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EBEA1F000C1;
	Fri, 27 Nov 2026 02:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748122;
	bh=iuAZy1Xqdh6yRTzJc6FLUzIwcR1MgTN4XofneJJ+eTc=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=FlzZrQMSP4GEYnaRkphNzlGd2PrGhIF1hxM6ZaZMoHMMiV+XLA0oCyf7QZTOgSXgG
	 UzsRNLOVcD/2zGbyW5p9EMyPg78OJKJk0j0Ut90jme/0OvmJRqRXBhrCwBia5E2kiX
	 dWKXyEwouvzE7vMmQW6Aai7t9a5kJSxMqo8JawmoLINoAIVivNEqwD2WGP/CizxWcG
	 6QL14PH8dnopeWzrapRKGAxk9T07Clmy76b94Cw+05EscgVYzyVOkLSIz/uTSVijoL
	 bJHankXIg7gF14YJ8V/xj4JrsYss4n8DO1SMOt72hl7F9mbgsz6ZWESPcqA2C9abU/
	 ANs3Q2pnd1zvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 119354B506;
	Fri, 27 Nov 2026 02:55:18 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Roman Vivchar <rva333@protonmail.com>, linux-iio@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358
 VCDT request bits
Date: Fri, 27 Nov 2026 02:55:17 +0000
Message-Id: <20261127025517.9548-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748117; l=3085;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=sgnrCZ+8Z//7Mp3+Z+qP8xX1lnU0T/jKoMNWsjR4WBQ=;
 b=rflaVb0IGQS4gPK+YmA2daDAOB0IbN1vK/rxQnjDU93P5Zxtf2yfEfCf4dbL6oL3xV40eow2U
 /7NHIzV4Oe8Di4zKE1Dv3iY9iHJ1F9altNO/+FoS4aC6hUrl7DBh2QJ
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

mt6357_auxadc_ch_desc[] sets req_bit to 0 for both ISENSE and VCDT, and
mt6358_auxadc_ch_desc[] sets req_bit to 0 for VCDT. Bit 0 of
PMIC_AUXADC_RQST0 triggers BATADC (ADC0) rather than ISENSE (ADC1) or
VCDT (ADC2), so polling the ready bit of ADC1/ADC2 times out unless the
channel was triggered externally.

Use the actual hardware request bits in PMIC_AUXADC_RQST0: bit 1 for
MT6357 ISENSE and bit 2 for MT6357/MT6358 VCDT (matching MT6363 VCDT
and the MediaTek PMIC AUXADC hardware registers).

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Reviewed-by: Roman Vivchar <rva333@protonmail.com>
Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6358
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes in v3:
- Drop patch 1/3 (scale divisor), which duplicated Roman Vivchar's
  earlier series (20261117-6768-6358-fixes-v2-3).
- Drop patch 3/3 (MT6358 VBAT impedance ratio) for now until
  mt6358_read_imp() timeout on mainline MT6358 is investigated.
- Carry Reviewed-by and Tested-by from Roman Vivchar.
- Link to v2: https://lore.kernel.org/r/20261126031013.27701-1-iasnezhkov@gmail.com

Changes in v2:
- Move AI coding assistant note below ---. No code changes.

Found and drafted with an AI coding assistant.

 drivers/iio/adc/mt6359-auxadc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 88b0e26..0e7f9b8 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -224,8 +224,8 @@ static const struct iio_chan_spec mt6357_auxadc_channels[] = {
 
 static const struct mtk_pmic_auxadc_chan mt6357_auxadc_ch_desc[] = {
 	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(ISENSE, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(ISENSE, PMIC_AUXADC_RQST0, 1, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
+	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 2, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
@@ -271,7 +271,7 @@ static const struct iio_chan_spec mt6358_auxadc_channels[] = {
 
 static const struct mtk_pmic_auxadc_chan mt6358_auxadc_ch_desc[] = {
 	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 2, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_IMP0, 8, 8, 2, 1),
 	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
-- 
2.54.0 (Apple Git-157)




