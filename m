Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA1D1CA15
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 03:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=; b=5AM9YLvdfQehPRKniQ1f9763KT
	uxu+ts3rLOO7p6nT+7DM1HeWtQ/Kkzy69ipMHxSOoJ2uKjC9zfEH8x28K7801adJU0h3NywliBIb9
	YSqm5p2CSPyzfy1DaAJo5nM/00OVLNlOj8LQ+sJk0oR8EQ8HG2Z0uunul0ah3x6JCYKc6B/m8S28+
	KAWMRfbzM4bEejlglaBiaF3OY3CmaKFkrdJkOmnkPR+otipDxM1htWZQ0ZCnV5MSb1UF/r+n0d9Lf
	3xaUXfKytTaU5HTrPUGu1m2MsvMG8eRuBJoLhMD13icSo3nkZJ3XyY2CnCvhwQZycWNVIMAw6nm5k
	ZtY3lxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8A2K-0000000Fk3L-3YQ9;
	Tue, 05 Nov 2024 03:15:20 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vd-0000000Fir5-3KNZ
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3224145a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 19:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776105; x=1731380905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=;
        b=G2eMT/quRjyu7vWZMfkxWY8iKXYng3WKMkfGmQxXhjWCBaYzdlK3pYkXEeEdq0sRQS
         hxbCmnKqfN6yBRh2oNEwKt/K44PRRmodV1ZxTxehkx5kB8vpB8wKYyLHfs+qIpwXARMU
         p7TY8H4PmDOHQv9F8keQYWprkJI+4Wg0Xa7gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776105; x=1731380905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVNKfz2t6zEgtE6p7hSHFZ+86J0/BrsT2sCmnVgjQCw=;
        b=aOBVx3HJ3fVFhx15Vkuk0CCERqOcSEzZtvLqWpLUD6RZVjAzKWHGvDmGsz74e48J9k
         S99BttNCXU0lXBY1zT4+OXyAHyyttlnCOdQlYEs1yuG8JVncAabWtcjd85jj7TDXG1tL
         5fB5Yp1k9pvRmb3fBoDpBaAMvm9xbZz7bicOICUsDeD0DMIXM8warEQOghxgToYQ4P1p
         9zgL+GT9EAp98xHa6uDLMG2vc5RPxhcu/0NsPSYQn1UamJ1qFTFzklVSNpxCmmDj2bmm
         zCQTHB5MK93o+aUHmXKcwMwbZqNUMJd8iEhNFK9a7ppcbjX5+v5KEk1SGCTRWZh+BseN
         oxnw==
X-Forwarded-Encrypted: i=1; AJvYcCVhYJftD1i0U7jhAHqg69rXOvUeK/07AWWXpapEe4V/NeDvclo6x1CF6CJU7gnBPAkcRWPWy6Pc0KnGWsOVrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIRJDeHmBnO236DVPSjYnvfMtcTRoZ5hpkyeUuzC+7DCmpjPBs
	WqhVgCzhRd/g5y/z4AQnItgUyBEgJvkD/VlvjmoGaa/VZ+iGNEpaixRFZpqTrw==
X-Google-Smtp-Source: AGHT+IHIrNO0VoT73VkYM3UKR4zs5Ym7OnU1LxK7zSs0kR7UH9l8Gsq3xPWPJiw3R+H/jGdnosVuAQ==
X-Received: by 2002:a17:90b:3901:b0:2e2:af52:a7b7 with SMTP id 98e67ed59e1d1-2e94c52f395mr19754083a91.34.1730776104667;
        Mon, 04 Nov 2024 19:08:24 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:24 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Nov 2024 03:08:13 +0000
Subject: [PATCH RESEND v2 3/4] arm64: dts: mediatek: mt8183: kenzo: Support
 second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-post-reset-v2-3-c1dc94b65017@chromium.org>
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190825_846250_AD049D39 
X-CRM114-Status: UNSURE (   8.82  )
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
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5..813e6bf65b62ee6742e52133f9adf7e83a6078c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,3 +12,15 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};

-- 
2.47.0.199.ga7371fff76-goog


