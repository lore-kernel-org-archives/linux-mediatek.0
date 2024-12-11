Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0538E77182
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=; b=VRew8G4KRVJaJVedmb7bK29Kdb
	pgmVSttPWRT072771W8MlOIVN28ls0Jucmd1wSd8oTxSQiLCCQvdIWBJQbKrgVNH0fY2cbNRHuqgR
	/lI1NqGoNO1f3p8omGz4UgaqfWjYEN3SLlcZS6DAjQ0EpXVtYNzJtX0Gt8JIvIMV59aN4gVF8mMfa
	TiwXFaKj2K3U6I0dxL7MIik4Xy1iopAQR1kgzUdAbz7zTsrbr6D5B/JpCQf4p7aIruDb9wFi3B5QU
	z3YyedBmZNRq0JrCHDImHM9/L4vu4svpXjt1WPgBSZHk//FMo28OfXtlj1GmdDu0rkvofpGD3OJ3o
	O242OVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFIK-0000000Dq2Q-36rU;
	Wed, 11 Dec 2024 05:29:56 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDM-0000000Dp7N-2CCX
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so1321970a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894687; x=1734499487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=;
        b=ewwhL/Rx9lAgMht63bFWTs8cwhfuZcK2LTI5GtNb5nAFx1SCpnyTtuXJS4K0Nygp7V
         yK9FmWFOVRNdI0X7d0lQpva801j5WSiOVLUnkmTbmKa+hrvS0OUNXHikWpYBRxBWqZMj
         9BlN2PRSMZN0QFz+2YJLLahb3OD/iQ30tM62M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894687; x=1734499487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+37Ej0Mm9yXagdLEw7xP+d3kLglfqR3xptBmnje5WIo=;
        b=IcpKC1k5CzwCaWL5SJ9Fk+X7T1mFuD3gdNIs47/eLGb5GQ25zSt949v60ogJnlAJTX
         IB+FJI338FQ7WfSkQa44l8sfDsggYyBqSFkPYsZna/UH31B8gsvtDqoJ9o5l0xzByf/p
         HEM5XvL6Nf6PH8IyiMVYP0X1sImy5MMORuB9t6G7dYi2TZIDlv6r2CQR+t/1ImJOa7BE
         AfLJlt1XNAA5ldHXGfqJjdGQpDhniOm2ORwF+u+laZIassQ9yY/oA13gaf1S4OLefDaD
         wpBvk+Nn/95Qbc2HIDLhqfPN5h8SVmdYWR1yjkJJ8Yf8YP80ust07P25neFiH5CP5Zso
         IQjw==
X-Forwarded-Encrypted: i=1; AJvYcCV71JVfRcvxRyKciJhuFaJ8vWfirfv5ET6a0yyPwpPRkAqmYfrynpEwOxyAN+FyQy9EY34sKrIiUmrCSfDNMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmYVUmT2bAAcnomALMJMSyDHWhNp7FMDVrhuqxuO8kn0bi6ITI
	w98QlhlK/A727+8Zi8ZAvS4ov54xhSn3AAVC8oQ5wtWsKJ7Udr5oV0QNLTPyPQ==
X-Gm-Gg: ASbGncvIdP3OR/m85t09w3HdyJhA3U3csneFiuX4BW5EEfKRkY/0IsAn8Lj1/5NIBUr
	VxDyIlu63dJYq5VlHcJp/E90a8Us/rpCQsYc0Wr5Q2S/UdHt0Ihizie1cg9NlFJw5hhIamu9yri
	kEr9fzxN7VfaU182+cIYC3pZgdX0t/x2TX0FUhlVvTnnd5hP/8sJedQTGlINXzbYiNhC8zjv+a+
	appYQSzBIHzFM3sUlG2e4mo+cVG5hacqk6PRbqOhc/9lfeqNQHSRwj/QiIjT5FIp5n72zBo
X-Google-Smtp-Source: AGHT+IEnDOL+LPNNcjtycQIWGHlAJTgKm/mNrg0sjuKMLfoIK4R2jRd0ukkjYLye/s1Gfn5Kr4iv/A==
X-Received: by 2002:a05:6a20:3d96:b0:1e1:b062:f403 with SMTP id adf61e73a8af0-1e1c1337146mr3393676637.34.1733894687682;
        Tue, 10 Dec 2024 21:24:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:23 +0800
Message-ID: <20241211052427.4178367-6-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212448_560557_389EED1B 
X-CRM114-Status: GOOD (  11.24  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2c7b2223ee76..5056e07399e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1285,7 +1285,6 @@ mt6315@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1303,7 +1302,6 @@ mt6315@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
-- 
2.47.0.338.g60cca15819-goog


