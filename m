Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F85C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BloqKd6NAIvqrSiSmUgDRaqMds0uLArY/YBt5zObz4I=; b=uPKJtfgbtfoURom4yo7nyPBaz7
	I8WFmfExiVx/JcM1eFpItviufeYi5fn6df8C8vOS+7XMMGswYMCPKsoycbcA0DcLQ6U9ZwBQbYIce
	0OzNaHK8XXd07LNiwS6clkkJkKVYlkIoqHMJ6mb2frZW60WRmcZs56EubuONDQb95cfzKQs6EgqJp
	xKj0xEkWFL3boDMlbbg5UGocttoKGB6G2+B/d3RI9TXJUsMvZpvpgF73QAhAzNgJ5Il/hDNpSJXTC
	SNwbAZ5BO0x6Xj34NIbN0t4amLrbLEv3qf4aEuDZNIaiDkHPM/exkEgDJwJ0vXtLt4uWyxLs1lT1x
	hJFVpgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeuf-009JWW-Bf; Tue, 04 Oct 2022 10:12:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeuc-009JUm-PR
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 10:12:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id c11so20565539wrp.11
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Oct 2022 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BloqKd6NAIvqrSiSmUgDRaqMds0uLArY/YBt5zObz4I=;
        b=4cjvYR+ZpIexqEStMAw9XshGpcQ39DsAXy1EfPd/uHVgYLZHkHyxw9/SjDcvjCGU1v
         E3gg7c1opMA7J45OYgS4s+ViyljWaU7U6oLfQS5f264o30QIW7PLnxO+nM8nsy5WIEE5
         ZyqbZ6ohHYladwfBC8QHiKa5rwOPvkPQ9BkQ9jYNWUe3L1Juu84E/c/CaE2p8gZWZdt+
         VJmX8GscKVzG9RNStEJLObuTmTYikvop3uyTdb8jvIyXjlhTxCkVzahrWY0lMyhVru7u
         Q/unmEfK1S2DrioycCo9NTH8Is2Hru3oIQMsqXoWie3sdV2siFOCRo6O21c6W6LSOpuX
         e4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BloqKd6NAIvqrSiSmUgDRaqMds0uLArY/YBt5zObz4I=;
        b=EQw3F/k7OSs9Md4VxZc/xF7O/uJZKhtj/7PzQ9vEanF+dXzp4Jq+8V6HPMMxfUBhRj
         8T2HURN2KUwb/wXMQm6cjIWXiA6lZyDIE4T/pZBmu+hIQADaqdJJEgWXcaXfNPC98rVS
         4J8XYJGeHZcE3WC5EsFxt+WWSYPsMVNbHwNw2VZNsl2oBODG5yzxz5x3ZBuP6CPRKIHg
         obcB5+7VNeYdHmuojfl50zvLCkanawQNoNGa11TMbRsr+h2v+xA4i9DxRLOj6I59oti2
         pk2c9+vTz3nT/dODU8XjacmWkNkHn4JSNBAC3QMCqkmbGsu3s78MDI9wOq4nxuHVQKXY
         77pQ==
X-Gm-Message-State: ACrzQf1WyH2p6IIMD2Gm9miZuZHdH7GMxXHTMXnonfIADv/10laTFKV4
	2KZKZ2lZ4ceDDjOXipfJLVKcBQ==
X-Google-Smtp-Source: AMsMyM4z0GVOpeWluvLFxqq0rLN9WkcvWHxSt6dxe4VukX794D7JBWk+aaRPxtXyhslKxe3oLPtscQ==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id u9-20020a5d6da9000000b0022e53bd31c1mr1110802wrs.358.1664878346581;
        Tue, 04 Oct 2022 03:12:26 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm15252214wrm.54.2022.10.04.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:12:26 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: mediatek: mt8183: disable thermal zones without trips.
Date: Tue,  4 Oct 2022 12:11:30 +0200
Message-Id: <20221004101130.17256-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_031230_834290_7180A746 
X-CRM114-Status: UNSURE (   9.03  )
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

Thermal zones without trip point are not registered by thermal core.

tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
only.

Disable the zones above and keep only cpu_thermal enabled.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..53f7a0fbaa88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1191,6 +1191,7 @@ tzts1: tzts1 {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 1>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
@@ -1200,6 +1201,7 @@ tzts2: tzts2 {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 2>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
@@ -1209,6 +1211,7 @@ tzts3: tzts3 {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 3>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
@@ -1218,6 +1221,7 @@ tzts4: tzts4 {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 4>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
@@ -1227,6 +1231,7 @@ tzts5: tzts5 {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 5>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
@@ -1236,6 +1241,7 @@ tztsABB: tztsABB {
 				polling-delay = <0>;
 				thermal-sensors = <&thermal 6>;
 				sustainable-power = <5000>;
+				status = "disabled";
 				trips {};
 				cooling-maps {};
 			};
-- 
2.37.3


