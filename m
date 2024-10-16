Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE324D1AD2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mvARbqpJ0ukMM8eVJDtDBpdcdn/sTBaKZ+KDs43CsM=; b=FTbUQSS1giDPj9pNFy2GP6iY1R
	5TunJcQTk4olSkhVYEgYBBTGY7X/SQvXPhzMJGvyFstuI4XrK9BwEwMhYHLc8DRkJdLNkfScY0dpJ
	u4KiEJTxdBL/zxw4eeaxi4niH+o6IttiOX9BWBwAhIziDnR0WjtGSH3OY2peptnT5m2nee9gO+gqA
	sIuoCZ0kyMDaRmqIBWXBFf1s2cWWdzvsEhqy6u7aGTjUB+dwzdl+8Cobwogp2Lk/r7CP2soD8nVQx
	PEU9rsI8U4QFYPrdcCfwOGNVcJSoqdsP4cchPX1SMhWax1Ui4VA1w0Jz4k9YK4sR7HmAYlKWRBto9
	0EwyeraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zE5-0000000AzYA-3Vpx;
	Wed, 16 Oct 2024 08:17:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yzj-0000000Avzl-3lb6;
	Wed, 16 Oct 2024 08:03:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80D265C5BDB;
	Wed, 16 Oct 2024 08:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CC7C4CED0;
	Wed, 16 Oct 2024 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065778;
	bh=VQWxLbP46Yk3JT2ruUu0Qw3xjvSUtKf+K6RBYmBe+lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdZQu0lvkqQKp6i7wnzriOv0ggkWZWcHotek7nZZSEdw35cKxZpgEDMR9IrMPXZbQ
	 WYoop23uy1X0RnPZxv+h22a0dffsyAWGe47B3VkLwdnV46GNOwJL0i3dnbOWnL5pqV
	 omdNB+UMVqzfLHYIcQhnCKXUFkU6z65UbCHDFkDyHmnnjxUI+O5bzUMFG8CnQdhrus
	 XL9m9kdJ61u2FNby/2sWKy01wPxw1/DeGD4aTCMMTOmDF7gVJmeIWCVkItZEaRNeJH
	 MyKxVJEiK6L05viEsJafMLkbLfvaL3SZzmumCECEL5gaUXlP26Z9cagMEpkoaYU6ij
	 1iyG5JVbDWBUg==
Date: Wed, 16 Oct 2024 09:02:48 +0100
From: Lee Jones <lee@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v8 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <20241016080248.GN8348@google.com>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
 <20241001104145.24054-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001104145.24054-3-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_010300_115619_1E31F3A7 
X-CRM114-Status: GOOD (  13.74  )
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

Argh, I couldn't bring myself to do it!  Here's a PR instead:

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-dt-mfd-input-leds-power-rtc-v6.13

for you to fetch changes up to 6e357f572638547e9c9e8d8abb7dc572c12032f3:

  dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format (2024-10-16 09:00:38 +0100)

----------------------------------------------------------------
Immutable branch between DT, MFD, Input, LEDs Power and RTC due for the v6.13 merge window

----------------------------------------------------------------
Macpaul Lin (1):
      dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format

 .../bindings/input/mediatek,pmic-keys.yaml         |   2 +-
 .../devicetree/bindings/leds/leds-mt6323.txt       |  63 ---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 588 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/mt6397.txt   | 110 ----
 .../bindings/power/reset/mt6323-poweroff.txt       |  20 -
 .../devicetree/bindings/rtc/rtc-mt6397.txt         |  31 --
 MAINTAINERS                                        |   8 +-
 7 files changed, 595 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
 delete mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txtThe following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-dt-mfd-input-leds-power-rtc-v6.13

for you to fetch changes up to 6e357f572638547e9c9e8d8abb7dc572c12032f3:

  dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format (2024-10-16 09:00:38 +0100)

----------------------------------------------------------------
Immutable branch between DT, MFD, Input, LEDs Power and RTC due for the v6.13 merge window

----------------------------------------------------------------
Macpaul Lin (1):
      dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format

 .../bindings/input/mediatek,pmic-keys.yaml         |   2 +-
 .../devicetree/bindings/leds/leds-mt6323.txt       |  63 ---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 588 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/mt6397.txt   | 110 ----
 .../bindings/power/reset/mt6323-poweroff.txt       |  20 -
 .../devicetree/bindings/rtc/rtc-mt6397.txt         |  31 --
 MAINTAINERS                                        |   8 +-
 7 files changed, 595 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
 delete mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt

-- 
Lee Jones [李琼斯]

