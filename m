Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46008C25B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hhafMyYkrX6Ps79nQk/HQYlP4TSCjh5F53nTwJudH2M=; b=kkGevDkqw4J7V7Nfe+eQvWMSsX
	0L6zYy+f0jcwh3kdgy7xbLYXKF8VGB1foUlXu/5hNV7cOpBwpFwsbpV0weWykWvXnlCM1OBSRMCiK
	qRUsyvI16pVqbt9Z38N3rENDCo3H2CFQMKyuvaQS4Ef+p5Xd2j+Xliss12FoHZq8Wi9mb9AFvRXOo
	jc2Wypk0lCzde501RzLTmg1GMLd2Sc2oHFTCfzZWsdKiwvByEmefU+GA7scc5clm/gy+yZaq2uwEo
	0LUNlAJHXnOq8LEHXPMpXQE0wSxF7vBK671OzFw0tmqZWtmmKsXZ0MD8PYD3d4eU6cFzbEa9J1XBg
	orjOwqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1f-0000000ElwW-3qvb;
	Mon, 27 May 2024 12:00:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1U-0000000ElpX-1IP8;
	Mon, 27 May 2024 12:00:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6269ad7db2so365974866b.2;
        Mon, 27 May 2024 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716811208; x=1717416008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhafMyYkrX6Ps79nQk/HQYlP4TSCjh5F53nTwJudH2M=;
        b=JcEIcbxLtfBuA9MimYTzRDn+ig/VH6ksb2Nf13LnHVsXg+mqkshZ0BBTaWgrdGj2JI
         i7qA1sP2lcF/qYEr2e0SmCMJnyQAKf9UodzdTqzeZrE7GLfoxMS62ibwdHu4ETVOqSQ9
         1WYK1r/2uBBN8BynH7Q9ytedRo+DxBjPbx1Kv4tav8QOnw2bJ56sXUXP1i932eTpvOOD
         GSjI2EAXnNtDopM9YyiiYqfAKmi2SMp9Ydlmvo3sacZXBvTjJsMnqn3J4EwqMlyXBN9V
         EPQ4k7DxRRBkgeYjmiJKpbJqZkdaVA2g36z+/coxbdEjbu7V5Z50Q5xg34Y9kJyNv5AJ
         Dqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811208; x=1717416008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhafMyYkrX6Ps79nQk/HQYlP4TSCjh5F53nTwJudH2M=;
        b=Y1cFLTr70svzouDQW9Un/HhG40GrBpKi3+gzFBuhzeP8Tg4OxpSvKO2vpIJx5Ttfvz
         fcLN2O1rXBA6pG8+6YQugysQrF2vtpWDvMJ7qr90NceVUYSLspLK2bCVhf4g6C8T+KwF
         0PZ1EGoPZ3gT+jyehnFQRk6aUo94q8vQrLkoC6QrUMrjdgqFSiqLjCuwXPrq09xAHu7A
         1RGGFTGYB76hktXJd2sEGnw7KMnkDXXfASKKzf3RTa0tpw2Wk3l4cJQwA/ELj1wXIx0q
         SlY4mjbD2xTTeoDihAHThEJPkvhdWmxSRSPAV7T0Nwn0E4AeDyUzObCML6uknYUgQFmY
         RurA==
X-Forwarded-Encrypted: i=1; AJvYcCUl6x5SADsx+OUIC+7QLoS+U8U7xG3U7XlArN1b1wkjdxIZwKLgZs+Ie9FtIsP1XsVWvh+yhXaUbwNXy4rt6wuI8FHPaD8zd6gARcJg3W9x8apnhkDqAN7tbIXRndCjixt7SETuvMoB/kmK/26A9PNOZXxz7eC9U8I=
X-Gm-Message-State: AOJu0Ywt/51aGDmb8FaSPAAeUKRuaAF7rfzSKBrTZZx6EaBQLl7TQ+Uc
	GLMEnG3kngA/VWm/an2rQjdo+w9N/ITYhmKS9h/hN1AEFu68vvQk
X-Google-Smtp-Source: AGHT+IHXyqU91SZsF/SS8uKpX0+zjL62tJ/iZ7IZum1uxfDLP4xHlxHwVSiQEbMzdxUF/vH/7q7RvA==
X-Received: by 2002:a17:907:512:b0:a59:29ea:ed1d with SMTP id a640c23a62f3a-a62641ce042mr508744466b.22.1716811208070;
        Mon, 27 May 2024 05:00:08 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm484669766b.183.2024.05.27.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:00:07 -0700 (PDT)
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
Subject: [PATCH 0/3] Add initial DT for OpenWrt One
Date: Mon, 27 May 2024 13:59:30 +0200
Message-Id: <20240527115933.7396-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_050016_454559_92260442 
X-CRM114-Status: GOOD (  10.69  )
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

OpenWrt project (https://openwrt.org/) celebrates its 20 years by
releasing an OpenWrt One product. Early units have been produced and
will be followed by DVT samples really soon. Then the mass production
is about to start.

This patchset includes very initial DT for this product but with the
pending work on MT7981 all gaps should be filled soon.

Announcement:
OpenWrt One - celebrating 20 years of OpenWrt
https://lists.openwrt.org/pipermail/openwrt-devel/2024-January/042018.html

Rafał Miłecki (3):
  dt-bindings: vendor-prefixes: add OpenWrt
  dt-bindings: arm64: dts: mediatek: Add OpenWrt One
  arm64: dts: mediatek: Add OpenWrt One

 .../devicetree/bindings/arm/mediatek.yaml         |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml      |  2 ++
 arch/arm64/boot/dts/mediatek/Makefile             |  1 +
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts     | 15 +++++++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts

-- 
2.35.3


