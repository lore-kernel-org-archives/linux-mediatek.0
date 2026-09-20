Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1D7C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=; b=n80sCZs7EpbNRW5bOMDYVvE9Bq
	8Qemo8qyMXg/GOSABaCyuzRobH+3gBLh9EiQULArG9XBO9TQzf8XSnoDFXyf42a6d+3HwObwf7bxv
	9OrfegzVa7s8lURcWoEdc0Bs8yhhDRiTOBYomtl3evVjWamZJ1lT+u/4bN5K+XnTYxsL4uHE4/zx8
	6otpIW+fl3/T5JYS8IF+T++mHVkGpMkBmJKLbC8FGlyoCmynEtObfE2P7gbg0W2LEw4eG6tT4FFP0
	ifJ1c0PYwuE+8jtzBqoSDEoq1YKkllC+u529WEkrfglDNPSBn2m7GXL3Pv6LVDBVw6FexCD6xHDKT
	FuYmGf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89b6-0000000GsSR-3P4m;
	Sun, 20 Sep 2026 04:56:16 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89b4-0000000GsQ6-25oe
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:16 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d90ba1d807so24093455ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880174; x=1790484974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=WpCEk3rX7WC2foF9K2CngReeeHtAyZuoDWq8vmxvVzzdLxoZP+A8t70efI/OEjnHtp
         57jfE4nHqVMYUtjKZzVRfPzlHsK+/McOQcaPccmjFDmHODNG9K+/+qyJbwfZVijMbHph
         FhqLuG4MYn9Z8fh5flZ+qDPcbP3Rs/80KKsUxHxbNg/87sZIeSPE2TeJpcH2arWf4d/G
         wwTBg53qFmxnFW/v0G6j79N32+RWUgchyzKSRF6KknhgHBMHVQ8FA/dWWQKVSWf5FHol
         kWJX4Ak0MGU+3yWDZpXBhpnStNUPvvIq2rfRnOa0EwuoxzchZCRmOoCxbHRhmUyOtf5y
         mK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880174; x=1790484974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=LnHMqBdhUtKTP0w217RV95TB415jOGhLS7ORVJ3CudsRRmi65TM5zQxNFCW/RSqHVS
         HN0EgEOKKGOg1JHmMJL3UTxBvrKAGaSu0nKPoWESV03IqKgaTyBpxvJ/XqtIrKNCnApV
         e2TDLP28RP+QftpEmueZHB/uN2m0iEifzNdMiWzJKcu0DlUREMKsQum92GLEDGifQVLk
         9LrMzajjEL9lYR7Xn0EoVo9HE5Jn89Hu4Dky1R48CODSlo29Qf2lSCJ1UPLe/r+fPNJz
         DOcJHoBospf08MkCMPF8CuWPUW7rqLpU6vMQA1qfeL4KAYsqwsUJp5Cim5RUnhMzHoyS
         MEgQ==
X-Forwarded-Encrypted: i=1; AKwUvByb78ef/8ZdCE8ke5MEY1udVNqFmPrIlimdksiBK6Dw5/PBGF03w8GRILbctaXG3sWlF1jTHEZ86ioejRUjZw==@lists.infradead.org
X-Gm-Message-State: AFuF++kGGOLus+szHzrxT8rr/12ZKg0eno/f1nsgcI4XGHswIqKtR9IN
	Z3A14wyMpxPP7q4JvGhaCVo6gNJ16xyiigL2zPjunXcsS/7FdaeJfQNS
X-Gm-Gg: AYBFou0M6rJuzVIj/XNXHgt2eSJpT42ddXwI2+Jjrp5eiV5owT+gExkC0StjBsJbZic
	AB5vBS0nKVeO8g6tdYnTa1fEf2mMGsy+IHiVYNYfy6N6kAvhVHDP8cffnYQsOIe4e5nlXayKZTG
	oU4iuGoES/WGNZrQTscJL9Litbg5XdJwRJG7rAqfQjUhL28xCsUccEjghe/zRlmBxSGZHv411pt
	NOXMHxeYJmnAi2aiioy3JCZoo7vdu4V6Ne7uYjypNDPAGEXKkytYXdH827iybHD228amtEXFM52
	mWylu6alBjdTBl46UqO2rTXFVqk1uaeVMrET0af/BP3kmRqU5QFv/WE7x6FjVIFBs8zAphkHGN+
	0mOOrQaldWrba+V2ozg7TfwDKtXcxE53gRx7qTRwbhrBmZyJ2XKdNa38oWQcy58WziajhzzxaeS
	wEfhihdDPdiSX6l1K531VUPtVedm+pmlA5pYlv8YTxDvZtKpls3XsoA6CpWxcbJt9DL4yYkzngB
	Ca5eXQfs/3Bn/0n308CBG3prxbeE6UpAW69D36UlkjUQzzGauKDFPfmvBBPYFe8FFroPagudcAh
	p2uXpmUI3Mz/yUj3WP5ZhMThIbV4qxChZmHEGglvkXGbcUQ=
X-Received: by 2002:a17:903:b48:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2ddb1adc353mr126021925ad.7.1789880173735;
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:46 +1000
Subject: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2677;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KObS9Pt9I+T74LqcNTQHQ5cFB2c2q8qsj/Np1ljqwI0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xU2+4Xv/r+xROS6dVFDzcSiOyfWXf7+o3x2v8XN+
 f7e1oJ/OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP9+xXDX8GZ9xRU9+7bXXMt7eK5Zew5L14t2sB48Drv779sq+Sd1d8xMkxZv9d
 N4ur99eJhaqns17xjBA3fHwku4TzRxB7rpBbQwwsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215614_557765_D72E3804 
X-CRM114-Status: GOOD (  13.88  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add support for nonatomic dmaengine PCMs.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 32 ++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index e59b561b849d..839ff2711f5e 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -22,6 +22,8 @@
 struct dmaengine_pcm_runtime_data {
 	struct dma_chan *dma_chan;
 	dma_cookie_t cookie;
+	struct work_struct complete_wq; /* for nonatomic PCM */
+	struct snd_pcm_substream *substream;
 
 	unsigned int pos;
 };
@@ -147,6 +149,24 @@ static void dmaengine_pcm_dma_complete(void *arg)
 	snd_pcm_period_elapsed(substream);
 }
 
+static void dmaengine_pcm_dma_complete_nonatomic(struct work_struct *wq)
+{
+	struct dmaengine_pcm_runtime_data *prtd = container_of(wq,
+							       struct dmaengine_pcm_runtime_data,
+							       complete_wq);
+	struct snd_pcm_substream *substream = prtd->substream;
+
+	dmaengine_pcm_dma_complete(substream);
+}
+
+static void dmaengine_pcm_dma_complete_nonatomic_callback(void *arg)
+{
+	struct snd_pcm_substream *substream = arg;
+	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+
+	schedule_work(&prtd->complete_wq);
+}
+
 static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
@@ -169,7 +189,11 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	if (!desc)
 		return -ENOMEM;
 
-	desc->callback = dmaengine_pcm_dma_complete;
+	if (substream->pcm->nonatomic)
+		desc->callback = dmaengine_pcm_dma_complete_nonatomic_callback;
+	else
+		desc->callback = dmaengine_pcm_dma_complete;
+
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
 
@@ -322,6 +346,10 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	if (!prtd)
 		return -ENOMEM;
 
+	if (substream->pcm->nonatomic)
+		INIT_WORK(&prtd->complete_wq, dmaengine_pcm_dma_complete_nonatomic);
+
+	prtd->substream = substream;
 	prtd->dma_chan = chan;
 
 	substream->runtime->private_data = prtd;
@@ -361,6 +389,8 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	 */
 	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
+	if (substream->pcm->nonatomic)
+		flush_work(&prtd->complete_wq);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);
 	kfree(prtd);

-- 
2.55.0


