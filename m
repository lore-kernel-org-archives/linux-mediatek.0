Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6719CC04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=; b=kfslwM7tsUWeVapxYQ+VKSME/w
	xTFi0wV7TI95koM5w2QuQM/ey9vzw1kledLeZvg0jKDSSBHMWSgWdTm8GFXQPsY4lR2Rz/rpnCXP/
	Y452U2Eg0a7qyt7xuZyPRrI80jN7qCS/gdadHJ0ClCoRCJppU4peRLk6u+Kk59THFIaTzla+AGZ15
	QACsmr88gKZbpz29kAh04dDX6XMSk5OZrC7eDTGSqFAqJXBkYdNqsugbAQJSiQ2lBoi/MO2DEyefj
	DzgAfj8krAfOSDRPQl2eiP0jNlhLfvgSO9gpt3XWbhU68PJDqL8xy7pLF/+v0GN/cExxK6ZlQElWZ
	5/VuVP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS9M-00000009dvJ-38Mp;
	Mon, 15 Apr 2024 19:37:56 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6T-00000009cBa-38P6
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:00 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d61a6229bso247229685a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209696; x=1713814496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=XYY6D/EOMyD5Xl5MJDrtkwuYiqbGLSGhoZGoN5QnisiSDAz68C66D8TgRqAQbhVJqb
         2Zhj7t6fzkYvYx2ERmIU/00QliHyRFneT2O1q1WztOW//FAEoW4boaH7dKo9gFn53JcN
         49e6Z1/Bmoaqvb+p5hued8KRy7sH5cng0u5e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209696; x=1713814496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=k2aTJCZZVMto70RRpAG/13sB7JaokwdAe4bS8yVPfrV++pmaW30FcxpvJ7Y8yLL0Lr
         2hjks0JvJHPfvOJxtveuxSpnFuUxF0VPXubmtMAPDscWMDQy55rOEk0dKCT8eDZEamZk
         EfwXkt+ZZTz2ky4KRQzZwLfPrysZBfidQkjoK5CVENw41DkIVEn+A5Q4pUkLbdXKnDDY
         OP+6axiSWp8eUFZv6iOctUbW/xxKTsuDblb89ntcMoOXtTarHP3i7IhRypb3hg/LpK2F
         rvtAKbmj7x3RlO8s+8V2DMwN7u5qywFMoobu6HKLItCRz2Bcjbb+2kyQNAMKUzRBQ0nv
         sNiw==
X-Forwarded-Encrypted: i=1; AJvYcCW1UgSbHoW/KVp2f4ioo+wxjmW6JWbtrON+BKSltnfbKzjeUlr5akv24guHRmVTxcAfsQo69C0det4Ze5QUEHrGjH6wIJrVf1iRN0K21ZOP1G6d
X-Gm-Message-State: AOJu0YwIyFVMHsLEhU7RNjkwn1r/P1iFLDn3lC+cB0JmQAXSda802cng
	eAPbB2dPb05UgI8OT+8z1Ip4lo2N65xgrGv2XemIU/jXexIe3UAu0F4O025eRg==
X-Google-Smtp-Source: AGHT+IENHla9VOs9zol9LIJSv1150+DgeHz4OsMQu2kACgbSSAPw34HTPzLa823VVZ1Js6TnsSST2Q==
X-Received: by 2002:ae9:ec08:0:b0:78e:df14:19dc with SMTP id h8-20020ae9ec08000000b0078edf1419dcmr4888734qkg.20.1713209696184;
        Mon, 15 Apr 2024 12:34:56 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:42 +0000
Subject: [PATCH 25/35] media: venus: Use the correct div_ function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_123457_930521_3F409E52 
X-CRM114-Status: GOOD (  11.95  )
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

us_per_frame does not fit in u32

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..de06e1712d09 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.683.g7961c838ac-goog


