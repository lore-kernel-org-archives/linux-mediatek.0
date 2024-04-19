Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B56C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=; b=HR/JoQfDAQUf5QDgQVyj0Y+F+w
	4PtfrSH19l5hVpxkAtrZCRDepXHFye9c49vbre1nPTJEbWoDU8/+cV/UkYpwTtOe7tzGSbxSfHnGY
	vrVugQk75Ig6RWllamqT/vuEWB9pwrrTOyzYENYRtJ0d7QSaLN0PDyZNVGgBfKpn87qLURuGOUEkx
	llZOn01X8x2WuXtWjCYv+7YZ6+sHD/aKsH4Wogi4f6YWYyefb7lICe532kI60Xl9HCA/a9WcMZYpN
	llUbhxhUyYAZ5D511qqScSGhDP6OjOhgy6c6BymdH7ZqucEpg7vl2IYH0iBum5G2BUd0ExPiJZLXb
	DSUQDO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvL-00000005AwO-0GZy;
	Fri, 19 Apr 2024 09:52:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksR-000000059Et-38cb
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=; b=snTHB105Jv7zrzbwqF+jyelGtr
	PafQtey54BmmBMqFMMRxUmgq0ixmyvXtuTm0xklSKDEDwcGrJxFH1PtS5vB9dqiV6x1jRZxj6uFvJ
	9SBq/WOqt792AGbw/2MQMereFx7K1M1H9AMkmsBqIrDxDFvnLZTQdR4i6XwturF0IYQeOHoJBDLph
	CCgxH6pcNjymLm/VuYQSpnhunhtvn3f01J0vemshqnL52L0Jo1KjTriHWVt8ZSyFi2oU5TVF9HZ33
	vUPcLSD1F/JSVxSRAjZ0724pDkJM72y5uRUfLvKhXeIqocdZMvAoEPtJBmuC532qX/rqlihytR5AO
	Fcec5Ltw==;
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksO-00000007NiT-0UfU
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:50 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-78f0e3b6feeso68873485a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520186; x=1714124986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=Rke3O+G5FbTzDOFTu7HWY/vgiHtp/cy9sIj6/MEbtkGHNx9tVIAykreAy8GJqQK/21
         Pw5dZ0hlpQQvWijgpBc2SBJvWiXyYk/C2Qn+XPvE9keIjDccppVvNSTog3L3gseZYqI3
         Iek7qNiFvTLWrKZcBcMlOVjiL56WEKOoVyeUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520186; x=1714124986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=q0dtRaHfGWcBFUDhk9b+8JwmiB/w31EVL8e6GKfnkcQQLMdX26T1qs4+cm16YTiivU
         YP3pg2WrwkpVnh0Ngqv6lvX2FO+xsOG27WfaP/pl9wod992JdnPNDhnRYvndSWsUvdtV
         ETDDjPEM2NvBbbsQea8Trzqo5+QiLjQwvDIg0HPpfv5C7+UeAMRtv2Dg0low+Sjjxbmm
         s3FBuA6ZV4YuHQbDoY6fhBHX3sX+mu3tHX1F+874ySBYOz1pknZ0tACfuzZv5CIh0dbk
         8OKUU7JZwoEienZuZ5wxa3Y5E1W0ZtI7mFehwHhtm9Nb4wwQMw+lq0++X8V6mvURUL+N
         8Hkg==
X-Forwarded-Encrypted: i=1; AJvYcCWYE1pnsQGyFtHoNPmIJVROV/izIbFooOOWZEDuJiI8f/1ltjmWfEFpjRH+Qq5P4WNZEyCyv0hLInlyvIta6rjTv/T+HE1tCcIJFujiKlKv7izq
X-Gm-Message-State: AOJu0Yxqu93wMlBlWCoiDQOHm51q+BJIYObZLli9q/l9dQgAYBlwhOcQ
	24kwdI/0ZGqn1Yt6XIVIjWlGWx6x0HHuUFkt80N4+NbouOCOPz29XDYqrsQevA==
X-Google-Smtp-Source: AGHT+IGmrMUnhFDPACSHoV4O9y/blrNx/1c6IZqAeqIu8A58TfBv2t0AZdePdmIMfSq3rhn78LSShA==
X-Received: by 2002:a05:620a:8116:b0:78d:7036:fbda with SMTP id os22-20020a05620a811600b0078d7036fbdamr1727540qkn.75.1713520185768;
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:09 +0000
Subject: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
 us_per_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104948_280557_BC59E66F 
X-CRM114-Status: GOOD (  10.07  )
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


