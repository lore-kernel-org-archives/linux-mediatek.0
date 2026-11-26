Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BDE606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q17q2kdX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3KgSD7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ca4bK6MZ2HQnGLOhzDCaK8anxl2LjXQadd/L2dUOpiU=; b=Q17q2kdXjwBvY1bxSTcUjU9WWb
	OMySQNNZxvT0/lPtYM9qLvjdvqCChFTWhzkBM2RB8A/BemXaccyoy0qYsIcxpBVyLlBR0pIvPtgnd
	GYHnhSh5fOkA4eCKcX0EuLH2ZjFZMlhW+/L/vPwgbXZOYjEbDaTsr6TZtjw9y+u5qhtUNIzuBoh+E
	tyesY447uiMv0C1lUMuByJTqxDVfYzf/yYo9nBSpQjuFMESxF0OGTPu4t/7+f/RRwqry334HHrcxW
	opeW15RwipbKWTdhJ/S3GNHAzN1ZpuztiBHT4bMgEZurQcmiPPphKKh++uwDoAs5HK4JMROvnIFpr
	ySX+ZF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNlF-0000000BjFx-0YwN;
	Thu, 26 Nov 2026 00:54:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkC-0000000BiPQ-1NCl;
	Thu, 26 Nov 2026 00:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00FDB464EF;
	Thu, 26 Nov 2026 00:53:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654425;
	b=vb7GDZR6zpxxgCq4MVnamjKGTz0UcVzJyzYSHFwRLsTTFiZBsIitLt5ZV1nikAZMLy6s
	 WTk4OuaPBmiS1VoV2/mib7oM+Iw6wJKnI1PG8pwBjOjwYxT83Kpe2SznJBhLEKcllOKkq
	 S5DkKfKKnXQQsnz8Ts9FNOhVbskeeko/ssixRU7MC/G12Qso/tE6HFBQRx5D86Q1WmXqK
	 PPXbGIrsiGgPh5/FDPmYiSfuwku4zXOloL4Vn6KyNhYv62VtWLffWWjoCw42I+893Nxh2
	 7uWZYVfYJ+rwNfSzlkGZdy+71eRQ2Z8HQlNDh0po5pW39uYYCQdFi82T/cGHYsJI6Fg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654425;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ca4bK6MZ2HQnGLOhzDCaK8anxl2LjXQadd/L2dUOpiU=;
	b=Michyu24KSC/fBwnGAlzrF9cBA/DbFyK+j8zCUm0536d0ahOJon75ncLqtIRrvZ42qjS
	 R5ekjBgka1wrK4REDGAZN96nXh7L7nJrwJT3IPR8KJIVojdnGAoVDBf3LSLDsIeLhzjjE
	 TNfz+M1kQZb4xdXqGn5MkrUpLfZ8CsLWr2WMGTDQNXBSrjgEX4tAP6nh0rX8TAzbHa48V
	 b8u8Tubn31hkOEJQKDzJlVqcCps1Br79mxhQOak2SbvNEt4um/Y+aVOA4nTkYGLToW5GS
	 k7BPgJ8lhDzFI5uAQwbew82MY7eRDyJZrjzUesJ0FKOXMlFFX0u7i05IHDVPouq0dWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA9C61F01576;
	Thu, 26 Nov 2026 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654425;
	bh=ca4bK6MZ2HQnGLOhzDCaK8anxl2LjXQadd/L2dUOpiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=e3KgSD7okFRiZT8uzV3CGQca6L2kxap0VuRAdcjrj9BiolwDhGoCpKPeABQSdQAYw
	 j0OEMudKbkDWXhNdvzapNWKujOzgS86HN/A/HgnuxNvXE73rRdWztsqA2wTItpWXCX
	 lulRdzt/aLRYmaZticu9/9L7Pt+22BOE5Tc+lloJheoLx73X3HKWsImpaMVWw+g/29
	 PfR4E4sYB/c6DJh1HsUotXE2RFpuzUnnSe8hEVu6xQY3GVYfC5bzPwB/cydpMgRDoX
	 8dJU4h5FQiVTONpRuAl+bD6t24H1rOGGf8Qy+Oz9EvTOHPVLXT20Q+S/XJ6xbF9SCl
	 l1S/YMdVMksfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56CFD4D14B;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358
 VCDT request bits
Date: Thu, 26 Nov 2026 00:53:28 +0000
Message-Id: <20261126005326.71926-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126005326.71926-1-iasnezhkov@gmail.com>
References: <20261126005326.71926-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654406; l=2491;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=3B3jZ9nN9K6Y8R/8aGmx1a/UI9Cb3COok/CghniWCxw=;
 b=dd6O0BoT7zVbr3/ijU3id9VYkO/zWrPmeZ4o1U/ZKJtBKoanl8ztd1L2bFM7hUQdxC8DPorN2
 D9D8CUsLq5ZArCzhvouqV67TwOjskPBiT4wXzj6OM0cAEmofd59UUit
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

Found and drafted with an AI coding assistant.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
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




