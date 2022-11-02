Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7739CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFNfY9d3J3FGfhHeuKP6i9tm4DRtRshTbbDnkz68QE0=; b=W1BRkzfXmA9NwDiyXGRjytrLhN
	qEnyc9STf9XkvoulgUh9Roxyg2iq8eoqj0y0LgJhAuJeQJbWD71/2QcA1hztjrpcG59FEKwdSg7nh
	z7cmgFQ5ozdZEFwrhALbF+DXHD/jq2+CQNAJWhCVLot5c7xjtMveV4qjA+3gbXsDFJGFvxPsJ10lF
	0oWGq8n5JBdQvQn5fBA6vD/xV4ptel+OccjKAloA+Bp6zdHMB6rcMCdHWpGSbSSno1Oby/seIS39y
	DLPit6hXTSBDft7NMHtFxNQv5CaFMkA25qGqPwe102bw73di/yBWxdYojZP5yWj+eXD42WPpidRqh
	lWlli1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ5y-00DUcH-Be; Wed, 02 Nov 2022 19:08:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4I-00DSYH-83; Wed, 02 Nov 2022 19:06:32 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C9D2966028BD;
	Wed,  2 Nov 2022 19:06:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667415989;
	bh=psNsBgRZUfl25MmyYsegtoE6p8qBYKvjuaAigeczHcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzUZx3QI5rk9bRKJ/8KzAxkEVIXNJ+QBKyG0LMVSOyppAkTPIVMdu6NXv5wMN8oNo
	 4AlA3dZhpmeLUggTxnViPoZTn9mD0lydKzTacl/XHLlArSbkxB8EuV5xyjuB6NgXf0
	 1kUO1NR7iGdyuep8Kct9VqnrJMq3CDW+InY8tWOLJ+XmTEAZBAWiLdatnFUtLfpwr/
	 2gfDkryv8KWwn6Tyxg7hf3gOgoXh+3pvclEQrUl0gA4fljUi/oaPQca2B/7aIwrDhY
	 kr7YB7ZVMEk1PnQK6d5aqy22IftEu0y/eJMrdWSpiZDSHHvhCiXU5WRKfZG7lwt/ox
	 NWPNl0xlr28Bg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c and mmc
Date: Wed,  2 Nov 2022 15:06:11 -0400
Message-Id: <20221102190611.283546-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102190611.283546-1-nfraprado@collabora.com>
References: <20221102190611.283546-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_120630_452151_A0476156 
X-CRM114-Status: GOOD (  11.55  )
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

Add aliases for the i2c and mmc nodes on the Asurada platform DT to
ensure that we get stable ids for those devices on userspace.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v3:
- Removed i2c4, 5, 6, 8 and 9 as they aren't used on asurada

Changes in v2:
- Added this commit

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index ce9e43475f9e..9f12257ab4e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -11,6 +11,13 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c7 = &i2c7;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 		serial0 = &uart0;
 	};
 
-- 
2.38.1


