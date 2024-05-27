Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E8C25B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfCeHjS+24EDjGWUbBotOmlzBOa+3LwxFW0+n/tqVOA=; b=HGlfcEZR4zp/utTJxpumJmFxdF
	RTZgxAp4Tu9CgyWLdwF4sa0w9220AT3VhmzCuuggSG3sVdI5QmXyMQuUyZ9iseyyXkonxuTLZihMv
	TpcVz5ocmYROOsYSikn3HFKV0I6JIO+e18wjrPUQsttV/xgyVxdsBgk2ikz/MRdeZ7P/QUmu5ITTz
	yol64ocwJGve/sphmy9kqS5ZPmwCyoZIywetU6tI3P6/tHDqRkmPfB219zC+n8MY11RuL/ludsq7Z
	n7Z1RRCMpxnW7x7ncLxgrMLJpu8dKJZV4yf+7Ix/+A/wL2xqa1E7pRZqT67DapXaKDJ7Vbp42g8F6
	PjK+XeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1h-0000000ElxF-06QQ;
	Mon, 27 May 2024 12:00:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1U-0000000ElqW-437b;
	Mon, 27 May 2024 12:00:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5785eab8d5dso3275704a12.3;
        Mon, 27 May 2024 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716811215; x=1717416015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfCeHjS+24EDjGWUbBotOmlzBOa+3LwxFW0+n/tqVOA=;
        b=WYkjvTUYJ3U9ZC1KM1zL8//Uz49EyQAvV+qsvbeJ3h3MSCcjJLkgTiwvXig8zzXICD
         vAhahTA/q0yCaQWF4WIOBYi8zW42CbhcyOAvGZ7G2z1APM5DpSnabcHE2SKIRBVtl2Ne
         SO6fKExGhZ5o6Kt8xoAHI0AuZmCZvnDHn6RHFMlzTNgpxREtzqnnomzZgm1mSBR1lKqp
         haoIqWgD0VbC3vUxuQfha2ei7K/SPWMC64D2hhAyOb+QottFeZ+Wu8oO72nqGYWKqzSv
         t1sFpHeoVEpdqBh8h/Z0YgPm/snSTicvad8DimZIMnddbR9aUOfHpkiVDih8k22rFGtS
         SKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811215; x=1717416015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfCeHjS+24EDjGWUbBotOmlzBOa+3LwxFW0+n/tqVOA=;
        b=uvuZVHgUA1fKFSkynJMRDCO/gFkYA6tnxsQlvxVAh039shpRfzdUue3kzjlorS7EUb
         dGtNktW8TEPnmKkkqljxDJB/adUSXtJ3Xy5nQeP5UOvVJz/DBOSjAeveb3oveTeZDcwQ
         7kj7ZLHCJ37LqQJoz1QVNyqshzW9zshE9rgieWfoK+shdu09x76OEz5m1META4njoXtl
         Eg9ueRi06JayzU9ue5U6lvmXk/EDyiUsXbhFeJ/dtB4SOnflTPzbInJUGugDnuLZ3u0F
         kZsEKsCuGNZE46RVyZUmpTyyCHpHaj3k7WrDFdzAwEXM30V3DEddehsQGXB27Sl3mnnz
         T+8A==
X-Forwarded-Encrypted: i=1; AJvYcCXSQl74mtlHK8Qf5UtvS8IVymtmxexHialGo2oEqK5uV7I46K445BgBLPjO3FpXuStSDrD75468yDYrbMQ3GY3qdlpZymjNEs7yUuNyNN8g+3tSmx/i5I91t6R5eC1sY35VVfvFS0HC2BI2Zs9gIM5mUk3YfCHkMh0=
X-Gm-Message-State: AOJu0Yx+azfC1f3MzM3uN4M4Cb0B8QvH58JL5RDhInYTH0pUs1lRfvRV
	erHOH4nzVqudzbIbcT0GFUfxFUt2QIlKduPMrZtDpEVNiM4aaYQk
X-Google-Smtp-Source: AGHT+IEM8oeuFJhoAvvCTnvnPABOftG2A+iSPr/DlNCJRz0DldQKpyblkdDhmCmRgoPYYa02crl3pQ==
X-Received: by 2002:a17:906:f219:b0:a62:7ef:ca4a with SMTP id a640c23a62f3a-a6265134cd8mr474783666b.70.1716811215235;
        Mon, 27 May 2024 05:00:15 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm484669766b.183.2024.05.27.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:00:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openwrt-devel@lists.openwrt.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] arm64: dts: mediatek: Add OpenWrt One
Date: Mon, 27 May 2024 13:59:33 +0200
Message-Id: <20240527115933.7396-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240527115933.7396-1-zajec5@gmail.com>
References: <20240527115933.7396-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_050017_047259_BB32520F 
X-CRM114-Status: GOOD (  15.26  )
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

From: Rafał Miłecki <rafal@milecki.pl>

OpenWrt One is the first ever OpenWrt product. It's based on MT7981B
(AKA Filogic 820) and has 1 GiB or DDR4 RAM. The rest of peripherals
remains to be added later.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/Makefile             |  1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts     | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 12f67959f257..06f960002ac2 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-openwrt-one.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
new file mode 100644
index 000000000000..4f6cbb491287
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include "mt7981b.dtsi"
+
+/ {
+	compatible = "openwrt,one", "mediatek,mt7981b";
+	model = "OpenWrt One";
+
+	memory@40000000 {
+		reg = <0 0x40000000 0 0x40000000>;
+		device_type = "memory";
+	};
+};
-- 
2.35.3


