Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861EFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhbcF3TWQTA5MkpkxmSIX7qa4yJQy6aIRpdafwtebNs=; b=Q1l6t0ReLh4inXkN35uWf67+ly
	5nj0JUnEQOkdGWOlgDqw8xXM0CQisUKoMBCauHELXORQvtv91avnJit3lK/qcjb9LSsXGTWpBgKOD
	kofPmDkFvtByu9/SJM+su9g/b+12fjGy9u3Q1N4qvm27XEkZSx7/B4AmUbspssFgHe+aV8HqgPP8H
	5+5640uvBO+uVUPJBQY/Fxp/lU4W2fiktv/uFuEVov/VHwrgYfqsb5w9BwBsV8I0U3uQ8DchfauN4
	C4RSwXdOJ8z1kzjHKkOveEJTOw/gAWNavEZqShDqeLybL34bfQHDHp//H2Inq4ZRp1UXiel43d4e8
	xaaPneqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sc4-00000003HYL-0vFu;
	Mon, 29 Apr 2024 15:08:16 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SZ4-00000003FcX-0CdZ
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:05:11 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-790ff1fa7b3so45315385a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403109; x=1715007909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhbcF3TWQTA5MkpkxmSIX7qa4yJQy6aIRpdafwtebNs=;
        b=OZlNwpYXS3tYLDmuay6yfhhhr1I9yXqLegFC9A3f2uJ3oM4lVHbu/ni0ZIZ1Nur+QT
         Fv0djoqo2r0T+FKR6pZDSEMlg8TPN6JIRf80M/VB6zZWeoJixGE+UYkL8FSwgBKF8cYl
         Q4Qf3vUFvt1rqwutlIMDlxYWBZ85hlfsovJzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403109; x=1715007909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhbcF3TWQTA5MkpkxmSIX7qa4yJQy6aIRpdafwtebNs=;
        b=JuCuWIpwQbZLm4zRYha1NcCI8SywBKO/6R6LKSdR+xiw/y6/yi4kVbV4ezbR7GqJmg
         apsOXv2EGJo6lCb8JSlCVd765v42mb3pCfmaJpR/oX829drt7xCm3RkqcvYDjJmMrtua
         l9Ww6VI1FL5oFTuyRTdnGY7wZmVOfcEhpkXzXu8Z8Z003feJyCWZ5sZVEJED16O9CU8f
         RkS/5g7LCxivuFTLd2qMmZQjJaLzYbR8mB5PEqsk9v47lhRXxjE+LkzPduTqYmUpRvoL
         8LYejQPz3RfGjeXTe7o4Rc5XdS5cUW5X1CkG6sw17bmECdDbOKpORSbHfZvfCidxhqSu
         PiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVQebeakRXZmZIg3M4jA78ovi3/VwRIHl6cwYLOOjCEWh3PKQvoHfRbRhY8pIl44fmcublK35uEShKVR/PtKA7k++NWbwVkWwNGyJ9N7H9gQQf4
X-Gm-Message-State: AOJu0Yz6TQRimR7AVPMDLoO77k+SCbfH0Tb8IzwNX3o3eEgs3x1lFqJK
	o4b6XWHU63UFyWE0wOXX9dcYz2723Rb7j6t0CmN/8wlJ/U35glWKX4rO5dy2fQ==
X-Google-Smtp-Source: AGHT+IGs4sEEfsd0KHK969uVD2lhoqcTxzDs2zjOqF/5cv6aPK5AvcxX8HFB2EOaJeVcr8eLM013oQ==
X-Received: by 2002:a05:620a:8204:b0:78d:6479:7c39 with SMTP id ow4-20020a05620a820400b0078d64797c39mr7471552qkn.19.1714403109214;
        Mon, 29 Apr 2024 08:05:09 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:03 +0000
Subject: [PATCH v3 24/26] media: venus: venc: Make the range of
 us_per_frame explicit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-24-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_080510_157099_344F166F 
X-CRM114-Status: GOOD (  12.30  )
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

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..f87e33a34610 100644
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
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.769.g3c40516874-goog


