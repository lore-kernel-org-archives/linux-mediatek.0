Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B0606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwuQ1Aa2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVqAuRGR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xcd8RAsEVEjiV3LkvRveg5qq9poJ0EgfM91ZZy4Bye8=; b=kwuQ1Aa2AnYSNDCAmxjdhpKrtq
	sT8QhNYXL3DA1ZgGHp+/W6skiUQC8bs3IxmQhVyZ4lKI31r4iWCE6rVnUKnzRq4okR2TgtmqafZJ1
	MTyENw4txJykKVTEhTRvKTBjYcUhjfifAFmlXTDrQj0fLdvFnPwejuCn8BJQ8eKCCTWELHDvoZ3LV
	T6d5Qou+xCL9IbjaXykmdytdfqgf+qHkwKODOV3O+So+LN9BMNqXFLPdDF/uL9N+OZ0ll6UrhlmK4
	6zNWqB0qvBaIGVDu819bT1smWxjkzxM4NKCev5o5qJ+HuJU3tJ4vtA5zY/7P3rD4RoeaF81J9+dCt
	Phn3GqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsz-0000000ByWl-0rgS;
	Thu, 26 Nov 2026 03:11:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsf-0000000ByC5-13gl;
	Thu, 26 Nov 2026 03:10:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2A6261D90;
	Thu, 26 Nov 2026 03:10:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662640;
	b=dOrREV5Ci6fkLAGRQIxsdmR4QonSBlcngjcLBrV7VfKOFvP64zrF1oR7sAswpQvw7nmj
	 srcvO9KftLkK6w5s06MkggPePTcwNpl60+3EIfpZ/Kj3YUH+N+9M6iVpB1TymjME2061d
	 SFts5n9+RXj8MK4t3BflnLjnHK1spm/K6BzN7+HhLe1U54Vu7EIQBTkdxnbPVhOHLmOVn
	 wAGR2nxrAlA8PmUFLa7ZNmGgcKwNBs1/LZJ9sunwZYXt4EWqGSXex0KWXBYyEUGQ2rgkt
	 7c1jocfq1rSTyAMZwfg6vHIwxkdVKgxTit9zpfxNMH+5pHXnivSb6WTEpa2fmRVeQCA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662640;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xcd8RAsEVEjiV3LkvRveg5qq9poJ0EgfM91ZZy4Bye8=;
	b=rYKedey3thgCd7t7OvFQP/12PA708DXTgL4KLCsVShQdEzpqTFqVfnC/5EGA3NcYQ6q7
	 rt9RGa7zgaDC+p/toNEt68nuSKO+AViyblkX8RcSoKF7+88u4TIWwXIC5xInbZOk1twXo
	 56wagsmWpYrZNeOFrsBFA8hpGEawBRziZD8BJz3eHBaDBWRfBQrswzl/TvvoPZUUwWspj
	 0nuGhz2KUnZRnWeV2ggyUOEEblktJnNv7WJzhOv5obOUU4Vl1R6hPKJCHaiWEVQbIjm9/
	 i+oFBXds8mMTepkHMdCapq6mB/RnFz0gaIe3QUaaZpfaBWQxOeOB4tEZLIyTsdIwT4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B946E1F00A36;
	Thu, 26 Nov 2026 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662640;
	bh=Xcd8RAsEVEjiV3LkvRveg5qq9poJ0EgfM91ZZy4Bye8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=IVqAuRGRiTbcsAr37s+CpxPcaj9LlcJBmzTTCoRTpJctgZH8dzYM4HpOgDWRDy+Uw
	 QCuIOXhqRpkdsGU/Wtpz7/eaOa6qNl/vFHFEyDUxlNvQEVuBpOcUyLchJ1PHO1bFWJ
	 /LaDl3On/FwXHrr0EuRFnhC92pFbahRUqid08w0wp12fnJ/dGDlZBvCMtO4mXSAUiG
	 q+9CEBxGsBZgFdWn08Zrc7tA/FMI9f/WgI6OGLwLcsojfwzuaMFhmj4aHkYQWN7PlS
	 k8QTmIjJ95fO2L3jIerT4WidJGOZGDLn73RsjSgwCghGPLWSPnsdBrWjOEpiN3OSzq
	 iOT19vL+6akYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 593754D1FE;
	Thu, 26 Nov 2026 03:10:15 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358
 VCDT request bits
Date: Thu, 26 Nov 2026 03:10:15 +0000
Message-Id: <20261126031013.27701-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126031013.27701-1-iasnezhkov@gmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662614; l=2570;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=Tm2foiR76Y5F+c07n1fWMZO/zetnJqISUTM3KZbbJ1Y=;
 b=3GIxGW63svjr+l/NjC6o6Ty65Pl/a8/SpLlAM/aXmKmB3+dXDCsTdEHbDIw+FkQx862VMUgYV
 exOlE95VR5BDNrC+pr8EEnInI5ddM/FAWiCw8tlqTfAvuOC3ELz/Vgs
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
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes in v2:
- Move AI coding assistant note below ---. No code changes.

Found and drafted with an AI coding assistant.

 drivers/iio/adc/mt6359-auxadc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 54c9048..4a66253 100644
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



