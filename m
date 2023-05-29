Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70D5C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12dKsnOQcu5Mg/WyiYcFp/cBeSbhx5zQ0lcmDfOc+hE=; b=XtL1c8UFQzb1JH
	DkCORRocTe6lMe2ZJ5ZXgwAk38TatENkg12ynSUsVXCUbGIC6MAHhiRVaodGFwMIpxaalkddNYwRG
	w2sWr43lYsQ+vKuuf/wKdTP78iNPlEbkMGyGMPwlGi0+Mdd4wnVVynrGEHB2spMnRZriKHEU2Hq0F
	bMsWt7kdG22+ZRhPFY6Qel0oCCput0EXSf5EAvb2ONe+dJ2j4ifD8nji4re8hQkAlH+j5SNZmsQto
	adgecjGR0UZFUPNE7cl4m4WzJjV6taMaAwTKUrvQtShq63AZk7gAAuZmyB6+fixmDUU6MKVOPyXnl
	BMF2GXMdUcjFluYUE1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jig-00Bf6D-06;
	Mon, 29 May 2023 20:43:58 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jiR-00BexV-0V;
	Mon, 29 May 2023 20:43:46 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id D31B23FC75;
	Mon, 29 May 2023 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685393012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12dKsnOQcu5Mg/WyiYcFp/cBeSbhx5zQ0lcmDfOc+hE=;
	b=QQqwtJ3yFEIOHtNxIWveOakMqe5WInd4m8/unfLduXW96Lcvuvvf3woYfZ8/tnGHkBxe6V
	ktWF4R/52MzrK0QEy3/OYJC5cjayT13M0G1FxhcnnIINaJXFWaF3RrxbJbdIyvLO2YdR0C
	A4PnEKezL3NYz76lQS4mvl0xA2Hs72k=
Received: from frank-G5.. (fttx-pool-217.61.156.2.bambit.de [217.61.156.2])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 95CA81006D1;
	Mon, 29 May 2023 20:43:30 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: Subject: [PATCH v2 0/4] Add mt7986 thermal and pwm
Date: Mon, 29 May 2023 22:42:54 +0200
Message-Id: <20230529204258.65238-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e59d6275-e4fb-4fc6-8a60-5251efc945c4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_134343_361102_D5C6F45F 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series add thermal related devicetree-nodes and necessary
dt-bindings.

I left pwm-fan for r3 for now as i cannot test this completely due to
missing 2 pin-jack and 3v3 pwm-level which my fan cannot handle (starts
spinning at ~3V). Only checked voltage of pwm there.

changes in v2:
- drop highest 2 trip points as they are not yet used
- leave already applied patches

Daniel Golle (3):
  arm64: dts: mt7986: add thermal and efuse
  arm64: dts: mt7986: add thermal-zones
  arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts

Frank Wunderlich (1):
  dt-bindings: nvmem: mediatek: efuse: add support for mt7986

 .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 31 +++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 63 +++++++++++++++++++
 3 files changed, 95 insertions(+)

-- 
2.34.1


