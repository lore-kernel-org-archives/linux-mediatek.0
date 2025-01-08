Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB96E77199
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=; b=BfM1oEGMyBOKgb6kvkmSmCV8IA
	nRteZplRP6+kw1D6KYpokWwyBEB48dU0Yuj/7nMLR/sWn6Qr+KDCSy9/1avSR3qFLsHk4sRDXjmfS
	fWEVUBl3rjHjUQREQ0wVFrWwHMVQvEuwLp2e/Thk7IpcHi0ZODW1Li8sRqxwj46MiaPGx2tSYXx4N
	6kWN1zaLC8NyFVOj2mmXKhZ0x/f9yC4vjWmIRo1zXfQueg5kiO2wmaPTOGyKlvivpARDXPxF/RSyY
	fMpfwB7Je5kBcl94QGVupGJPX5wDo7El/uKxT0A58jD78MCZAoD1Ds9RxorvN9Kqb86oydHa92Jw2
	ezQsYGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWJ-00000007ZgK-408W;
	Wed, 08 Jan 2025 08:34:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWH-00000007ZfK-36jQ
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166360285dso247195355ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325269; x=1736930069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=;
        b=himosNZalKb/f2vEOoDHQDe9eNGE8Y0A1fcb7kcdLoIdfue4sZbhAXmksbvKq2PrC+
         MxVeMOiMx/YW4X6jwuO3vXR/D03dpEERy8IZdqZvolqmqOa/MN0Uvoirt0kQJelxnZS2
         lGV9ylu3I089kiyJ8HZMO4+smmflkcwC9syNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325269; x=1736930069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=;
        b=Wt4z4t8HgQKyp4L7NE4H53eDgUrIImKbP/Tp91C5aS0kS/sQP6rTIQmjXLwp65KwXU
         R17mSj4CH7ogniDshrTChZLPxXpPAXscA5ByVOveixGuaoVohNUZk7+EYlN2Zp3Bne8j
         wIDW+bjDTxMZhJ6+lLJjgDrKpftHSb/33Poh3wDkvid0eMHVVfkENnNdYihIXGmdLt/o
         GlBkrp6STpl0tDfnOsqkl6t4CqEq9s0zoMXNKThdI29z1HwqVxL2gem8Qx1m/TzJfvra
         /+fR5tZgfI8u//LiQgMCzmChB0bbnkB3x7JnUavX2tfRadiccgdulqL7QgX7DLBSBzMh
         +StA==
X-Forwarded-Encrypted: i=1; AJvYcCVEVnQSM88WYO/qJVTelDu2iCCcWWoE1mmE/sDaublIiPfn/v61qlxs3dB+f3+rjLZfwng02Bh8hSMY/HOnpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD1HtrI02cqvGUsAvRbpMbkOW+YgeKjz7NkvHXegQTpIo8+m9h
	XWFHn4HNLDyOiPIkrS4wEfiwGv+htsRaUjrl7LQfCM5o2kfS3RNC5UMpGGa7hQ==
X-Gm-Gg: ASbGncvTrg3Ozy8Rp5+NDqs/vZOlP2YM5T8n1MxmGcAfHSWQZwyov5WADmGpXY11eU4
	btGxtvWBUGuf9LSNIPzarBydczY8fe2ZqrJjao5En/FOFSmti1cQvA1tHOn+02UyjmOS/iYFdsx
	cr4m1km08v2nei4pHYg8p3c1e/S6lKfLNGxNNExlA6pQVIXaGQ4fF5RhsMgPiHHt1zJGAFnZEBY
	AHtngG0r14IlqnGXPCcyNspd/rr8BR+IoA1hZsCxjxlh3rlzKrUyAcV/CZba2YdueDPw8usqIE=
X-Google-Smtp-Source: AGHT+IEufyJ9Z1gHFaHVltf5vZ4SxHR+JVTg5Ok01+7e6JirHWxkfmRu+e5XrZq2fBo0mVrBTIoNOg==
X-Received: by 2002:a05:6a20:4394:b0:1e1:b8bf:8e80 with SMTP id adf61e73a8af0-1e88d2fc8c4mr3918189637.41.1736325269073;
        Wed, 08 Jan 2025 00:34:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
Date: Wed,  8 Jan 2025 16:34:21 +0800
Message-ID: <20250108083424.2732375-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003429_807009_13BB0EF6 
X-CRM114-Status: UNSURE (   9.95  )
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

The PMIC has child nodes for each of its functions. It is not an actual
bus and no addressing is involved.

Dropping the bogus properties fixes a DT validation error:

    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
            from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412212322.JTFpRD7X-lkp@intel.com/
Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b5d4b5baf478..0d995b342d46 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -925,8 +925,6 @@ &pwm0 {
 &pwrap {
 	pmic: pmic {
 		compatible = "mediatek,mt6397";
-		#address-cells = <1>;
-		#size-cells = <1>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-- 
2.47.1.613.gc27f4b7a9f-goog


