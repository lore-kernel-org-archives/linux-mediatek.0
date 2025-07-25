Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017CBC87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfEFj+WD1p4ex6Sg4fR+HWBGVkr7gSjPHwm1HlGHFQI=; b=KvhWF3gSAxDBoZF+NfXcM2Dvs8
	LnGj38VYb3GmCNGM3mG056BgN0XiTFdPCM00JYTdzNgENsqwbIs7HFQBcoQSaXnaxAHl3H1JOv4b0
	2ZqaweCdr3hbtuttuTT/YNNVEQQOg8beaomv0zdNLLwo81dgDcTXLmEH6xINLomWdpfzmuDetFjht
	SaslU4D06zj6LffnmxEJ6A9w4i4hyagDQfy0/j7eQI78o+Dw3KdH3DH0hSqoxutNCCwHMsok815r+
	1rZMIHgypEWrbKcTVZ6sZoyuonaVmz9sY8gFa5RuAPZILf0nzQ46S8JjpP19ANZb7drLljOxW0ymh
	pX3vui8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2h-0000000Ae0o-08kE;
	Fri, 25 Jul 2025 20:29:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP2e-0000000Ae03-3zNu;
	Fri, 25 Jul 2025 20:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E8CC5C649A;
	Fri, 25 Jul 2025 20:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC4CEE7;
	Fri, 25 Jul 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475359;
	bh=Imha4OX0ZhwOigvJh8YFnyOUROjweFoNk0pUIHBrpJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBmk1V9It9WMtACxnpGuqS+dXcJZbCibN0qJhMdmR7JXzU7UcDGxqXVSN7TX1Ukyp
	 K7oxYEDuNuZMKcDqLLt8nfuvt91BAayZZTmBtbUUk+SnPjZ8nWirQQYi4O8yeWXVum
	 XHKOThHlkOkCC7yoBj/Pz41F+ly97Cem2yaOjDdFiU1DUjW0NrB9BpuzUVVXcCjugU
	 GCBlWm/NGprv2S/hXMCwSZayD5LKPhTcHANkfzcgAclohf/gEDSuesMG0KaEnbJMX8
	 cHwf5O+G6ZypWaVIo2L0zsp1lGOraVhUfEHkWY9JaASwnHqt4qU26DFMbBfeEGA6HX
	 LWzDSdQeLlHAA==
Date: Fri, 25 Jul 2025 15:29:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 07/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add
 missing pwm_ch7_2
Message-ID: <175347535659.1836862.13811953768761711580.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132921_020136_95E9060D 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: mripard@kernel.org, jassisinghbrar@gmail.com, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, fparent@baylibre.com, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, herbert@gondor.apana.org.au, daniel.lezcano@linaro.org, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, sam.shih@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, tinghan.shen@mediatek.com, houlong.wei@mediatek.com, linux-gpio@vger.kernel.org, broonie@kernel.org, eugen.hristev@linaro.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, shane.chien@mediatek.com, atenart@kernel.org, sean.wang@kernel.org, maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org, davem@davemloft.net, vkoul@kernel.org, ck.hu@mediatek.com, linux-crypto@vger.kernel.org, tzimmermann@suse.de, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, jieyy.yang@mediatek.com, andersson@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:43 +0200, AngeloGioacchino Del Regno wrote:
> The MT7622 SoC has a PWM channel 7-2 group for the pwm7 IP: add
> the missing pwm_ch7_2 group.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


