Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D69C36014
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=; b=rORPIFJkGr8UNgzeczDz23bf98
	CTiwRklzWMcgYMtKKx2V0YB1iYBBXSNAoKsT1Jipp7GSzzNhPX6bkfnRWVYGThiktkbTpDVFqNi79
	2woxdVt1DCXWFirtsLohA3MLMaTjRE5cc4i+M2OxiMiY27/JomAK93PEPUutBlXcIJGY0wf2/zyFr
	o4PxGeDOvgXqiP53UR6gjvD8QlY24WdgcjseHLoqn8NVqtU/06hTIbhqUxWS0xk50uEm0gzAdlmGx
	7m2sS8PSULFy34i9rartycXLtJydJr63B0zw4eyWCa8/hzBqma2FOX+Nfy8FUHRXwXyVHtOenknc5
	CL5XXDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXQi-00000002O63-45tH;
	Tue, 01 Apr 2025 08:57:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXQf-00000002O5E-3McQ
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 08:57:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so6951167a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Apr 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743497824; x=1744102624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=nzEc7ZHF6tRIcc0EaD7g58I7Rk1EnXxQn7FYWuvZ3ygYZWVR5caLRE4IZR+MGLXd7h
         G4MQ6h5LcOSUV7ZR1hBaUsTg4l6q+oCLwxIYyn6CzoHIu9GaWdS2L7iLAdMH6njrekfh
         xQlZA51rDHmMqeFHkRXwkAJ3/6tL2IHppb+cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497824; x=1744102624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=P22bR0x2ZwS4hUpq2lWNtMhsB9INsrIL0uDW5VZVJTgmG+zk7mjPhqwoVdXby6ymY5
         ooyvi6rSPie4titcszobZJsNHPdOaDU3o2mnBWOxmX4SuZDiDXojTWTpcPutnA507FA/
         R8hm0JDkPy5theEewoczh2+266ybnzulvuXvHbt2iwYK0koWcY1GQBhcaKhC09SZl1u4
         T5AfE1KRrosooOBqtApu1lCMkOHumpyd6J1gWI1uOibgjw+Ng9CysxBqIsSDmmQz+Xl1
         AZ0k3U3QUEPZZOWmXe3apzmDDt2DccZZ2c2Z+D8xjCJXeDPt4jOPbDTr0qYgKsKAp1vS
         RNsA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7gqCfTi9n9mWpRjPcQlP3fz7wUME7L0ExWlgEkeEEHEI2zagcYHtiVSqeiwsXyAx92EiFqkrwihFNMiOxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx742aNZx0fYYPyf3g/F845nK5IOeE+UAUC3AmtTw9OWeNmgKwR
	R3F+pBjWizzybp2N3uv00LDWuOG4c6e/0eDfF+hhtkGiqJV0rDbjpL+MZ2QPQw==
X-Gm-Gg: ASbGncsL945eOKw7O4md1cpolvMseM7/RJCqCNI+LBN1RoIBL5xDtGD7KZrWP54L59G
	C+EmcKVPY4FnJImWTPGVjQTSm4AwJA/keS9JrrCo/Fa5jifSYNhyYHblzgPuwMct5mwXnT+G97Y
	pU0iNDgZsIxG+vUjYCp5fjUveNequ18UdhXx2QKOkUp7HX4QUQiDOpv6xpmSrCzFELW69MWRl4o
	0MoJ2HZ6z3kCK9DZvdLqKgukYagmy7yENPiPAtqWrtIRreYfavriIOlQQN9ARL5svM0f5pNFff0
	T+DwR1OTd+/6IPs1pn759X55kgpGhldahuHuj6s5DpdRNu9zGiKY+cu/M01xYeMSG5sJH96hCA=
	=
X-Google-Smtp-Source: AGHT+IEGnyXdQQaEtEc12iqZVx24nt1bNnc7msMFARFnIYDLX4DR4C5RKsaUHtsIKRjop94QRdf+PA==
X-Received: by 2002:a17:90b:5690:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-305608ab182mr4183384a91.18.1743497824504;
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad70:9e5d:51fd:567e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305166caa77sm8756803a91.0.2025.04.01.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	treapking@chromium.org,
	yuanhsinte@chromium.org
Subject: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
Date: Tue,  1 Apr 2025 16:56:57 +0800
Message-ID: <20250401085659.1222008-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_015705_859593_1512C376 
X-CRM114-Status: GOOD (  14.64  )
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

In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
buffer pre-allocation was disabled to accommodate newer platforms that
have a limited reserved memory region for the audio frontend.

Turns out disabling pre-allocation across the board impacts platforms
that don't have this reserved memory region. Buffer allocation failures
have been observed on MT8173 and MT8183 based Chromebooks under low
memory conditions, which results in no audio playback for the user.

Reinstate the original policy of pre-allocating audio buffers at probe
time on MT8173, MT8183, and MT8186 platforms. These platforms do not
have reserved memory for the audio frontend.

Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
 sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..70fd05d5ff48 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+				       afe->preallocate_buffers ? size : 0,
+				       size);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..a406f2e3e7a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -117,6 +117,7 @@ struct mtk_base_afe {
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
 	int memif_32bit_supported;
+	bool preallocate_buffers;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..37b20ec80829 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8173_afe_hardware;
 	afe->memif_fs = mt8173_memif_fs;
 	afe->irq_fs = mt8173_irq_fs;
+	afe->preallocate_buffers = true;
 
 	platform_set_drvdata(pdev, afe);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..0ef07fb2898d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8183_afe_hardware;
 	afe->memif_fs = mt8183_memif_fs;
 	afe->irq_fs = mt8183_irq_fs;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8183_afe_runtime_resume;
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..c588a68d672d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->irq_fs = mt8186_irq_fs;
 	afe->get_dai_fs = mt8186_get_dai_fs;
 	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
-- 
2.49.0.472.ge94155a9ec-goog


