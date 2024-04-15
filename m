Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EAFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=; b=wsjUSg3tu2ptH2G9oZ+nYy4tFG
	fb8Z0DJpB0HNHaDswJqOg5zMh/9+G2cpm/lNvyqAH+DG4N0trTKnDtkALiVwEJ01uSe81hP4Xh06t
	qzB8+1qrRLky2SyZLCMw4N0Mi5DXuVCri4a92wGgNq2yELodlXj+PbQ5VRKWvAqhOz4pMScLabEAF
	qNxWt/3f+Mna/Te+3OzxP79Z5DDGyC1NHHxnMpwNiEefjk4pj9c0r/zl6xqOPDMCSQFs3ui9ZMI9J
	D6WXNIEWbfB4YcrZAm5mdBmSdkb5FB/0Q6sO/uCDL54Rn1wk9YYDV5zBD81HgtHVfQZQIraAe8joW
	qcePfS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSB2-00000009f0s-2Crr;
	Mon, 15 Apr 2024 19:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6w-00000009cXQ-1POe
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=; b=K41abT4Q300Tr7KK/pW+yvX5HB
	5yXoQYoCndsK+BOrp307c7j+DSKXO+YhIAgYHXur59JE6AxVLvaEcQeqMTrX0GvLb6cJt4pCNxHeU
	hl+CIj9aUKWwyzpFysv7Cku5zvQlXF3VxyCubEw3CFAgYpEdil5vTQdtiPtmSJuDIWEi7C9nB+3Rv
	1ZjNoYi/RMmB/WaQT1OIm07a5uwTIvqsn4iSgagGuK8Q3/QizItGfC4+kTBScTTgGfiNgyiGV/yJ7
	0t0OBLcaPsmmktCFEXEMD2mHPtoDHUM7CN/dz38D3+JgEITsExHBrwtygwirg4OIySfMO2F8HMawA
	G6jSBRCA==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6f-0000000Aipg-0WV0
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:13 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-78a2a97c296so232952985a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209707; x=1713814507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
        b=eOtpnsN1BmS0ptye7ZrzGFp1mY1gnkV7ucOrhv8mMrMv8MwvZMa0dHHg1FERLYCyaU
         MOuWJ9yS0pcHz0B+jhxZAbBWvOmdRmXXYyYpfpm5PKXAjSKhqVop7/oNQDOKSeh68q9R
         HQY7dQ2TsRpOB/RRGTXW2sejn7l6wEnO7b2mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209707; x=1713814507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
        b=jtFzr6L5ssgedajqRvFoiJZEJdWuuOSa89X9IznTW7jNh6Ld1LP9jvBjiChkomfeLD
         q1RvbB9yLfh7cBtk8BeX6dF5Spx9wzb5HJibPd2/hkJJnvHKZ9OyfloXJMaVVoOxpVc3
         s/pAIc2FNV+JCvI5QUMevOw6D4KgpDlfqPoCg3ZGn/DIJnc5+LoM7cDlsWN6fRUH80dk
         pLbKh6iJIJyG6omc6w2k5OU3wl7FlYwvcu79SwGCrQSrKTgHgB+9uwvyullOtiaFZXb3
         lLlMKctgO/O2yOfV78HdX5p+dIdUObve/JvllQl0cQXWhQ+9yMq6IhEoCvnnXqELm6ev
         cr4g==
X-Forwarded-Encrypted: i=1; AJvYcCXnyXXO0U0SV5uGO+owxRg8i1BB6BfrMdr9xKshtwNpgDQc4hZWFYB0OI3K8IwxEKUou0ZtRFTDWZXnGUxruKJ7rLqWJC7n7GPgi5ksJ/xRDt7m
X-Gm-Message-State: AOJu0YynJLi0RJJh5d/gqpha5gSraRznf3xNOU257LTApoMXcH2DXcr+
	6DFEXlioHt/FkzzAZzDIPfEGBCcxDBDnwvOvDB5Ql0EVJIb8QG/wVV1UDShXsA==
X-Google-Smtp-Source: AGHT+IHZ1e+rN5kElZ/+CBGmltPllmsoOBrN7bu5f4/61aiFTpQ8yq022XA0QecM/v+OB1heBU4SXQ==
X-Received: by 2002:a05:620a:400a:b0:78e:ca18:4093 with SMTP id h10-20020a05620a400a00b0078eca184093mr13235627qko.60.1713209707046;
        Mon, 15 Apr 2024 12:35:07 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:52 +0000
Subject: [PATCH 35/35] media: venus: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-35-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203511_007001_C5BD6789 
X-CRM114-Status: GOOD (  12.60  )
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

drivers/media/platform/qcom/venus/venc.c:611:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:651:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:629:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index de06e1712d09..285bc1b4d888 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -608,7 +608,9 @@ static int venc_pm_get(struct venus_inst *inst)
 	ret = pm_runtime_resume_and_get(dev);
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
@@ -626,7 +628,9 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_get_put(struct venus_inst *inst)
@@ -648,7 +652,9 @@ static int venc_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void venc_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog


