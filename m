Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D2C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=; b=W+3bCeg3DLAxx3UcJ5u68Svl9+
	wg0e9ajD93BGYwxdEzx8GXNkyiiVImpQF/9h94bg0BtGmntBSaJzfGkQFWccGwMUvITv2Zhs8MNRS
	UBV/+hS/CDqQEtY0oaFqyxTx14hzOT2hLO0L+vRnWTetgRYDRxGpbn2SezHD0iKe552LTdH7ZCuKY
	lNajYGpz4wKs970e+EehTzobfXu8QDNt6gNH/HLsavXopj+CtxTVdhi9bQgVZFr69sZBA7ny7KE3y
	sOuNVU6wEW4v1L70rQPGmo9fVfVxxNgAKKmU6kdbJOo1VvlE5Xu9Z4VQnMcZ6icN5dHPHk6RIW//i
	QS9EecFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Shv-00000003LF2-2IEg;
	Mon, 29 Apr 2024 15:14:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Shr-00000003LAX-08MU
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 Apr 2024 15:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=; b=DOHSy2ldswQESG+20T44MkW9V3
	GbDU+WzUPS+Gd7z2WDrAF8U639HjNk2O3HddzKskQszFYDWBBXbmf0SX1r/WAqqr4vkQtcOW4jaD2
	XOIghDW5SgGLqw0hUS1BAXVTUhkqmGaiKJcAZfXIp4bXr512h96adZoCVSbDwdkH2uwxrw5bADR9K
	4hl/gE6kg9PS6fxXdFVzTWvjIyrkg+W9XyKgx/N8ps7baaYxhoCgsi8VHCQ83HRyRQT3ELADc+Rz9
	Ej/v27hwYXSRjjZwqNM5GnwRM9cOm7V40dTr1O3PZyW1047J+4+DxhabrGonqYpDw82t8gPqvWzJ3
	FhBXL2rg==;
Received: from [2001:4860:4864:20::2d] (helo=mail-oa1-x2d.google.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sct-0000000GYM2-06tU
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:13:42 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-23bd61fbd64so1676822fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403092; x=1715007892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=;
        b=hEc5++2UcZp97mqO1ECi/cGFqwIa0pZy13unj4rLqMDNCxYey3RVCahSnvXeP9f1wd
         QBIgMe59FJnPuPaXwa6Un6OIywAE/GoE90f6sK9Nd+oRDGdQrmcVFIMzqGo+7ptGcxY5
         6saSjhmVLYcpuPgWvOFpkFpqYF+mBmur6dlNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403092; x=1715007892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNRsm9gIh82mFVXKJ+HUiStpAhIByx8KXG3SUDPUD70=;
        b=c99CBZTO73F1kU3wLMelhpzkM1QpnnjCNgTOBZHwSifl6rBEfJz85E1THXhNcVvH9t
         Mzi8YswTeqDTcvqW9vXxhzDYo++NeeTiGqIGoVOwLazzZcCUrPxs1XG8Zr4XcUSva+x1
         1J9SP3j+wHt4f0xHaSneNnjuNQynacclPUFwjd1+1C611aBn7CQeHTyH2NAi1jjQp6ES
         zUIds6fjVLja7ZojoxDo9KwpxnAItdYD26oxZRa1NOPEU1II0H9W1949zuQNdOLn7kOe
         zH5ZybIOzB43aeaCN6ab4GkMa0lwyNJnSbgaYK+aADjAr5A/7y07Gv7Atb7sCRtBgAHr
         Hq0A==
X-Forwarded-Encrypted: i=1; AJvYcCVPYI+O+7303+TqUbDkzbA5+rTNUjIY7cWIMeFk56stFW8NVfofWhycrjmUKURTGdK/D2+uWsFGHWVyLZRzVBawzZG81ddrdQr41EKYqUWuIM69
X-Gm-Message-State: AOJu0Yz906ueUdCsJbokntA9lBQwNz4AAkhSNNSM9chZeH66KraWACqk
	h91dWPyi0iW5nZKglpNN0loGNUog7IaeHV7NtGi9j4L0CtfumnrnLGpLu+JqRg==
X-Google-Smtp-Source: AGHT+IGXcStN+XAFfYHJlQ/BhJGSDUpZDAykPn1StedMjlrpGT2G5swu1IRQFedvTjeL4JvuXpf10g==
X-Received: by 2002:a05:6871:a416:b0:233:b5ef:3bab with SMTP id vz22-20020a056871a41600b00233b5ef3babmr9216406oab.3.1714403092563;
        Mon, 29 Apr 2024 08:04:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:48 +0000
Subject: [PATCH v3 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-9-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_161058_396884_43DBBE93 
X-CRM114-Status: GOOD (  11.92  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3a22da443a22..421b2b96bc8a 100644
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


