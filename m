Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5900CC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=faaWm9kKMcck2ImmwhnetGgTDP4WHiKRSvb4Y2er2NM=; b=ctXUS5VxcULtE2
	l075Pwr5gV0z8Rsz8WbC8SvaHAvng7XGeGmXO+I+iPt6nnb0/TULr2sCtEP2GI/l35L1ev3aws93V
	x0dAqWJvvq9Jow/5gE8Uv+w3Oh8UBb3HspsemYEofUzQpAoeQ143heBYAU2aUXz0s+HGlG7gYEzLt
	Radnc+GrwrH9HqhrHjUUkuznLElWuPuUuQX1s4udcOc5YzeBhxwwKfS2QtzOYCn1dRZOS5Qd+VU/S
	nCkbluf46CDAB7Ecynz8NNww6ngSs80B9UOc0/C6nA73IHnz2djDc6UhT7Rwr39IAVY3yK29Gwo5z
	L60pxPqtOE9LfgwEVC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQASJ-000KWl-2N;
	Wed, 17 Jan 2024 18:16:03 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQASG-000KVe-1I;
	Wed, 17 Jan 2024 18:16:02 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 452265FC7E;
	Wed, 17 Jan 2024 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1705515353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=faaWm9kKMcck2ImmwhnetGgTDP4WHiKRSvb4Y2er2NM=;
	b=x2pbTALCTpXpjTlSpbqC3CbYw83ZKHbpjyKWCW5LEU1zrgBGHziOM2hEt9jrSmRH9Q+P8E
	0CYzL4UsE/VqPJTdzPkoa9ZKjGMQSTcnutw/dA+0cJe+4LCSK2d4LKUqDj4A9iqTyjHtAL
	Md7Tdrl08PIPHBM4nLUnzRQBceXLJes=
Received: from frank-G5.. (fttx-pool-217.61.151.254.bambit.de [217.61.151.254])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 367C93601D6;
	Wed, 17 Jan 2024 18:15:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/2] Add reset controller to mt7988 infracfg
Date: Wed, 17 Jan 2024 19:15:43 +0100
Message-Id: <20240117181545.60355-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2b681597-9b8b-4c5c-8a97-97f5be73149f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_101600_626574_9C5A375C 
X-CRM114-Status: UNSURE (   7.66  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

Patches are based on clk-next due to recently added mt7988 clock driver:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

changes:
 v3:
   - start resets on RST0 offset (LVTS is RST1)
   - rename offset constants with MT7988 prefix (else collision with reset.h)
 v2:
   - change value of constant to 0 from 9
   - add missing SoB and commit-message for binding-patch


Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 reset IDs
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 23 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  6 +++++
 2 files changed, 29 insertions(+)

-- 
2.34.1


