Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419B5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dj5C/7n4mNWmATWSgG/BPuJr8HGmEzaAhNT6x901UFU=; b=ouehlHNSUn4RrUpSt9yWjtSXT/
	GbqWDkVIF4BDGPeAq8trgCLM7ScFnD3YRGkjmsN+wRpsw3CTL17DYXzWVEVjfX4WynMdIwfJ6px4u
	1ld7S0Q28gw9rMRaT/U3712o+Gmt68MzOY4RrwFKybLhbwkT1RfylkUbe6jxmZhEqFxVRhTkBMKu9
	baiTDbBj1JRQTUIuhvNpTaKiugXYwOjPK1GYYWi3FFqS6mZOqH2XB0k9jUXchvBkQzn+NnHkAFBXt
	uQ/h185i5wDV3ymPxwRgQQwSATBLGhzKi5ZilkQ6yiclx39iPsSd9V5iRAVc4WLbCtDysabYf1316
	WSL0TWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcC1-001FZM-KG; Mon, 28 Nov 2022 11:20:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcBi-001FLp-Fc; Mon, 28 Nov 2022 11:20:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 770D46600012;
	Mon, 28 Nov 2022 11:20:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669634434;
	bh=dE20A2/OTzcHoFZjonpiFTdjhVa0lqqfrLGgjF3xe2I=;
	h=From:To:Cc:Subject:Date:From;
	b=RPdzqVktr1JSiTCwjxg5t2lBvjIZVJu8cFhNojXxoE1yABV6riAbAgdmQ+XRbf/nW
	 XeedMk8iCjPyspka3o+GP7OSVq26m4IOMiNAAEPYuMu+3oYD5B+Ofk2ftlQ6gRXd3D
	 tZT3T9GHpRqzA7fneYJ78q6eL5uZ0htJm32mscIouWjEAFwNzsb9LBbNu44hBOkJN8
	 VO/EljAOUlrbGjOLJEu/qWjNVBqS1TQmyuTicEoZ1xoRT8A2zVq3dLgpHccpWwzPjh
	 5jcOWVV0+R61xODESb57J6nXijp+4DSXrJ0xdhVbY6GZjrYBOQDMWHp+g2HIufSU40
	 yvyyXPiptvQNA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	john@phrozen.org,
	sean.wang@mediatek.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 0/2] pwm-mediatek: Convert to schema and fixes
Date: Mon, 28 Nov 2022 12:20:26 +0100
Message-Id: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_032038_754753_1FD71B69 
X-CRM114-Status: UNSURE (   7.68  )
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

This series converts pwm-mediatek.txt to schema and fixes
mt7622.dtsi to declare the needed #pwm-cells on the pwm node,
required to not trigger a dtbs_check warning... and to make
that node actually usable.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
  dt-bindings: pwm: mediatek: Convert pwm-mediatek to dt schema

 .../bindings/pwm/mediatek,mt2712-pwm.yaml     | 93 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-mediatek.txt  | 52 -----------
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  1 +
 3 files changed, 94 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt

-- 
2.38.1


