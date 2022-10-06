Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F44C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhVOElLNFlTBLa5F4fT0JUku3qcDDKstOWX97A3SrYo=; b=pWGgrVJVdoCtUvPx6mDpWfuohn
	1Ubzd3haGLXgzpkTlkokK7pCzx2CXkdfy2BUtaZCyFJSi7dNHynyudLTnsWYgcV4s7mG4mIUPOBNN
	qqCe9V5NuX6wN2xVBIDp+kfqePA+hzqSyZunq2RwFz/BNr5Wyo9xT3jTEa66S1FAnBo9lNjY55ZeU
	cTlU+p1TQ1w6IqatEiRCx26wEHepQBGNq4UwEip3EwNncC1bxP9jd6ayvPGKOd7Cgu3wYRlxQ46b0
	gvdEZUAQXvo75USwDAsZvxWIF8KIoc9GbLZ2G6mlNpYp8Wr3kqxFtBdtAECHBpYZX9xP8VejPdRln
	YpBcPqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYNS-005MPS-JJ; Thu, 06 Oct 2022 21:25:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYN6-005MIG-5A; Thu, 06 Oct 2022 21:25:37 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24154660230F;
	Thu,  6 Oct 2022 22:25:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665091533;
	bh=aOnsKC+E1877mOO1xAIQ+QVFtrIRW/5ZxTE2f8db6Us=;
	h=From:To:Cc:Subject:Date:From;
	b=IObwZSt+H9Y3Jf4eaRH+vlmt01qKOZsCrYrMTcenENW9UxdZTaEU9yHBD6l0Bi7fJ
	 Rnw9yo3is+Vigq5jnb0hwGA6sEKO69FO1PROUbB86Vxwyimdoh79QvD0f3hrXLwHMg
	 kwXu6S0ZvqApb7U8ueUu3v0GW2x8kHbjXJHC5Gls6MbxXdF86C/FyooWMF4n4JpS1h
	 NTQzvkUhxt7g64GMyU60Qawp78xRsJzvGpczQxzuB8cJXfubVxfUytb/wll56l4SK6
	 bCcfTbyJ0Tmzm7yOsrZA8q4dc7IHystR4LQt8MiQXuLM477Lzi0C6nb3egRgJNh6eL
	 B42i7GfKP1s9w==
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
Subject: [PATCH v2 0/5] MT8192 Asurada devicetree - Part 2
Date: Thu,  6 Oct 2022 17:25:23 -0400
Message-Id: <20221006212528.103790-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_142536_431417_A389352C 
X-CRM114-Status: GOOD (  11.10  )
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
been submitted upstream [3] (note that while that UCM configures HDMI,
kernel support for HDMI audio will be added in a future series).

[1] https://lore.kernel.org/all/20220622173605.1168416-1-pmalani@chromium.org/
[2] https://lore.kernel.org/all/20221006115816.66853-1-angelogioacchino.delregno@collabora.com
[3] https://github.com/alsa-project/alsa-ucm-conf/pull/217

v1: https://lore.kernel.org/all/20220908171153.670762-1-nfraprado@collabora.com/

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

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 507 ++++++++++++++++++
 1 file changed, 507 insertions(+)

-- 
2.37.3


