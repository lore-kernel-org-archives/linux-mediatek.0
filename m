Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F03DCD13DA
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2026 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=; b=mB4kCMnJPErBhQLBkAVwJnMHxd
	N3WgEeYLMpVV7nwZWDD8RHwaU2K59wUAZSjIDzFC4b1gT9A8ye6DD1EY3X7oq8P5oKxYVvTnj17EK
	AHcnQEjg8lJfCHQaR/7JUhQUGYB4qNBGTZTSrXXUQ4lTO8WyIO5NZ9slWQ20CHmeKZpNvEoNNft41
	OrNXF5rPaolzS/XOlVdtCuXENvS1fQVfHqCGCb8f64GoopSTHqm0EGPon/5fxqPvYGL2R5oxusGeh
	x74NEeu1uapfK5fHTvJI4AJB/gfHvxGzgWV8Ny2qMGFYGvOy+cFlFuyTqWu7N/09wnMbnoVGEwAxl
	YTy8qQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ56q-00000008YXL-1Nn3;
	Sat, 02 May 2026 07:49:56 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ56n-00000008YW9-0hIc
	for linux-mediatek@lists.infradead.org;
	Sat, 02 May 2026 07:49:54 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2ee990e8597so3334224eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 02 May 2026 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1777708192; x=1778312992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=z6vxzO4HgNC/Vkww7IS+I719SC98LIxX2D+5kQ1T2wLEH60+J8WOIgkmvRTYWT98di
         FU8feqb3in26NokVyLl606BYV26Z4KRnPCEvUBvFybM9PRxdmQP9PP7/poh+uJD52G7q
         dan0eXwIES+oBQkts3MLV9KG8eXtHjwYlgqpUOLPT2zTPZF2E251E+nhnAABdDGtZe1I
         Zfnso+R4OCZAaTPb+4S7yuTXj/qjueP3XmcnYY38ht4dazfE84tRCBIbIgk9i0MxSAUR
         gXXp85zcIS/UqbZZXOm+OH8ghPWuQYIqhnSLP9M93prqSzzfK1DZO/17N8cuwf3V71pv
         kE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708192; x=1778312992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=jYOLZznVRbvNIylwHyh8MUEXOWR2f0rdbPoFjv0cK/ywyDpM4B9NhedFuAlY7yTYWg
         JPCxBDwr9c4WpxdlJA+/5EdCLN1C7kG1Ey2eOUqfKz54w5zUq66dITOEie/R/4fe9IIG
         /qSpfAgPca79kMaY/HO9/hFv8pMIlirKHXTIcq0LNkti3Ciq6yhQieX24YdjstoX4LGv
         lDEOSbKhcLEEQtNws8s1RfHYYaLvrutfN1uq2i6hUhRMAzMPRrMP1s3C2yLD1W3zs9Dj
         iwlRAUzaKLb8oAnWUpkt9LRFSE3Jszev8e71lyBfQqnHHMJL1KDfMk01fSp0D9C66cGx
         zgsg==
X-Forwarded-Encrypted: i=1; AFNElJ+yXyB1THuZRsg+bDOmxo2WGQAEo0H/6cXJ0tpN/k/hvfGYo6zdF59M8YpCcOgOtP3JKWDfzYV91lEZ4U31DQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBXJKVdjxfzbr4dI/jXCKcGRawdSQO1yX+1GQrYAjLbNA0d9cS
	Ew4v+7r/nk0VTA3NkFFQwjP/tCPAVIse+0OfW2KedXbUPH+xGaydznq/MCX8CGdWEQQ=
X-Gm-Gg: AeBDiesqJzNj3jAVpYacuwH7QpamJ+KBEYsbf9sC8ygFO9K4axNKxAnk9N1xFQBLNFo
	T60nME7iNSNc6KnjbAkiI0b5Cbs088V/PnhlWYiGBvUh+lnyJgIrijjL8xnG4WJCa7rMtgIJ/Sh
	0oP2VqpvV8hJDgRKjknA0/8k/Sg4T/WmUff14lNvVAHt5APlrLdYJK3hMoNS+D2mKbdDtWydxJs
	3jpYUnYbHnVJjG47m/3Qy4ZZCG/7B3QZOFFJ6LYJu4uRT2jrJsLg4u+lYwVDLMM+Hfwe5NGNkGT
	A3IDNLCDgEdqX6OxozxR0LvFm+9sFHNbYvmKPWgVcKobIdqLdEuVF1k9qpXgZzh6S/mgaR0BjxL
	YxAW19eWqDeNKDkV1vG7ZDN9JBchmARB9JRhGJ7bhe6O5tgvYlPm6BFTFNmQv820re0U2rKwuog
	nvAJqZmJF/Qd9MqdqW7J50RfXaWMEOyqVzHuh3ZQbAyatqY4URinyAYP0StpkPnCLVkw==
X-Received: by 2002:a05:7301:6706:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-2efbb29039bmr1022967eec.28.1777708191723;
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ee3bb63c5fsm7422380eec.25.2026.05.02.00.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
Date: Sat,  2 May 2026 00:49:12 -0700
Message-ID: <20260502074912.12193-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_004953_455325_88D4DC8E 
X-CRM114-Status: UNSURE (   8.97  )
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

The interrupt number was taken from a downstream DTS of the similar MT7987
[1] and verified on my OpenWrt One.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
Link: [1] https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..3c6fbb6c5333 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,12 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0


