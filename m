Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC06C25B67
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KIyXKnp9ik2LhvuJOfiqnewO+JX1rYsLQwadh3j9eo=; b=0UMZTth0rWMPBm
	rhiG0Dr9Uqi03J7LH7nTz9kOYb/ps/nE0JLAb521IjAUPKn9PjA+Y/CinLuApOzQW+agHqKEy2ljN
	RyTuvnjKMPATLg0aJBcKQcsS9S9QmIbcXPh6W8kTf9NZyjflI3Ms/jHfkuApBc07fCE0tA9vnMaoz
	zZDDuGTTGYaS0uZJU9rxMIqX3UiDftDfVfN9WqWO8TBHbxTdcPdfXUZaJa6K+ZSiwzXebWGEaL2Ak
	wcv3q/RQ2jfSIa78vZn62VznESdLlk0Kcr73Sku9tvzQx++eAASVn/87Rs/aGv3x6hV7E/JGgTEVj
	Ky3Dw8okw1osgb0yCRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xN-008Uor-0I;
	Tue, 24 Oct 2023 00:07:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xJ-008Umn-19
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c9b7c234a7so32963455ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106050; x=1698710850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8KIyXKnp9ik2LhvuJOfiqnewO+JX1rYsLQwadh3j9eo=;
        b=ofD11OQmFXw9BYOAXNcYf6oTwvpCzqOwbR/NbWFW3xeOF299DwgvoUON/n3ZZ6/FTB
         YghFNrehKNIvOvesN45cZ5p0ax7bUh4IAXHrX01ADodop0MUs/TYZhrroEiRDA+HOjFa
         petg6Yp/qsSAesGujjgse7xzi3q/t2TqoMkD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106050; x=1698710850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KIyXKnp9ik2LhvuJOfiqnewO+JX1rYsLQwadh3j9eo=;
        b=FNEAZHWEHgIrZ/GzcsNyRDJfN3FNfLkEgu5ExUtUCzQeYB10VNjxAsUH1zjrTRW9FX
         0ojOyGRSxzNkfV7THriEtop3bpyz62mJJDQv7dZ1ExGHkZT1/CkLJ43QBE9FFVn7vIKX
         0k5pbfSGo00NzKBCV9ic7mRhEh6Z2WQxP1GtFpHdi4em56zZ5MqEq+Nmui8RkcW54XAk
         VfNo63IO382FXruGXKyCRO/0FiRb1BNW3mISiBfYjHzqVBSDL+CI0FAdrGpH7wADJvcK
         s2xG7WeK1uCtyrbvl8Ha7N5Vz5CLX0GkMGyqSVqD1w5t2DLCyyOaPg/0TA8yEFvkUWBE
         kegw==
X-Gm-Message-State: AOJu0YywzG6+HIp0siqHS18ir6MQIeX+VlN9+Evi2jCwR7HWzZYqWjOY
	D9VWbMXr2hst+ZudRA5ot71EXQ==
X-Google-Smtp-Source: AGHT+IHiQ5fMHyiReBzHBkMvPSaaCCS/bkotYyZaskZvzm6qK4GNEDtEwtoub82tMAHIemj7mRkj9Q==
X-Received: by 2002:a17:902:d484:b0:1c9:cf1e:f907 with SMTP id c4-20020a170902d48400b001c9cf1ef907mr14511451plg.57.1698106049960;
        Mon, 23 Oct 2023 17:07:29 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/6] Add a few mt8183 follower boards.
Date: Mon, 23 Oct 2023 17:02:23 -0700
Message-ID: <20231024000724.57714-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170733_421601_CDEC714C 
X-CRM114-Status: UNSURE (   8.62  )
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

Hsin-Yi Wang (6):
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
  arm64: dts: mt8183: Add kukui katsu board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
  arm64: dts: mt8183: Add jacuzzi makomo board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
  arm64: dts: mt8183: Add jacuzzi pico/pico6 board

 .../devicetree/bindings/arm/mediatek.yaml     |  25 ++++
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  25 ++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  25 ++++
 .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  44 +++++++
 .../boot/dts/mediatek/mt8183-kukui-katsu.dts  |  40 +++++++
 7 files changed, 305 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts

-- 
2.42.0.758.gaed0368e0e-goog


