Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C0C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BlQr3Q27AZF/C11mukQz8hWE8j7XAdocriR2GuSwtWM=; b=rd/aaGCR1umYCZf5TI+BEhw4B3
	aF22AwXWWh3dDw9XOdh8yXoatKsn9Mpy35VBDBdXEsrISbWpkN7/NcJn+S9RC/gm2cXOLjJpIvyC1
	7K76fLn8D8jYOUOjw9McYvBbSxw0IpJS8G054ej5mbJVN2nTDJV+A9CvysYfm/YG06e0SM0I2g92U
	pBUkk006mT/OOZaI6lhOuFmwk4vwmf0noh8lw+oLu3X+HzBDtrV0yDU45ZtPSupu2+tn13p4dXBCm
	2g67znu4RUhOpF3ySTyCT1GgfhbX+0pqusEUTBP1BH/TNReu0kMM1iAMeRJ3O1q/twUlOGCkeCwGG
	oAprsF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KTL-009PWO-03; Fri, 17 Jun 2022 22:29:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KT1-009PRA-38; Fri, 17 Jun 2022 22:29:28 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 020CA6601797;
	Fri, 17 Jun 2022 23:29:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655504963;
	bh=RUtkDl+kWjurrUM7JaIercsTTzu0XKltvnmwlVJ3WMo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ta20+N4xzU3IVSjLZxfAKClCXe/Tx+0FvcfeR6qQsRpsK8QwQ0unBhGIsxBEYiMZ3
	 4rXwu20Fa/s4prn8TER8Vz+tTOVq1s/EWdqAgbp0g7QSZ9QW9eM90wktAgeDs0j3w5
	 knnwZULMssfXibYNiKNMmmP2y8EyP81Ih+8+NHTxa3E26y5c33CE/w6Cv2rHz0QyPM
	 fWLwIq4a1kq2EllM9ypOtgx5wVDwASMcJZ4EVxJiV1Yot9xB4LAkmTHvw9nUI1YTAh
	 m+m7PJPnd03t9pxpyvlWupQvK+2cyaMy/77/ayGU3R26yyRwikBPABXICk9+XZjrbZ
	 2mBQ2z2XaZCxQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/3] Fixes for dtbs_check warnings on Mediatek XHCI nodes
Date: Fri, 17 Jun 2022 18:29:13 -0400
Message-Id: <20220617222916.2435618-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_152927_385622_6FBD32E5 
X-CRM114-Status: GOOD (  10.11  )
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


The two first patches fix inconsistencies in the mtk-xhci dt-binding,
while the third patch is a DTS change to use the clock order required by
the binding (and that was fixed in patch 2).

This series gets rid of a couple dtbs_check warnings on mt8192.dtsi and
another on mt8195.dtsi.


Nícolas F. R. A. Prado (3):
  dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be
    optional
  dt-bindings: usb: mtk-xhci: Allow middle optional clocks to be missing
  arm64: dts: mt8192: Follow clock order for XHCI

 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++--
 arch/arm64/boot/dts/mediatek/mt8192.dtsi               |  6 +++---
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.36.1


