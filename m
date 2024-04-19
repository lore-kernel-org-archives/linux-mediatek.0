Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47481C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=; b=ifxzp8QCGK3VPdT3IcEYot5dct
	62UUAfVL/7GTDfQiKcUIWAPr3zVAToujQG7XSIfAhzWKyqaAeWGmlonVLUErgSAW9A5inpk/CLpmX
	oRSYUZ5zZiDN7r/D+0zha7ipAksk8nwpijlX1mLCD6Qb32+sn93PzhLoujmazL9NPrBhqwiAkH/84
	4EhSfc6R+amD7+xFuXusr1A35ADQ7Oxp7M2InhFOPUI4ZHGtWqPw4Q/KEivP7DbYMez76UmIS7N6K
	miGsu/v2BGJdWx5k8T0dQtCYYHcEsNIt67R7P+PzBCtJ86yUAuZgfQ3QR2okhXL4NMcV3p/2tuzpR
	B4pP6wPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkuU-00000005AP1-38tu;
	Fri, 19 Apr 2024 09:51:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksO-000000059BW-24Jy
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=; b=K/0Z411fFqd9vta+TuoCgvH+dl
	8fN8xny92oQ+Q0PCqyZ89ktVeja/JY/hvRuuZJdLh64IjPSkAFFsmPdf6uaAlg3HC0X+/CX5OVVhG
	BSWzKGcuAmHWA77pi4Q6eqQpstOF2ZaMCw74QT48Vw4Amryx3TbH71QyCeuHLn8Cqpup/NyTD9WJa
	BBEXh9YEQAX4xq8KI6tDppIYohJ3cB1mpKfMGtkEbppcaMaMfctiRPSmHZKdUwGvtSwDANylu+XYD
	dtmiEtJXMUcFjWDioBXxlEj0BiHgX8Jl09bVtnc7uzahAz9PkRtiBMqkaYtWihFKAoW8IUjH2DgM8
	QYBOXNGg==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000COPK-2m0A
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-439073cd4c9so525411cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520170; x=1714124970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=QbubsKQ0dQ+5noqXTAxNFKR2sq+wOmJTvgqGm5VsF9dBBl9zbx/JAMYpddQJs0K4OW
         dBospUaOEvX+obVsUlv4RQTenjsed7gSccfGy1Nu8V+VSmzOcDH9SkJQlwfMZ4ruR1/S
         42Bxkcxvls/wElR57Iox4ZtJJGdmImkdzAdrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520170; x=1714124970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=ETjZLXYmbLlKZCenCFKhI8plVocOQb1veJZriN3Fs/hy1Hts2SWeeqsqqpxOIXQasI
         8RJWWiSs1hIEmZMuFkAiG8L0W18s0m+eqW+isAmzkj3p2ZB4JxCCsVrhKxUMP94eom55
         b26QYCSZw60DYhZ14AI2m6l4hl3rnlmwOTee/tXMrQnKsxpGALRBun3MB/PorYJ7ehY4
         fct+GvHcFd4Ny1p4C6gF1FLhWaGgQDlwoHcekeFCZWGBAk64fzLtYa0GC6efT4ORhN3w
         AkUq88nmJ/UKjawQofcZtpTK+rNNFyYZ+3VTJgtEZpfsQwP+dQUquHNLIomO/nmQGrD/
         qtFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUWLLJrxf4xOGwx/sJpVEHKsLOKTUrfwdlfGcC3ZH3PVX6YUwJcbw9WnC6CGBpvTh3SXeFkhV5WX/U3aghj+D1BvWsjWGwnwLI3qiAo9UuPza/
X-Gm-Message-State: AOJu0YxDSu+8dhPCxG9Lu3pZdqQvh44qQ6AbYB2vs6NI/G1RdaA24uOz
	eLdMcEuEWKIdLEOPSXH87WhcSdUOmqVyhe1DkoUSDepF4O8nD/u9Sym/NVc+tw==
X-Google-Smtp-Source: AGHT+IEq5/HFwcn26nQnIIJ8VXOEY35h4vBPeSOiEtFFD1Z7vC7s7kPOFrGUrC/lVDARzsxRqq1juw==
X-Received: by 2002:a05:622a:1386:b0:437:b995:98b5 with SMTP id o6-20020a05622a138600b00437b99598b5mr1747672qtk.57.1713520170255;
        Fri, 19 Apr 2024 02:49:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:55 +0000
Subject: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_104942_241697_C8A17839 
X-CRM114-Status: GOOD (  11.94  )
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

Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
is not enabled.

This makes cocci happier:

drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..915a9f3ea93c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
+	struct media_link *link;
 
-#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
+		return 0;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
 }
 

-- 
2.44.0.769.g3c40516874-goog


