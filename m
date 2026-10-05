Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF3DCA5FFF
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=; b=zl9Ony3ABYpbDGSTmquWFZc2us
	w8yTzWjts0KmfhGlGiIXh5u/Ig8tPCBBqaU7EFID+Gj3GtAfCpLKdpAOCDgW4NrRytcVK3QJOQgGq
	2ZkUKFA2To8ElI9FO4NgQgwUy0bNk9rLwYJM2GTSUYxQSyMd38UqXA3kowaRjM3lOn7v+1blgeM/4
	7AU5eBPD964JnBwRbxJIF8wXwwuC0UBbIopA3rX1a5hTU9Aixe5UGkXFpyvHpFPWR4i4iqaCWsbBn
	EQfi2f5wWeFIroVqU2OIifYADTSpA9JlxkyQ2uWaGno3UwgTGoxdiKBk/iXVcAkfEpwWVY13HJdWO
	Q1G1KUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTz-0000000GHCt-3E2Q;
	Mon, 05 Oct 2026 11:03:47 +0000
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTw-0000000GH8K-0YdB
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:46 +0000
Received: by mail-pz2-x2a.google.com with SMTP id d2e1a72fcca58-883a16b758dso238490b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198223; x=1791803023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=nMYt4kS8zPzWy38IeVPCNViGrqR+KmP/NavZuHH/DXenvg1WvGdRvfObWuIn0Mo1sO
         p/xHkwjQH6xY1fZ2iyU5x/kxHRU2cfnOAbwVnwtR8XWYORAwKDCoSYGbKVjS0zZyzN9/
         O+oCJD1MibOHN//AgL/X/ofMFN86MByTxQ7rVYoQWzb1RO9MTt+luTWk6FXQ9KGHcZWh
         QewEvYur71yU5YZx32qwFFBvX5I4/ax4zEsNzVD/OQixLTO2WVYAAEKUrIZ+1e4A8nQt
         IAdlLgSlhTCtODGArAzBSqb1MR5uReM6EchbSf+p7tnA8V36UKZePLC2XP5xMvJP6gGa
         vJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198223; x=1791803023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=ivJGYA2VcpTTdTnISnXpfRHizEQRQAJwz6Ksi7n9ZLkTlv15bBE9+YVhMEHnu/pgn4
         Ae8hhp1gGprc7Jp25k+MbBDNaR0FdQaQybRj971RuFF2RP3podN9CnpWQvbpXvHJFDjU
         RYIy3Fw9y2E54Wpux7AFcw8VDvfR/67oATIsV0nZDHZRLAVnt1dvJgk5krJ8MsgKmcaU
         8P+/8PpKe31y3Y0wte3UNDCAuTQkNCwOSDtrlUDngMkKOO49zAsRfU2Gfk5z0XCdssux
         W/udiDdROXa/hL7G5GPWziCkOpEHnIqXuLV/pmT9FAub+I17memGM+gCv1Mz1pJWJoHG
         Q50g==
X-Forwarded-Encrypted: i=1; AKwUvByVqGMYiVjfZBDeAmTPYppAXrpkPVbUaVvwmLASRguJ8oJrQSf4tycuGA02Mry7eRJ11Vac/fDFhVYRYZz1xg==@lists.infradead.org
X-Gm-Message-State: AFuF++nf+NWwP6jS1/6SO0iXsHcdx+4YAKyvv0Gn3MQBC5f4vJcsEw1B
	9XufoBOHvWNgJOIGOknI6hi+GIlYIaVFX0EVx0pA/KR9zXN2r54BGbVq
X-Gm-Gg: AYBFou2LVaFpNqgsH7nEicjL5ThjGeKs7/ZjIXJnmkmZRgGaY8f9o3f38CYE9NlJjEB
	xpaM0EI+kv4ydKrIYflEkbFS3zfUIFsTJGMVYj/SmUXWGttgw4n+h9XbxQfcazjTzwkNE7DXeKu
	as8AuTVm5xDVT4HXsci5S3nnl5NEXYjKjH4+Qv1udSP5+3iJ3urNitPL+btGSCL8e1SmcPqGJJH
	e8nfbw0O4OA0kYGjtpLXU7iWyM20415y6SryOWVmOsU5a8rZG+QxVGHq2JJ5JUaM2tkIXfeTn1r
	2AWGIhuFjDv48f5YbdE1Spk178/Q0jHAwzG58zFEyyzK1l2e/rbMP9t684cdcsievZPqhQ0GnFA
	Unsy2IyolQBiaOSqDan7X1oCqwNEDyTjVc+oG0nq7JX5LYOaiNjbpzm86taYj/JHfs7l2LzqS74
	rzHM9ZcLYt3nejOW7Z7LzzAFXkMPmBKJdubmIcQXHgUrRx/aWEVceqEqtzsTpd1ni/9oT+zoweZ
	VrfnbHDmCpirgOZtd25wHiSRf9e4WigP5IZ+Tyu7o5KM2cFRjSy3scsdK/27NZzoIavX12ShWYQ
	Ohih1qC9vkDJFw==
X-Received: by 2002:a05:6a21:4ea9:b0:3de:60e0:5ca5 with SMTP id adf61e73a8af0-3e0bcfe8b19mr7326452637.9.1791198223408;
        Mon, 05 Oct 2026 04:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Mon,  5 Oct 2026 18:02:49 +0700
Message-ID: <20261005110257.50145-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040345_331030_97BC888D 
X-CRM114-Status: GOOD (  13.02  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+
 	return ret;
 }
 
-- 
2.43.0


