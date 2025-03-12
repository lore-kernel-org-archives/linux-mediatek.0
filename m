Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B1C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=; b=z6yHMt7pB1HnYPknCcxIHw2HSH
	0p+bTWQM2jflBPK+44AsRoMnpAmWYVkWK6JpNbKfHH/pFE+k3B9hN6HIAfob9GDJ3z1cZjKvumGVA
	MXxVNlrfDQr+hPbhVUmeiW7kcn8spp527Ow5qfQc8Ey8ZXrnT5/ZpcJRO/57pQdpAlLV9nHBEuQ0g
	jD+IVMZNKdhK8DFZO6a050iZsL6jQA4BoxjsyQ4FsFf8p1ruUOIY1BAP/td9cBAU+Om4CbmxbofYn
	MlTDItCmkOV0AZj45b5tmxQQBsQdZ9e+ITIW3azSDzCzEppaYucewzpRbhCXamrlmYNQm5hfDbODy
	yAd+wlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzk-00000008Da9-16Ln;
	Wed, 12 Mar 2025 11:11:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZO-000000088mQ-2cCn
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13262764a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776254; x=1742381054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=mYboEBBX+GEfnIN/YVRD8QVbo/2gieX2Y9o8yoC4dRtZct7YF7rEF+zVh6aKs3Ls3d
         Y6EjqsXrQKwe67PsltYKF2PA+udTEBNpMLSUjDIcWS3xJI1Qxuqa+V8+V5qhwoCBtdsQ
         QnAdARwn0R9FZvXj3dGT0nrQ4lWR5nTp2KD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776254; x=1742381054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=iYAeZbXHJvChhQmf3mOdjLdKvsQJhlU+pMPY7dvO+gcOUcdGrWqqTMtd372TcnVwPk
         ukX9+8X+bPbt6TrlrBz1jq94tfX8nOCmG7bocBpbfdt7Lize3df+mpQXPY+WMwNlgvDc
         SaOnOgrF2vwhVTtq36VOcQ0HP+UrBpH5OIi93fvh62HwJbdHqM7Qryq0zeFb96Tkt3Nl
         9WVo1D4jCpwgpUa7Ei6ivqrAvnxnvDiVDQN6pywviDjzsnLhe8ZHWzUsWYlzd02I5att
         c/ZZnl+9Tj6e491a2cJIumAMtGVfFM9iQjdtcHovrFyRTf9zFJ0UY/CJhTGriBNrMR+J
         h2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUiJdvPDRqi1eFuwwpyv7D1mA8EibiAro16LmlrTffhxryJL2E88bkBs/oSNR4xi954jhJ26j2rKLBf4BC07A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1juPRXfvySK0wYlLHgIFtjlk0lfhJmrRDuAi4artSsVomlk99
	Bk0NrGiniyNx2s+W72Lt7JTFBsnyVB2innEkDV01JE2HsNmmSKGaYX7mG8BiUQ==
X-Gm-Gg: ASbGnctHlpZaAIssLOAGFLF3viM6hHc/K5FxEaH9mRe1bWLb6YMjqYtLJ1GVRkMBJY/
	pc9bywjsWzOnpNNHVe41JaWogFR/7pJqvDjpa9fuYqBDk6da2fzjJ0DOBNsiFjhiG0+NCq3eL0F
	6Qqhp+9kUTyY8/BjY5bSnX0S766Fl7rOAw7k7JLphQAYQekCoSCUeuc5gbLOG1hxayT03Apc/XO
	wRhGG8igVcRHvF4rIbplJNFk/L11Mp4HspdGJsJtagQsZVtzCecrqD/XcF3xHcrPOsLWzeOrW+P
	RPLEWrPCQhp213VGHRfN6niewSOoGq5aRDJNTXtM+NK4WwkwNZrgdCe3eOt3lrY=
X-Google-Smtp-Source: AGHT+IFSE2gHTCSWYPmLv3kDZjxj214O8BELRgRt+BaoekLoQKZE6r3o5wS+pqNMYHoEB24uQ1fVVw==
X-Received: by 2002:a17:90b:388a:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2ff7ce94cccmr37763724a91.12.1741776253695;
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Wed, 12 Mar 2025 18:43:41 +0800
Message-ID: <20250312104344.3084425-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034414_668475_5ADEDFF1 
X-CRM114-Status: GOOD (  11.16  )
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

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..eb01851e1cf5 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -84,6 +85,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


