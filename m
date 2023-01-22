Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EE1C25B4E
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Jan 2023 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqWzA2A8s0W3l1TM/BzQd4A0DOG2jZ8sXCG0x2a12mA=; b=x1DHNlvaADm1UlckMqji1wzpXT
	GT2e7JCBg9NFtd8w93YllGHXJV3jHamdgZdweKnoYvE3HKVYxrtDzGQLblFYDfMg53z8O46uEdN82
	ZrSyxAsBzUUQNjh74nqzpO4tiogaY3aOEbms9H7oJ1fB4pGiB1AsdX7vx+d6bhAQ/JWPt2o+WrbZh
	603PUI2yiG5id3gU9h8RPc6UtavzmLnBVQXuu99nkfDPB6fSpjKM/zabKI48tst6VneTfDV+F0iOe
	uWdNXK4c+zs1VoEgetefG3/dOhNYLmlomP3ghT2FWLuJkZGO8/fHCr2nugUNjeACEaf0kXs0hwcxh
	Ydzd7P6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJf07-00FfBh-Kw; Sun, 22 Jan 2023 18:23:31 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJf03-00FfBF-RL; Sun, 22 Jan 2023 18:23:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pJezw-0003q9-17;
	Sun, 22 Jan 2023 19:23:20 +0100
Date: Sun, 22 Jan 2023 18:23:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Jianhui Zhao <zhaojh329@gmail.com>
Subject: [PATCH 0/2] add pinctrl driver for MT7981 SoC
Message-ID: <cover.1674409777.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_102327_921383_2E1FC2C9 
X-CRM114-Status: UNSURE (   9.94  )
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

The MediaTek MT7981 SoC is the smaller sibbling of the MT7986 SoC.
While MT7986 is already fully supported in vanilla Linux, only few things
are missing to support also MT7981.

Add pinctrl driver including devicetree bindings for MediaTek MT7981
which together with the added clock drivers[1] completes support for the
most basic features of this SoC.

A complete work-in-progress tree based on linux-next for testing is
available via Github[2]:

[1]: https://patchwork.kernel.org/project/linux-clk/list/?series=714497
[2]: https://github.com/dangowrt/linux

Daniel Golle (2):
  dt-bindings: pinctrl: add bindings for MT7981 SoC
  pinctrl: add mt7981 pinctrl driver

 .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 475 +++++++++
 drivers/pinctrl/mediatek/Kconfig              |   7 +
 drivers/pinctrl/mediatek/Makefile             |   1 +
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     | 957 ++++++++++++++++++
 4 files changed, 1440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7981.c


base-commit: d514392f17fd4d386cfadde7f849d97db4ca1fb0
-- 
2.39.1


