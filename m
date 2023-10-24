Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C43C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XlbC1K4AxAmssnIJB6kuFR9XUGWIIZCHNO54Y+mJArc=; b=gfWUFjpjeEaPmZ
	LCQMteWCdtuKbCdWfghe3thSeCLntdmU5WQCixxBT7ug3KxDGK8IQRfyq6p20M7rHTKxT5MZbHoEO
	CnPVlDb1+6dwiP/Rw4ttMT7UGwUKPClRK+UAjnKsKGUIdGDYeWoBMKXGHjvJMFLn37tADmgz0Qitd
	4CW9O+dPSlmQXzp23rdcD/k5Z+bgC+2mgqkR1OUNn1KQiJjZVcKdN+rBgPhp+ON/jVTtzR6IqQUDn
	stm7oHNkzfDI3mQdw4g9Z2ETDn7/oUJOv7eNXmbIOvsrGyN1uSFZhnn5YDaQR4PYWMctG4lnmZ8Hs
	RV3EexlytvAhgh7x/RQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOv1-00AsSq-0v;
	Tue, 24 Oct 2023 21:26:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOuy-00AsQ9-1K
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 21:26:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c9e95aa02dso1770955ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182783; x=1698787583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlbC1K4AxAmssnIJB6kuFR9XUGWIIZCHNO54Y+mJArc=;
        b=lIqnkKsU+YMdcNzrgwBc2n4dSMOXgHn8N3jYHaWdyxXvYuLhqXm6y4zjUaKrddDub9
         lTAPhQdFJ1mHji0RqPpbeZ5DAOSzr3ZHn9SEjQcSq1rzLlL8gFVVtpsT9v+qtax8I60k
         R1r9+40xz6PoVtRh+EVQEGD8oVOVuTVaLlob8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182783; x=1698787583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlbC1K4AxAmssnIJB6kuFR9XUGWIIZCHNO54Y+mJArc=;
        b=ShWdYbkkK3eCSAsyeYKYBr5qRwBcJAoxBCwQIhfrpVnI5mxVSD163RM9Q+zZwoT25b
         zw+8YQAnb7h6eDYQiffqgVS9zCngHx0EV8tMoG+7R7yanbTREcfqFayfwsPb3dTkBbP2
         zJ2zkqfrU0bqGOHpgBn5/QLi4C1Fa4LcsQN1RyQbxffU9XjIqyzLbN0QAcl/dyKjPVxX
         F3aOeIVrGF5X+pQF9lWH7pYYfqVLVs65QtSBte/0E3CmLKKm1SX/HWNDEi9IXonWn5Dp
         Pcc01Fn7Ye4/BRPjt5oF70QIOy7j5ohPeXg16iGCP4Qzf54pKMBN0b194mlfVxg1X9ZR
         syFw==
X-Gm-Message-State: AOJu0YzNRW9oDMb3PTfey62vv3RD2wizpvHkkEFee0lR59gkhqZmIhUw
	3DFPCEyBv22vNY5Yp+9dVTIzUA==
X-Google-Smtp-Source: AGHT+IH08j3uB/07Mi8ENp6fO0bST3SnZ0NK+J60maANiUoTINigRosmQBLv07Hk2ZM6aCvRKL76TQ==
X-Received: by 2002:a17:902:ec87:b0:1bd:e258:a256 with SMTP id x7-20020a170902ec8700b001bde258a256mr17679533plg.32.1698182783069;
        Tue, 24 Oct 2023 14:26:23 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902e74900b001b850c9d7b3sm7824140plf.249.2023.10.24.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:26:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/7] Add a few mt8183 follower boards.
Date: Tue, 24 Oct 2023 14:22:22 -0700
Message-ID: <20231024212618.1079676-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_142628_452493_01CCF520 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add makomo, pico, and katsu which are mt8183 followers.

Hsin-Yi Wang (7):
  arm64: dts: mt8183: kukui: Fix underscores in node names
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
  arm64: dts: mt8183: Add kukui katsu board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
  arm64: dts: mt8183: Add jacuzzi makomo board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
  arm64: dts: mt8183: Add jacuzzi pico/pico6 board

 .../devicetree/bindings/arm/mediatek.yaml     |  26 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |   6 +
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  25 ++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  25 ++++
 .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   6 +-
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  40 +++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  44 +++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  90 +++++++-------
 10 files changed, 360 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts

-- 
2.42.0.758.gaed0368e0e-goog


