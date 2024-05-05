Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E7C25B10
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 May 2024 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RLH3io7UNKePw3EyOdFULg9Ms10FSzoi3dnG86S1EXo=; b=C4/USZaQTAMbeA
	yLUucl3zfPr05L1eQ7ft4gmym9dMd6xLpqzQCtXQebMKpVpYFzYtwurMmKqGyHOv/E6LnFDmNsHwo
	TJqTjNpTsGLaYO1bDt2BOSoE7UPdlkZNkebmB6rBPwz/mEyhbgCHZjKTjHc3Vk2LrlSaTk4wpn1Ni
	6VCm8W0QVOUwm7H467NDrRUlDfdDiA/GyiLYR6ji2u6wtekpEKqjNuihJ79G6SP/qJNt34R0f0s14
	C+iwz1vTW36Cn4rxuIEi1aUDYgzmtgr13A4tcuMeirv/FnpJ+IHeZYkOHxmSpuGT+GvABC69z5A3H
	RoWvbTmYJo6LxJ4ZR98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f0C-00000004puO-1zGh;
	Sun, 05 May 2024 16:46:16 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f00-00000004poM-44st;
	Sun, 05 May 2024 16:46:10 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 0AA035FC1F;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RLH3io7UNKePw3EyOdFULg9Ms10FSzoi3dnG86S1EXo=;
	b=UW/d8YIV0QSPsg1hKTYKgbmMNM6nLY1veCdqtdo63qaDl3Q45beJJ0NPCWmk1DPpjOWU4B
	VYx69bxiAHIN61XNZNmP0839JzRASQof9+HWa29txjKLwatn44c4aydyTB/LbTOKapJIix
	uPYbf/vKvZlf6Yc8quEJocQ2tKzNpOo=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CAC4E360233;
	Sun,  5 May 2024 16:45:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 0/5] Add Bananapi R3 Mini
Date: Sun,  5 May 2024 18:45:44 +0200
Message-Id: <20240505164549.65644-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4acaa28b-d825-4c5f-b59f-9ec20eb5ead6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_094605_185562_C115D0A3 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7986 based BananaPi R3 Mini SBC and fix some related binding errors.

Frank Wunderlich (5):
  dt-bindings: leds: add led trigger netdev
  dt-bindings: clock: mediatek: add address-cells and size-cells to
    ethsys
  dt-bindings: net: mediatek,net: add reset-cells
  dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 .../bindings/clock/mediatek,ethsys.yaml       |   6 +
 .../devicetree/bindings/leds/common.yaml      |   2 +
 .../devicetree/bindings/net/mediatek,net.yaml |   3 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
 6 files changed, 499 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


