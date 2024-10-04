Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2408BCFA775
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RL33WIeDrw915imXEq28+yRaGpR5FaDj932LC2iNZQo=; b=XohzFAXl+Ka8PC
	Em7rIQolcUEbtXsP2raCwpuBa5sHgmye72/435p5+0Q5W3OAFtVguz6Tjm5kNEHjGg1glNVvmy0V/
	zBRUsWhmTkVsY0nRJmqPEl1+w95ZGcyE2tIqnhUTA51lku+XGwxheO+uOycQW4clqpSh2O+h3j6CL
	A/XtWZrw2/MWJ4nLienTi8uU08mrestW7EVIJmTtBD6TEbQdNaRw2cZnxJZDTmu30cGkAGLuG4dzE
	XPOm/q3+dJv9VW6BqfjxYR+BhkEmfuEnhvLXl9RBvkYLqLwYTzghP1djCoRoigT9BJyqm46nnRMU/
	BaURkdEqG+E0IZ5R3vGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swhtq-0000000CPK5-3NsZ;
	Fri, 04 Oct 2024 12:59:14 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swhsX-0000000COvd-3nva;
	Fri, 04 Oct 2024 12:57:55 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 7653B5FA81;
	Fri,  4 Oct 2024 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728046668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RL33WIeDrw915imXEq28+yRaGpR5FaDj932LC2iNZQo=;
	b=uCePfTWo7XuiOQYflwcBVkCvUbqeL4zY40tGga46qNGPVxqE9UAKJVD5egRZzu58iSHSoT
	LNH+Pyxj0UUmqr0GPxX1PjmrtNAiLiVu5WDCerjPfDrtJTHaPc+tjA422MRuagJu92i5kp
	RexANxqYU6NBWdFmIul8vakGzWS+yyw=
Received: from frank-u24.. (fttx-pool-217.61.153.189.bambit.de [217.61.153.189])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 807C040040;
	Fri,  4 Oct 2024 12:57:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v1 0/4] Add pinctrl support for mt7988
Date: Fri,  4 Oct 2024 14:34:14 +0200
Message-ID: <20241004123423.34519-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2cf4806d-0c22-42d3-b394-aa868bc5d0c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_055754_275776_D9FA5A6D 
X-CRM114-Status: GOOD (  10.82  )
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

Daniel Golle (2):
  pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
  pinctrl: mediatek: add MT7988 pinctrl driver

Frank Wunderlich (2):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: add pinctrl support

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  575 +++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  241 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1526 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   59 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 7 files changed, 2410 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


