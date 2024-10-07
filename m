Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F61CFB45D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6TLu7Yfzf4lbg0y6z1FzkWz5coi/i50OEYYrcpN/ESs=; b=nDcpeHIAu3QCBj
	C0B70LJ7HIUzUjOStH/bTrjDTeOmHcTqq0qpE9RAqZ+L52/53y4bwIfRdtZimrVpMikfQ+6Kc6cCe
	FK7ubhUrcmGVfA5vLxi+sjFDDlCUk6kcA7PS9I63TT73xuMIsy63Z6aKbTSUOpBU0RErN/KQdemoU
	1w2YN6TfHih6TBYlQ3CoW5EwAiXPfxxhXMIUwiC4j0DuC95OY7W/mzqIGEbr6YmerpDsSIRPz2Zup
	sSCAVSxfD8WrzWyP646MDH6+58wZOdyR6h1LXOBefHvXxu1dgToMOOyMUMdxkGc1ApmdKlCYC9+Nd
	h+vfaEfpxIefF/iHhSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxuP8-00000003kU2-34Im;
	Mon, 07 Oct 2024 20:32:30 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxuNm-00000003kBX-1yru;
	Mon, 07 Oct 2024 20:31:09 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id B9AA25FEF8;
	Mon,  7 Oct 2024 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728333060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6TLu7Yfzf4lbg0y6z1FzkWz5coi/i50OEYYrcpN/ESs=;
	b=F1rLU2IX5ExchOPTTgvShxw97tG9m63vhbl8shc9SW30D+fYg2NEqoCORz+lfGNWRPWzha
	Nlb1sWq8WXgiYOo6LsBKeGg0lAp14R8AcLncsTxVeqSMYQ9aAROy3pSuAbgWanYFbX5SDW
	80wADJBsT1tBPbdTWdHOjCecTbeKehc=
Received: from frank-u24.. (fttx-pool-157.180.226.56.bambit.de [157.180.226.56])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 7E823360200;
	Mon,  7 Oct 2024 20:30:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v3 0/4] Add pinctrl support for mt7988
Date: Mon,  7 Oct 2024 22:30:41 +0200
Message-ID: <20241007203053.72862-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0734da11-ea93-4fd0-bc82-59581f47b628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_133106_679687_EB92A1B0 
X-CRM114-Status: GOOD (  12.12  )
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

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  569 ++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  241 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1526 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   59 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 7 files changed, 2404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


