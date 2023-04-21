Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801BC77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2RYbc1C9+H/WQ9WMzIcpwV9sAdZeEPo9IAoHwZnSuyo=; b=0da9E+TSdV1xWJ
	h3quuQDLpmDqXKg6y8qJFCv4ZNoQOVDf4LVSJP/d8Bdozx3UxfnZtwnopL5FzKG6TNKaOaHsnElRv
	VJiXD3bHeAvDTN7tY0axaX4PnH9R2XkVyP0WFJtgFZaj+6Roc72b5EOrlwaYE4wNnaZjpB8/v+T1I
	wA420cnHJjkqvf0Nfh+1Tjh6etI4b0F7UVKPsjH4feQhoG4GbiK5Tucs8/NtKTOXcN4No0I+ZK/Oa
	L75r474DfKCX+P/JjXD1Ah/L2/YD3J3bzYlRGv/+G/7J0pckhdV2Pf4nEK+oUW3chG1+0cU/BK8HM
	9mDFzeN029vW6NqSa0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqhG-00AxX6-39;
	Fri, 21 Apr 2023 13:21:07 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqh8-00AxSz-1P;
	Fri, 21 Apr 2023 13:20:59 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id B836F60506;
	Fri, 21 Apr 2023 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1682083253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2RYbc1C9+H/WQ9WMzIcpwV9sAdZeEPo9IAoHwZnSuyo=;
	b=Lfvi7Eem9Nhmj57IAOhyO1lmXsp8sH5Aec6EXGS1PJapNBZqDUQP3YvPNXrNJgNcOH07jM
	cnivTjWsKHhywBWQv24qmlZn327p1ZbRNacG1z8sDDAy1BNidID1KiqduqP8/DYeOn6BvR
	tN4PRrFIUVrpZSuW6Np7i40wHbme6a0=
Received: from frank-G5.. (fttx-pool-217.61.159.143.bambit.de [217.61.159.143])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7541110072A;
	Fri, 21 Apr 2023 13:20:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: Subject: [PATCH v1 0/7] Add mt7986 thermal and pwm
Date: Fri, 21 Apr 2023 15:20:40 +0200
Message-Id: <20230421132047.42166-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e11c7872-5256-4a48-ae62-b36e397cf910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_062058_701555_37E63690 
X-CRM114-Status: UNSURE (   8.00  )
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

This series add thermal and pwm related devicetree-nodes and necessary
dt-bindings.

I left pwm-fan for r3 for now as i cannot test this completely due to
missing 2 pin-jack and 3v3 pwm-level which my fan cannot handle (starts
spinning at ~3V).

Daniel Golle (4):
  arm64: dts: mt7986: add thermal and efuse
  arm64: dts: mt7986: add PWM
  arm64: dts: mt7986: add thermal-zones
  arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts

Frank Wunderlich (3):
  dt-bindings: nvmem: mediatek: efuse: add support for mt7986
  dt-bindings: iio: adc: Add support for MT7986
  arm64: dts: mt7986: add PWM to BPI-R3

 .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
 .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 44 +++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 89 +++++++++++++++++++
 4 files changed, 135 insertions(+)

-- 
2.34.1


