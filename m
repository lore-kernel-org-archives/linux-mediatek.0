Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6CC282D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tACXAYYXiMb71YL2oZZZFWeFPiOraZcXMZ2yusj/Yc=; b=mcIn01r42NjDUsPZv+hqP4tvl1
	AJGAnx7ZO8LTSC4gfQwgcasG2SIKqknvW44YikoX7XpZ0s3HeScD8n/fJEVIudlXSmcrhkgCbIja7
	nrYsAUXTyYbU4+DSYxGP8RtT0YIIZZZNMZtcwM5fRPWA9XQgrZZ0XKgPZcX49V8j4Cr6UoF28MmsN
	g7z5evI7VJosr5xBrt47r8PHPh2VztHJeJVkaMAsimup45Fxo16ys9lEHYKO6WOMZs7fEp+KXPLG/
	ZlKC5SFlKrwOho14sWfm7GJ4mSe9NEuVN5ZvsllxVIo2GXiPoB45e0p3hYxhj9THrgspQvz14k7RB
	UcG2haQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHNa-0000000C4Ny-2oQJ;
	Thu, 06 Mar 2025 19:59:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHHP-0000000C3dO-2AA8;
	Thu, 06 Mar 2025 19:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741290794;
	bh=6hgrWNlNICsPF21r+8sMC1sCI3SX1I+SgK4MhWNZCNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=THwrKjHSpnJe9MF+/WQbp3fdUkO/+b6howeqE7wy+b7435gmi0e37OGCvcFy7h6a6
	 GnHZ2bk7S8kZpenYBIZdRFDKPnygL8dOtG4bn9EVcQgMrlRnrjDdbvYarKzq7gTg6b
	 aU/5SPfkV8qhHJGjjcByjcBLez4SFaRGbGfZrofcjN8Kg7YWpRxxaAsnb7b0HenVPs
	 C50Hf2IEwHkd6vmMSX8HlzgxUy/544SU+AsMzy8ll4JKqcHHK77zmE0YJkN8Ta+V83
	 T0xpB0ptfF1SLueA59GW9l1jn6fPIq8DW7cs/BHur0IClxKNfpu4uKoxmN1XcG2hdl
	 93TSxCpPUwLtA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 635A917E0607;
	Thu,  6 Mar 2025 20:53:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 06 Mar 2025 16:52:17 -0300
Subject: [PATCH v3 3/4] ASoC: mediatek: mt6359: Add stub for
 mt6359_accdet_enable_jack_detect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com>
References: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
In-Reply-To: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115315_700455_6C074AF0 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Add a stub for mt6359_accdet_enable_jack_detect() to prevent linker
failures in the machine sound drivers calling it when
CONFIG_SND_SOC_MT6359_ACCDET is not enabled.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index c234f2f4276a12853a6fe0b13c4198dfc551b6b4..78ada3a5bfae55308135f37acc4c3857057bd203 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -123,6 +123,15 @@ struct mt6359_accdet {
 	struct workqueue_struct *jd_workqueue;
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_MT6359_ACCDET)
 int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
 				     struct snd_soc_jack *jack);
+#else
+static inline int
+mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
+				 struct snd_soc_jack *jack)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 #endif

-- 
2.48.1


