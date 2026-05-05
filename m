Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4F8CD343C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=; b=3fK1xeDTY2qJt2DTsOHoW2FAaw
	zESAMrBuGTaSpynTJiQvquPy42DSiTzmd1g4IfEvOlXGNQTkYa781FnaxHwIxU8aHvODoGwCmC5qr
	GeLki8FdXAQVGl6jit6CcWkiHxMCDbJv4qoW5rXyh4r0er6Fmhk9vd1kPtN3uCwBcyIbsctmwSOZj
	w7v7lHN3eveQCSbcSzJBasuVIvjsedJtAKyOQ6opCake7wZK/3OXFPYteYyxHpEy65CSdlD74sCXJ
	tF3uU/aA+omjZnjGZscfQlOYVJ2wWIg43vwRk3w0tWC8S0MNduA91xmxAB2xSDt7DcBE8R02HT0Lt
	DYfw2W+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnb-0000000Fr2I-0Prm;
	Tue, 05 May 2026 10:14:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnY-0000000Fqy7-3hMa
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:42 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8354461da74so1057625b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976080; x=1778580880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=NQvlBLelopAZSds1M9a3RE8qSzBCGqf6HNDP3cgECJlk8ZdURnw/1IUSFqPU1NNRem
         ujGRdxb7Kr2gDu1lTekKhAYAIY6gaLSiWzKrXwwLzpugp9gnnuYTVrjqP4Xr7LJMjlic
         RgnxujeTEhhWMsk2bJd+3eAgWdy1MYm1oOmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976080; x=1778580880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=iYZMesEYqE1uBQiw/iOgQ01wzhGsVafzus/DTv3Az3DpjdRlZ/k6nffjXAUaoLVn1r
         cSCPvS6g+UswFjDkWyJvKxFqpX2mYahwL7m5UupCNXMj2ZoF2c8XmU84+RAiY+eOlwPI
         S3JjD8v5P8XYSo4IUy6wfU5Zgt8dg31iQTMCvTBwg5Ha8WbTDoGZYyP6+BZ0EZja4vcy
         JXV6vDcO/U+VKcEuJwYYiJAXnvGXebXgfVu3+7bmVKJ2gKweNyuIp6abysmr07c5RdBz
         Cp4sk4ZNXaQf4Lz8e1jxfwYUCbhX9fgPFMJIdXXOBL7vEXeJYR7UQWZ316/kfHhua6uX
         b2jA==
X-Forwarded-Encrypted: i=1; AFNElJ/O4Or1ExQB3Dx7NO1et45FdHeN0TxTBL8/M7LKmJr0LLuenpYQ9MsqCTvnph6kRehzLx2scvm9bikDXEw4qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTK5LT6tcod415220Cw35GGZKwQM0ErIkIjLG5LcQa8OUaXFZk
	wcNzvs84P2+DrnoNeIcLkBhBlypWDoLZOhZvr1OA/3IecGCzS0MaaEQT6fxiMDw23hAL7jyT/bS
	EXeQ=
X-Gm-Gg: AeBDieslfwCbFGAtqX6d4hoSGO2gea3mGZp+MJgLS7PSWIzWF+eTkQbAF23zx2HpFrj
	ujjZxTjQpXwQsfUKR6Tav1BnIRRrXT7tqy61pOU//TxqipHnH0Ih90yp7BnLSxPdbfgZ97Q8krd
	PLM7YKXV7087vCs/y+G2sg9tlrU7ThcrBuk99EoamIM9o3DOhGzdghjG2t84efVu3Awnv4VvwkC
	/Xti0wOBmmBTp6EEgbmsY0+SIMtfwR3U+FZp1RY0QLkjE+LRaPlWG2vZHwE7uUIzSMhcO1wCJx9
	nz74nN9dZ0oV7llasp+pdhb7x9+Hq1vXzKu7Ci14G7s7FotXVWL23tkoGr18JbHOg51WoquPltC
	wn8TxgEyd1ounhlzcOmWGg6Er2VGv+8GHIFQhPXGmoWwE5/i72vu+6bk6BQ/CJg+ARGWYz32KLZ
	ZMr6keJknFCOxm2N/1NwfnoZKPHIrqir8h6exgb5AlsUcXiILDSYuc4kAEiUJdD9k/dxTHA8y8t
	RN1ktJFg7XM5bEettQ=
X-Received: by 2002:a05:6a00:a14:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-8352d2b5436mr13440114b3a.36.1777976080065;
        Tue, 05 May 2026 03:14:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
Date: Tue,  5 May 2026 18:13:58 +0800
Message-ID: <20260505101408.1796563-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031440_938834_26444EEC 
X-CRM114-Status: GOOD (  11.50  )
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

The WiFi supply regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index aae9d5ccca13..da819f36718b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -167,12 +167,11 @@ pp3300_wlan: regulator-3v3-wlan {
 		regulator-name = "pp3300_wlan";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_wlan_pins>;
 		enable-active-high;
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
 	};
 
 	/* system wide switching 4.2V power rail */
-- 
2.54.0.545.g6539524ca2-goog


