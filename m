Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E3C54E49
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=; b=b4sXqpKzCAc+vS8chLJADEnt8R
	wnqxZWhZNKiCHfP0bZNqwy0YVXDkHuhdH8RUdC7XlL8o9cpuLrk6GAJi9gKAYSHuDhE4QbJQ97PDH
	2dcToBEQTo3/3mXOGL7gS1qj1SsIxrb/8g7wfCwKDhnx8cTm0RYtSpOQRHB7D9HwBn+Um5WQgt2P0
	yuzWDSnn9DR2++Mw/u0QnzONs3UUNU3MwzCWHdqrX2PGnDvSWDeIt3Vae1U+uryj1QRE9WfpfuQvI
	Qaxtqcc8iO0YcAjfkomML9YhiEAb1kt2Zr6hJfffIKDEpgV2RTWO/8it0C8eIF2FPxQwQmlq6JGuY
	ZHIVGf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScp-00000008rhD-1bZV;
	Fri, 23 Feb 2024 10:17:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScG-00000008rYn-0sR0;
	Fri, 23 Feb 2024 10:17:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a3566c0309fso27821866b.1;
        Fri, 23 Feb 2024 02:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708683434; x=1709288234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=;
        b=R8iIkop042AYO2NVhHoTgJCqa24WpTVlku0eOnusjpd9i7w2XAoE7T368iLnPfe4BO
         ycYudxIen0mbK/9jM+jAq1wYn9N+JkJRlilIH9xfSFpflIgUkeFC14hZaoOeORVeV7UN
         UfniAjQ3pR1iLVGS/C9zCjzAqpte1NXi6Gl1YGKXiUR0vAk8nrvi10Zv4bg47n7Ivd8V
         Qr3V11SIH81UNI7PenuCg/ID7UDIH6rr6IEnZ0Q/rlMErk3EBYvBngTDf79E4AixOg35
         5ZUQghLedVa7NMMMLhux/FPQ24scHfeitzaj+t0VTcolmIdUSxcNvHE2r6SFrDFlu3T0
         0jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683434; x=1709288234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKqhZPN7QFsjLPpu788l1fzAnbgMEFuSuh/7MopxlUQ=;
        b=lEU2Kkc1w2L4YMNpz36+LjJBt+eS7yluwPIIMRiEY+UA8pJda7NCmcj/oww/+0jloy
         ILWSYDrnGUY1vcmNWhn8Iptl2XiRGaB/Xxhht8huSWD7W0EafRW//2prtZ+eQQ1fbgec
         60h+DD1t9vQrDr2bG2sfC3D08/EC4Jav/U95FbB3Tu4fnQOMiy5l4MUmYSapfXslOOvC
         wqD/C/PTek3mZz+sKdRb9z2YzWIsM4pCDP7HDGBD4EkhTCg1rAlgtMfXsPHQoj8L3mbR
         WrMzF/yRdOU3ZVa7FYuDm2dhgu8M4usDjDMuvCcnLfmHRzR380CTsn7YL1bhuDLSMR3V
         RM/A==
X-Forwarded-Encrypted: i=1; AJvYcCXE6wGtPi365bCXdDVyF2rBh3+EyBcyaN5zpBtt1M3FU2OqCMJRVf4b9CwE8gdn/Ohxsr+f+5UH+94iqT3/yVbBAqVvn10DyID+k6alXQMmBY50Mb7mb13FPMnaDPFtfuMkx245gmGeeB20i/hTfcDT9oz+9Jn9Dk4=
X-Gm-Message-State: AOJu0Yy2/pT9z3desXmLJLHhzBqxdaPp44E8xYIYgiimzySAFUYezQO2
	YIxbFS+d4CPFDbrQqrBVTuNuPKqHuP3PgPLd0GIrfdO2RJbb/c7H
X-Google-Smtp-Source: AGHT+IHoB9J+dJYQcazfnWb1yekpQwyTDdvcQJglDlRe3xWoGrqXygy9/ozIWp27JxUIezptovLTJQ==
X-Received: by 2002:a17:906:b0d3:b0:a3f:8f30:d094 with SMTP id bk19-20020a170906b0d300b00a3f8f30d094mr927527ejb.44.1708683434188;
        Fri, 23 Feb 2024 02:17:14 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3d99dc3f3asm6667250ejc.67.2024.02.23.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:17:13 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/4] dts: mediatek: add Cudy WR3000 V1 wireless router
Date: Fri, 23 Feb 2024 11:17:05 +0100
Message-Id: <20240223101709.30072-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021716_310996_A9CCB9CE 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is a MediaTek Filogic 820 based 802.11ax wireless router.

https://www.cudy.com/productinfo/1637722.html

Rafał Miłecki (4):
  dt-bindings: vendor-prefixes: add Cudy
  dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
  arm64: dts: mediatek: mt7981: add pinctrl
  arm64: dts: mediatek: Add Cudy WR3000 V1

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 22 ++++++
 5 files changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts

-- 
2.35.3


