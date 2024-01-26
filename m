Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B687DC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ySgp2UiszzMfNCnD6O5mfCcxxHNvIaL6WmT8mRfAk0M=; b=QuPH2DNytZR0dSuhUBUNyx+4bc
	UbXW3gqke62XhOr1bd9yW/OCcVjw2Mg4BD6MgCG5niLY/xZpw42JJv9kmmLENv/oiDDbRAiMbOJvt
	cAJpyV1Rgintl2tDT31i7FxchkvwIgqdNxj+pH8NDSipA6rgeNg8hxSOywIw1F9wjRyOdxb745jFg
	UnEsLK/t4aUv86XHJKwMJiNpoibwPEhJpzc/wwbCHYjvET0z6oG56JuliTl88w7IRgEBjKZamhRMG
	UM6bX22bnHzz76w85unyMbZa67WFXKbDhaP96mWHJjz992KWtbg0XU5TyV7rsDS02mWSuOiyuGn5D
	ywjXxCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFny-00000003FvX-1awt;
	Fri, 26 Jan 2024 06:35:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFnv-00000003Fuk-1tHO
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 06:35:08 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so1012598b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 22:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706250905; x=1706855705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySgp2UiszzMfNCnD6O5mfCcxxHNvIaL6WmT8mRfAk0M=;
        b=cxxVylXmeXCLzmyrfKlkZ8JgNpyJCj7Thb2M4OGH1TnZxmqeaEAYS2J6zdJpp4Rgbg
         XpvGlcvERsF/6IHzUS503Ub0waVgEjED9CUM1WqHdSnKfZ3ZPToP0m6+ehezWNHOolAD
         XVvCHxD4MLamane3Jp2m6JQrXpfRkHQkXWsGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706250905; x=1706855705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySgp2UiszzMfNCnD6O5mfCcxxHNvIaL6WmT8mRfAk0M=;
        b=h0uRs0roEsj6IDXKwVW4b4Vb3KMwa/ai8qh8Itc7yQzLsNKIAIQ+LNzkkKwDjXD8Ho
         mIn2Wnx4Jc+FqSUwSt1RzbVz9QaGbBXm18Ss4ZGKHx7Vv1wUOlZhKV8rPpyfY1DeSeP3
         kdN0aBzxRD8tt6cTyanH954d187+/c/jpARj5zKNsGdn74DGpS+JT2xJjOKYJN+rnmrw
         604z5plJLFGBuubS5GsnnCoJy9L00cB9A4/asUs2T+bwZNkUJnx2vubEIe6fp8eZL5eQ
         jCU6ZYRQ7paKhIMRS51j4QKY8ODdQcTYR7mX7LU9R1SiVgKW9AQ+GJZ2Pf4qKKfHNGln
         g65g==
X-Gm-Message-State: AOJu0Yx+XKL96jQ7QsKkgPnJZ2k2f4PHBfyxc5dtpwuVPd9Hphv4cgTl
	DOQ6dx1gZBwFeHhN2Zlpyo57C9Zx3uJ1SE1RgpE978ByyoCt9X4TEYURbU9NsQ==
X-Google-Smtp-Source: AGHT+IF1szoUbF1JDZy6toVdzGRAw8HhVOL8J8FWhgQ/IhKqWQPq084VnvUGMXytbOdxbOyYMcX4MA==
X-Received: by 2002:a05:6a21:3987:b0:19c:53ab:d7d0 with SMTP id ad7-20020a056a21398700b0019c53abd7d0mr684905pzc.50.1706250905647;
        Thu, 25 Jan 2024 22:35:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id ka3-20020a056a00938300b006db13a02921sm488735pfb.183.2024.01.25.22.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 22:35:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] bluetooth: mt7921s: Add binding and fixup existing dts
Date: Fri, 26 Jan 2024 14:34:56 +0800
Message-ID: <20240126063500.2684087-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_223507_545304_698B6C63 
X-CRM114-Status: GOOD (  14.65  )
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

Hi everyone,

This is v2 of my MT7921S Bluetooth binding series.

Changes since v1:
- Reworded descriptions in binding
- Moved binding maintainer section before binding description
- Added missing reference to bluetooth-controller.yaml
- Added missing GPIO header to example

This short series adds a binding document for the MT7921S SDIO Bluetooth
controller. The MT7921S is a SDIO-based WiFi/Bluetooth combo. WiFi and
Bluetooth are separate SDIO functions. The chip has extra per-subsystem
reset lines that can reset only WiFi or Bluetooth cores.

Patch 1 documents the SDIO function and the reset line, based on
existing device tree and driver usage. I listed Sean Wang, the original
driver author and maintainer, as the maintainer of the binding.

Patch 2 fixes up the sole existing usage of the compatible string by
making it a proper SDIO function node.

Please take a look. Not sure which tree patch 1 should be merged
through? I suppose with proper acks it could go through the soc/mediatek
tree together with patch 2.


Regards
ChenYu


Chen-Yu Tsai (2):
  dt-bindings: net: bluetooth: Add MediaTek MT7921S SDIO Bluetooth
  arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node

 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 53 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   |  3 +-
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

-- 
2.43.0.429.g432eaa2c6b-goog


