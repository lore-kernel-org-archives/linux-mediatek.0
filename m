Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A05CAC5B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z477Gq11r6hec4WS65Z6hH4Gn4gQs07AjpjYni56VYI=; b=JmQZfHfGHJqg1xkq1tQC/dhje0
	LpjzFbMoOxv/0onj8+A6QNmhM5JUbiHc3I1bo3s06d+7im8piD56CKk6oI9vVNkuQKR9y32oUS/jC
	xC+lU4p16GRDW74ymwxFI1Dnb89rcRd7E0vNSMsIgfdeYNZjZ2O9jIv2MU2YmY8nY/eVf/8/n/WM7
	JU/8S0oS/wGTmpKt5ze5kIF903czkmW/rLrKfGrwLOPdmfk8sCdKTSfxzyG9mlQhZH1SKZzi8TE8n
	QE/Nk1TQDIrUYEMXHqVHJpxCNlXeDbnOVrZj/396u5dbqAeEBxZGs5lnVlq0fhe6oi2XZ7ejmk7Xv
	u0qpCJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AhS-0000000Et65-3xWw;
	Tue, 23 Sep 2025 21:37:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AhQ-0000000Et5a-385G;
	Tue, 23 Sep 2025 21:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D620B6028C;
	Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE44C4CEF5;
	Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663443;
	bh=AmT7pTT/bQK4h7VloFIIhchliPgyZojTf54MF0QHREo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a55I2Drexre9bmk9zOM6IHzQLXlQLZh5HwWP9Px8aa/1hUS7J58IX7JJ3YDzCuSEM
	 PAS3UJCrtAIueVROmkX4i4/LE8CnJ4xggv/HzM6XkXuZUCxXuwrOA/v6g8Y2f0uku/
	 f0ijwgCPwX5/BC3M3TGHhGSBZsK1PD0rxU7lsZr5CX9FWDXzMlOrlUQMTXiYaxcO0D
	 skyJYWG9BJlwnI2a0btE2FNr6ra9N0dWRB6zll1TTr5tpxaUDyhp6C6gLAYOk8Mmtl
	 jxKtO5V+Vycuwt7yWcI4UnHje3zc3L22NfIckDsJKK8yanMDnkXkmCavEDVeL+Tcsl
	 68jmOmlZAVZmQ==
Date: Tue, 23 Sep 2025 16:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 00/38] MediaTek devicetree/bindings warnings sanitization
Message-ID: <20250923213721.GA91441-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 10:38:36AM +0200, AngeloGioacchino Del Regno wrote:
> As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
> tests, and got an infinite load of warnings.
> 
> This series starts attacking this situation.
> 
> I didn't really count how many warnings I have resolved - it's a lot
> of them anyway - and I think that this is a good start in any case.
> 
> More will come, but I'll be on a long holiday soon, so not from me
> (or anyway not before I come back anyway), but most probably from
> someone else (in August...!).
> 
> Cheers!
> Angelo
> 
> AngeloGioacchino Del Regno (38):
>   dt-bindings: display: mediatek: dpi: Allow specifying resets
>   dt-bindings: display: mediatek,dp: Allow DisplayPort AUX bus
>   dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
>   dt-bindings: timer: mediatek: Add compatible for MT6795 GP Timer
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
>   dt-bindings: pinctrl: mt6779: Allow common MediaTek pinctrl node names
>   dt-bindings: regulator: mediatek,mt6332-regulator: Add missing
>     compatible
>   dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
>   dt-bindings: regulator: mediatek,mt6331: Add missing compatible
>   dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
>   dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node
>     address
>   dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195

As we are close to the merge window, I applied patches 1, 3, 6, 7, 8, 
10, 11, 12 and 14.

Rob

