Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F307EEB57E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qfTMyu7w9EdB+2oY2ut2KdGVFrARYqqHBDzpkPEqJG0=; b=cO3G7T2+PvJk7b
	JKB1DaZpsQIQZY3IRQeP455jXfauZkUOPlB69/+Sji8MdqlUNPlhBrpBY8/9LzvyganrC1tQUx+P2
	3n2Uvu+9qY/3x4kNE+GxyNp7pyoQYISPygHs7R3klaIFPJzSHTY0mujRfC6wP2mP85/pV7d+qqjdk
	3sieCNa94KFhKZloI0wnGsOrF/Fjw7VE1N2kIvXP9u2vVScAImoZYGN4bN8RQ6N3Buql3qCX/dgmh
	YkPedYejWAeb36uVobW95qE0DkazI9CuxIxV6jo1F3zAOqMRK/B4LnS5jdySmL1MbwEQRrY3W3nA6
	mUNP70K4phuUPNXaFQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qflji-0018Bj-0Z;
	Mon, 11 Sep 2023 18:34:14 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfljd-00189V-2k;
	Mon, 11 Sep 2023 18:34:11 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 215124007F;
	Mon, 11 Sep 2023 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1694457243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfTMyu7w9EdB+2oY2ut2KdGVFrARYqqHBDzpkPEqJG0=;
	b=X2VjIad8wgPnA1JFGNCGEj5JtB6knClj7qJrjJc+4x+ogd/eUolZzWJ4Rp8WOjsBODMdyc
	dACn1zOf9jd+D6VRVMrIxlxZvZIEwimFTZ0bPSCHPK4fMVZt7mEG1H4Za1gM/OdpEBCp+R
	y+002/BqsQh9s6pBUtfFcMW1x+z6E8I=
Received: from frank-G5.. (fttx-pool-217.61.151.158.bambit.de [217.61.151.158])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id DBD3936055D;
	Mon, 11 Sep 2023 18:34:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 0/3] add LVTS support for mt7988
Date: Mon, 11 Sep 2023 20:33:51 +0200
Message-Id: <20230911183354.11487-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 361255a0-031d-4400-a9e2-6c671889ea48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_113410_075877_11CDC0DD 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series makes allows soc specific temperature coefficient
and adds support for mt7988 which has a different one.

Frank Wunderlich (3):
  dt-bindings: thermal: mediatek: add mt7988 compatible
  thermal/drivers/mediatek/lvts_thermal: make coeff configurable
  thermal/drivers/mediatek/lvts_thermal: add mt7988 support

 .../thermal/mediatek,lvts-thermal.yaml        |   1 +
 drivers/thermal/mediatek/lvts_thermal.c       | 129 ++++++++++++++++--
 2 files changed, 115 insertions(+), 15 deletions(-)

-- 
2.34.1


