Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54030C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4b6kxHXn2wrQHXxVcVKCdXvHs0ACru8nrxrnyesn9I=; b=cEWsMzvelF2AdK+HdbUqYiLojE
	tmYuYcnb6zF19UoPLH4dRWS9gqhMEGvI9c2yt+q4OncFg0x700tnLEgwQ61Mvvp6DKRQpcIy/SuKJ
	P1JKRbxfYv/h2ZniRXmAXepVKDul5qMllyJGYFzQd9JfJ6dN6Z2wRk7e/EnhEwsicIXAxdlG1rajF
	4y7blwURhbRTUBAYDp0AyEAYAO8tpAdYcHQ6YMXSVzDDLekqCapgpYPF+Z1GDHgpbo2aiQll42riD
	M016r+irV0pg5RoLgJbsj2+/2/MYY6Yro+Iw5SupFXWHD8Rd47IBEa3UeszCk3q4M/F/1jgjwnsPN
	2JM2w7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1Y-0000000Eltw-3xZf;
	Mon, 27 May 2024 12:00:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1T-0000000Elpf-3r8u;
	Mon, 27 May 2024 12:00:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5785c1e7448so2835220a12.2;
        Mon, 27 May 2024 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716811211; x=1717416011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4b6kxHXn2wrQHXxVcVKCdXvHs0ACru8nrxrnyesn9I=;
        b=llJe/0C+T1z7PHbkeVES49dYcEqfDAKuVqKnFZXdIe3gP4AyDfneQvN0o2i7W45Y5p
         JoIwE7PSJMTAtjwr2+xBaT0lX8htyGaC7Frd+bSekvne1S50sHWYqkrFtH59gmE0XfX3
         TmYbyXQKpBeHnN4xcaTOZvyh0aSQkZvXD+JyaLZM2G6DHX4q53g/1K4nvuwqbOFM9fwe
         NEzAC9fHyyJT/jQrZROnIhHAVPuxqF5A9fjmZ9o7FjJHalO7IhJH6wsbrQ8SiYwQ0xeC
         8Tcnt2eYOBbZH99TOqDQZ813oOC4svNGRFcoXTNUrvlcQ+CMWKoh1zIIhsHdVH0363Dr
         a2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811211; x=1717416011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4b6kxHXn2wrQHXxVcVKCdXvHs0ACru8nrxrnyesn9I=;
        b=X/0GtwmHMP/Qi2N41jrmJ5HtA6CUSTKMHYNGAG/07YUPfnQXN8v4+jLdAIuaq2ARWV
         CKWGUoxKp+p2hDBq2doQzXANvnJn3VH0wdk+LAs5lm1zk7du1PHXmTsmG1i0HgryzKpA
         8JuPeykE+W55UJCdq/bNbvHgWW+kVNDx5mQxoI9M9Lf7Tj94zWmVWk+I/5O3lGlJfEMU
         g+EuUVmMCzgpsf5XqCdbkP0oXwS6V9QbEVHvI8WyUa95V6lITMilRfsYl44XAzMYnKa2
         /waOhY5zUdGt0HOY5zxGp3kUokCeLcI/EZJpQ5tp+AKjzVzY/wkvT1p/bAPbuOkdQRPF
         FV4w==
X-Forwarded-Encrypted: i=1; AJvYcCVwXodwNzGxvExByWAPU7zdnB4nGZazaJRMKAOdRtKdjisWCn/MswxDu9OJb330iwc/Wv2/ds1F8b3ZheLnTUNiylkmxUM/zZXobex7rvwm7hNNPNK4ahZKHi5qtbxcWNvh41Npk/EOx6eVHqG+ogQZ9A0EqTk+X48=
X-Gm-Message-State: AOJu0YzjbLgtup7woHGIsn1JRaO3QIWHX+jsl4wwZCea7mua/VilsWqO
	2dLiXGaAWAtXZB+0MAqNRiG1hsICTYD8y92IXbncepVufdUGTZFr
X-Google-Smtp-Source: AGHT+IHuImaftf9Wnm9N4conq8Nnfqpipw/+l9o3eMb1o8R7JwO+DBYQObs1z8e75S+0TjhobGg1vQ==
X-Received: by 2002:a17:906:2484:b0:a59:cb09:41d6 with SMTP id a640c23a62f3a-a6264f120damr576511066b.49.1716811210521;
        Mon, 27 May 2024 05:00:10 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm484669766b.183.2024.05.27.05.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:00:10 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
Date: Mon, 27 May 2024 13:59:31 +0200
Message-Id: <20240527115933.7396-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240527115933.7396-1-zajec5@gmail.com>
References: <20240527115933.7396-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_050016_072286_CE75546F 
X-CRM114-Status: GOOD (  10.38  )
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

OpenWrt project (with the help of MediaTek and Banana Pi) has produced
its very first own hardware. It needs its own prefix.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e474055359f1..eabc353b8512 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1084,6 +1084,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^openwrt,.*":
+    description: OpenWrt
   "^option,.*":
     description: Option NV
   "^oranth,.*":
-- 
2.35.3


