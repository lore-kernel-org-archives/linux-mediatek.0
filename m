Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hl3E1tS0liiOc+7CgQKZ7Yh1i1GuT1EB8CLGL1g5/m8=; b=R58fqDP/R5wq9eX/yByFzJARhM
	YhLhGiygbHmYtKmAR/MU7zUFRwkCD+8jD8gkZyGWyzBy2H0rr1rEv9DMzOZ/31ZF990e4Rzc1jboz
	IQXOkPZS8mXlRO8vR7KQW/Yh5w/zUR+vDOWr+a7plRPZuTeyGXC4U54xwRYl39p0VdI3G3MIbtSml
	WYH3xyODRI2Ja/0YFsGgbKDdlNWtrya9EdDm3W1Z5/J2F1gmFnk2kPMNIVY16nZ0khAWZTzlt8wBw
	TSrmQQjp2Cm0wPimMDZG/mzj5VOj3M0KPzMtox6otXvQrmEH7UiYoPWIqnyI3ZPDm52FwGQvZ+rG7
	zJxX7ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VfO-00BKAh-Up; Wed, 29 Jun 2022 11:15:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VIz-00BALW-0P; Wed, 29 Jun 2022 10:52:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5491F6601907;
	Wed, 29 Jun 2022 11:52:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656499936;
	bh=th90aph/IQBD7WzvP1T5xI7Z0J+BoGGihn+p98MgdkM=;
	h=From:To:Cc:Subject:Date:From;
	b=PaC0ppAX3eGZrvvQDeNsnTJlNLZplFQAsXVHj80izyQxTleDC7iToQA1pUvqrGu2b
	 ov+NshkMorDHzqC4rKh2/aIjRWzk3vlnh+VJnrJRem+o5LkEHOKww50eutPssles9d
	 OlFAtqO+Nv34jJMiPA5nB37Q9Gie5ZnknbuCywpl2dAyoCnN1Av6NDBMfFnIA+G/Yf
	 47RPKHzF0A4KA3jR84Odl0cFbMZT/jmYI/bj3NW/V8h4kITHMkb5GLU+7kAalSksU2
	 2Eekcjd5PFiEqFXneD4WzSfSyBI97pu02pQzILNHEaabUcSa1qwdNZhCHXz8A2P4Q/
	 kCxAiQPits+yg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] MT8195: Add resets for PCIe controllers
Date: Wed, 29 Jun 2022 12:52:03 +0200
Message-Id: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_035221_296012_76136026 
X-CRM114-Status: UNSURE (   7.18  )
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

The MediaTek PCIe driver supports resets from a reset controller and
they're essential for correct initialization of the PCIe controllers.

As a preparation for adding the PCIe nodes to mt8195, add the resets
to dt-bindings and infra_ao clock driver.

AngeloGioacchino Del Regno (2):
  dt-bindings: reset: mt8195: Add resets for PCIE controllers
  clk: mediatek: mt8195: Add reset idx for PCIe0 and PCIe1

 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 2 ++
 include/dt-bindings/reset/mt8195-resets.h  | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.35.1


