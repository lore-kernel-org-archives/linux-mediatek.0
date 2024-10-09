Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8CCEE336
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UpGS3gTyhzjjSZbO4X6Vyyq4IACP8SWP3ZnkGETPtLk=; b=NbbqmKuvHmBszf
	l+eA4f+QRXJLJrd8tYGnTQQv2+KPdxmTUygCFIWpT5cjSs5pXESSLg+UTczqo42Ou9VTI/ppsVUn4
	PJYuDSCMJFUhAxS9DfvEBFtadcjvoe6YlfGuPHS8qDO84aCAdE4OuYi8EuPD15yBh2rDhRegAfsD9
	xfu12a/eQHz+N2hHShSnFpCEkB0PXSdKLf5UIXBNAd60zj/zCotMEfHhHdXwtAC0ANXRXPgV0I3Dg
	KkMjBKr7JS0+pBa5qOAvodRSh6rtMRXLRJcvbG8RQvAe1OF5L7qfgerYBF7kQO6wrtNowbPojuxNq
	pVHPBtoevPiMRLiO6yqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syacL-0000000ACr5-2h3S;
	Wed, 09 Oct 2024 17:36:57 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZvT-0000000A4U7-19Hz;
	Wed, 09 Oct 2024 16:52:41 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 6D682616A2;
	Wed,  9 Oct 2024 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UpGS3gTyhzjjSZbO4X6Vyyq4IACP8SWP3ZnkGETPtLk=;
	b=OQ+gFqKFt8WwUNnxdIoSGv7v/PpLekziwmGcij40gQBc7yTtBy4GK+wqJZomr5vHHLewkk
	Erdbl1b8e1c9n9UDQ4/ABCisTyyG/nzFIHpLoVx8AP5jfEs3nPfV0oO3d2ahTm5Mj6mkKo
	RuckdCa8u18CVDZrtEg8QfHFi3XG0vg=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 54B628023D;
	Wed,  9 Oct 2024 16:52:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v4 0/4] Add pinctrl support for mt7988
Date: Wed,  9 Oct 2024 18:52:10 +0200
Message-ID: <20241009165222.5670-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 7027da39-35ba-43dd-9915-1fe059df1531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_095240_210400_DF89CCC6 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

changes in v4:
- fixed fixed string binding error

changes in v3:
- rebase on rafals dts patches
- update binding to have mux subnode as fixed string and conf with optional suffix

changes in v2:
  binding:
  - drop gpio-cells description
  - move ref in mux subnode up
  - order uart-functions alphanumeric and fix typo
  dts:
  - fix indentation of reg-values

Daniel Golle (2):
  pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
  pinctrl: mediatek: add MT7988 pinctrl driver

Frank Wunderlich (2):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: add pinctrl support

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  571 ++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  241 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1526 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   59 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 7 files changed, 2406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


