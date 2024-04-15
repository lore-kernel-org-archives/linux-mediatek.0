Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD9C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=; b=ICrFzRDY1HShPrCXsojrbRyS/5
	VkM3XP/sYlagDFEippuRLF/cCnXz91AeEeRnGN2PGzyUZXuZggJxufKT79MccY4j3fvt5hShcr3BF
	C8mF8jpWMjUHu81yroWSqEE7zw7ruYnJlkQP062inbH4u9+tw8ApCnZsYkqzmMRfqRDHtM7E2eg/e
	rivhG+1aeYignY+7zOepD8nufi3f5YRqwgd6/t7k1Pbuqx16AGlDzdm27Gb48yVhir9tKbSQLbOsD
	He7pk83CRw8VrHv+ukxX7umiIvyXJVKVF9n1D/sDTCOwlHtc/xfd8tWYUOOLtyWaQhxWs3bpGH/jE
	7xx5TQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSA0-00000009eNT-40W2;
	Mon, 15 Apr 2024 19:38:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6b-00000009cKc-3H9C
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=; b=GSJiL6k0TD+96yN5W7yXPJDoZ2
	xf5GcXV7CfHj7FaSDBV0jXE38gpoCnLR8nod1QXUZmPz1dZaAqGZCQgmcO1heHMGLFSTuMx1Vldci
	xjRgYU9dF1Kpl7gP+BVD0zbQpNAAOCZ8/J8l21gln24hCU2ZidwsATAxArqCYm3s1K5/rUfqmPssB
	jUiV6L0C8zVdSQLaMJa9wFQF92XqPw759P7rww4EKMZx0woB1oA4pI9rvNy5OSVri0wkMkvIuB1Q/
	/YZK2j8gfvUx+ecvbeOBWaWPJMO7/jvD7Okzpnga/tKJjxUX8iVvJE0hZ6ITz+PdvZS63Yv0IidP6
	Hax2h6Hw==;
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6T-0000000Aijl-2C9P
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:03 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so2194160b6e.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209692; x=1713814492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=itrtW99D7xQ7IlIF614iSEy5rHEWv+eM1apUpG/C5zErDwcOCOUTX37vPhlKoJG8Ij
         o3OMeKSWx0ltingBCdmS8/3K1ub/9kJDXkxKR1+qxM5sy2B0dM55Sch0imzHqyDzj1k4
         8FRC/En6kxcu6EWWlqbDgh7EvXLPY/JXnJCWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209692; x=1713814492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=JqnZrJbS0JwwTtQF6ukIrkk5oAuxmZv7eBYTmf4XT2upedwqa5dCBtmixAc+aWzzJ4
         Vgsw5NZvF6clq1QazRpt5911HYJtt/WqzAW5kGNpodIg+kx8wW1qvuTJx5mQ3D7lPQeL
         /4/HBYOGpIxcKqus9RcbMqfi7hDJ0ZLpLUA6YNE5yt91C8QfihZi5RB4j48lEAiwa4ya
         EHzPkix7mEIaYXSTgEKBasOOb/37FcOteFuQD01BZ6IczErAhzjZ3LqBTJOp5bB5Vb/R
         bI+c0yCSVppwdJEyliZ5qyi1NynwwtslbKX0v3/FUBSw5LV2kmuIYf/Vs1BIUaWJqWOq
         U+cA==
X-Forwarded-Encrypted: i=1; AJvYcCVwlGhCuLrA/A0St7Ix8DQ9ihKY9yTms5iRnrFXyD0oCPc13hWbj7h32TPeemvhcq+0aIaw/c+JkRoCfQC6OAIqrdJqW9NhBy2N7vx/ZOOJQxFO
X-Gm-Message-State: AOJu0YyE//5XrBspLYvWLlTiGPxJcd0UeuV6PJ6S0Hmyu5jQ3h8BSYgl
	UQYF7vkuCXbOjX3j7m48MhyiWRHuKTDoyxzUZiBAFFfULTwDNZI7rKCkEK/zlb2U+mdbwyyPPb6
	fug==
X-Google-Smtp-Source: AGHT+IGZ58NMkpObXyXFmK/dlwdDRAXnKMQeVrLnGqtYNcTRA6TD/q28Ror56VZ2t4DiW7soUyKUtg==
X-Received: by 2002:a05:6808:128c:b0:3c5:fe95:2371 with SMTP id a12-20020a056808128c00b003c5fe952371mr14036703oiw.29.1713209692296;
        Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:38 +0000
Subject: [PATCH 21/35] media: venus: Use div64_u64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203458_798974_42CA2AE1 
X-CRM114-Status: GOOD (  11.84  )
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

us_per_frame does not fit in 32 bits. Use the appropriate div function.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..1dffeb7de76e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog


