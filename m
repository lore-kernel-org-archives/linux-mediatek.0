Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E83E7716D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=; b=y9+7zVJC8shcXJ
	XqLEDxqqYerPjpnyBAPgTWVupNUE7TqPZADDACVPlAv3VX0dEEg4GkmprM2o2YPLKsenEaKaUAevu
	7TgD5/pR/kKBhYVXXAZydMrh3qRJQTsam8R3T09zc0FjYDczWcJ/52ETfrZzAtsV0P0OkxTfHNd03
	TUtyx0FaQ0GwOX3yHqjFWqvfBcBBrl7UXvql9s3eAlhS3QO3HiuIZiSYI2N/U823FUNZ8SOY9Ws85
	rdnzmtWIA1V7P7d74osCqoKk9gU2PwS/hrCSrpsYEC3o1MG0+ttQinDMRHQ0+gqeQ/NQkTJWO7iHu
	CPVcLQGiw2PF86uG9Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIi5A-0000000BXmB-2M8t;
	Wed, 04 Dec 2024 05:37:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIi49-0000000BXdh-3t6F
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 05:36:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-215d92702feso2862865ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2024 21:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733290608; x=1733895408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
        b=SXgYuIhMdqNfXYE251X/iBard4QCvDIKeojZxxeztudianCMq+h6j9KJ/RoB8bQhU9
         85+pKnMnSTtxayTxxJVA/kDcwjIUN4RcuG9PIstzg6qfZyS5a6FH2bDqTs+xzUWquguI
         Q0zypCz3whu6drPZHjJY2/0k/1HFj2exm3KYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733290608; x=1733895408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
        b=mjYEzNlczi+fCfWM4a6Byr0AXZuAEVqvHwjkQQwdF/Ndn2rfAmJT2CrySOfN721QuR
         8ZLmxeFvBFTmhUI8jRD4NxoHy5TUTkkeImfu18YTUQ67gN4FRj9GDhkkD99Fd5tij5kJ
         OiWuBtxsyD48EJzH/1g2fdcnz3wtT+xFBAxvmHSUmyZrYltd8NH82SuZQ+gusxcGWHeL
         2ZRFT5gCXfVn9k7hHox3QtoYqBcOZu2vUvcX38fQf+580xRzhmZb9JpXfbixKE8KlIn+
         sNOoNrA6nUl5HMc3e1T2JEpkDWpvEI158bv76aeW14GdtPGvic52Idh5hRgvqiEKqiTp
         4oPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc4AnOEHJUR7UK6ARVmAUSLFrBBCLfGp48ZjPU/iQ5sCRn+KV5yQ+RPC7ArKOjgstQbVr2l8OGznVOKMzoGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk6QE/OMRQN+WihFhNmTq6o1aX1ZL/COpNt7p7zRBS5nCCyS1B
	8GDBospIKyppx5nt7Zm6kOpTDPpY4SDDTOs2yTIHDEKnFPgsrUYnKFP6odYXOA==
X-Gm-Gg: ASbGnctxl8KOqZis8YIZ9e7VMJXsRhxpDtOw2mPytHmEmNf8F+zjJRDhu0t9EkzZ0ra
	+QUVhO9mcdUs1wmfAIcW2YiT8EMGAdzWAWmsDreefK2Q1ob/7hglGC68Bij1x9JGpvLq3xriJel
	NRNVcQPGc16idj2joHubXTP1TCOhTjc8OY/urkcRDXO4yt42U226deiq+wcgF74nQEqGEKfqrW0
	nJI2mjLaItu7ylvOmbWJ55LzMxWc37Ia7vs48sg5RlLKKgeJ81pzGXnk9i60lIauEI=
X-Google-Smtp-Source: AGHT+IHCZpXeN9MLrmdZcAAHOnTGeoLcKfIjSMDNfOqrrypRTuT3gt40Zogb0oCb0B1u/35wvFZQbA==
X-Received: by 2002:a17:903:4094:b0:215:bc30:c961 with SMTP id d9443c01a7336-215bd161bbemr52091865ad.35.1733290608504;
        Tue, 03 Dec 2024 21:36:48 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:b764:8a78:a02:6e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219672d1sm104304235ad.164.2024.12.03.21.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 21:36:47 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: dp: Support flexible length of DP calibration data
Date: Wed,  4 Dec 2024 13:32:33 +0800
Message-ID: <20241204053634.1365491-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_213649_991458_DE5F7D1C 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The DP calibration data is stored in nvmem cells, and the data layout is
described in the `mtk_dp_efuse_fmt` arrays for each platform.

There is no guarantee that the data is always a 4-length u32 buffer.
For example, MT8188 has a data length of 3, preventing it from passing
the preliminary check and undergoing calibration.

Update the logic to support flexible data lengths. Specifically, we
validate the length returned from `nvmem_cell_read()` against the
platform-specific efuse format. If out-of-bound access is detected, fall
back to the default calibration values. This likely indicates an error
in either the efuse data length described in DT or the efuse format
within the driver.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b16471..e9ff6fdfd6ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1165,17 +1165,25 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	buf = (u32 *)nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
+	if (IS_ERR(buf)) {
 		dev_warn(dev, "Failed to read nvmem_cell_read\n");
-
-		if (!IS_ERR(buf))
-			kfree(buf);
-
 		goto use_default_val;
 	}
 
+	/* The cell length is in bytes. Convert it to be compatible with u32 buffer. */
+	len /= sizeof(u32);
+
 	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
 		fmt = &mtk_dp->data->efuse_fmt[i];
+
+		if (fmt->idx >= len) {
+			dev_warn(mtk_dp->dev,
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog


