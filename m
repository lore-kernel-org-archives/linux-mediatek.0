Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF98CC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 07:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKnc2RZBbgrdaniJjhXC1yNhidddngTlWoTj4fSfTDs=; b=onqCFAeHfAodcWFF+OErSzTtkl
	b2QOlriAAX3MdCNHZJNYX6lg4qxkeGKgr9RrPSMrOKo2XhD9z+ptaCxLWYr50j1Z3sDFu24kXc44I
	wqOHFvAykjZHJPUjBNlN7FgtSnZZqUaM27S+Bd3ZeTBzCGkf70c9laMjyOQ5tZqEE0rVw9AeDtjPG
	0U/VtyqGxd/q76ASE7vLrZJBV7WGqgPtL7Oel6ngX/aQPNFEhQta3gDqNbKwGOjFjl5L180kmPOmW
	gUN3Ye4sgczS7y4/jpGq9wsrH0Gy4TToTb9eDEXXFxlCGnzGNjudhcLP1a8Q1OsSjVlhrt94yyM5H
	YupMQ6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfO-00A7Mj-2j;
	Thu, 30 Nov 2023 07:40:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfE-00A7Hk-02
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Nov 2023 07:40:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cfbce92362so14401565ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701330046; x=1701934846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKnc2RZBbgrdaniJjhXC1yNhidddngTlWoTj4fSfTDs=;
        b=Kf3oe169cPEy+GEFWIzY6EyEbOd8+sisgiYXoBdxF/1y8k+mC/NlA8Ro4cWoMzniDJ
         SPYBBWvmyTK03NHo8Rix0kyTcIeJFEHvs+CiKM+7lXH6HJmqlraKJ1+rRbSGF9V5UIFR
         wWYx383Tu5OPtXaZ7eYPtyctUPR29bUpzl6IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701330046; x=1701934846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKnc2RZBbgrdaniJjhXC1yNhidddngTlWoTj4fSfTDs=;
        b=FQ5pz9T5PH3FjqZdbg/XXvTzYxcIFxfUyr+JNp1UBfLSeBMKEOAWOn0MsjQIhsrTIz
         MyvNRcKwZmImWhq7SSZtOLhJhEph7WcdmRNctmO9omzoAPU3xuw5fkshVTIM5DxOFuug
         MmUYpNusqkRNK64ibAfzT1x4Q4JtiVuM4J9aHz6/0lpaJFgff2gOir2LbSfXxp+7f4if
         ixsagTrKl++KT0fblt8yTLnjFyiKOq2kv3UPSNPw8/HoqqMOjknJx3O6to7bYVGYAuyg
         lLFJPEhkEBirW0MoeYQVpPuap7ZEPgU+P1GPyCUcJszDuDE9YzfJInymEall41xCUXG8
         4JQg==
X-Gm-Message-State: AOJu0YyYPRNGHFJU6wh8NC4Fq83uwR60IepQDMDN/mcDYOKTlHolOMTP
	nlTmEva9/MyoN6s4poBGCUZfoA==
X-Google-Smtp-Source: AGHT+IGAr9LwKDNK6mCFGvRbs1763uve1b/upQrl2GE7plYDdI0iQfPRY6A2F/64FTmn8nJQgl95Tw==
X-Received: by 2002:a17:902:ac86:b0:1cf:c3fb:a75f with SMTP id h6-20020a170902ac8600b001cfc3fba75fmr19045596plr.17.1701330045865;
        Wed, 29 Nov 2023 23:40:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7c8f:dafd:65c3:2bcf])
        by smtp.gmail.com with ESMTPSA id p35-20020a634f63000000b005bd3f34b10dsm612870pgl.24.2023.11.29.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:40:45 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] arm64: dts: mt8183: kukui-jacuzzi: Drop bogus anx7625 panel_flag property
Date: Thu, 30 Nov 2023 15:40:29 +0800
Message-ID: <20231130074032.913511-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231130074032.913511-1-wenst@chromium.org>
References: <20231130074032.913511-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_234048_047145_33A52C0B 
X-CRM114-Status: GOOD (  12.31  )
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

The panel_flag property was used in ChromeOS's downstream kernel. It was
used to signal whether the downstream device was a fixed panel or
a connector for an external display.

This property was dropped in favor of standard OF graph descrptions of
downstream display panels and bridges.

Drop the property from the device tree file.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index bf97b60ae4d1..09e658bc30e6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -147,7 +147,6 @@ anx_bridge: anx7625@58 {
 		reg = <0x58>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&anx7625_pins>;
-		panel_flags = <1>;
 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
 		vdd10-supply = <&pp1200_mipibrdg>;
-- 
2.43.0.rc2.451.g8631bc7472-goog


