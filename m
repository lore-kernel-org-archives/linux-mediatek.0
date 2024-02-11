Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08801C4829A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XXP6rRuSuhpj3qhcdk0ROpSfFQMPM9dLW3DXtXsKv9A=; b=J61ZaKNiqlfIKXOpYadOL043CS
	+6iD+bVzEBLOyuAWZDW7b9748hb1WLSdGc1MY3Sr38EwHDTc+yw8jq6HXWi3y38w2i36+oVUNca6e
	5NJ85CSXrS5DKc/TmlEReJB6JcqvtkA6Fh/sODlFcvXkzmIBKiYckzptr8mGINFJvhy4BnHOupTb4
	JTtE5zHzhoULalCShqKVU6Yq8yPXht9C0Lq72uL3a53dT6mS1/3yn1Yn/VlTHvu+KWSl4UFPNnhoo
	82L0nJwg6uVBoBjgJh/5XAghuu0CzBNtpu2wnFRAlkkNT2OEgPdgJq9w7n0Nk/wd+2r5gc/D46KzC
	92IKpiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHY6-00000003Lzk-2bJO;
	Sun, 11 Feb 2024 21:39:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHY3-00000003LyZ-1S0c;
	Sun, 11 Feb 2024 21:39:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a3850ce741bso250894266b.3;
        Sun, 11 Feb 2024 13:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707687575; x=1708292375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXP6rRuSuhpj3qhcdk0ROpSfFQMPM9dLW3DXtXsKv9A=;
        b=gjJX/gAjh1bjcKyyhBM+9eCfMOV9Ai4tbaq/DeKGgTQkJHZiZ/whniNvYNBfZxqGZJ
         RsYEKbuwyuPC6vmT+ZaNRQMcFFO94UU1PB/olQ/wuTspkEJsWFHp4FgzGaKOmf/XtaRD
         ywU1sD3OPuoVeRD4A6WF5h8M+odVJShNj32QtqZEcGqAyIZu+RFElcTpBxbzNxEt//RQ
         G4DFqLwfgoPpI20mLnw5sO0zkF/lV2WFTkj4cU+zYgnFvy1ThpuYT75VNi8C+v3/tJU2
         mWTJdaqivS0JYgRtAVwFs9Np/KI5WctAiAqRsNQkyBxo4ugjdVaXsjrhJ6Fn14o/6gqj
         ZQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707687575; x=1708292375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXP6rRuSuhpj3qhcdk0ROpSfFQMPM9dLW3DXtXsKv9A=;
        b=TCcNqI0636LayckDKCMBkwGTGrKWTM4UKwqjg9aSHu15kEzjdYLcCixtPxWtgI+D5q
         Nyj+7y6In5OYoqt1B++LqXQ4G+lDpwXY+jlNfV+pS6zcgCtcXZrxKdkbSUoMRjxXH/sZ
         MW58G8kk92ufENCDiHpekqmXcHwsxjb/1088avbb5C13tPsgjjJWCU6Qw80o4foX8cj3
         GLMldH/PEXfov/gORw4a5CX3UFdzOj+QVLj1zYtnvfSw/bx38UcGn0hQcYZ6gWPdGO7A
         bfEgDwpAuC7uzk4PYASZn2MflQgIV6JPTLxTr/xSSu+ZUJd/xCaAl/wkTyfHCH4KsqG7
         P7eg==
X-Forwarded-Encrypted: i=1; AJvYcCXkaqeCd6jO5g7M/SaxjBUB7u3L4K2cB7VF+TdecDHJGKLu2fR/2x64lJySh1txbC4fmNSVmBpj7Q1+oi2avkoA15t5a89ZaxHLSkXKOKB0bIxw1+RKxZ1kKZeVuE+UPl8jU6heTlYee2WNQXJ6JMqPNezJ8AxyKwc=
X-Gm-Message-State: AOJu0Yyd/eYg6QEJU2TOrvSGuM2+jwjOvPKuIZMcpeC7k1QBOI7dS0Eo
	hCA/3yQWESYKBT5Z/GYF1t3i1S/4Wvby+x6aPqccofYnhQI1yvJU
X-Google-Smtp-Source: AGHT+IFVGzQFDZaB15caEdzv/S+0ftQ7S5MLO9wsKeY/jCGq+9Ri4eIH+0EbIyZcz30JV0xyv8TL8g==
X-Received: by 2002:a17:906:4544:b0:a3c:8bfe:319f with SMTP id s4-20020a170906454400b00a3c8bfe319fmr1099357ejq.74.1707687574886;
        Sun, 11 Feb 2024 13:39:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe/erHX0IhHagaiiBCebAgfY03CfDoycttJ6BPox0CSr6uApzK8+4fKAGuQ9x/TiWB1x9S70jW0KH3Kgrghbgeh/SnLVsp0p+BwAb2Dtg7lDg2LraL2C+TVVmpCec5BoDnAg8YXLady6EXC0JwghJiduKEVfMKwtM2Zd63Wt1d/UKQ3chX4r1IHobElAjBbljQnk7GuBisZYOe1Aw77jRGQDLpF8D7sg2WD69vw50beNcM9iaoi6YEvpnTs9f1c+axEMqOpp5PaSS+dkB22uZzgm4VxkNdAuNBI6dgpAQLqUnidhuE9FTKcYqHm6DjtPsITn6SkLdFUCb+r/QiCCLuLdNsd12qrqth/HondIyYPX0qaWKf8lOT0R0uipUS+dcYsKUOHDpjrIVadmi3JycxMe4vrJ49iYg1i5P9wOrHP4C0eUMZTWr6+coo7UxEe+9I91J6PaT/KUWjaT/z8d1yXlcDvvVQ7eyKBEu0AjjungNw+v+Wga4jTs0uopu3a1YcdnE=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ps6-20020a170906bf4600b00a3c66ac512asm1206344ejb.214.2024.02.11.13.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 13:39:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 0/3] dt-bindings: arm: mediatek: convert MT7622-related bindings to the json-schema
Date: Sun, 11 Feb 2024 22:39:22 +0100
Message-Id: <20240211213925.18348-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_133939_415121_01086EE2 
X-CRM114-Status: GOOD (  10.22  )
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

There are more MediaTek bindings to convert but for now I focused on
those used by MT7622.

V2: Move bindings to /clock/
    Use clock-controller@ nodenames
    Drop incorrectly specified "syscon"

V3: Update titles of all 3 bindings
    Simplify HIFSYS compatbile (drop "items:")

Rafał Miłecki (3):
  dt-bindings: arm: mediatek: convert hifsys to the json-schema clock
  dt-bindings: arm: mediatek: convert PCIESYS to the json-schema clock
  dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema clock

 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
 .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ----------
 .../clock/mediatek,mt2701-hifsys.yaml         | 50 +++++++++++++++++++
 .../clock/mediatek,mt7622-pciesys.yaml        | 45 +++++++++++++++++
 .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 +++++++++++++++++
 6 files changed, 140 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

-- 
2.35.3


