Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YST+9G3qHfoR+lZBKk7NdoN35411C9RaROQruGFrRvA=; b=n50O73wdQWE6JL
	H82qaYP9j0sRoTEH/ho3QnEpHmc/nOwzy3meqvjT96wyIvkxYrT2JZw091Eevsx+386pBuSIB9gkF
	KHAmiiNvrPHYTOs6VSOtsUHVzAAd/VfynnCPfwah6m3Bfb7GT2A0t+QyzoGMJkrc0Zggfk1nQRvmp
	F7ap1FB3P3mfqfgSN+vkOHG17F3vpT8PlNYGTc51XczZP38pHqKTie55vRBRABV6NO7aMZYg9ydxO
	T35nGKJVcjSI29MUM4tpU92sAeoY/7Rm+rpzxei7sBnEO5ptpZQ4vlVsm5m8fCs6WLEN9lbErYexq
	vZmbbVvcjjHn1b3LgpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGGk-001Gtr-7M; Thu, 09 Jun 2022 11:24:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFs-001GLB-EE; Thu, 09 Jun 2022 11:23:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA19966017C8;
	Thu,  9 Jun 2022 12:23:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773788;
	bh=9Ae5YF6irZpp0Rms9XFrNm87VVx0wDKBfDaYKBip0iY=;
	h=From:To:Cc:Subject:Date:From;
	b=kTGqfVH1pAml5TEdtn4V1L6IjyCLLn/p7oz53tNZ4NCG02/TgKQhGwGI0PXypNIJx
	 WiQEwpXpg/S1JAjeE9zINrD5W4GHDMwCiATKETd+fkmP0VwM62qvWOdOP2S0rCREME
	 +rTnlqhyyBllcPh7Gm4PdX9S9hkjZi69kUB/UMjq5atKW6BFbQ2b8UhPb9snZNMhwb
	 UKLhwCCrqmTmFMNu/tDTCsCF6Ks6p9ZNpwRtbkBYuMeRpt6YmeI/g7xWVPq4jl8MW5
	 VmA7vF1Noib1pX5tRcSL+X+wPVQvKPNQ+ZzugIQs3yATRD9FBl0fB1DspY9JEP5MkH
	 suJIzFwYPi/Hw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/10] MediaTek Helio X10 MT6795 - Devicetree, part 1
Date: Thu,  9 Jun 2022 13:22:53 +0200
Message-Id: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042312_660911_8EBFB999 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series modernizes the devicetree of the MT6795 SoC and adds a
couple of nodes that are supported by this SoC.

In my local tree I have much more than that (including the dts for
that Xperia M5 smartphone that I always mention...), but I decided
to push the devicetree commits in multiple parts, as to get these
in sooner than later because that reduces my delta, and this makes
upstreaming a bit easier, especially when having to rebase things
around, which happens a lot.

So, this series *does NOT* depends on any of the other series that
I've pushed and is mergeable in parallel.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v2:
 - Split fixed-clocks addition/removal patch for readability
 - Added patches for pinctrl controller node and vGIC interrupt

AngeloGioacchino Del Regno (10):
  arm64: dts: mediatek: mt6795: Create soc bus node and move mmio
    devices
  arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
  arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
  arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
  arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XOs
  arm64: dts: mediatek: mt6795: Remove incorrect fixed-clocks
  arm64: dts: mediatek: mt6795: Add general purpose timer node
  arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs
  arm64: dts: mediatek: mt6795: Add pinctrl controller node
  arm64: dts: mediatek: mt6795: Specify interrupts for vGIC

 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 260 ++++++++++++++++++-----
 1 file changed, 205 insertions(+), 55 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
