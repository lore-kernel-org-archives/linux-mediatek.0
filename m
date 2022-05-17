Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jsp23ffZtbX1VR/X/iZjS2I9GEbhEqI9DJfz9pltxZ4=; b=yfxJfCPlNv6pbc
	crcRPck3PoWiIEniyb7wp71WXUeS6YYy3nINAIyQGpTr9CXV7LN4AuH+5D5pMkVKOHwK0/dnrmuHc
	LDuPrIwmOdooKgNRH7bn4y0ioz/pD4YbrknnqBUi7yegDICo8a0b4/SQDwGcZXutV7fdfDdvpkDqU
	BbVY/zqs0Og/euzZbC72cNq+uVEw/9YUCNXWM4BjdTHxowpBFki+U5c0NE5oBetxLoHt/kN+qv8uQ
	+wT/vEB1HJ02xD8Ov4esyoh/segdejHSXpUzMGrYzm4tGkkWiKFVDFbej9IyS/T3h3x3rt2NLTbNl
	bwuTrkod8d+47zVPRHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqskf-00CVhw-6F; Tue, 17 May 2022 08:40:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqskR-00CVbx-9q; Tue, 17 May 2022 08:40:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 14AC71F442B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652776802;
 bh=ejXGkWEU9/h8Gq6inz9Xqi8NHp2mWLXGwzZX33ZE2hk=;
 h=From:To:Cc:Subject:Date:From;
 b=M7+lCY12v+Sz9bXV5nqYxR3B4j9JgL50K17F45jPhYbkgWyrJsYxhxxz2jwfRxQbf
 YbeaCq8YQzHeEvaZ3wfQ2KT+OhftqhbdGoCzMhZETL2K9sjQbTkwboRcZY7cHJ7mG/
 Qj9USxiVhvmPjUVeFSu/BIud9YeHh6cbHwuuUTM7QrpGjyToQHKQ491tIRznfQGVe5
 2VeEYar8c8mab0T+UCJXNR6U8vPXN0eQrYkOuZOMGYY05pzhpjT4rKg0/jUuhtkJll
 bd392YPj3HLcUddBjUjl9+DR+88gpaAUZZOhoBPxoz+Mln7sbeOFqO2Uv572MMfho3
 BeHOYnm0URvsA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: [PATCH v4 0/2] MediaTek Helio X10 MT6795 - Pinctrl driver
Date: Tue, 17 May 2022 10:39:55 +0200
Message-Id: <20220517083957.11816-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_014007_600830_FE5166CC 
X-CRM114-Status: UNSURE (   9.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces a pinctrl driver for the Helio X10 SoC.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

Changes in v4:
 - Changed license of mt6795-pinfunc.h to (GPL-2.0-only OR BSD-2-Clause)

Changes in v3:
 - Fixed $id in yaml file

Changes in v2:
 - Reordered commits, dt-bindings first, driver last
 - Fixed yaml issues

AngeloGioacchino Del Regno (2):
  dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings
  pinctrl: mediatek: Add pinctrl driver for MT6795 Helio X10

 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  224 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  623 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6795.h | 1698 +++++++++++++++++
 include/dt-bindings/pinctrl/mt6795-pinfunc.h  |  908 +++++++++
 6 files changed, 3461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6795.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6795.h
 create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
