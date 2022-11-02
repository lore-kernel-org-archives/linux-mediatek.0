Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A474C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/vJiA1B85dH2kZB0andVO/jbuNg2xpOxud9gtAT21qc=; b=h3o/EqZupYdUjE9wVUskooIqUd
	44FkWR4uo4UyvE+Y30JoOiSIVyHXt22kbk3MR8oV4Ez+MS4oYWMYdUAsU7pT2a/6q0V0yHzZt2JTD
	95SPDiFv5Yd4a8Ba8y0M5/hjHThPklrzcHT9tybLImutH5LtT1DWa2onyKg0DA+lZNiGRWvSdFHRp
	4PlzvfoaP2Zk0Q2uiM0YSRK9IzAdVfhaxBczAPbY3X6Zv4YAi4L3PorJsp/lZ9b9r+aVzGqr3v9JD
	KBDhewUEQW0DyD9+LTrQHts4g3sAr0AYlX0tOH9iKyVidf7obZR8O+o36WUXikb8WPJMjqgBmNU94
	JjnzOuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4c-00DSxm-AX; Wed, 02 Nov 2022 19:06:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4C-00DSNH-Lk; Wed, 02 Nov 2022 19:06:26 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F340E6601671;
	Wed,  2 Nov 2022 19:06:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667415981;
	bh=FsgjrI9Qzo0bsrusMvSReHZ5iMayNntgVoZWPmOnknY=;
	h=From:To:Cc:Subject:Date:From;
	b=OmAeawVxpom2EF3ceUJLMDwjPvqchL+Rj2hlPhJoNgx9a6Jt67nmQE0uHt7/8TWID
	 vKE8s8Ok1wHYv5xXNqdKJEeeh/eG3798k6bHNwR7bUXFwuxY28ezwcOVV2TV9im3O+
	 ZqDKR7B2PJQWDB4dwU7LHglvCgcj2UIF/yYfkFKDBVhVhYHgqGw3WtJ8uAZQaqou6N
	 1HGf86xS7whn3HRMsihb/IcJtGk+rhZ35Rh+lQaQupw+L3RIGG8zF+8mIx0oNz4lIt
	 6B+crOXAL8/r1180F2Zl5oRSj6mcYwSDXPrmK30ctx9X/SZygIUeiuoxYITEcMPe6T
	 TKD/m6o6FMUBA==
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
Subject: [PATCH v3 0/5] MT8192 Asurada devicetree - Part 2
Date: Wed,  2 Nov 2022 15:06:06 -0400
Message-Id: <20221102190611.283546-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_120624_880743_65C7D4CA 
X-CRM114-Status: GOOD (  14.03  )
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


This series improves some more the support for MT8192 Asurada-based
Chromebooks, by enabling some missing functionality, namely the internal
display and audio.

In addition to that, aliases are also added for the i2c and mmc nodes,
which should've been done while adding the devices in the previous
series.

Some notable components that are still missing support are:
- external display/HDMI audio (waiting for [1])
- GPU (waiting for [2])

As part of testing the audio, an UCM file was used, which has already
been submitted upstream [3].

This series depends on some missing dt-binding properties on rt5682,
which are added by another series [4].

[1] https://lore.kernel.org/all/20220622173605.1168416-1-pmalani@chromium.org/
[2] https://lore.kernel.org/all/20221006115816.66853-1-angelogioacchino.delregno@collabora.com
[3] https://github.com/alsa-project/alsa-ucm-conf/pull/217
[4] https://lore.kernel.org/all/20221102182002.255282-1-nfraprado@collabora.com

v2: https://lore.kernel.org/all/20221006212528.103790-1-nfraprado@collabora.com
v1: https://lore.kernel.org/all/20220908171153.670762-1-nfraprado@collabora.com/

Changes in v3:
- Moved codec and sound card compatibles to separate dtsi to prepare for
  headset codec differences in newer revisions
- Added new supplies for rt5682
- Removed i2c aliases for unused controllers

Changes in v2:
- Extended series to also include patches 4 and 5 enabling audio and
  adding aliases
- Adjusted display regulator hierarchy and voltages to reflect the
  hardware

Nícolas F. R. A. Prado (5):
  arm64: dts: mediatek: asurada: Add display regulators
  arm64: dts: mediatek: asurada: Add display backlight
  arm64: dts: mediatek: asurada: Enable internal display
  arm64: dts: mediatek: asurada: Enable audio support
  arm64: dts: mediatek: asurada: Add aliases for i2c and mmc

 .../mt8192-asurada-audio-rt1015p-rt5682.dtsi  |  19 +
 .../mt8192-asurada-audio-rt1015p.dtsi         |  26 +
 .../mediatek/mt8192-asurada-audio-rt5682.dtsi |  21 +
 .../dts/mediatek/mt8192-asurada-hayato-r1.dts |   1 +
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   1 +
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 465 ++++++++++++++++++
 6 files changed, 533 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi

-- 
2.38.1


