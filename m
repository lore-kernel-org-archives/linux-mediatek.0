Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AD2C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kD8JSa/wlHNA1KdEJbBxgwZ9LZz09AqTXMn/5iB0iI=; b=4pTYf2o9P7jJ6yG4KMyqEx01oy
	g/S6HcEnHL28hPe9H33CXk6iZWRUfkF/uHRPBvxNuZ2F2e+X9yX84j8OWv49X71b6mZGv+ds0pfAm
	ighCvlCfSGwoM8V1GSqflQuWOIEmGIP3oCZXTIggXGVSuRlIU1q8HDyUlZPfJYJrdnFj/CJe3eWzP
	HfGv3Kkd1eTlnah2U14c1F+IaYpPsS0OCp57hyWWOyKVPFat+g2XensnSFhHpFY8jGLIjZmWG/NLa
	qx8e6B+IbFyKAjoNaQyYVBbR+DLix0x8p3ru0U+i9BbXysIw58yx606W0NMYhnfIaLLsE4wgUhxf9
	jlTEAMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNE-0000000Fqvh-3UTK;
	Fri, 12 Apr 2024 07:31:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBNB-0000000FqsY-1ZLo
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:30:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso630239b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 00:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712907055; x=1713511855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kD8JSa/wlHNA1KdEJbBxgwZ9LZz09AqTXMn/5iB0iI=;
        b=lDnZT3vWfuqSWp+bCclgLwLjvHzIAV+Jn+77Y/An0uGDp1/m+bH3g1Up8ItD2N695q
         bHeEsd7Ga7FaMaF2JCJCY/Hnmh/9tNbx7vEWa4dHJ2Lr/0J6kkv+6u8mcDs9zmMVR7PZ
         lsMolX1jh6/WR3fiopZV1CVvhrwui/p/84EJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907055; x=1713511855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kD8JSa/wlHNA1KdEJbBxgwZ9LZz09AqTXMn/5iB0iI=;
        b=kQtPZc3kWsFf1lDve5NaRl/LO1fkKS/4ynumSS19t676MDRrnFfS4XjN3Oz+wVr6UO
         GxsQ3ZTqf5xvKkgi2RFksUflZVEh12cJ3FWTpgNb+nCrEn6jqCDJ9AbgGtsR18MbyQS5
         zPhBm5CCC3e/Yy3pnAx8VYtw50u83yCcRYGDOb8Gaq9hBCzD+xw9Ut5smfIGwAezmtAw
         nOfmkdKtyMXNea8qzvnVH7pnp5sivx6+fNcIygK7cUS8PG/h19q7YJ4Ud6FSx+kvZAkW
         Yzgal9bqkc1wfc/WJVEi+IuDsI9ooPIDfEuhucyH7zA+W5xPf8t3acpzYGlfRZOeAA24
         VPRg==
X-Forwarded-Encrypted: i=1; AJvYcCXuea0Ob0Ym88F+AVwbZV6Gs5mvwvreFzFolPdg+WEm8OK4Kv8JY9FI+HBsC5TCNLuB2WcS+Geqiu9sDFkTAKSVlXyfR+ATLyASPGQ64yL+01Xy
X-Gm-Message-State: AOJu0YzXXlMJAhQjClWZ0H9E872tM9WvgfpvUCB4zke61ghA4IAtyIto
	vwM/rYEuCfM/Ns/vLz5wHr4RzKKBrNyOWcUggtMnNPjhjW9EJaRiUa+lxvSRzA==
X-Google-Smtp-Source: AGHT+IH9TJ0GU71I2lqJVSkEubfs2YUSVV/7k6TyMcFaUg5ykPaPZHNJ1QhyNg9VCsr2/J7KXJRL0w==
X-Received: by 2002:a05:6a00:3d44:b0:6ea:e841:5889 with SMTP id lp4-20020a056a003d4400b006eae8415889mr2368095pfb.33.1712907054781;
        Fri, 12 Apr 2024 00:30:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id d6-20020a637346000000b005d3bae243bbsm2149609pgn.4.2024.04.12.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:30:54 -0700 (PDT)
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
Subject: [PATCH v3 0/2] bluetooth: mt7921s: Add binding and fixup existing dts
Date: Fri, 12 Apr 2024 15:30:41 +0800
Message-ID: <20240412073046.1192744-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003057_452604_4CF12A38 
X-CRM114-Status: GOOD (  15.99  )
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

This is v3 of my MT7921S Bluetooth binding series.

Changes since v2:
- Expand description and commit message to clearly state that WiFi and
  Bluetooth are separate SDIO functions, and that each function should
  be a separate device node, as specified by the MMC binding.
- Change 'additionalProperties' to 'unevaluatedProperties'
- Add missing separating new line
- s/ot/to/

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

 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   |  3 +-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

-- 
2.44.0.683.g7961c838ac-goog


