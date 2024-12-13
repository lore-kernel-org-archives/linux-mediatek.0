Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CCAE7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=; b=cUsG6LQBLnhebKBbIUJCEtJB8m
	4MVg1EHg7ZU/sEgelxFktBX3mFBnwardPCULS/3ZS8UFoCrPkhd6swZSF7uJzjCfh87E9orIWfHKG
	XX4MaVa6gngK/gYFPQa3neUaKzOiAMVqhrj6vJ8kkEVT/l5Xlog3ppsGl7Da8/ZtUxllI4kvYnpVj
	3fWdcMUZl2y9FJijgULHW85jCk1Zd3RtTsNfVKBcnLhryH033dXof1GCwaYM/5+QZWuVWJr4U37jK
	V6acS7c6sHJZ4iZ0i5GR2Jw0rMEolFi/xrNUDD2e41QyDEM/eelFCZ72DhpBYB0s1HReej3zuloyj
	ngxVnM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyEr-00000002lu7-0aia;
	Fri, 13 Dec 2024 05:29:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDS-00000002lap-2iie
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-728e3826211so1165025b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2024 21:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067674; x=1734672474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=;
        b=jqL6BiOZshwZ4Lkrs1oGomJheWOgGPENQJKFm4QgORcQk7gbuaM12H75LuYm/8hds8
         W4tUDfOrhsA3aWJ20CPV2vyTccpX7jO0vBcQAfVBe3vEmVuJuiHZItV/kXGsIE8e+jFw
         x/Z3WMSz2nYeR+E9vxHOC66hbkaLetvC/RloU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067674; x=1734672474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=;
        b=gFQIrqIW2O0A5c0sY5SoxG4Pa7vOL37N0mEnGXei3Yd78qp1QjKdg2+4E0vxGwo3G+
         kjKsJ9ICpEqxBSA1/cs8zjvFfmVQBn9X3MMSi7F5KHe/dK4GzckrD4KJ14LNd7AQcNJu
         2b6PMu3o88Cb+JlHqKDdm0jqj02uQmEtv/ZK4s3wqOhe58Tt/guAOsZSvsS8bC2q543O
         XzDPrcMjrD2fBgx27I5+JeET9GQ001bwbhH3khB8FMopbKDHY1KoUjADN9wdtwb5HTyp
         snjv8n1ic5xIWigMhOw7DL8IF1/Jf+hzO6K6q8xvg2PxCwJVLzneDixkhP154Xspzxdi
         zDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAGSE8JA2KGYqKCfdBcw9yb0kbGgtRZvqEd0lME+mlnFpKSFZv9SFOQOE8TSvMN+Nhm0e4TTeT+S0DdOuK/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpVh3U+rKzdgrI5PU2xMpqi/kFXxSx6KtqWpw71pEDfPDDKkaa
	Vc8eIWKw/LHlDKRg6QRgX9TBTUIbFS3q4V9fnuP+P7bWPCo6BpwyDZZh5mD3xw==
X-Gm-Gg: ASbGncvhcpD4toGliOBzHsKhemZTPrYeW5fOy9Vnmrm4x+GSUXkwIJsvXLcBiRTwovk
	NYrmmrvMTq0nz3N8cjltpWz1ba05VmOm+OGaQM+osoqY65V5DY7UucA5h9/FCN7xdMm2GkCYpgh
	mml6adgjyzck8kkyY2hrdSDv3uZ5u9Rtjllst4xid3QNfEljWnjMb7IPSr1jpVmkvFZ5sUuKygC
	hCLty2D0catC2zedRct2nBKkXI1amLnF3R/74VBTzVNxaf01cbYeDVb5S3m6ITdjjgaLUmcExjl
	qsR5Sr2POcuCbZprAWfLsYztlFrSlLoJNCaaUv2JFlEuRKw=
X-Google-Smtp-Source: AGHT+IEewRI1exts+mBt5zPXwiV4DU9C7+OYlL08s3JN7DhOdqeiqTJY3msJOJkX4Vs4aQwdU++g3g==
X-Received: by 2002:a05:6a21:7803:b0:1e1:b35b:5132 with SMTP id adf61e73a8af0-1e1dfd6023bmr2007610637.20.1734067674075;
        Thu, 12 Dec 2024 21:27:54 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:53 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 05:27:47 +0000
Subject: [PATCH v3 1/2] arm64: dts: mediatek: mt8183: kenzo: Support second
 source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-touchscreen-v3-1-7c1f670913f9@chromium.org>
References: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
In-Reply-To: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212754_689516_41634909 
X-CRM114-Status: UNSURE (   8.16  )
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

Some kenzo devices use second source touchscreen.

Fixes: 0a9cefe21aec ("arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5..561770fcf69e66341c080687e2efaa6e98c550a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,3 +12,18 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};

-- 
2.47.1.613.gc27f4b7a9f-goog


