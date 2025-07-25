Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D2C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhvRIGuxm4FSZ08xYbjtEkasCWtV0IxaBg99BewfkZ0=; b=MdNO4eSico4XP8jADBjm2e8NJk
	t697EJqJlBAA0w1iDLZpvspQNtsv/MF7tya8PYqx0X2rOZJgLmr5qhTYFUS35BaQLO5TZrcT61tsw
	PsnAaeEeEt0i3/S8WXj68cx5OZPrx8sF4BD6H/wzT6Pqgap8MevxVfQzRCtrKMQU1tQbdjE6YIpeA
	O4rDwpH4WugCwn/ym5D3OcR28XNnT87VIuV8jslHoIV8JO/8Nwf7SE5Ztpu1QQhbCwawL+F2zjqGw
	0wtJDHI1pH5d6GWW4XHZtDcwf003PkdScsHfd2s2YiIgYAZqkTXd52c8baO49cOf46hpX6zONLo66
	Bo1QuJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP0Q-0000000AdVW-2NXh;
	Fri, 25 Jul 2025 20:27:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP0M-0000000AdUl-1Ik9;
	Fri, 25 Jul 2025 20:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FBE15C6415;
	Fri, 25 Jul 2025 20:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD53CC4CEE7;
	Fri, 25 Jul 2025 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475217;
	bh=gwiksp3J4bGpqvzDaXhOxRpN1GcS86ZmMLM2DmIXBlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGN9Hi1imKljswG6X/DBWlkd92MGaNXkl7nCpM96OQLcPyU/TkuYmNgKqvYkbtIVR
	 9dckup9w/GKbTvNcPaRj1rQ77iwFaIjwjQJQaekWBHEzdCiBLNfF+qnHajVK1zC8T2
	 fEvTe7JTB/wj79CyGw4A/ansr+AR4VppgZXBymyhe5oAQt0Z2tmwxe0DngswssY1h+
	 /kyUy6w2NxgYSmTlvqwU4n4bVhYX9RCEZ0BaoTO9ElMI5nyzjj++ig1nJ4q+GO0v9F
	 wJwMkqxcH4BdiQte7QQqI9MDqYfQBMxJAWlvaDvqDWvRMUTD3lgPtZMZNoj8a+7PJG
	 yUHsU9u7dT27A==
Date: Fri, 25 Jul 2025 15:26:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
Message-ID: <20250725202655.GA1826181-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_132658_422661_0104C988 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 05:16:21PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 24, 2025 at 4:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> > is optional, and has always been unused until MT8195; specifically:
> > on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> > on newer SoCs, like MT8195, it is located in VDOSYS.
> >
> > For this reason, allow specifying the resets and reset-names on
> > all MediaTek SoCs.
> >
> > Those properties are optional because there are multiple ways to
> > reset this IP and the reset lines in MM/VDO are used only if the
> > IP cannot perform warm-reset.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index b659d79393a8..eb4f276e8dc4 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -102,6 +102,13 @@ properties:
> >        - port@0
> >        - port@1
> >
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dpi
> > +
> 
> Do we really need the name if there is only one though?

Not really, but if it is already in use then easier to just fix the 
binding than both the binding and dts.

Rob

