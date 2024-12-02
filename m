Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE2FD10DBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pg3Yz4At6rILnrTbhiFAD+QZrbg9FZ7kQ3hH3sJqcUI=; b=Tzl2geJPgupy36u1WCcMD8xw1a
	WjlGUPvKzT1esix9lsLTDQJ930e8jC8aPFQFYPtl//D9kDbtgH8wAQHckdXCTANwHG/UZQ/kcEdS7
	RBHzy6Hfw3wFYZ4RjZ0/M79F2MhM8Q2ID+eeqXvFpT5D7c72z+jIVfr5GP8oSaWv/PsXtH2Z50VF/
	3p3QbIje/O6/mBfye4JU+XdD9kXwcTuXYItKryMxq8dQheeG3oBaGHrKDbzA4XtUDFZXBcJBLuNpa
	xfUq67SG0YZqBVmvtSMexfE1aqky/31br3SU42OK/RoKl72WVXs0KSQittMiJnOqyxzHaOrzUrc07
	+iQtWobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bd-00000005Ohz-3qre;
	Mon, 02 Dec 2024 08:16:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bb-00000005Ogl-49Xp
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 08:16:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2706019a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 00:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733127391; x=1733732191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pg3Yz4At6rILnrTbhiFAD+QZrbg9FZ7kQ3hH3sJqcUI=;
        b=bXFONIDxoMwE/CJie83gnAMwvTzlEO0Q9YiCMr48ODbzPvrM8XkHDRVz2ej44/8li7
         xIaJ12AT3u4DZA53t8vYY5zh9fXzOL/iubb3tHkeb/RUzpuY94XicubeJaxBBZ9ksS5z
         DzcV3CdX0IkAF3TBMR2O9YvoPMht+jHRBVP1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127391; x=1733732191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pg3Yz4At6rILnrTbhiFAD+QZrbg9FZ7kQ3hH3sJqcUI=;
        b=up99iXbohck8Blq0//8xVBIyYQ6F8h0XRP5rhmJcQeZ08i3ihRStEDR+UiXH1VJ99i
         I/rXM6jRxpXyWMXCNW0Wi6HzIlgLbJAZ6fPNX0p9Ch9Xlt7cv2RO4dl/4+0RmfSjwyug
         2YfB8pdBOdcNoUwtozsg3n6JmKJ+8zlFeHDZ9u5Cr4pjHoji62bZqXzOsCeveBX+a68M
         sBi41JlUa3NNU6KODL3jeCg5M400LdS/tTotvlKpiRuJPX01p7JNWdOHzgQtZ8h0sWOG
         WQF7Qr0jBtW8sZKOS1v5+9x7ZrsaOA8z1PqqBGC4xb7YH+NbLFicqbaOLJ8liY+GkdQ4
         cZrg==
X-Forwarded-Encrypted: i=1; AJvYcCVFFM3KKL/8HrUUqVQybYq6Ua5WVPov/0j0yWKMS/JP/5AtYerpYYP1wRAEpBWk11dGH9m1IjT18yl2+iHaIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZutDr8T1+067J/AUIS9Yjn+hq07dxW67itoUlccRamudck5BE
	tiPYnKYKy3EnOWyuqQBzKex/XcDPR8m8ZKixYs6QTjtgKL3dV8uHooV28nNZbNqDnXHFNpKYioo
	=
X-Gm-Gg: ASbGncuU0dBDqm8NdKGBcxxK6Jc8eRz2KRBqyHwus1vo5S/I5DnUsLzralX+3JSrYPY
	FTVlfDDvhth7Jkqpyuz07e2qm0iLkPIUMfuA2LA1XlkGpiLK+VsBONlgYraCHOfPQrDHu8b62Ha
	xpk7uhnLpyPS9sOEChgIMKzBoOyCxhQkz6X6Lb0qwpHbA4mVoDAEWh1xM5rjg+VmPbgITMgchQT
	npzRTR4YKZDWEjg2igX281hO0eYkXl1gI0WSZBYmTJQH5L1uthVlAR25cnrKvvMbbvB
X-Google-Smtp-Source: AGHT+IEyKQIaeusGCCWVxa+Pk5NLnro9d/aITgSeBa7Kg6kcWmmYAuoWP7vfPPAfBDvpL5S8TRfv5Q==
X-Received: by 2002:a17:90b:1805:b0:2ee:b0f1:ba17 with SMTP id 98e67ed59e1d1-2eeb0f1bc4dmr6645889a91.37.1733127390703;
        Mon, 02 Dec 2024 00:16:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee488af41dsm6312844a91.28.2024.12.02.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:16:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Koichiro Den <koichiro.den@canonical.com>
Subject: [PATCH 6.1 1/2] Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"
Date: Mon,  2 Dec 2024 16:16:21 +0800
Message-ID: <20241202081624.156285-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_001632_023353_E78039C5 
X-CRM114-Status: UNSURE (   9.57  )
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

This reverts commit edca00ad79aa1dfd1b88ace1df1e9dfa21a3026f.

The hunk was applied to the wrong device node when the commit was
backported to the 6.1 stable branch.

Revert it to re-do the backport correctly.

Reported-by: Koichiro Den <koichiro.den@canonical.com>
Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
Fixes: edca00ad79aa ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 39e4f6a560f9..9180a73db066 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -922,7 +922,6 @@ &xhci3 {
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.47.0.338.g60cca15819-goog


