Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D13C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=; b=pkXnX/U2J3VLlz8DnU6TuUV3nu
	XnB8w7s0GhW44T1Dugu9Q8Z9Kr8BVe9iGtUuAXqSiHXrthVdUAIez4Wj4uBzSrKui/WV8fJNM9hZQ
	3Ns8M1lAPDy7cAg1fTNFOqdaEDIthc5BJp88HqCH9vHj7ALM2uKOpoyIo+DsXJHOPsBof3KkLBZV9
	Phx/Iw13lb5OVt/kDQXUCm5oZ9v9MS9fNuf8I/XG8YHMuRqAdpgUOP86NB8lf31hnu8MVloVcBv8c
	++R6tUdEtozOCkrvW3Hvx3paeFWh755RBLw9RiAB5nMPr2CuIglgScnO9ZPmBJiXrZlKWvDnEGuFz
	UencEfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS8O-00000009dOB-2mED;
	Mon, 15 Apr 2024 19:36:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6Q-00000009c8V-0Hph
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=; b=QqRf+GvMV5o2FDE7rJBZusTmsL
	r3GbDHslzoKp3YyhfODvq57MSVSP8P3JQv3sCbK36rts6aKhU18NRcTWq9tL01WyEQ3x2QR3GoTiQ
	ug4jipYblsnyCqDyYWialHnqJOmEDWP53N+iqUASJlyeZ8qGAZ/vExP64fnzrywzI5z1E5gvVdHss
	2b3hKaKgoLrzrb6WN8vVUIfNuTZpO0RhUbVnSkzmFiDzEGTrpAK7rW8p2AV6QpJdNRqeSiG+Tqo8f
	UpvF/O6MbCKYTzh8zpJrOQevnHrgSxgLGK1JAhQ8GntM/Au2Pmisfm3ZgYd7SO98v4nF2h4qQq3+T
	VOnl2rIw==;
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6D-0000000AigC-0Qc4
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:51 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-78d6021e2e3so286084385a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209677; x=1713814477; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=lGIpfzBEEmX0MSiI/rwwrSvMa2ZRGrJvY9m5EMXq4NMMDR79x7U0GX0C+jBjbHTCXE
         Ee/CC4ptBEaFBVZLE3ND1AEctXSBueNFVeJqPk8Y7cuC9reXZoP9m+lcNi86GZ0djqp+
         cibEgreOlVuglIvVWKlnbpCPcqrHNY4jHua7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209677; x=1713814477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=n2yEkg6hQvPZh+TdCykR0wbKdz+kXbiiMBQzpCW+TUIFQvbkwXzB+AFZ3IyhbXAIn6
         E1+v4GOByci+HNuu2IOJCvrxMsA4zOnkMRilhBr3MmccQjcPlAtEtkShqetBGMBd/Rpr
         6i57tkER2dndEXdVCfL2dk1LZ7rNppEPe03xI0Ntev9hNZX9wd7yDv+YNSqTXigrlI5K
         23y7V7lDmwCDU58fWeFX8V4LqsTm7zS71XyWAaEGjgTPXRLzTOqTAafQdzx2wAfbW68R
         KjGTqWJcVJT+R+BCmpn+8zzumMY0AmH2SALcJVewIAtb5c7BsPSjG44mmb1s4rZVo8i3
         SK7w==
X-Forwarded-Encrypted: i=1; AJvYcCXAUsdXS/D/dmmh3f5KnxGIMg1Q95ccRy3gyg56vSmtJTMudJmPEC+7G3I2/sdLEO4CxFczq68HtYT9H1uEdoOmOnhOC7g8EWgmqWVmukEmbrP/
X-Gm-Message-State: AOJu0Yx0o0pafgT93doGvjpTRZN9tvzKiHa5U8QwSyLJcnZtTvtWXgAs
	9mR//BFpxIsFwhggPWSbCzLaDNlOwO6Q4x6P/zovWW1QA6GAa5DNUCZeWbszag==
X-Google-Smtp-Source: AGHT+IGdkApYbK4mkbCfGsE7agdP/ocKeSLQEP1wZl23ZOICtEnIFWB9MCiZP2rFcKrIOjZRFtHqpA==
X-Received: by 2002:a05:620a:611a:b0:78e:e035:e898 with SMTP id oq26-20020a05620a611a00b0078ee035e898mr4919595qkn.75.1713209676753;
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:26 +0000
Subject: [PATCH 09/35] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203445_809136_3440310F 
X-CRM114-Status: GOOD (  11.82  )
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
 drivers/media/v4l2-core/v4l2-async.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..e26a011c89c4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
-
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	struct media_link *link;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,9 +325,10 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
+#else
+	return 0;
+#endif
 }
 
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,

-- 
2.44.0.683.g7961c838ac-goog


