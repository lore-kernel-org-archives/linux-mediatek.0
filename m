Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE5C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FySLVtRUqALQ8pnoAX/D79ZcODZut2tbwpSzv/0IXMc=; b=0LJe0KnPCsIYPSxVzSsAMSeqO9
	PrtBv2i/TnxWLm0/XFv67DMcCcmZk4J3DiPxWsLv2TYsg5rJNjJtygXzIyNC905CrB7Mifg9Xc/6N
	5HLo4mE0ShmKVU4b1HsYjWGH0qSS36EbZtXm8nHzDIv+53BhpTvhsMf1zPrxltMNsjrvnWWnGMIse
	BRoQMWKOnV0PgbHyRDJw00zywi1zfJGo5TLH0gwLLfQbtwWi0xoZsVjsNeVquwa70Xl7wQU04nRjg
	Gi32z+AMqBNuLsive7EEjQXmgCBFJE0fjv2AH7NvUBpsW74TlLh6yq0lj7OEnsixAJ0YxbeV6cPb/
	MoM2mRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquKI-00GBhr-1k;
	Mon, 24 Apr 2023 11:25:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pquK5-00GBZo-2L;
	Mon, 24 Apr 2023 11:25:35 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EB56660316A;
	Mon, 24 Apr 2023 12:25:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682335528;
	bh=l0uXiEnDZ2ULACJcoCCIgBv1dIqJ+NUHoS3OdWQeveo=;
	h=From:To:Cc:Subject:Date:From;
	b=BvfsqqiMm8jbd0sTjSdeqVJq2WscjqOufL6ldhQNMPq/IFRv3V+uGO+J0LB0x92YY
	 UvEdoIIwRmtXEA/X5uKhFBwe4B8K6goiDdMCzV/IcDOxnRk41tt2hhZEcLXgzq4gDF
	 bwuToe7UO1H8DrEyGuZhNtigOcL2FJm75QRDLWWEK3HF1unX/jr1RmX1bh6FFaxraB
	 MSh+cax2jkB5tIh+WdWl3ULAQxwsYcRzX8jilBUA1rjSDQHaQMlX8/yxveO+rsDiTP
	 //J//4YWsVahKBjY7sO+kgSYmgiFaiM7gkK2WLknKTe6oryx2UB5erpkZ62s1FQTx0
	 9JCKd2XNLxR4w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/4] MT8195 Acer Tomato - devicetrees Part 3
Date: Mon, 24 Apr 2023 13:25:19 +0200
Message-Id: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_042533_920245_FD3220BE 
X-CRM114-Status: UNSURE (   9.58  )
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

Changes in v2:
 - Dropped tomato-r1 PCIe0 enablement
 - dp-intf aliases addition transferred to mt8195.dtsi
 - Changed thermal zones names and critical trip point temperatures
   for Linux to initiate thermal shutdown before HW protection kick-in.

This series adds support for the WiFi card on PCI-Express,
eDP (internal) and DP (external) displays and adds thermal
configuration for the "extra" thermistors present on Cherry boards.

All Cherry Chromebooks now have working display and wireless
connectivity!

At this point, the only missing component is vcodec decoders, but
that's to be done in mt8195.dtsi, globally, not machine specific.
Please note that in this series the eDP panel was put on aux-bus,
hence this depends on the series introducing support for it [1]
in the mtk-dp driver.

[1]: https://lore.kernel.org/lkml/20230404104800.301150-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: cherry: Add platform thermal configuration
  arm64: dts: mediatek: mt8195: Assign dp-intf aliases
  arm64: dts: mediatek: cherry: Configure eDP and internal display
  arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 162 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   2 +
 2 files changed, 164 insertions(+)

-- 
2.40.0


