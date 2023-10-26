Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6275BC25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ch2xr7WSfAQsekJPDJjz2RgxrfMVUniFSWo5hCYQcEI=; b=NlQaZmGBoKlrDAzy3QLC8/x+Zi
	IDVMZ1rhJfPZPiCqlE0nR//H5P4/EC0MQI3SaNoAw694j4EPzZL9NUkLkgpOjLKlS7ovHGN4y18YM
	wT8wDycJTH/d8pdcn3P9T4PIc5wUpu43pVEh233aSqvG4xU7+pzIlxigqaegSju0edTGDZZHS40cA
	08EIwP8TVr5NKXW/61X88rEMxzkL5dzjFaoTTlkjFKsOM/FHyZk1bJOmREGIIaNciUrHnrSQuEsrf
	JQQZmc36wIPbVMRwhHnGodanIZAei8yvlrfUfuDt79E84b2bPrPbZNkhN37s5dCvabuHvOoUYLyzX
	51CUZXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nn-00F2AU-1h;
	Thu, 26 Oct 2023 19:13:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nk-00F27V-1V
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:13:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-27d0e3d823fso1024814a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347628; x=1698952428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch2xr7WSfAQsekJPDJjz2RgxrfMVUniFSWo5hCYQcEI=;
        b=AV0mAO1Tove+n4mU89zQ9r9Lx9VNToHQoSJ+XNmwynfPRkbKJ8mQBO4MaA/oNAHMcy
         c0u+pRbtFOzoQ6zMPX4QT2Ntj5DKwaPhANWa/wGIHu/Ap+mHazjG+ylxAzINmaIk1PFp
         Qj8QcuP3Ecl/zLmo0wiu3GIYw41nOHG4LHd0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347628; x=1698952428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch2xr7WSfAQsekJPDJjz2RgxrfMVUniFSWo5hCYQcEI=;
        b=HNyxB75MFMzwsXT36eAU9tr5Kj3UJ0x6wrVgjab5qGe7dKVXRMSpJp6BhJHStouJBb
         K6WfbAaWpTBt7E8/Pw4Dd9IIeY5K1/zkOiOXYHR4/7kEbRt5GYhuiqrQQUpqaytDZmrT
         g44+aw9lyLasU1I+y7/RxCpY9oILzvpsE7djOjDiqsjwlfe9GdcYPT5MQ7/28TwxOWZ3
         S5oYTkmkBkRN2GMyQmfwKvgziwrrY1cxNJhGl6on+s11ZRA75iydEwGnpOQHXy6Spj/8
         dmnBUrkKmi1QMfQ9lG6j0Dssrxo+xySipj22vVlUtessWwkpNfg2fEIQJ5IYBbWNWUgv
         InLQ==
X-Gm-Message-State: AOJu0YzCIGTmgUhXrcu8ymY9OlnXJfL31+q9iedRZ5jEE0YCkucJxOwO
	HME/KCptHa9AOf+SrU+lhNSWPA==
X-Google-Smtp-Source: AGHT+IHUqjqOZtBWong8vFEikEVD8olSnLJyI2zsl2FBwBwf0Fg0LjpZS1EX2gbS3zNjBHJCDytTbg==
X-Received: by 2002:a17:90a:1957:b0:280:205:9ba2 with SMTP id 23-20020a17090a195700b0028002059ba2mr448867pjh.5.1698347627814;
        Thu, 26 Oct 2023 12:13:47 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/7] Add a few mt8183 follower boards.
Date: Thu, 26 Oct 2023 12:09:09 -0700
Message-ID: <20231026191343.3345279-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121352_565797_981F4A34 
X-CRM114-Status: UNSURE (   9.48  )
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

Add makomo, pico, and katsu which are mt8183 followers.

v4: based on https://lore.kernel.org/all/20231025093816.44327-1-angelogioacchino.delregno@collabora.com/

Hsin-Yi Wang (7):
  arm64: dts: mt8183: kukui: Fix underscores in node names
  dt-bindings: arm64: mediatek: Add mt8183-kukui-katsu
  arm64: dts: mt8183: Add kukui katsu board
  dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-makomo
  arm64: dts: mt8183: Add jacuzzi makomo board
  dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-pico
  arm64: dts: mt8183: Add jacuzzi pico/pico6 board

 .../devicetree/bindings/arm/mediatek.yaml     |  21 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |   6 +
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  24 ++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  24 ++++
 .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   6 +-
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    |  18 +++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  18 +++
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  14 +--
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  36 ++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  40 +++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  94 +++++++--------
 13 files changed, 384 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts

-- 
2.42.0.820.g83a721a137-goog


