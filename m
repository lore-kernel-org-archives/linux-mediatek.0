Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDAFD2F7E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YD/BrAcHdAIIMXA1jUzknbvHmeKtjxe69u37Q8I7CtU=; b=Npv1NX2HyynuH3VrrbY/tgfUK7
	CPPQrfwRbNUjZqtFBTZimUS3szr2IWCVaFUXGuetsins1GOg+xncdUsWt93N+38uUVKKkxidJwh9j
	HeVJU3RjLSXX3+FrCtY/jb0PvkL3VWCZZdZC5BcvnsSAMiCb1Qh8lLJJpAUUqchK1hwIRl9RCPtpA
	xAiwVTUI1snWg/z1wpM6irHxa66/8qxfjxpZO2HYXpb6V55ADAy49iu1FeUI07MUuaZaqaeBRW2FD
	fyJYuNPQibCC1EDUmzbgfIC4oJNjwm22Txw0sCrcCBgxLgZdYgJgChMvUCpuwOn55GRccEpCFbqYh
	XpZ3s5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iSE-0000000HZWd-3Mt1;
	Fri, 18 Oct 2024 08:35:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iDP-0000000HU0E-0goF
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 08:20:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso1315906b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729239606; x=1729844406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YD/BrAcHdAIIMXA1jUzknbvHmeKtjxe69u37Q8I7CtU=;
        b=H5/rqhlDUVztqTwHdxFzizgw760Nj1l6jFYDaUVWcb2f2EXf7WmxsnLqvM+XtbDB1G
         PqR+Lut3BA2ypbCs9J+JbD0XK8Rvci3NOt0wpTRTzKnkA+Q1yFGgFBIs4UKKuOlAw18q
         SvDx/HFH7rQRpm2jeNg2un9jQaqUG1nsuMPw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239606; x=1729844406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD/BrAcHdAIIMXA1jUzknbvHmeKtjxe69u37Q8I7CtU=;
        b=sukyYny7GAPq5CPjuZzerpVM1SgmIRJaNLWAPmrykvC7ZmNq86pezLOAuEKIq2r1oq
         vjNXja0z4Vm8Y59PkjfE3fhPF2cEQ8vY3q9wzoGCDjCaEiQ+DVKDJG9F6K6pQGaz+yAq
         LAcLiTM2HoTn4FzuwUpZRqal8/NwB1phYcKI2vknik1He1KlVDzU4Xq68dxvdNGuWpRN
         0zTRu4MZ0l/buZotQY1ErSDR9rutGPlA++lJB1Nj1mgpPO2dfqMukh5mvRfUU4HKFRQ3
         pbh00YvLjUnHV3oQ+t5x+iYUH/MEI5PCO1mzuwrtvNA7C+6RY7kT0SIRgUi+oUkWZRP9
         HlGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOYFdYGM90V8v2orONWWRKHz3smI4ht9I6dlOXLiBc2nENI2WMo5rHTFZI2Cu2lr5P88oZmzq/Vc8NJnyLDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9b4mhWwj87vBpyQUzMeJFq2VrZZGdK2e2+kHLFZZ21/3sYk7l
	WO47n1Zy1SHpyQsvwgnwedeGvLd3z6r/wqs+NIzrEsrsPDOKChOtUdglqD/eQw==
X-Google-Smtp-Source: AGHT+IFwfYN5qZ6/UTJrq9b9zMKrlE4sxFnfRkL/+LlT9NlUwm0QDBK5n84qYUmrvBAFwk3vL771Fw==
X-Received: by 2002:a05:6a20:e605:b0:1d8:ae07:c06 with SMTP id adf61e73a8af0-1d92c583d4dmr2151480637.48.1729239606136;
        Fri, 18 Oct 2024 01:20:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5e77:354e:2385:7baa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3459348sm900418b3a.155.2024.10.18.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:20:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
Date: Fri, 18 Oct 2024 16:20:00 +0800
Message-ID: <20241018082001.1296963-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_012007_271049_6A495979 
X-CRM114-Status: GOOD (  14.10  )
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

The Hana device has a second source option trackpad, but it is missing
its regulator supply. It only works because the regulator is marked as
always-on.

Add the regulator supply, but leave out the post-power-on delay. Instead,
document the post-power-on delay along with the reason for not adding
it in a comment.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Drop the commented post-power-on-delay-ms property
- Document the delay in a comment
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 8d1cbc92bce3..ae0379fd42a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -49,6 +49,14 @@ trackpad2: trackpad@2c {
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
+		/*
+		 * The trackpad needs a post-power-on delay of 100ms,
+		 * but at time of writing, the power supply for it on
+		 * this board is always on. The delay is therefore not
+		 * added to avoid impacting the readiness of the
+		 * trackpad.
+		 */
+		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 	};
 };
-- 
2.47.0.rc1.288.g06298d1525-goog


