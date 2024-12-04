Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F215E7716B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=; b=FhU4Z2mFcplmS9
	nRoKr1da8xA6LnliIbTYaTItRf6ahpfqMfcDL04dNVQc/vBseHh4v80D9c78T6iRYsw/OhTWtlcxp
	XuPnbotZG3tSMi4UtpFqH+sUzC5lbI0ACNrHnJn6v+jb+GT+v1KuAZrhe5Q01UZTmtsZkWWItz86t
	pF3e+07j+Qhs14ThCFBCED9o1Q+wC1ddq/vcxSDUvxWkTS6MJAttggws+6ULPKBDsfoD+bLN0+GpK
	/AbzNGQoO2afRbyqBjSloS8sLCvrlWgH4LAxM4HQYI7v0Xwq2d5R7V91t1/L2fdhqsvZ3fg0bl5/H
	Ferez9SRRETB9OrC8p0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqM7-0000000CpgC-1R8D;
	Wed, 04 Dec 2024 14:27:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqLB-0000000CpZs-1Sxq
	for linux-mediatek@bombadil.infradead.org;
	Wed, 04 Dec 2024 14:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=; b=cEtm3Y8z1bvKpVP/I2Uy2U8afZ
	dLw6pJXoOwGuVFtWaqPaof4i0fNG2lBTl/nrM4zoq7+W3Ea7KSzwVfj6elhT0FRJ9spJx3tKpJghA
	59IbhO8OZ2QGq0RVEl/+GwrbICKYiqs9d7JwMgymD1G3vKwyh2euVQMKr8TNLMz3X+s2Dm/OtgRDG
	o0g6pV4u+IqizoeVpW2YfuXYJ/RmIQA6ttKER5HiUcPLnWlYGks3LIRKF9ONvW9DlK6r5aJe4unHn
	ybaiY9Zab4tzF7yOKxOZa+tAolpGpDQeenHqmZIjIHyd10F3OGISvAH73KIg4Bd62z8zg63xyjyoZ
	Y6UPfdUw==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqL8-00000002dRs-0x9F
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 14:26:56 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7ea9739647bso4921057a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2024 06:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733322411; x=1733927211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
        b=W0cTJmlVmCoSujb1yhp3DF4pBweAx4xupoz8jsAL9A5Zl2z7anOmPyA6j6kc9+pCja
         21fgSX1a7FOy/nrMdV/U9RduW10yaQ2stNvIv1dWQmb6V7DFrbeFO/BtEFluNx94YQ3E
         2A4aGO49OSwK3z1HBYabeWMfw1aTmtFUotbsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733322411; x=1733927211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
        b=r1sMDv4tIoJP8Fv6DO9AqLJWxh8DLhdtQzJuhacz5mrcHWMWejydoGrvl+vpg6w60v
         pNiLopCgCeaJn6QET6FYa04Vs3E3sO3KYJ2Lo3xeU17JCxnSNb/pFrty0cR/rPUfN1Qg
         iHo0aSHDRDkh/LpVncL/b2bNUxglca7/JGZtpQLV1GWoGEu3PwZBKGxm7RA2ebGBul1L
         IvRIk6zs2b4HLjtk1BtMjBXB6U+fps4aEbIbX+RbFCqnTQoj6nH3cq9zU1k9x8GYfP9p
         a3Cw4Wsa+R37nV4iWr7k0urR/iix3LpKhkHR/mJl6HTHSUybDlb1w/T+oMnUcI48aqzN
         8bCg==
X-Forwarded-Encrypted: i=1; AJvYcCWhNyEAWtoWmQQLVr8/HT7x64hGbXnBJ/5jOaxhOePmWCx8ActOEfUzD18fnCWFlTNBOHM3dMOj1AsRqVZtsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiL21vwi4zWKlL80nMkQUhUGgHuGEIH7WEq3iA9jsyue1ESqeY
	E8SFwaphPRar7Yjq7npgI/VGbopKr3+Wi0Cb58y8KlR8XDG8UJp87OJSaP7GKA==
X-Gm-Gg: ASbGncs25dUYTMkscFTrOznJHki+ZnBiPqYVXLMyIrwmklgxa/xVgBJS6Cfc7KsIhS6
	moLiwgyE1lpE1e9fHeI1W9OZueKsQ+Tm4Nmys/uhQ4wLIp4X4iir/XPE0+IwbxjoUxHVwyvk40b
	1yFyyoyDwlOFI6VQVH6TjMFAAZ1fHNLonrg8p+iqIcIWk4J0RI9N5QOsreq++YgRO1r7FyhzZP0
	UUENmQsNEf+tiJPKv/TXaztoAtPpbHzzd/g/Rnf9NeFfK7Mv1Zub2bcEW+2Xsq4FsQ=
X-Google-Smtp-Source: AGHT+IF0dNNNk83kN4LRrd8AEGyz62WUomCygJPIZPBTF7uW7lrdAcSow02U1nyM8E/b/c2B1GaPog==
X-Received: by 2002:a05:6a20:cfa6:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e165412f33mr9668165637.40.1733322410642;
        Wed, 04 Dec 2024 06:26:50 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:b764:8a78:a02:6e0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3a2a5asm11416510a12.80.2024.12.04.06.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:26:50 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2] drm/mediatek: dp: Support flexible length of DP calibration data
Date: Wed,  4 Dec 2024 22:25:38 +0800
Message-ID: <20241204142626.158395-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_142654_569890_283F76B1 
X-CRM114-Status: GOOD (  16.58  )
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

There is no guarantee that the data is always a 4-length u32 cell array.
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

Changes in v2:
- use %zu identifier for size_t in dev_warn()

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfc..55671701459a 100644
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
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %zu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog


