Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29566C54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpBUxqYvBKX4tX03KjbJxbiKYB0CW1q5AbspkuYc90k=; b=TD34MVbXpsdfQzSeFWLDWg2SUJ
	FILcD2kzO+RB+iCIWB7vaJuP4j2m7kJckMzCrYYf3nxFOGUtHYkVX2S+3OTG/4Z2Kvd7pDi7bVA07
	cpSkYmAxmGHMB3tVMgJzQFUj8otfJfA5spFENyrmmAuwboDrQcTCEfsR116fXS72H5Q7dBLkDokNO
	uRjyblbWFrNjxW/m/c2uKEwiONzQHx86uHYJNvRNheF2LM2+OdUiBYUx5c8adDMN4xuSTm8rAV1/s
	uQwyOMk0s5u66WW6uFXWWkeZ0ZnjfZfjE2NTFPuEerfEyb5R5h3t0lBGYe9qL/JobwPGRrkGcwQFx
	TmmoOqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNj-00GdrW-1X;
	Tue, 21 Nov 2023 11:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNA-00GdGc-1K;
	Tue, 21 Nov 2023 11:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KpBUxqYvBKX4tX03KjbJxbiKYB0CW1q5AbspkuYc90k=; b=nDmpLA0sHGD/bR0gsr//OjjVRL
	V4GuHmPWFA1OFTWKjXeiXorcaR4Dt5Na/Aq2RTy6BuOm9CeRMkrD/9KXcV7obfiRj8NNFRgbzJoEJ
	0n6ISqKNEkWobi6PJlaKMM578i5Irp20c8CC6pMUz7vGv2Wwq6zRVOKNwzKInzoeC2UsYIkidA39z
	TR+KKXgyENCnFoifF/0jPJSwBMshte1dVHYbB13+pKU2bOvWfGGpz4WA488FEGZAouoQe6qIrpkNc
	hDcENAiqWJPh1tsKgVHQqjLMWbQJoiRGNKPiV8jj3VK477OPNpcq2c0DBz3dir1cvwZIk8Tc8ClGi
	nFKKeX3Q==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PN6-00BQQT-1X;
	Tue, 21 Nov 2023 11:56:54 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 852916607324;
	Tue, 21 Nov 2023 11:56:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567808;
	bh=XEVVBoXHkUpKz+mYu2BhuD+v7qTvXaba6bcEiQ5SYSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GYYbo9QldXFXkudLNK5rBpyLOm3Syq0rkmS15Dw5elqhdCQEjLJ8kZzlIAH/9feSQ
	 fKlAppZeczG0BvHBMcVMzFWOKlTqcdLR38gs+mDI8TFzbgqxnvL3+7ke7vlfaIarOE
	 WD4+zgmW1iKsLDiocSUyAnRL7xZwxGw2tTmygpebAcSBxHok6hcBdGsl3UxPU4RhG9
	 8XEQk0x8kv80N5b4iMA7KyObYnlaCUOR78JlP1dzoe2MuBlgaduv01uzC1TJkOv2/K
	 NbRxwgmUpxDmArQm49ItmhnUMfHWIiHPkJZFJP92lDNXXN9DWJqILJhvwM+4X/RRD7
	 +oX/uQYLfW/Jg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 16/20] soc: mediatek: mtk-svs: Check if SVS mode is available in the beginning
Date: Tue, 21 Nov 2023 12:56:20 +0100
Message-ID: <20231121115624.56855-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_115652_862394_04D362E7 
X-CRM114-Status: GOOD (  13.66  )
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

The svs_init01() and svs_init02() functions are already checking if the
INIT01 and INIT02 modes are available - but that's done in for loops and
for each SVS bank.

Give those a shortcut to get out early if no SVS bank features the
desired init mode: this is especially done to avoid some locking in
the svs_init01(), but also to avoid multiple for loops to check the
same, when no bank supports a specific mode.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ae0cc22a2941..16a16c5a3f24 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1400,6 +1400,16 @@ static irqreturn_t svs_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static bool svs_mode_available(struct svs_platform *svsp, u8 mode)
+{
+	int i;
+
+	for (i = 0; i < svsp->bank_max; i++)
+		if (svsp->banks[i].mode_support & mode)
+			return true;
+	return false;
+}
+
 static int svs_init01(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
@@ -1408,6 +1418,9 @@ static int svs_init01(struct svs_platform *svsp)
 	int ret = 0, r;
 	u32 opp_freq, opp_vboot, buck_volt, idx, i;
 
+	if (!svs_mode_available(svsp, SVSB_MODE_INIT01))
+		return 0;
+
 	/* Keep CPUs' core power on for svs_init01 initialization */
 	cpuidle_pause_and_lock();
 
@@ -1575,6 +1588,9 @@ static int svs_init02(struct svs_platform *svsp)
 	int ret;
 	u32 idx;
 
+	if (!svs_mode_available(svsp, SVSB_MODE_INIT02))
+		return 0;
+
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
 
-- 
2.42.0


