Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7FDC25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQUL2PzKR+JdrLffnBAs2bKimKacdctH4BdntKoRNT4=; b=koz/hFtj29hadIKZEI9f7WDzNF
	yB0jsKtigiAkPWgTKU6C+W9UZj8RDvZj+zWmu7gAEW7LvbC237a3WFRwEa8RKx+Qn5X9ZJ0yte+EU
	T3Nw7kHmnuZ3V1VHM09KRsvKSf+BJm8NzlJWg0v8MO7cnJyiBUqUYIFJYgSNHolQlcfAniqO6ScdS
	4j3cVaW4rC9c15HjjdwswNZ3ODZC3h///BoL9xrwBghJfNZqGMj86gKz6DtFzxg4z/vblbFUFFp2b
	m4XuVSzFQbPD9p0Z2AYFrZx84pCd9gDKqFiM2QUBO6EPuB2Ku/iJRVyKtcjAKsQ6k+t8qsubrmc4a
	2lICq6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEppW-000000060n3-26zh;
	Wed, 05 Jun 2024 12:33:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEppS-000000060m5-2Obm;
	Wed, 05 Jun 2024 12:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717590798;
	bh=43JzBq3ntkiARgDqq61v/eTzXhWt2IKimvfmiXq/pWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RO67AvLJAYr/9hxw8E5sXcBQritIrnEVl/iQvjAhAnQIH50bMDpCu3lrbl+NeBTtX
	 U1S8ZPqTvJzFHzKfHaeAhwOv/oMThjyyrtQGqzipSltDsIfzA2X4kiCDGvzdTioHLF
	 TYWpDN5Tr8ZMDm2AyCYFreP+xOtBzZ0JQOEg0nFMN9ZGUitEn6s1iZ2X0IxUmcQWKl
	 pM1CdV8+nLW7+tYqUsrYzpx/hKqMF4rv4Z2Ep/u+KNy7nh+tpZZn35THRJuJ6baqIY
	 DN+ZSjvrgszTNK5WRraqWdq/OZw1jSBbSEA4XKfhb2YdBW7Rl6IWIeb4R0eEjS1Kj4
	 zYStJebSWO6SA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 321BB37804C8;
	Wed,  5 Jun 2024 12:33:15 +0000 (UTC)
Date: Wed, 5 Jun 2024 08:33:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: Probe failures on mt8183-kukui-jacuzzi-juniper-sku16
Message-ID: <2491f962-a8e1-44c4-8ff9-f8c3e58a2a39@notapiano>
References: <e5912054-0fc9-47ff-8f38-9b9a3e9d2156@notapiano>
 <CAGXv+5HJKur9vWq4j_x7-fuL5H0SY_oQNYFWTxFCC1EBxF9yQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HJKur9vWq4j_x7-fuL5H0SY_oQNYFWTxFCC1EBxF9yQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_053322_934790_929D0DD4 
X-CRM114-Status: GOOD (  24.78  )
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

On Wed, Jun 05, 2024 at 04:01:06PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Jun 4, 2024 at 11:52 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Hi,
> >
> > We're monitoring the status of device probe on the
> > mt8183-kukui-jacuzzi-juniper-sku16 platform in KernelCI, and I thought it'd be
> > helpful to share the results.
> >
> > These are the current failures:
> >
> > * /soc/i2c@11009000/trackpad@15
> > * /soc/svs@1100bc00
> > * /thermal-sensor1
> > * /thermal-sensor2
> >
> > In more details:
> >
> > * /soc/i2c@11009000/trackpad@15: I believe this is a second source trackpad and
> >   is thus waiting for the "platform/chrome: Introduce DT hardware prober" series
> >   [1] to be merged before it can be handled. Although looks like there haven't
> >   been updates to the series in a while.
> 
> I've been working on other stuff and haven't had time to respin this series.

No worries, but it's good to know that that's the latest status and I didn't
miss something.

> 
> Just to confirm, is the failure due to pinctrl conflicts when the trackpad
> variants probe asynchronously?

Yes:

[    2.185408] input: hid-over-i2c 06CB:CDB5 Mouse as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB5.0001/input/input2
[    2.845044] mt8183-pinctrl 10005000.pinctrl: pin GPIO7 already requested by 2-002c; cannot claim for 2-0015
[    2.854700] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: pin-7 (2-0015)
[    2.869503] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: could not request pin 7 (GPIO7) from group GPIO7  on device pinctrl_paris
[    2.894885] elan_i2c 2-0015: Error applying setting, reverse things back

> 
[..]
> > * /thermal-sensor1, /thermal-sensor2: The following is reported:
> >
> >     [    2.813605] thermal_sys: Failed to find 'trips' node
> >     [    2.813611] thermal_sys: Failed to find trip points for thermal-sensor1 id=0
> >     [    2.813619] generic-adc-thermal thermal-sensor1: Thermal zone sensor register failed: -22
> >     [    2.813624] generic-adc-thermal thermal-sensor1: probe with driver generic-adc-thermal failed with error -22
> >
> >   And the same for thermal-sensor2. So both are missing the required 'trips'
> >   subnode.
> 
> IIRC either the driver or the DT had comments saying "these zones don't
> need trip points". In that case maybe the driver should use
> thermal_tripless_zone_device_register() for them?

I believe you're thinking of the SoC thermal zones, which had trips added (and
the comment removed) in commit 978979409209 ("arm64: dts: mediatek: mt8183:
Refactor thermal zones"). But these are the kukui board thermal zones.

The thermal-zones dt-binding does describe the 'trips' node as required, so I
think the only option in this case is to add trips to them, or remove the
thermal zones altogether. I'm guessing the
thermal_tripless_zone_device_register() helper is meant for other thermal zones
that aren't described in the DT.

Thanks,
Nícolas

