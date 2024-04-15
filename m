Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EE0C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=; b=1RrLYC41EhHfAKFuYon26fbP/7
	q2gruasiZfIbKfDcJQxzsA3WMcCdMc1x8KtHvjsPuTxShDtZdXYSs+WK7lC78p5LmCucR//IEKXXZ
	f6QNbPaVurs4wfngp+r94kLVOvUuqA+Ep7OqZMskHcgz8DcA6a5IQAdPKb1WKawOQfPEo2iiEM10+
	S/s0xaYetKHrjfRD8yCaR05ThDohssBQiaUrEUSObrtY8qNBFZeA74GrXXzX4oAUadUQsiMTcYM0Y
	R/cQm82wl1sA0hdz01BUWKrL+/Ij4L0xbmLhRCN5usYS8rqw0oIyx310oelEvjPUV6csleF2KDjX1
	cj0oLdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSAJ-00000009ebT-05An;
	Mon, 15 Apr 2024 19:38:55 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6a-00000009cHc-07Q2
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:07 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-617e6c873f3so39447347b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=jrF5pB0QD9pdnoxhteeXkSUCvzAOGK/XKQtYCY+JfPJCEUdzyFq5fgpAZhdci9edKT
         HyaduLAkzCsdYnRAl+VvwOjEHru5r4Yp8wh/xoPjTLfyAz/G5EysIrKgcP7xERG9+vGQ
         2PVYwu9b+0yf6nrcXBIY3ZzPB0G55DqnuclM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=U16TrXP12VjhOTwEj8PTaGh8bbbV2BQbkaDoDuw+4iFHR6bNWti0iUPv5N/2jryCnP
         egpqYFvDLp2bvGNgL/bMYagfgmSSp5DS1hXs48YYYey4ULm2+9SzRYkGES6V7ot2s/Qs
         pYF1t+rolJLiecKDpUGk1nEn0Cgx0pm836mqF4kFilVdPL7NbsJtD4zn0KyfQOfR1ATf
         98lGuFLJFQrBtN6P5QhNbtL6vZLYHJ513chQ0qFfIZMC53TUq2sSL/awYQnRePcY0jhg
         BZhxvDFVZ7C7SY2u4gTfkQtrT+1niupiJYZRsAqJRJ92eoAY+NUbNpUzmcoO9/BjO4RS
         BgwA==
X-Forwarded-Encrypted: i=1; AJvYcCWt+Acn5RjYykmBTPcvBA9mOVq6A5P0iM2drGszj+zigYqm7phyNRXFXIY9yadkVaRrc5u22dBelSB9l0KiwVM0BB5RYUN29JMkGsc4RQVODxif
X-Gm-Message-State: AOJu0YzBxQspEnyrsb9F7SBB34c8+Q58QJfKW55TjdxGfYgBHn+T0oMn
	4Ks+Y2nxfkpb799EUNlc0vdGFle9Ycv4AlrSWaIgQ4toAw3tdmgQ09nle/y0Jg==
X-Google-Smtp-Source: AGHT+IEHr8lEllDyip6pAkUMGURPdINr08Mt5MZfIhMi3nIR8h+wyIaxQ16q8BBaKyR8INXB42ugWw==
X-Received: by 2002:a0d:e292:0:b0:615:2078:9c0b with SMTP id l140-20020a0de292000000b0061520789c0bmr10298321ywe.40.1713209701695;
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:47 +0000
Subject: [PATCH 30/35] media: i2c: et8ek8: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-30-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_123504_267052_DD7B1E94 
X-CRM114-Status: GOOD (  13.59  )
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/i2c/et8ek8/et8ek8_driver.c:255:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e932d25ca7b3..c7984f90ae4d 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -252,7 +252,9 @@ static int et8ek8_i2c_buffered_write_regs(struct i2c_client *client,
 
 	rval = i2c_transfer(client->adapter, msg, wcnt);
 
-	return rval < 0 ? rval : 0;
+	if (rval < 0)
+		return rval;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog


