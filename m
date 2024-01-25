Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F04FC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NO/Zc4uKraRuME+gHTfVr/GjjhDqS6UPAwJbWwu/3s=; b=aVPHjl8hgJ8dTHU3ERRFCygqgh
	3ehlK4Zi4DaPtlPoQKsxNYZHoCYYXViSiTXGqx6U++uPPOEK7ySRXvkTabDkVxGkeFOKmIGNubB0t
	/SyIPOR/Gwx65Offmwt0wdBzrRb9hD/iSda7T6BL73XZsbQ/J/AXRUirTdHTPzEdtsaYwA5TmLLM8
	Uy30AXU+DgurUo5sbkVcyO+lrJ8IpUTrbaM1DXIwyojGU33LQhYjs3UAJ9R0BW71rVL7MF1Ud9B+r
	q4ZRr3HcUImvc49AFWx6Rdbc2kuRm+VLTX9nDPzgzm2glh3y6fDHkW/sS4qzY0O/AmhERP9CCVFJn
	158FBXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwPp-007fIf-0x;
	Thu, 25 Jan 2024 09:52:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwPn-007fHI-0L
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 09:52:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6dd87e7c355so1630448b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706176373; x=1706781173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NO/Zc4uKraRuME+gHTfVr/GjjhDqS6UPAwJbWwu/3s=;
        b=GZ3FMm3LFxVhrywcUdsrHRG/AeDyhbo41ZG9mDPrqh0uuDnwyXvM9scEWkmV7U1h8l
         i629h/OmAq6Ld2CCE3lstgf0diILeZcR0EN376GWmvUrFSfWNXU9JWBCeWwim6HuyJXI
         3oFgs2W0H6eAJQ1De07Obq2sdicpWLBnac7Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176373; x=1706781173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NO/Zc4uKraRuME+gHTfVr/GjjhDqS6UPAwJbWwu/3s=;
        b=nnZp2DKgS3vKF5oXE2jyg+s3gOjm/JWEXcIdxnvgTkVMkR10YMKZwEufXJi+7Znkn5
         nUuts1rmWC6nhdmlhfWS3aq4PKpdqJdJHcWlHCjFxg5Fnj1gqQk4+E9Vh8CdbIpV3gHH
         p1ahFMmkQzwwATovRdUBrmbIM6T1JFGgwKWr7mL7thIPk3VbDcvFtTG0nj6pLWo+WE0G
         KICM2YNEM/XtvCmOgeS9exdkdAs6kQeTllJ3EqtIgTYbzk5Ht0xjjWmY5bvS/SMFtrXg
         GTkNo3V3ZTCDu7tUBv3+mZHCKpuK9lxkxX4t5ZYIfHmkBiG7sVrkqmfA/22aJuPvlZwH
         lniQ==
X-Gm-Message-State: AOJu0Yy/t225bD+2zJEz47JZnD9VNefOaL5KY2sFEyJkkLLpIu7WxeWO
	W+0KN8MAwz46Jk5i4zRQiK9Hmq57GpBf2xmtTToeWPa2/eYLpOt8F4zPfg5UUQ==
X-Google-Smtp-Source: AGHT+IFz5roRh966c3riGPD3IUjKL6oQhDWhSIiqYZQ6AAZe7dRuh8xja37v3AWjFcAW8gI3Ezje+g==
X-Received: by 2002:a05:6a00:1955:b0:6dd:c1b4:5e61 with SMTP id s21-20020a056a00195500b006ddc1b45e61mr366982pfk.69.1706176373418;
        Thu, 25 Jan 2024 01:52:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7fb6:ed02:1c59:9f9c])
        by smtp.gmail.com with ESMTPSA id gu15-20020a056a004e4f00b006dd8a4bbbc7sm3228275pfb.101.2024.01.25.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:52:53 -0800 (PST)
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
Subject: [PATCH 0/2] bluetooth: mt7921s: Add binding and fixup existing dts
Date: Thu, 25 Jan 2024 17:52:36 +0800
Message-ID: <20240125095240.2308340-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_015255_173623_861BC968 
X-CRM114-Status: GOOD (  13.84  )
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

 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   |  3 +-
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

-- 
2.43.0.429.g432eaa2c6b-goog


