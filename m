Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53396C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oU7xNIJOgcDZyQLTxB0D1Oegkqiid6wFmJS2x9cVETs=; b=Cew1u7ryoPJC2z
	Bv2gsuurdLIYm74qNj1cV0OoKoAMMOXg6kx1vG0LAHiysz8qk/xvoZgsglpRn7iIv5Xa6R6OXf3+z
	eZXGo8k/buCV2R0RRvyPG1NxkhmMZ+kkiGrK/SlvjYHwgVxa0XMlSoEY5x6xkkJIEiofD54nJx8l5
	L804B6DA13j4WD35Qr4BA6U0gZmorxuEamueUbyUzlBZoFivpt9ex73qDGt1DVbI/EUC3FJqslviS
	MXFxTNae7hbeQRul+tPu6DKG+idT6clQNd0CsjMv/ad/V8nkOCXpL1VCZFWFyZtMn/L5Sf20V6LS/
	YQLVYA1ryUFtTd+1jQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEMt-0048zI-7E; Tue, 25 Oct 2022 07:28:59 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEMg-0048uc-IN; Tue, 25 Oct 2022 07:28:47 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id C534F60571;
	Tue, 25 Oct 2022 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666682924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oU7xNIJOgcDZyQLTxB0D1Oegkqiid6wFmJS2x9cVETs=;
	b=v3fyfjC/VqaNdQeY6P0Wwd0ir5wLyOgK+RoLPwqtVE6PWZTCRHW/fXK9ftzvcWKyMVL+n9
	NbMY1KzHU7Q+32fpzti718c4VnUHR4DuSyfc/ipp+jG9fmkyJCuxL4SRgIovffoUjUq3D0
	26D34hPVJIAnh/0+fkIf5U852d/Reyo=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 476F51003DE;
	Tue, 25 Oct 2022 07:28:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Tue, 25 Oct 2022 09:28:35 +0200
Message-Id: <20221025072837.16591-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b840c511-db93-405d-9f2f-cfd160d31122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_002846_765826_90DBE7D8 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series prepares support for mt7986 PCIe which is basicly gen3 PCIe
but with slightly differnt clock configuration.

To make differences better to read i split the exiting bindings which
has already different settings with a compatible switch and then add a
new one for mt7986.

v2:
- fixed typo in part 1 (SoC based config)
- squashed part2+3 (compatible and clock config for mt7986)

Frank Wunderlich (2):
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 65 +++++++++++++++----
 1 file changed, 53 insertions(+), 12 deletions(-)

-- 
2.34.1


