Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E680C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xviEVCzM98P+sYh3OmDpU6yEPeOmCoJkVobO0/V/DjI=; b=YJ08yaq3u43Wbtnce3FX54hek4
	3zCe532R40ybbd+g/GwraIOgheLOd+jEGxZ9IZqPlJhlFB7Zr8oc9yiTz6dpjlFuS4GFRaiGeTpzu
	MJdclTIlruJa6XXkXswjxRMztJxLPELoH3bpW7CHr7LHpVie+7y//3SKRi+qiQ+pUr1MxBczKae8Z
	yVCUE/0HBQ5Pv+966HPW2oKqk6UNDOt+lCj++pbVmMB7H3nQoIHuXY7/X0RymnPTEEiKhJvFWgx6y
	aCgsXePxmlsOS02J3xDiik/sIF9ZQAZhb8E0bIU8jzX0fLg0ypUPnU03h6HXoR+vHZerz0fg8zTkf
	vBe8/yvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02l-00CFiz-2j; Thu, 13 Oct 2022 15:22:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02R-00CFZW-Ew; Thu, 13 Oct 2022 15:22:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78E626602366;
	Thu, 13 Oct 2022 16:22:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674539;
	bh=DM9dp4q0ZBB9kwxv9JwDMM/0XtGc6/2vq44258xzabo=;
	h=From:To:Cc:Subject:Date:From;
	b=ZgRRH8FHMlEkPlzeZV9XV9OOigpZgq/LZPrWhdZAh7y5j3XtwFUjKX/bsy0oMA9x/
	 cbJyRFPkx9ppVUt1gcLN+pur7cHmNxVKaN1tARC5ZIHGHASwhXqo8UO5if6zHQex2F
	 SbH0o8dBl2hE47bBjSaZJs5xZ72O2L5jj78m4b/B7abjLwRA2hgXKIPOpxl/lvyg6W
	 4b6Pgkkm6vZpbxJZNo8odrnQvrcBFtw6SHSGPydEexGIGeC/N8R4MZ4KT5/ybozsiK
	 9N7Xa+XbzA/ixaXWOYz8BTlK6Wed/vkEOi27JxSA8/JRv62v9zD2QQRIfHqku0B6Zh
	 0/eiTxG6qFjTQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sam.shih@mediatek.com,
	hanks.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	zhiyong.tao@mediatek.com,
	andrew-sh.cheng@mediatek.com,
	viresh.kumar@linaro.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	mars.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/8] ARM64 MediaTek devicetree fixes - Part 1
Date: Thu, 13 Oct 2022 17:22:04 +0200
Message-Id: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082223_846303_5DE3B44B 
X-CRM114-Status: UNSURE (   6.70  )
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

This series fixes devicetree warnings for some MediaTek DTs.

Since there's a lot to be done and since not all fixes are trivial,
I decided to do this in more than one step, as to ease work for
reviewers, maintainers and for .. me.
This being part 1 means that there's more to come... a bit later :-)

AngeloGioacchino Del Regno (8):
  arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
  arm64: dts: mt6779: Fix devicetree build warnings
  arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
  arm64: dts: mt2712e: Fix unit address for pinctrl node
  arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
  arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
  arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
  arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name

 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   | 12 +++++-----
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     | 22 +++++++++----------
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  8 +++----
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  2 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  6 ++---
 6 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.37.2


