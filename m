Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F86CA0EF5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=; b=FXsJ4my7T06+PXmDzB6+oujUAZ
	MLGnGFlMsUikBno24fhDbV0H7A3rawzUg0HIQ6uh15Sk2Sm4BBvN0yarplIyjWIijIHPsIbd5TLxx
	+65TLmUDca0pxA5i4M2Q7atZoaqT9/gkJJoRZ0DLsaSXC7rQEbeIqisx852Sbnlw0IkOsM/qcRqBG
	DhbpWrSbt/RfzlpeBcT4EJhifH9FDy6HvDgSwajjyTHlzFuMQEKLEFMjQf1T+zuDJuz0PzXlnxcyL
	aUFBa3a16tPWv/LMKwSlpqk2n4wDvWzZaiqerQvLhyS5TuRFwoEiIoeKNHRWVFARB1ziMhBsM2ZjG
	/LQfv66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxK1-00000005Qux-2RyC;
	Fri, 30 Aug 2024 08:49:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGx-00000005Pro-0NS8
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 08:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=; b=UVDuGGLjWJO4mfUe5uPkLR5S9K
	dbMqb/GrBY6JMSrrqufG4d1JDqqRvWoPrQ2cY7VApUh3ICifj+vv66H61BvfaYgVgzG34HlJOzFBW
	gAcfn8gOWbHl8Xf/8fqmKdsE14SB0tF7AMCWT4wJa7xzFxsU8HFFcRoJsiBTcmw60K/qUVK5IVL1f
	zM0oZFZggrNrl2TQ+vDPJdpL5yXoBDC1cvpZBxksi1liIItRXNJZAF8dfketJ/q9/EzDFuVd5KMkT
	o+mU7vN64we/RouvCbSFI7nRgcf0kVJWZS2P87qGjYDWz1QAD+yJf87Jnrb/5nf+hiUzNLFXBcXPw
	SGXRPRsA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGf-0000000BcCW-3DtP
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 08:46:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-714262f1bb4so1275435b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725007563; x=1725612363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=;
        b=Ard20w8f8p+WtzHMyWfsK/1lG4PPz3vUQZEFjvo1XlR+1Yl2bi9b4AdvdKFZ5lXTeH
         V4wxh17vaRrbMuPg/sWLiwWwO9KXonHr8Jqy6XVeXqHUeF7Ff8YdEDurXfXKKcOk3NPH
         sRfHdRo2rC+RbxlbwSdIPnZwzNTXwQSF2uV1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007563; x=1725612363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=;
        b=a5wGnattBCpCaS4BUVYacPlXJeEZhbAJbMoJ4qI1/Sf7+0JKsFbbXPhe8VQO/XvWCC
         SRz2xkcwiaeLOUetuqow5gDQDXFym68y6xznCWCDQ1QQyQcaemerQUOC+na5qaYAffmx
         AgiHHD47hZLz87hF5KSHIrLOPUBaLrXTvvXp5t7PryH6eQNzyBQKcZXVEnDkwqtQw92O
         +cbjPdwRw3RYLSGdHl1/c5qcsooA9blTPbK2GLxNLLv36K4oorHxfsLHIqxBifQVowla
         TS0OtbTrT0NqTEHk7g8kvu+wwNMjLXBXZSDbuf+eQeeqZl9hs+459LjXKaGNtE8WZcWy
         X/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnLHuv5CEyYFHhmlCMuBQjPpF2pZmEJbg9Ec3Gm3vu8kp1sgZzfj4kVmm4qq3QYcckF+JwjqFuRQ/8o8FpYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV+uL/GXxpsQIfrkgPmN7k0XarBwuRXrMwHUvN67xnAfgRADB9
	+UeRLSF65WdaPleUVdPKP04FOi7fp4EoGsgpPY3xeEhD7qz3he8d78Cc12zLbg==
X-Google-Smtp-Source: AGHT+IEc629GXImBuNOILo97YU6aaZaMx2RzjoxMwdEEvSYsu0H0uErl6hhdNvBxFRkjzwhSGg98Rw==
X-Received: by 2002:a05:6a20:d486:b0:1cc:dd3a:ed43 with SMTP id adf61e73a8af0-1cce100b087mr4623425637.12.1725007562833;
        Fri, 30 Aug 2024 01:46:02 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d85b0fdf44sm3192373a91.6.2024.08.30.01.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:46:02 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v4 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Fri, 30 Aug 2024 08:45:43 +0000
Message-ID: <20240830084544.2898512-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_094606_209428_2B1909EC 
X-CRM114-Status: UNSURE (   8.67  )
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

Add power domain phandle to the DPI controller in mediatek
mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index caec83f5eece..85b77ec033c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1843,6 +1843,7 @@ dpi: dpi@1400a000 {
 			assigned-clocks = <&topckgen CLK_TOP_DPI>;
 			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
 			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 			status = "disabled";
 
 			port {
-- 
2.46.0.469.g59c65b2a67-goog


