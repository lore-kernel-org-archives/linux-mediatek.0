Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F107E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=; b=jGKCJit8dt22+Fp8ZbmlvpyjQb
	+PxxQR2Sp8HPGGEsztQnZoXxbBITL2JOdrv7o08sAPb4osEvG41j0GJb4eU7W23hAcHUYOyqdMShm
	GteBqFCbO2MchlJrRrnndk3uWRc2h2Oc8MWgJksurKAgCMKdSE4Wa9BEf1nhCPpP6ShJaTTPtlnoy
	WSHCtE3TNxtvg1mlAE4i9flFe4SMdwG3KblDXuGjCqOxjaiXfp6COz2cQ4K2L4tcGskOjeKz8VXjV
	t9qYVU8+1rGvgZDqxS16yq8Klh7QLnvtu/+WRmo4LKyEwz+dUJGmRotlu07msDzYIB05ebgD7Liha
	5iMjRW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFEE-0000000DpMo-2Gjq;
	Wed, 11 Dec 2024 05:25:42 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFD9-0000000Dp2C-3XLk
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-724d23df764so5763893b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894674; x=1734499474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=;
        b=eJj2vQJQcvU42OIYXx/iJLbuK5PCD7SS0dwzqRkr6znmgbXsGp5P0VS/aruGO5jlzF
         Fve6mWrLeMSXrZxCcKqoNvVtrcxovSasXf8C3fgrPBa6YZuHavu6ypIRriOhyniCSBV6
         ZKLAabx6JAOShkq58jBs7EMa0tddnQKT62rQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894674; x=1734499474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=;
        b=bbUG04NKEkkF4r3SZqlA+jHGNjS8mxZcPBb7SpFyWhwxPnplwg7qMy7VBINwzxd6hF
         RI9nWXZKZizvA9ldT1kwADxxSzUq5wic4TqdLuImSgRhlWPmGINyYyIMJICaBUjQFI3+
         Y0WdQye3oAdSKQHNOSPg2iyFOj7P9hNh4d+Eqqzk1z12HOJy5PBfHu1RZ0UnKKCzE16V
         bE7OXyvkj7JtwlTBovfLW6nnNHCLZRg5Im91kn9oWi3Y3mTKVJiAoPXl+IZKC2wjuIg6
         /EVPNe7NUiTCRV7tEN59Izw1m1rAfplBvObtF06Xn8NieeGIO6k/iGScqhbliKQsycWw
         j6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXmJfuHorn0EKyw0exxkjqUMapIA3d6v9dZBI79kZbUu+Py8iKLaJua8x+Jh79nenn/dE5YC1w2AdXvTRSvMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4sR1hB8Mh0hW96YexN9HcW7ykbHskVp6ua4syY5GCgcGtzols
	udMGKMFf219SiraiiFUPEYDS8bpYgAwKFFKjCU2Cm6AWJjjk4xLgJuCrZpOJCA==
X-Gm-Gg: ASbGncswlofshlEVK5li14bT5i5CsEn1ZmI5IgnfsaTnDMFTiGynG3yjQkgFHNZG2oz
	qWeM26Ni2/VGDxxa+t5xmFhYy8+Kq1yM+oWgzwAHo1MgbIz3LhaMIyBUNYOsYiEng1d3osEIeVN
	mwB4NRm/Pb9YXTquTCTDqXuH4XXn7Uliz1uyyTAhSIC5rJaZVMPFN7X1xbGCKnymM6jLvXOKDW0
	lEoQRgL5svgHzBTrVWa/yPiW44r7UKAYt6XJ//L3C4E2UsM6VSAjNSrN/eawMmIge8UD0lG
X-Google-Smtp-Source: AGHT+IGRXZyCR9vBPnWrRkfxCl9FFb1KFJmcBVsUf9/kW06iS0cwlLUslN7QIGTATGDeY32DTij/Zg==
X-Received: by 2002:a05:6a00:1915:b0:728:e969:d4b7 with SMTP id d2e1a72fcca58-728ed3e8533mr2451508b3a.12.1733894674483;
        Tue, 10 Dec 2024 21:24:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:33 -0800 (PST)
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
Subject: [PATCH 0/8] arm64: dts: mediatek: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:18 +0800
Message-ID: <20241211052427.4178367-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212435_911234_741C2080 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi folks,

This series drops usage of the long deprecated "regulator-compatible"
property from MediaTek device tree files. The property was introduced
in 2012, and then subsequently deprecated after two months. It was
never carried over during the binding YAML conversion.

Drop the property from the MT6315 regulator binding, and all MediaTek
device tree files. IMO it should never have been used to begin with.
This also gets rid of any validation errors [1] related to them.

Please have a look.


Thanks
ChenYu

[1] https://lore.kernel.org/all/173386568696.497617.3727087837255802552.robh@kernel.org/

Chen-Yu Tsai (8):
  regulator: dt-bindings: mt6315: Drop regulator-compatible property
  arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
  arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
  arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
  arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible
    property

 .../bindings/regulator/mt6315-regulator.yaml  |  6 -----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 23 -------------------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   | 23 -------------------
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  3 ---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  2 --
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  9 --------
 .../dts/mediatek/mt8395-genio-1200-evk.dts    |  2 --
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 --
 8 files changed, 70 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


