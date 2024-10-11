Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADB8CFD36B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knj4iyceQ5slQxHMWQ23f65+4O6ZSQmh9/DDT8JHkyk=; b=DBilbWKc/HEurNBbf1o8JHCSf8
	MNYau2tEl+fKAouNSQsmCBtFWdBZ6mNjfnM1rm1+CLRPE+Ga6Bt7JsIcS8TcpdyRwrj720QOkF9/Y
	JF3Kn3xFBipO+a8eKtgplDXpXI84A8VjwYIy+vJrK7DetT7Ix4zf/LowECrbhuxkUz44UrSjc1tlg
	Rg9L6MYUEMVGcKz7J5Lxleu7sdKVYHSLJ0T8aQ8IEDUSQSoxA9O1HtvvMqCDe4j2TBLrmlV3gQETn
	umMvrTl6ZH+8tvjJHfSVadV4xLGnhVUMW4WrsMwDE4dDD2rMusyvRQ9FkuUj7gxGfWEbUTeQb6/NH
	tR7U+KNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEOw-0000000GDkU-2UYx;
	Fri, 11 Oct 2024 12:05:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEOr-0000000GDjZ-0lpv;
	Fri, 11 Oct 2024 12:05:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9932aa108cso300789666b.2;
        Fri, 11 Oct 2024 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648339; x=1729253139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knj4iyceQ5slQxHMWQ23f65+4O6ZSQmh9/DDT8JHkyk=;
        b=ZMXcdO9712H4aV2aU3OdZJN4UdHHfoTON9NcmtvVXvT/sIyshMifDc/g71sdhQrqBw
         CNpQG6EsgWFWoCqLk/gxiL6f54heR3vAuEatim+5gE9UvYDjxXEMUF6plZI4uT9yvDKX
         9ltwLVXrD8ICyxGLwciOZBw5+y1TTGQ+kzzT/rDpTxVJAX+Dd0MxtdLGb74g5uVoVTRt
         LUYtbn0xaX6C8P5ACmgqnYjk/37n5l3NlaHxLtbMhk4c0pw+4hStS8S/aUfKh87OLuEf
         362oGBED/30/PtF5SSDj9E1YUMFgGWDKBiMsF0zEX40zzGrYW9jpRJf0+mLnotacW2/f
         5Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648339; x=1729253139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knj4iyceQ5slQxHMWQ23f65+4O6ZSQmh9/DDT8JHkyk=;
        b=LgBllcc3ctK+n1VJ8f57i7x+OKPj3eCUPRO/DH1Y24Fzqe4Yd1VCl0/eSrmueHSNFi
         1wrA0LjvdgUpB6ZNUUqIp4WGgT5gPuXRWan92tOo7yGifgkzszFHWtC9/JMnyhUJdHbn
         OPSIumnKSExbDzNSXqpBW5/tPu9wquiZ4WH1JN/uPQMN6lhhaySBmD3fGNEeoANnVTLq
         hLJMYJu88lgd/tZb93p4ZTUP+X0dY+JHM9ocly7tLzgaaT9ZdhuC3TCPn6y723PAQPZV
         MeUycFeiYKZs+PPNhFstah2mU9R5Zm5FFCC7k9V+xWNn63V8L7ob24unUk+o2JNlGiNS
         0R3A==
X-Forwarded-Encrypted: i=1; AJvYcCVXX+URXWqCJmCSYHckdq3SeNnaZa2jItRBYLcT+eE/rs7WaqsQNGtaz4oBGAIWWRW7qALC75z9CjdeOlKJefPf@lists.infradead.org, AJvYcCWEE/JGDisSxf+NSS73xDJCPTRZWTWbQK2ivNJ/MKP94N4h78SusN8u5XU1imBDAJqdYVODp5Traer9FVYkYd8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDeG+n8NIjR+HQXEMRvRhjc/0savrjp9AANGYx1qfQyF/zECH
	hX+sdCQerghC7+mAM4TA5TV9fl2TIZ/QKHFAlAPYzdV1lBnJOfgv
X-Google-Smtp-Source: AGHT+IGMP8cyZjEIxPba+iTIKgstjGnGcwHKJB1zqw/qhTxhHKDo0hhPTQXebtPL0aKrYHvp68eRpw==
X-Received: by 2002:a17:907:9610:b0:a99:90b6:1b10 with SMTP id a640c23a62f3a-a99b8eea8bcmr224593366b.0.1728648338769;
        Fri, 11 Oct 2024 05:05:38 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:37 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/8] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Fri, 11 Oct 2024 15:03:45 +0300
Message-ID: <20241011120520.140318-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050541_255855_FB1B17D1 
X-CRM114-Status: GOOD (  18.66  )
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

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to the top
   level definition then adding maxItems: 2 under the MT6795 condition causes a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindings
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (8):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  191 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++
 9 files changed, 6221 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

-- 
2.46.2


