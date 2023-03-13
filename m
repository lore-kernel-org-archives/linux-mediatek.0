Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i0WstoW1NpOj6Or1cXKAzWU4k+TRlVeDRMOnxv1vRd0=; b=lbDeqdWpQuTphT
	9a7iv5epUO0I0iluRgjhPuJIztZO1F4Ab4anPqzKO23yYVwokSsAEETaqcOHcRQE6zkcSoImOOm3r
	9hQfVmLrGfVN1SOLd9VQF+DdycpSwG3gGOdzGmeWWLSw8k1KaGvE3kTrmWfDXyMIl3APjkehj6bTW
	UvRhhI7BHnzarnioMr4LZo8rVsg6r4K+GU5T3yLpN5rIJw/Jag7ylb5InxUw6v8FDvql6WPqqIo3+
	1N3TuxZ2QRJu+CmaxUhMKlJ45urJyW4pDxLoEO3dTeZDkR6BXGDiMSQb5yB1zaCnAr8oyMvjwWqhF
	geHD8+zOEWkUFCaFv3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboby-007dso-Jv; Mon, 13 Mar 2023 20:17:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbobU-007dfl-KI; Mon, 13 Mar 2023 20:17:10 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 701456603082;
	Mon, 13 Mar 2023 20:16:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678738617;
	bh=475NKLqKir33iZI0kwyLeOEqNsvSrdnnNejXAnay7+s=;
	h=From:To:Cc:Subject:Date:From;
	b=PoEvgVpQH2RGL42QIc+pP6SCylC5dHBG5VKGammWmVwT7kKDEVUQ0c7zadSk3MeJF
	 1gZfOtMS+4OGzascqMkMjVVdlXsV9za8S/54Lv5ZhizcOr8mjkM/D3LyKYzNV5yOEn
	 nHcLqEMmd3KIwT4iMqFT3KRgTw3CTu/zKn/qpBm4O2ZuF3v+2tKzwSflrSidpj+Hz9
	 mqduppReW65RkyQ46fxQvDCVDJWrwKEUITt7dqJh5ct1wk0bKTtwyQNyY6wC5Rny/x
	 VAtm60bBzMiUs64oqony/6f+k3nw9TMWNPfmKEd4uBjlYMdXoHpN6VhIhrefJOI/t9
	 DaU0nGz6/t8tQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: mediatek: Add newer revisions of Google Spherion and Hayato
Date: Mon, 13 Mar 2023 16:14:38 -0400
Message-Id: <20230313201443.2275101-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_131708_841039_7B0ED46C 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Add devicetrees for the newer revisions of two machines: Google Spherion
rev4 and Google Hayato rev5-sku2. For both, the difference from the
previous revision is that they now use the rt5682s audio codec instead
of rt5682.

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
2.39.2


