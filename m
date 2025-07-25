Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E230AC87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=728Ct8g9n4UK+qDAJMOZmVA3D9zsl/1JMW/3b0NOOyQ=; b=hqcQZfC8YwneSGodpItrK+V3D5
	k5IrNzW8P7E65HPJR3brmeLSyhud7PjIYvWUOGxhDa21mpCGSsJUBZlz19YPLCQ4XSN5XLkSHdKn4
	byzsmwRTspfvteGgbw7NbjXApgO58p2xuPJTuAUWz6alSSO1/cSFDsXxxGmFRYkUYd4aOHQkaCati
	NdH3ewfP0kn0TUvySt7ZLNhP/xWjd69nMUhYO9giLsc7ASexCDIuvm64DJRI0cnCLmsRcQbWFO0dR
	FB4BVbItUnXQctvFbzRhwRYGK9jH5mexIqf+ZR/ZO2Pb3N75wSZBtuzk44aSpn4+6bzPjCsxjR55w
	U1HFDptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP19-0000000AdcQ-3eiY;
	Fri, 25 Jul 2025 20:27:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP17-0000000AdbH-0CIA;
	Fri, 25 Jul 2025 20:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AB695C5FBA;
	Fri, 25 Jul 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85EEC4CEE7;
	Fri, 25 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475264;
	bh=aTUYa4oy4wxPOvc8JecX8ElfkuEQILHtAfALn/xab6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AivHnx6fxOn/tyd89Fe+bvxQTmzuwiKd6XahF2foKADROK61HvS8eG5aqcgsjOwo0
	 QrEn+cpmRseYPEDN+2lgU6QGI7SWcgLSxrjNGxFM/oXNPP0g/f1sztZ5kRvMK+GsBq
	 OO1DuTpijsVzwGPHQ8K1/2vhGbRR3SuWmbHvI5JVhuQorMFU1XtVhK6yReD050/FzQ
	 +u83DVE9OuKOXkCV052rxzX/HVExTYmVgnWa8IowrfBlMwtheKx2ti6lXTQNmGMmsw
	 J1yqjYwhoBbqr64fW7jtsZdYr/zCSY9zIZ1ZpMs+HRj5QCZBoAuRmyJrBWNJ5NFF6a
	 kc+jE5j8hHdYA==
Date: Fri, 25 Jul 2025 15:27:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek,dp: Allow
 DisplayPort AUX bus
Message-ID: <175347526170.1834693.13284335506775768371.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132745_125973_279B9AD9 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: mripard@kernel.org, linux-remoteproc@vger.kernel.org, jassisinghbrar@gmail.com, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, fparent@baylibre.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, tglx@linutronix.de, kishon@kernel.org, andersson@kernel.org, herbert@gondor.apana.org.au, daniel.lezcano@linaro.org, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, ck.hu@mediatek.com, jieyy.yang@mediatek.com, simona@ffwll.ch, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, sam.shih@mediatek.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, linux-gpio@vger.kernel.org, atenart@kernel.org, sean.wang@kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, eugen.hristev@linaro.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:38 +0200, AngeloGioacchino Del Regno wrote:
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


