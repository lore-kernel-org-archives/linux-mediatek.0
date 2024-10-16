Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15FBD1AD21
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OFDMBjF0KjDjqpMSiEHi1R+N84xnu3TpCx6HVBgG1Y=; b=gJ7mKXvsZOWwYB3RRRjAF32587
	Wf1VDXsldBE9hHNWvnny8sHGJpBNBYqeoTbNhiopIEVyxplDzrnmbFvn+sXoYLQhoQEn3ApmrnJ9S
	RggffWT0A4Mjg33r4D5jll1zeHXqgjB78VlQzxdN6YiTD9MB8bXNgQFS6BbaArbloLjmed0Spxyed
	j24IhV9+TzgQhlNpKB8PNu8rfPnERpmXMSY/GXbLVNmNTZMCROCohOJ74/Thcv76Fc8zzTbasfYQm
	nWDctXog0e78SwZ6T2eUcwfTRZNJVIQLx53qijllnx1NXUl5fJ9nolJfns9WWdDwqOVLZT2pbhWPK
	SlQnVHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yzQ-0000000Avs7-1rq3;
	Wed, 16 Oct 2024 08:02:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yvD-0000000AvDj-2ZCy;
	Wed, 16 Oct 2024 07:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 873B45C5A19;
	Wed, 16 Oct 2024 07:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D67C4CEC5;
	Wed, 16 Oct 2024 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065498;
	bh=nsM60+cNuES1C+fqTbnc5ooJ0hP520KLGK9VFBCBDGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fE1nfrPWvmps83biOQkLKuOrEbyoX9F+oYZZR4MyCkhnTWXLfurI4YDDnEgp3i07b
	 VRYqDkPXIU+qUtKDWJ717mNrRjaZqikw3+etM/jDuz+SlyxnvznHnDKrAlDX0CzJ7e
	 fINBIZ+D9Zp09Ppusrp8Fb0ZqNgnLr3Jdt9Q8ncBHGtElLWB9ESeQ5b5BDNqyqrPHs
	 CtV1sq/qM1ERfGyqIll+x8X3NR+ZGI4q/LTpO0Q+uyL0JEmPhyTYdi0Xyt3NDfgwb3
	 N7NtwUeILsWm6XGFTmTz4KTjWwUil3aV5cQPTDvmG6RV280Yh47SXf5mfG97vA2mxx
	 vkzZ51zg7DMLg==
Date: Wed, 16 Oct 2024 08:58:08 +0100
From: Lee Jones <lee@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v8 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <20241016075808.GM8348@google.com>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
 <20241001104145.24054-3-macpaul.lin@mediatek.com>
 <5nvshurbpmjkqysphfrfxhekq3c6od6a2uqai4rfxns64mdvf7@ftjvgjnivr3k>
 <20241009155222.GB637580@google.com>
 <vb324yv7s7yew6m74lfvdv6wnuo6e4rxtiu2q7okypttw46ox2@lgfdkie6o3t2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vb324yv7s7yew6m74lfvdv6wnuo6e4rxtiu2q7okypttw46ox2@lgfdkie6o3t2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_005819_755831_98BA765C 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, 15 Oct 2024, Sebastian Reichel wrote:

> Hi,
> 
> On Wed, Oct 09, 2024 at 04:52:22PM +0100, Lee Jones wrote:
> > On Wed, 02 Oct 2024, Krzysztof Kozlowski wrote:
> > 
> > > On Tue, Oct 01, 2024 at 06:41:45PM +0800, Macpaul Lin wrote:
> > > > Convert the mfd: mediatek: mt6397 binding to DT schema format.
> > > > 
> > > > MT6323, MT6358, and MT6397 are PMIC devices with multiple function
> > > > subdevices. They share a common PMIC design but have variations in
> > > > subdevice combinations.
> > > > 
> > > > Key updates in this conversion:
> > > > 
> > > > 1. RTC:
> > > >    - Convert rtc-mt6397.txt and merge into parent MT6397 PMIC DT schema.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Everyone okay with me taking this without a pull-request?
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks Sebastian.

I have a bunch of things that depend on this, so I'm going to whip it in.

-- 
Lee Jones [李琼斯]

