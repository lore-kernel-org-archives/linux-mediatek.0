Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DE9C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSE1LZ8RJP6sIAmkq+8umDfF5CuS0FK0HNlyLUmOHag=; b=yJnVxoj61hUhGJsEzt/DN/BT2W
	TZgqXVki/uKYosxISH6gciXLPw8xyBTSpsV3GW/Ok2pEm3wQNHXO926JOUsBxsmRd0y1ixxYOpK3k
	6EqzfA+OXll86oqJ+vTo9XaSHRgDyQ/5pnmErM9Nx7LUxJjhb60qmspKGMM1PpbxScIhaFxKDBXG+
	tiNNGXUtj3o6Zu3uEKji0em+a3dzNYud2hhEHnpyPfQGkkCe5wfX4Oq2JhuFfz1qkV/FY69DgtEGN
	54aF9V8/81isYZzqHwYDhaejvc0UPaRt6G65I2fa4TH31YZHUOHnLe2eCL6qR9faY7hYH7r6Xg+9q
	yNGFO5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Smo-00000003Mpc-0ieE;
	Mon, 29 Apr 2024 15:19:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sml-00000003Mp9-3SNN
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:19:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e4266673bbso40797215ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403958; x=1715008758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSE1LZ8RJP6sIAmkq+8umDfF5CuS0FK0HNlyLUmOHag=;
        b=Nn8/+zn9N54iwWFf92kurrDbW+5K3wxn9kgHSDkHuJeJj1p08PXn+0YGdpTS5XY+vR
         ypHrCuCG00lCU5iVob+gmQIL1JV3Q2r8eg1P588s0TTz0oFD1TDykObCL03eIju8SCoU
         7T4JA8XdKe8k/cCTVmFdfqaL7dpk5vJV62lWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403958; x=1715008758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSE1LZ8RJP6sIAmkq+8umDfF5CuS0FK0HNlyLUmOHag=;
        b=YeK6TqvZCrNpr42v3GxMdv2bpKiwyKkfycLySAmB2DvzeI2CBLJxn2/xXs2ymXGDID
         PiADGsd/S8MN5kqHkZfFawnHYx9IEBZokfOKsQnQNnAqoBicebf4fWjlZUdgVS+UTPjq
         aAzcXPAAGqo/kXdS/TaKtkfkcqBiM7ZbjIevVdvnraLp3DZ8sD8Qga0piT2sxfM9j3qv
         LQ6RpcAKpFMx3y8u/wNrklHpe+mnh4rdLv8EvU2BZPRozwvynaBMD6hAM3nSHlRXYoXF
         Bgs8VDvltF84biimef4Cyw6t/nmH85k+vECrkM5abeUKd/xHOlkI+fArgA7ReQzjQeFC
         nSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcZ340iyGwUOapcRLzt9u8cPtFg3FBzZO6/nI9fktgqyqpKDEBSGUSipolYmc6Y0rYxZnoCCHgYaEuWJpeOFOh4y6WKlQ+GEj6hgk0F7StBaID
X-Gm-Message-State: AOJu0YwQLAYnpS2udA+kVbyoFbMoaDFAehkC8A5eY4LZZsffnPkKct6v
	JMu34fi1dXP/Qp2ZXqpWB1Rpsh6UTg7sOgSg0+rVoBouDFeObmjof5SYepvcA9iRl6iHOufwTMA
	=
X-Google-Smtp-Source: AGHT+IH4U39JmXtitBebyQXf3RiEBhrVCarSNwVpuxhIdD3y/YgatSZWK47F6u8fGZIDpkmTeNgcdg==
X-Received: by 2002:a05:6870:a70e:b0:22a:9c40:3782 with SMTP id g14-20020a056870a70e00b0022a9c403782mr12043126oam.11.1714403107649;
        Mon, 29 Apr 2024 08:05:07 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:02 +0000
Subject: [PATCH v3 23/26] media: venus: vdec: Make the range of
 us_per_frame explicit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-23-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_081919_870589_029B1381 
X-CRM114-Status: GOOD (  12.31  )
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

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..2b2874aedb2d 100644
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
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog


