Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9345EEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQd2A2jBgLCVpZ0OcHCTHtAM0w67JglA0hN5W+4iy+4=; b=0nHF2pQugu2oY0
	BTUV2nCERc10k3+8GjJi2lnt2KASWlWaXLPEKNDhV4wbSjuy5x0e86PEv+C6Adn3yxHoTBIC3W5d3
	SBEJ14HG9wnZnwkX6zP/B5xVbgjJUMLn7xY0Afjc+N0I5crmwXJKs7hjISAmq8hLRuplMEc2HDU9y
	3sjv8HfZpnJL6KMXhdc2qAN32jbk37+1yxR56QzvrDkdAKd6TN+GD4NZOx0Vr/+IlpQlCNAAjvV01
	C51iVvXj7wxZUx62FedopG/pRVPsNZZk5mg3L06wqassOWSlGydXtiJ6P5oDnI1BxLd1tCoWUeb34
	izmUO31L8VjWy7bRizIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwYz-00F1r8-0s;
	Fri, 21 Jul 2023 20:17:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwYw-00F1pW-0L;
	Fri, 21 Jul 2023 20:17:19 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09E3C66070EA;
	Fri, 21 Jul 2023 21:17:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689970633;
	bh=jbbvodRyaD2ByA7yyyJZHO2BISIUGtl63mFXlT/Qw7E=;
	h=From:To:Cc:Subject:Date:From;
	b=fUFE5iAnLIDH6xyu4fJydGHJYZr848IDWjN8TUpy+7kLZ0Uxhcr/HljjYk+lFxIqE
	 TE2MLWXWQfNynMD6j2hkajGljPmMM0z7RiIybylSwSp/4a6io3LbC8bbVJFOkDdcoK
	 n93N5i6PYTRxiJPRPm0HCnhq0qI9jzs4EUB/AkC4AYyWvJ22M9JQb1jBrte1KpCo2A
	 C4MCkVRC+wtfBLk/PFDetlO6Ad/5YSGTKWA2Yu/RkBkS6yrIBHMbRTWH1ecdByWZ3f
	 lF8P6SJIxIgFLOGJQ0YA/8Zk6MseJwLrejfr9OCC+BVAhd+17lj0eYZHioBZwNqfbF
	 UbRofh/FHcDgg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/5] arm64: dts: mediatek: Add newer revisions of Google Spherion and Hayato
Date: Fri, 21 Jul 2023 16:16:53 -0400
Message-ID: <20230721201705.387426-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_131718_298565_9175938E 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Add devicetrees for the newer revisions of two machines: Google Spherion
rev4 and Google Hayato rev5-sku2. For both, the difference from the
previous revision is that they now use the rt5682s audio codec instead
of rt5682.

Changes in v3:
- Rebased on next-20230720

Changes in v2:
- Removed patch adding asurada-audio files for rt5682s
- Added patch moving nodes from existing asurada-audio files to board
  dtsi

Nícolas F. R. A. Prado (5):
  dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
  dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
  arm64: dts: mediatek: Remove asurada-audio dtsi files
  arm64: dts: mediatek: Add hayato-rev5-sku2
  arm64: dts: mediatek: Add spherion-rev4

 .../devicetree/bindings/arm/mediatek.yaml     | 11 +++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mt8192-asurada-audio-rt1015p-rt5682.dtsi  | 19 -----
 .../mt8192-asurada-audio-rt1015p.dtsi         | 26 -------
 .../mediatek/mt8192-asurada-audio-rt5682.dtsi | 21 -----
 .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 19 ++++-
 .../mt8192-asurada-hayato-r5-sku2.dts         | 64 +++++++++++++++
 .../mediatek/mt8192-asurada-spherion-r0.dts   | 19 ++++-
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 77 +++++++++++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 28 +++++++
 10 files changed, 218 insertions(+), 68 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

-- 
2.41.0


