Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF69C47079
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bEDuGxV/dPJIqZg1w0wl3qVgLyOuLBrt1YTH4lJcK4=; b=PgXe992sADJVAJuN7MgAc1gisK
	XyqAXPekT63udCXH2jUGz/G6/NgnzRI1qbPa5wpP2MtH/9Ff8NHWMaaajhqxlZ+i2Jq9kE6pPxEM1
	2VtoXKD8oaof+KTZMN3O0sSbSBIRCiymGrA7u8mWurELXYq07hwLj4t+jhQonOu3S44HJe2IzqBCv
	paBRLAcnndr1vjOh/Q8Co0j02BjsMzvGGp8J5yXaG0XKtIomUVGvAIv9xHuqWV9y0WNoPmGAgHnC/
	71l3gZ2nIZTJr1+62OK1HUlFIvCMc7ZfMlSahU9dAscSulHxkccxS6j55xhpgAQFLuxAaSpg3yj/T
	Wzyzk9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0S-008zm2-0M;
	Tue, 02 Jan 2024 21:09:00 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0K-008zfv-2z
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 21:08:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7b7fd9e17d8so494833939f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 13:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229732; x=1704834532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bEDuGxV/dPJIqZg1w0wl3qVgLyOuLBrt1YTH4lJcK4=;
        b=OOrZqqnxYnOW77UkfUv1GGBQVqZkze4TDPQY8gW78piKu9DniG0C6s1Z6qDQaZbUVn
         y33OZiXs/3WxB55ZcppnyZJ1hVHuMNl2NRd6RwvMEMWx1wJO6NFlThCXAu+C+fCu5WmD
         qVL3/bbqNmqK1o/J8KWAHUsjLTM+svXp9hld0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229732; x=1704834532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bEDuGxV/dPJIqZg1w0wl3qVgLyOuLBrt1YTH4lJcK4=;
        b=WJMmSGt08tBhEeWJQQCQjYh7WEn9nBso8Bo9dTDaraRCXeXScWic3rdvB8j51tDCp3
         Z+PGHBfhI3NHLb2aAJir++wsYkaOGOEVsd5srDu6SaB8Y4tE9A52v+EZeNOpkzzjfWa7
         RBh8SZ+5anNZoLNVMPknatEij419GvqU3ZPZknE0wM57mU41dmIWaia+McjUFnkNEhub
         z8zlHh0cZC2dj+areskqE4JUuz6PS5WhDd/eyUHRsUa3KrAVOP54z3VxOG8rzvxcSR8v
         YzO5sdc9qEd1nXpkxSYaOBcvf1EhGKyUT5/ZMFPO9kvwA5pdQsRY7dxvsbrszhTYwqs3
         ZPMQ==
X-Gm-Message-State: AOJu0YzEXn/O7rJ64mVlrFzAbRnuev3IAyrRCf3BSCkk6B4p1iLyfpfg
	8wH8/fugWXvXodbz0dBEQz3PA+1eoQ5K
X-Google-Smtp-Source: AGHT+IEepz+cz572l3C4gGDpkRMfzMAxMxz3DhHQT6lcFpZI37i5Utc7APQrtUv4nIj51c+vjo/kRw==
X-Received: by 2002:a05:6602:147:b0:7bb:cd42:ed8e with SMTP id v7-20020a056602014700b007bbcd42ed8emr301320iot.28.1704229732361;
        Tue, 02 Jan 2024 13:08:52 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:52 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 10/24] arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:34 -0700
Message-ID: <20240102140734.v4.10.Iba4a8b7e908989e57f7838a80013a4062be5e614@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_130853_103658_78D30DA7 
X-CRM114-Status: GOOD (  13.02  )
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

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v3)

Changes in v3:
-Update commit message to provide details of the motivation behind the
change

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 5506de83f61d4..08261164ab18d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -924,6 +924,7 @@ cros_ec: cros-ec@0 {
 		interrupts-extended = <&pio 151 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ec_ap_int_odl>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


