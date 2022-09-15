Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F450ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=; b=PmzhqdjOvQSPFwlVYdYobTMuvx
	ULdXXcPEp8+vV1+7z95n2UpDpKANKvxIIchGjn4/gx/XshhFab7yA2o4C/uFzplAj9ZjjJ6H8WymZ
	VxGaFUyb6+9P//SQwLgE0VlahvLy10Lyx8Q0jbLg2JTlHiUREZu0+WJ3sW6dl6yN1UwjpXYcBk13B
	Bg9vHDDB8nh+9VFhf2hs0ifflfLzkmLS4or5BBmL6PFrErugImaxLdil6lA0fSXhbGVS3BAbE1oy/
	2PLS/WcJH6HIzeW9IJU4WaZwhKcW5Kj3SxEsd8lCT6IlgMkF6i/NyFHc9nzk8D6XzAnrSfl47LizI
	ZQyaqVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlWs-005kc3-Vg; Thu, 15 Sep 2022 09:51:30 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlUv-005izO-JG; Thu, 15 Sep 2022 09:49:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so17011521pjh.3;
        Thu, 15 Sep 2022 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=;
        b=mWs3Joq2+U9sk0TTku4uVfHfyJi54bqPrLJdN+GMWioKOLnEkyRHTv5xRQa+u2QYdw
         dV95RVVDRAFNhd4CPJ8CDqlym//oYKusNe9pE+0UGlurC7GX9j8A0Jv5IGrQxD/r4B/t
         X13xnw9hl7TkRq7NoOqQaN5jnWFHhwLI7Auvg/P63ImdtomryUyEtHnnuVHpewnd0ZoO
         LCFMNAIQACzoLpPObHtHKsS0aYUS7SoFHipgKt6I9xIK+3iAKZeC3j0BoBAU2najHWr6
         Ss9mWYWzKs3SgdP2noEt8mTzKzK7+QiBVL63MfrogRCkmxX0O33J6DOrFKmGE2fz5bDu
         YZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BLldUmawu01GzUZglxj6MBSK7Wi8J1495Ow2vHiQCbA=;
        b=2aXoj8jekKyvCWTX4qmgiR+9YlFcHIyOLhhqYILxOreWKDDAGiao83ftXlrjYr8exj
         MYxEdzf6T33lYG7kaw6k4wEtXjF+E4qb/hk2W92i6W9qGua1fKVMUr/BLApv5jgN/b54
         k3+bAWhdQgDr9xdkFbyKN3vB0MYcLnka10nh8NuvSX9hYmFryoFzfirR5vXXdzlPmLP5
         nFDDRgLdBNZAa6ecEYleLkDfmMEG9kTSWeORtwiATMsTIKdjS5v+r+sGJWzjH6X2TivI
         njV9MJawQkLPclvVh5ykMf3M8DW+w+NutO2oMSoOIhZcDCG3NyoNqmZH78WiBo5+wuDR
         TlVw==
X-Gm-Message-State: ACrzQf0P8++OSalJu97vGF0x0WIMRI6QVxXzh/v4BxMRSKWqShZge3lt
	8aHmJKSiiRWL+mem2I461LM=
X-Google-Smtp-Source: AA6agR6yi0j1GpLpIKM8QQVsHOeuU4zo8E/AA6tf+Pawbf6kZNb9CUcIHt39amXLj4c6P9ph2VToYw==
X-Received: by 2002:a17:90b:4d12:b0:202:e772:fa09 with SMTP id mw18-20020a17090b4d1200b00202e772fa09mr10042498pjb.30.1663235366651;
        Thu, 15 Sep 2022 02:49:26 -0700 (PDT)
Received: from RD-3580-24288.rt.l (114-137-177-189.emome-ip.hinet.net. [114.137.177.189])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b00176675adbe1sm12669010plh.208.2022.09.15.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:49:26 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com
Subject: [PATCH v11 4/8] lib: add linear range index macro
Date: Thu, 15 Sep 2022 17:47:32 +0800
Message-Id: <0418eade65d434a25d304eaa804b34f92318be87.1663254344.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663254344.git.chiaen_wu@richtek.com>
References: <cover.1663254344.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_024929_737132_BA6A4638 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 include/linux/linear_range.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b3..2e4f4c3 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,17 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
+#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
+	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.7.4


