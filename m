Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC5BC001E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAUiGhJM5qG7OX6mRIP1V08NHkhKxQbeca7wqYfG1ck=; b=u00WXJsxiTn8xPGrmg5lDPvQSk
	VnTOpZO+F1+KeopZI3AwRUU0d8qQO4+h5KdcdhGXMUUc+ua/GgNPhj/X7xl+w9GSwCCJSJVe02wUw
	VOaeKO5nKpgdGoZ7t9drci8OHet9cZ3z8TJ8MkEUjB3Gi0JlJbS3X7esW1jZcXW8Uz9I7BTEuyQ6/
	kuqp9Jnit5tvu0dPX3YeHfdwULanaMzmaPKmvnV1DgbuByZHR3TwGlpjDrHl2dU8ZX68XzEqnBJX+
	NrK5uwDANsOUgReQmUNbD5JvJEsJFPKXmVWWGYmKzJeGYPo+V5zIg5Bmrj1mpqN7XbLPsoNSWi67i
	4wIpnTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkR-00D0M0-2y;
	Sat, 12 Aug 2023 09:17:27 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkO-00D0L9-1O;
	Sat, 12 Aug 2023 09:17:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 045391BF208;
	Sat, 12 Aug 2023 09:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691831840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WAUiGhJM5qG7OX6mRIP1V08NHkhKxQbeca7wqYfG1ck=;
	b=S/Ujxv8p5lVdHotql81+u9Mbu6oGIGhjka9ikFKgTlCv7dX4Kkr5eYBVuKP+KZ51CwKHez
	DcGupjkhiq3Xw19MiEguAtBcaeHN18JebZ38PNj89/H7Il/A17WU4tQ6nmSHeDgzO6xlLn
	t4cRv7YM4H1i8Wx+GAdOaXPa61BI2SdSpotjIzD4Qbwz6jBt0h4dkRnkbm+rEZG+NQqp0N
	BxT7NSbKZrCd78bRcQOH/zGyXRFW79FAXG+QDM2FTv6KpCrxCVaSA+kHuLti4kZSzlaONp
	Jdp1GQg5AkPa6OjtlCjVXuvcWqKgB4cPNciISBrtbHXVJgM+ko40TH8xPdrkNA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 0/4] Document internal MDIO bus of DSA switch and support it on MT7530
Date: Sat, 12 Aug 2023 12:17:04 +0300
Message-Id: <20230812091708.34665-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_021724_615224_C81E167E 
X-CRM114-Status: UNSURE (   6.42  )
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

Hello there.

This patch series documents the internal MDIO bus of the switches
controlled by DSA and brings support for it on the MT7530 DSA subdriver.

There are also some dt-bindings improvements included.

Cheers.
Arınç



