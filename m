Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1432D49795
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 03:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=; b=bB+XzGmlWu2GsbdEd5zV6o1GjE
	771Ux8Rfy3kA4EyF7D3hr0mlJgt+YfCzuFrDlne+4d4fh45Z7QwXWqXq7gYz9HJtDCoxxufBJw+dm
	zgBjm6lWkBKlDAbDd3fQH2gki8SAK9Rju7/IpDV4X4eJrS1DP859qvmrt+ZA+CtDLQwZ5s5L/hKTP
	8as7qAGJDzOEoWI/stH8AliD95z3o5Aae2IayA5V3dR5IOu0LprNLCjdMnl8vndm3i6IyUmFCuVoh
	CTCEXcfrdQsQCJ5XFcioq2Q+b66zO6PhK4rVkSenO4BvMtQJXBZ20lFJobJUnKsrJcUls6tJfax2h
	XJJEUeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx9m-00000004xJF-15ro;
	Mon, 02 Dec 2024 03:31:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx0D-00000004vFW-0Sll
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 03:21:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21589aa7913so189955ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 19:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109696; x=1733714496; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=;
        b=LLs0cd4YED626Q469rSvFeRwlMmWYzZ2YJqamnyWza/tXZchubDP47xvJ2N+w4NfwY
         ia22gaGNqtpXFWbiy4/RXlyq5CU0DKTdPzL1d4B9IIFgKE8HueNpK85+lT16JNWZh3ge
         yhepYL1w4sMZY4fxu6ktsIi9RZkx766CDDk9ff42rg1UaPXmiO3TNp7d5dy1jleiNZP+
         Cm1Gvwus57E0AwCxtgveFc06RitmSqXg6aEKiA+c3LwJtEo36+kq4c9l559XyONVKIBb
         QnZVuueUpfZZJXhXr3SLM5srbSFA47JclC/kJU44CGI2Nm4hfwOlTKY9mOd+hdvJ/I9G
         ZcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109696; x=1733714496;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=;
        b=jnDaSYT/LOWaN9IHWLUQ7UGf8UzvVw3PcIE2LBeM22T3OiyK0EdRTOhE39Zy+AVUDN
         81IsIkY66sT7+/kvYsI20pzhsqV2yHYGHOPbLW4Xemua/+JdabVuBzKoqvy1L7Y5jByl
         RKhNgpaYkeMIgyTQuPxvg+C9sABtjUWhmD39FPMXa2Mxf59t7Z3C7crEOaUS5iBiQDyO
         wVp+iidTHnig19/59eG4K67IltoxSxy9AARCD5h818YZixWqv+MAdFo1ddN0Gqtm9DV7
         n4biWpcGbWgOv2/hs5SWCztv1Vzr45rTfMOxFAzu3B9hzcG3OLWzXVi31Ed6gJBh/Nd4
         Oxdg==
X-Forwarded-Encrypted: i=1; AJvYcCVzSsrZpKRcy/Tta+FoTDhNq5/ApG1o6Hy5iRQldLlO4xl0NmsrLb+lKEXUBfKMKgYfCb4rJXFTIRIeUlvujQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxi3+QOJRdGZMsTnD377SN6G4QXQ2x+mvLRkumdf0Rm/Sm9V0H
	2tG72etEtaQnFTaaKHk9BLDQwF8h0wv5IavvQV9RkJpFc8rPKJPeeFavD0l/w0s=
X-Gm-Gg: ASbGncvu8uJS9MgNH6TzuQ/ZLtCMkNsMtT8d9xHFaCEvbjpf03naJBGdyVIU8CXVhvC
	euLRfgnboEWpUJx9znHdz59/Yf4ceYfYBnlB+feJmp/peJ0ade7haRJnWT65jObeXzpPX1AtYPO
	RbfWjy/hEYUFESATj3laWDXoZyE15XOkmEKkJghRQcNcradZjFwvDjpmJFQiCY007kJYH9hPweo
	e+gqxeSnMCcySlFncAJLBXG7wUWZhm15VBLdzViGddytb0GoMOjF/a+eQzGKv5IAq6qNrl2ZTnf
	luSayANg02lHng==
X-Google-Smtp-Source: AGHT+IEJN88pnwqqXHYSIyic7eyBMjw0obUFHPnwV3eN7HNKvCq55lxxoodclMDswm8TKyzGp9aVVQ==
X-Received: by 2002:a17:902:edd0:b0:215:435d:b41a with SMTP id d9443c01a7336-215435db4a5mr63665425ad.1.1733109696542;
        Sun, 01 Dec 2024 19:21:36 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:21:36 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Mon,  2 Dec 2024 11:20:35 +0800
Message-Id: <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192137_155863_F225F461 
X-CRM114-Status: UNSURE (   9.60  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index e324e3fd347e..cebb134331fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1


