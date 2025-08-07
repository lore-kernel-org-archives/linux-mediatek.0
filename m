Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F1C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Aug 2025 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=; b=kZFc22YCEg32fESREumMMZ9sHT
	IKagTnk/DKH3HTXx37oIf8xJlgg6lc5KY+3sOzZc6N5/xMOelNeeWt/AcB+Uc96aQcWsoSa72c9Ak
	QQjPxkST0CVF8+AGSPA9H/ud+u0yEBoVAw1hFdMV3rDE1F4uZm4oBVsHODzCYUSsFStRzKhS/p1jy
	RKJGP5AVbzpSOcBpQdQuEDb1SB8mKLqRm4xbFyF3w4JtwOhMkdb/kQDbFYszLP8eP+3KwSNYh4lU/
	8aRrdPB48C5xR5Jvj4fcEIQHqpzO/wVP08Yf9Bx1R2hHXIjxN/GfUYpfBJQxUGknGb1itQ36jUdJN
	2VpvpL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk33q-000000014JR-2Ceq;
	Thu, 07 Aug 2025 16:01:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk30f-000000013o1-212F
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Aug 2025 15:58:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso8867975e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Aug 2025 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582308; x=1755187108; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=eV/NHljKSqwnEvhMIQ2jPeOK5tEoF/MvPWutth5bec+NjSnt2i09Xz+wXIR49CvZ/A
         DQwFN2j0bpUtJUF7dOS9dS3MP/Gtd46GCGCF6Pp2bMOCPKpUE2Qw5oSCI/cKfmhvlxdu
         tUgkKh4MpfsQyHuZFL/Hx4DsPB4lkBpGI0lGIjI5eDGeu+VV6KdSpebyK5c58vlocfro
         7gFWyRVNEu0/lLbva3rhuKm46Fq9OSFd2kNjZxLrbFl/V1BjBkUoF+Njtp6SeGYUnk5L
         /zmHAL1nDHFwhBRkz1qvVMwILp60YxTOAjH/WZ2vpfOSsw99tLxH7v2lq7Of3PFsyVb6
         tn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582308; x=1755187108;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGaXLwvEaTDaelriMZ69/JBFsXGLBD07Z/REYyW1I=;
        b=sRpG5BaDPyGhl6ZSMrJu/kniQi32Y9gWq4qOW5u530S3aj/5wAzmWMgU+8VYDMLpLw
         An9A7JBGoSY+M5f+V41VuytGBMPjpwgOZDsuYxpk3tUZxnDpAuH3ZrBsKUpIXwsH6TDp
         2OtoZbjB1FdvM0/KW0bla6WMhmWAaabq5oZInzXlduc7kWBqMy2DK47gdG9qDDeMwmvB
         VOPzXVbIWjS6TjHY2u0UVPp+ypAalXSb3fP0oiGMu3gvnGwLdm5+hXK087fOvHOtnpZU
         TiQzPabmoZXV163CLGd4sKQHAvIWNzRD7bmSqQRshbHozCLQEWgbb+5WMvHl0P+04u2w
         s5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW94fAgMVLtMP7kKBuzA8je9sBY1+UcQA3vc+/3MSA2bEBfcyjSAFTnLPaxHB9QpQKWoiActLYfv23gG3eDEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb7NNYyupLI/xazaxqc8NJbHU7RKUzAvL5Nc1SSFkjK9DN2+JH
	cnv8Oq7+ynrGZeNfZvxblzfMsajYeIcMlwq5wUvSrRveMOIkGuaiF9w+iwPfCT2iob8=
X-Gm-Gg: ASbGncv9kcTfqNdUwLsv1viZ5s2kPq6vaY8fKHcq58iSWRNLoNo6C0Nfn8goMSHM9LC
	zvyLKh6nRxViyYkc1HmMpPXZWQNfWoLDQdfjODaKFg1TGXBXQ/bolODBd3utNm7F9KV2z1fowwV
	MO/pUehlxwKRIVz5T7TNKGXjh3wNHkJQEeNSJaQVgcTM8FgvswPoaQI3rTQeETR2eVOt7cZNL+6
	jjpbrd5/QXWtL6u8fxJEgvPOMyL+AG8BBNvXjo6P6jG8EqNOQR8C42SlkjqqX+5QPJqMMJQizk7
	cRrlMrLdvxRNZBpoO2jdOeBfbmHIxutXvfBHejW4OTyWm2m2zPimHmtkgJcvzUWXneRQckMveYl
	BE3++8K9Obqh/3BqfExmQ/0jY9/c=
X-Google-Smtp-Source: AGHT+IEQAtbjB5WuaftcfISb7loqx9lFVpOAzAnPzXuHW243UbLgIM9IVwryPWI9EYIwJTEBgNYAhA==
X-Received: by 2002:a05:600c:154e:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-459f431f845mr2720525e9.0.1754582307874;
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e587e154sm108933495e9.27.2025.08.07.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:58:27 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:58:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] PM / devfreq: mtk-cci: Fix potential error pointer
 dereference in probe()
Message-ID: <aJTNHz8kk8s6Q2os@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_085829_517759_963E3D14 
X-CRM114-Status: GOOD (  12.85  )
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

The drv->sram_reg pointer could be set to ERR_PTR(-EPROBE_DEFER) which
would lead to a error pointer dereference.  Use IS_ERR_OR_NULL() to check
that the pointer is valid.

Fixes: e09bd5757b52 ("PM / devfreq: mtk-cci: Handle sram regulator probe deferral")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 22fe9e631f8a..5730076846e1 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -386,7 +386,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 out_free_resources:
 	if (regulator_is_enabled(drv->proc_reg))
 		regulator_disable(drv->proc_reg);
-	if (drv->sram_reg && regulator_is_enabled(drv->sram_reg))
+	if (!IS_ERR_OR_NULL(drv->sram_reg) &&
+	    regulator_is_enabled(drv->sram_reg))
 		regulator_disable(drv->sram_reg);
 
 	return ret;
-- 
2.47.2


