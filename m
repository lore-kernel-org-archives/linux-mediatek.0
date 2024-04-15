Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEBFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iffer3/QisAZiMzK6e6qkKJFt6oDSvxeznUoOZCft7U=; b=QjeA1yeQNEswq5zDpGlTxp/CO/
	0zTOCAyHnrBctJpqyPwBFnhONjZ9R/LOo2UMyDKI19d6sk/b3ZrCg0cUzw1JR+4CZMoDdSry34Oyi
	tJoOIGKpqauPIdXDkowxgbfpEtXlQpv1lWZy0YB7kEA6EOvYhM9vfd9n4ni11QXruE8fuLQuldDzb
	Zll7Avl32gxhvHHeyvQdgeghpUDDLCS0MgNj5pv4kW4XxD4QD0daFoS7e0qna86MT9oABxwBBux+Y
	Cyl4OJffVv3N+1JKIJeF59tSgduTAzGPfvqd7Akmgt8Swr/F7XycOnRkPDEykjFQvR9IucFJxG5sp
	mt+HWmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6x-00000009cYL-0YSc;
	Mon, 15 Apr 2024 19:35:27 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6D-00000009bwB-0eDA
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:44 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78d543db3a4so272567485a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209678; x=1713814478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iffer3/QisAZiMzK6e6qkKJFt6oDSvxeznUoOZCft7U=;
        b=k32ury/s5Q8lQh992GFLxEC7DgQw93ZPNHk9zHV3qc34Rlhu/GMkqwao4/NddupoaY
         qWCOaA15M85byeGpxJS7uEb+4X7vjSvPPHqxr9E4C2zgYhVxz5HgXe2rCgx1w1CMRJOv
         hbqNVn1E+ONpRLKaa9SdWrm9BMNDD0ZcmNYWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209678; x=1713814478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iffer3/QisAZiMzK6e6qkKJFt6oDSvxeznUoOZCft7U=;
        b=WlabUrcUNESisO+uVkM2csGfNuf8p+r6gA42KnYAigSX1zaBMUQv8ctBkiFHcg1G5u
         rlW32ypTG5nsHkdlYAHXIo+datSgZLnQ67TWgjO7uHmUL6o2Y1D5d3R6Vihd9xDlOyy0
         NcLGD4aLp6vCNHlksweUuKubvO1qt6dYpoDu3zHA43TWLsetbsA2M9ADI6UpzzdybFDL
         jX7Le5zT/UiKR6PeSNx+eGWB77Ez9BZQAtaCSAdzrWZ4LlugElCenWL8hCGGQFO2/FqT
         xAoaNsjwWfi26JMoKFVrzOr6y1ieWF29ZJjSmEr0zblSvHYKiGQ/YZOC3uCvVwBc+FLJ
         75HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW06YHEWWCwaHNNSiWWf2ezyTzZcNWnsX03j9mw+MFMylTxt7wVZ09tP6SGUc1n6I1pzN3Inb3SfFPNYQSDTBiwg0/tGpOxRIgi2r61GjPMVHhw
X-Gm-Message-State: AOJu0YyugsJFYAprSPJXjccJ0d4NwYyOZvk/bbBRSOIS7Oc3NkjiggcL
	E39L29DQZqwtVOD6BE8p+jxL14BlXvKwArBcXn4ENbEkqwGsu3zXwGQrj7X7lQ==
X-Google-Smtp-Source: AGHT+IFEHU7eIzT8/HtrN2B+e04dqI5HiplT7bCOIBdeXvPZpYPaOGCG3Tv+rHX6H2GzPAb2+GvQRw==
X-Received: by 2002:a05:620a:3b8b:b0:78d:58d2:b600 with SMTP id ye11-20020a05620a3b8b00b0078d58d2b600mr11752858qkn.42.1713209678448;
        Mon, 15 Apr 2024 12:34:38 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:27 +0000
Subject: [PATCH 10/35] staging: media: tegra-video: Use swap macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-10-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_123441_730812_2E739C56 
X-CRM114-Status: GOOD (  11.26  )
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

Makes the code simpler and cocci happier:

drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 630e2ff987a3..7b8f8f810b35 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -317,13 +317,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
-		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
-			unsigned long temp;
-
-			temp = chan->addr_offset_u;
-			chan->addr_offset_u = chan->addr_offset_v;
-			chan->addr_offset_v = temp;
-		}
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
+			swap(chan->addr_offset_u, chan->addr_offset_v);
 
 		chan->start_offset_u = chan->addr_offset_u;
 		chan->start_offset_v = chan->addr_offset_v;

-- 
2.44.0.683.g7961c838ac-goog


