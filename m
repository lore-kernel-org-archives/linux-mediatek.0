Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ruByWk/FZ0mtCo6WOtEalfCDZpqeYKIA3c5TIG2wEbM=; b=h8UVnv06IEHpfm
	v9bwnPvWnwBX9GglfhFm0oCbZySg89eiYCgRSJr4f17JGa7tUo5aZHjYX1xDfuWBudsuYodGharBK
	Hm8uoPdlpQ1iqQ//TXuWU9EO0fuItt9PeJEW77iEgRo0uQNhUrglkdPDP+LcLGOZJjKFo+9WHyxhe
	Mom1hJc8XKAmyWFgGK9K3wpf2i6a81knXgSSHm807sRyx6YurQp62D8qv2SY3jWgIVJXxZhDLH5d1
	DAKMoQtvKxyR525C+NBFqydln7WxmfEd76BBcIDazgQR06y7fga1D2pqOoeHTn8xRvToGROlqCc86
	s99EMFw1sQSMf4BjxinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmR4a-00DahX-V3; Thu, 05 May 2022 02:18:32 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmR4Q-00Dadv-AU; Thu, 05 May 2022 02:18:23 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 7so2563895pga.12;
 Wed, 04 May 2022 19:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIXDVokFolVKrzalTPKUm2CP3QVEc7PDIydFuy2ELrg=;
 b=VTMfiv/xxi6fGdCelW3OOBaUHSCm7CuZK+BQdtEUII66q8gebxTf/i43wtPpxuwg46
 5OXvSyTPQJ4h5XCfeXHkYuEyDfjap7ZqgOq+130hL11jSuDpUzvwjrVjbo/uTaqtGsPe
 msDZ7TOhh6Q62Cl41WK66/t5wy29qmqTdjeeo0wWa9CP411/IOJ8EcHvJgal+ZwepiMK
 4HRNPzZWvsiVxGNUZQsbHKlaiwdWDw7d6hKuwuyNnQ6j8RCQGl7JYJvIbvHdXCSkg+hk
 ARyfUqXY63VnGRzvh4aa/DJntuX5ziUFLzXtAGQOWXALdGZDcweQepSrO1tTJNUvo6W7
 vfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIXDVokFolVKrzalTPKUm2CP3QVEc7PDIydFuy2ELrg=;
 b=13qoMnC8Zj+AewiZkRZVK25jAJNqlbLDDAuguBbXIhybH8jwRsP9+sB35AzuI8npyU
 yAI8XEjDOW4Nl7J2gBI/IccH5lVuCDQyO5sfn5S6+C9hC5EvPPeezbQPSyS1WkvcfEeO
 jmrgkr7jE3dv7N3MqxuFFUdgYCg804S/sNPDaIpW+rqJgObWjdmHoNfwS8vlP81qEKO1
 Q9Gfn5Vz/XcyFjqFy1KqahTRfwkiLZJm99clJq45CCmZDI9nD0B05RFvNTNA4D1vFQ1P
 K1wK5fVjh4NTyzMMUD+fBFAHYxlAG4sGjhX5+zM/7fmxcfbeaB8O/3/sjaLtbdeCe/6M
 r9Bg==
X-Gm-Message-State: AOAM5337oJh2dOHRaRITQdg5E4RX9KRFoMz5/wHtik4pNfY+GOEF5PAd
 KjGpWgoPaBaeO2mvmPRKrfc=
X-Google-Smtp-Source: ABdhPJzWZdSl8kCzaGbBSh6IuuBwK7I7BYee0kVZukFZY0T4WG5+0idnYzYBVwUf4sMRTt4ffT1k1Q==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr20022746pgw.489.1651717092863; 
 Wed, 04 May 2022 19:18:12 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090aab0100b001cd4989fecesm3967290pjq.26.2022.05.04.19.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:18:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ASoC: mediatek: simplify the return expression of
 mtk_dai_pcm_prepare()
Date: Thu,  5 May 2022 02:18:08 +0000
Message-Id: <20220505021808.54337-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_191822_390348_29C8612B 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 151914c873ac..12644ded83d5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -213,8 +213,6 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	int ret;
-
 	dev_dbg(dai->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
 		__func__, dai->id, substream->stream,
 		dai->playback_widget->active, dai->capture_widget->active);
@@ -222,11 +220,7 @@ static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 	if (dai->playback_widget->active || dai->capture_widget->active)
 		return 0;
 
-	ret = mtk_dai_pcm_configure(substream, dai);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mtk_dai_pcm_configure(substream, dai);
 }
 
 static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
