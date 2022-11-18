Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF55C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8qpOHGlOhZYR6pVYrTYVhfVUaK3uhqqUMzIDSjxxZ4=; b=PELPg8INURXslVTK+U6Emml0S/
	NiYGpLoVpyQw4v3RTycyz28YLDzruzjoyCA+j4e+OFFtGbrQOd/Y0L27Ee1msQ891tg1E+QKwq2S2
	/Ft9ktj38d1o6ZlLYTuhTkNpj3SdGk93dMBOE7uDJLoEaabIdwXYBm1nq5uYKnYBKd89b/w4hQBHO
	qci/XJdjBDvT/Bl75QoHJXNFQwQ2XXLdb/O8GcAk6PqIiQ3elzGlXVvziUff8VHogSRgalLoc9REs
	3e4MMkHoBwi8QDGMMJ6oaG9btjyZO4JdgZ0MoiXtCfZK2NI7WdZhb2DCasZa/EvTW8dwRJXAs1SGH
	KTQ/ChCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbS-003g1q-Jl; Fri, 18 Nov 2022 11:32:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbF-003fun-9P; Fri, 18 Nov 2022 11:32:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id y16so8780895wrt.12;
        Fri, 18 Nov 2022 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8qpOHGlOhZYR6pVYrTYVhfVUaK3uhqqUMzIDSjxxZ4=;
        b=BwfGT3C99fgwftzC5OnNV7hU6aNSoYA1b5/aMNHdS1dLyOO/Hb2iAYzjv/+Bxbh/Hi
         +jnX8GWvnGy5BqXAsOmrJgvTk9G0wYpTdoiP1vzf+OUs0fd5NFGhRJb71549uzCaEKFb
         jsmQeurYWPrFWu0mGJuaBcqMv+AkmZBZhQn8PX9ohezOJvcJdBhbT605K3vvx8SluQ6g
         deLdTlMcL1+6rYuMQkxGR9MLZzeAyO/fst50YXdBLC5gmL/cqNF3ugaeXsxPQ9skjult
         D61AAzQfKKeWKI5wbI3OFSeC45wPjFzUatGDGJMGBFPbxJ+NWlTABFU7isdsKdEEO5Se
         jHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8qpOHGlOhZYR6pVYrTYVhfVUaK3uhqqUMzIDSjxxZ4=;
        b=kFqkGF0sL59HjQEUgOH27ezlK/WS8fwxcLOSRiulDoaVG/Z8Jp3pYHObrIbtaC4zfR
         KKi9YjJYR5LW/C4m0+8x8iKfInJwOI1lQ4FiXemkkoduFO057Uk9JsWJAPEIuA+HIqNo
         EhdyKS9zVbfqmFU79UFwnHyh/w3GNMHoiA02v0OLLsyETv4N6AS9nEh0/VYZGnhYa5Vw
         DaQEIUm0fZ5FNaWTlyJ0mcu1FdXyg37QKy8ZRRCli2MILquQdwom6c3v5+01qK0oMHhz
         iu+vndSZB5r8e0XfJw/iKziQOh29kH+I95AVsw7rjOADaNz8rJUxjUmBJZhh98vuoq7B
         9c/Q==
X-Gm-Message-State: ANoB5pn1ixEcQoZs6jvORF+yFAh7hz3NSR0ScUtdIAhsRfDKSzB7VDFD
	/fELw6OmOKZLFWVj5F9m9Rg=
X-Google-Smtp-Source: AA0mqf78tC8zLLLrVwtpZodpwAvwC85+Ssq8kXfWKY0JubDzNVdSXmpR3zF4XZLm/lh/NF7M8xCfCw==
X-Received: by 2002:a5d:6745:0:b0:241:b2b2:7c50 with SMTP id l5-20020a5d6745000000b00241b2b27c50mr4081224wrw.613.1668771112672;
        Fri, 18 Nov 2022 03:31:52 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm9894817wms.5.2022.11.18.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:31:52 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Fri, 18 Nov 2022 14:30:21 +0300
Message-Id: <20221118113028.145348-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033201_349414_A21D85DB 
X-CRM114-Status: GOOD (  15.57  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to the top
   level definition then adding maxItems: 2 under the MT6795 condition causes a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
 
Yassine Oudjana (7):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  220 +-
 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  227 -
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 8 files changed, 4800 insertions(+), 259 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

-- 
2.38.1


