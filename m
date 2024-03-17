Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B525C54E6A
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmdm3dIttaltfYgNn91n9oleuQB7czhKG4DCjwg6DSs=; b=mvkD/LjcSGiHPjyLfLqf3AhtP1
	jh/zQqdBW450n+f3/YSIh9bgNKbNO6lSOIi5CqrvSJdEwVJHjy392rQD+QpydAuoulfOptykPycg3
	JBu46bEhmchJAn4Oz0qFA8+HHV87YYSj6h0cqwDcAd+ahUA5fTlfqhojSJizLodu3RakU8TYnuV7c
	a19IA6kyQBsMv4fTx+RMS+JbeUb9VD0ZJDXG0/l76LKCg5RHXNvurmcHZ2UNtQvvAfak7rCpHZmTv
	iik4P+zTT20UdbGFg7eP2YnA9UmqLPQAi+Hve8tZfzJNH448FF94R0xxYM2LaCcp0kuU4POtXnnGr
	v3EvRpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3I-00000006eVb-0dQD;
	Sun, 17 Mar 2024 22:32:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3D-00000006eSm-0l9i;
	Sun, 17 Mar 2024 22:32:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-513e10a4083so1383402e87.1;
        Sun, 17 Mar 2024 15:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710714736; x=1711319536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmdm3dIttaltfYgNn91n9oleuQB7czhKG4DCjwg6DSs=;
        b=jYSUJdC6NEdYRiMxPI51g17/DSOkQ4m6E6C/WNLbkOFUiyAnAVSJr9WUvIDOGPH2Vw
         xKe9TW5qZCjoXjY8C1O7r8f/fNlGBsDVgrdizw+7RE2AqwAOnAdpN0XKsQ3i0aWqNvWE
         qlpA6tl7hOB6OWGWY9nmmnrMmSfWN1JbUe++nPaPMWvACEeJWlJlJhAFbadNrVm3wHkZ
         cpzZ2++Wi103Ikd1gO73tyIzRZghQVuQ7THKYeHDFCAMB/VIBm8io5SBE96Ftlvn+Uyj
         0WiB1H4IH+5dyL7Pcej5TR7tBGD8mEeqx2tDYt0Job5FV9n5r2I0JqjGr9D7qKHOcFE7
         YUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710714736; x=1711319536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmdm3dIttaltfYgNn91n9oleuQB7czhKG4DCjwg6DSs=;
        b=m7/H6Jqu5xEBc4KVX3JIIl8ULmy8GmfE0i4i2G8w5obXmlwE4zrp5k1I7BJHF6l7iC
         hWtmfotG7ioGTMStgKYQvITS45ilJE0SAA7N2XZ1hUdDxSyjI3GBU5QNYuvAz6+xSw4e
         L3pLJCCbEgnNjG1+XMfTBSI8oP5MxtA0RBTGTMQTxDcgqleDGTCbrD++Rv35WM4jFo39
         stNGkHQweLdv3bSgalopviY63B++1raafT38EBo7WbyhnLLqAu/JpJNvS6zClmKBGxXq
         amFjAv0gA5IQ54TqeRYLgi2q79u6I0ToBpLN4Ett6gPDIFfiPrspRpsfcelWCXM+RbUh
         dZDA==
X-Forwarded-Encrypted: i=1; AJvYcCX8GyjXyFk76JzjsmW9g8DNh+Gwiyc0gXU+NHZFT7kYwbP2cM1kLiTtUR3LLXgbEx88s473vDxtNhmNkvhO7rS0g6QYGtlQttMk6e9Xor6hEpE7ZZbL4OkRR5VOTxXruvtEXI4kgTkXX7ocsktdoHZWwZagwgosQBM=
X-Gm-Message-State: AOJu0YzgeWKBI5OhO7Qc5t6uwYvqrZjo7CD2JSNfodqmW/QQZvmKm+12
	kJkXyrNVcspGNKC18nqtckveyZXIWCp6l2B60e3rppeuTn90KqYM
X-Google-Smtp-Source: AGHT+IFMwanalas0xcU0GCo7+jbgNY41telHFIVcpw8xKYTtxzTPzgyobaq1C/yYMMQnklPjIHsVBw==
X-Received: by 2002:a19:3850:0:b0:513:bea3:7f60 with SMTP id d16-20020a193850000000b00513bea37f60mr6493783lfj.44.1710714736199;
        Sun, 17 Mar 2024 15:32:16 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x5-20020ac259c5000000b0051322c11100sm1366981lfn.221.2024.03.17.15.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:32:15 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 1/4] dt-bindings: vendor-prefixes: add Cudy
Date: Sun, 17 Mar 2024 23:32:03 +0100
Message-Id: <20240317223206.22033-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317223206.22033-1-zajec5@gmail.com>
References: <20240317223206.22033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_153219_245337_B87ED19A 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy is a Chinese company providing networking products.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b97d298b3eb6..8e0dc4a138b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -334,6 +334,8 @@ patternProperties:
     description: Czech Technical University in Prague
   "^cubietech,.*":
     description: Cubietech, Ltd.
+  "^cudy,.*":
+    description: Shenzhen Cudy Technology Co., Ltd.
   "^cui,.*":
     description: CUI Devices
   "^cypress,.*":
-- 
2.35.3


