Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E3C27C5F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPORLPyzPDJEwvO3QsQBvkLUkFXGQoRmfMVT8jvuAKA=; b=VU6F8LhSPVQqmr+C/VRbTjeLzv
	XVP7ymPyZZFJ8CtLxtA138A5H9/44h2GBnFovWjikfNoBMn0CZOHG4s/nsrD7ubNjeXDku2JXwf9R
	vEl2gE/X//SX2JW6TsEB8cf9CZoI0gLaAA7kOPV7nc+YAk3ChC50mL47e7hFWGjwVnvXCWt4ceInn
	iGnNnWOxiMMM4PrRegTl5qGUOQfj30no3LLSnUA/Zuum7NDQXNnfnj7ymOuKoXdog0PnnZDFF2vPp
	lkE44LYUpRgqqn5QOfrouVX/p+qaO5PuXPze3BzkJK8/IJvXtPCNhnrGqGBD5LKYON+poOWV8K77U
	CWTR4isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFanT-0000000ETwL-2rIP;
	Fri, 07 Jun 2024 14:42:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFanO-0000000ETsA-2nw4;
	Fri, 07 Jun 2024 14:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717771336;
	bh=UjTA2F7adwWAMjgQ+i5VZ5k/ef5LLUXB78PRbI7/CD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7wq/d6wNnb+x+qHcVp8tNbNm24/0sz84WoS/0xX1MqlBsfzuwd8UAFCdLXEAnZGb
	 5xQbmjolOloH1lHIPPY3YafTDWDv8JN2Q97m54JTlZwGWryw/nqmCaTpekcr4bGfbJ
	 i9lKm/ek3015xRo30aHYUTXLvCrx8uyN+j4auldQXQV33xXfug66PPUrvm4rThz1Bl
	 Bji5BhnpO6G00+ITNzjZxQTwf4MH6gkpfSzyQkk8qdIpvHaizHnUR8aDhcaf+H1L9l
	 MqTF3xOzq4s4fGKbMEA2ap4c+OUXbiu+DLPx6PUOx7l6MZ5GWSK0CYNps1kCWoyVO1
	 O4HIL8SWS3QiQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 408523782191;
	Fri,  7 Jun 2024 14:42:15 +0000 (UTC)
Date: Fri, 7 Jun 2024 10:42:13 -0400
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
Message-ID: <bbdf568c-bfc4-403f-a62e-3f2e00ba814f@notapiano>
References: <e5912054-0fc9-47ff-8f38-9b9a3e9d2156@notapiano>
 <CAGXv+5HJKur9vWq4j_x7-fuL5H0SY_oQNYFWTxFCC1EBxF9yQw@mail.gmail.com>
 <2491f962-a8e1-44c4-8ff9-f8c3e58a2a39@notapiano>
 <CAGXv+5HjRmn5o6uogn89OMLONWWaxBA5MJNKCesYXoR7G_FOEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HjRmn5o6uogn89OMLONWWaxBA5MJNKCesYXoR7G_FOEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_074223_040815_C3E9554A 
X-CRM114-Status: GOOD (  37.96  )
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

On Thu, Jun 06, 2024 at 12:15:51PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jun 5, 2024 at 8:33 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Wed, Jun 05, 2024 at 04:01:06PM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >
> > > On Tue, Jun 4, 2024 at 11:52 PM Nícolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > We're monitoring the status of device probe on the
> > > > mt8183-kukui-jacuzzi-juniper-sku16 platform in KernelCI, and I thought it'd be
> > > > helpful to share the results.
> > > >
> > > > These are the current failures:
> > > >
> > > > * /soc/i2c@11009000/trackpad@15
> > > > * /soc/svs@1100bc00
> > > > * /thermal-sensor1
> > > > * /thermal-sensor2
> > > >
> > > > In more details:
> > > >
> > > > * /soc/i2c@11009000/trackpad@15: I believe this is a second source trackpad and
> > > >   is thus waiting for the "platform/chrome: Introduce DT hardware prober" series
> > > >   [1] to be merged before it can be handled. Although looks like there haven't
> > > >   been updates to the series in a while.
> > >
> > > I've been working on other stuff and haven't had time to respin this series.
> >
> > No worries, but it's good to know that that's the latest status and I didn't
> > miss something.
> >
> > >
> > > Just to confirm, is the failure due to pinctrl conflicts when the trackpad
> > > variants probe asynchronously?
> >
> > Yes:
> >
> > [    2.185408] input: hid-over-i2c 06CB:CDB5 Mouse as /devices/platform/soc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB5.0001/input/input2
> > [    2.845044] mt8183-pinctrl 10005000.pinctrl: pin GPIO7 already requested by 2-002c; cannot claim for 2-0015
> > [    2.854700] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: pin-7 (2-0015)
> > [    2.869503] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: could not request pin 7 (GPIO7) from group GPIO7  on device pinctrl_paris
> > [    2.894885] elan_i2c 2-0015: Error applying setting, reverse things back
> 
> Yup. That's the issue. We work around it either with staggered driver probe
> (built-in vs module) or move the pinctrl up to the i2c bus node.

I assume you're talking about the ChromeOS kernel?

In any case, if I got things right, once your series lands these workarounds
shouldn't be needed anymore, it will work as is. So I'd rather wait for that to
happen, as the current DT looks the most correct, and the config changes
couldn't be made to the upstream defconfig and seems fragile.

It's ok for the test to keep failing for now, it shows that there are things
that still need to be fixed, so it's serving its purpose :).

> 
> > >
> > [..]
> > > > * /thermal-sensor1, /thermal-sensor2: The following is reported:
> > > >
> > > >     [    2.813605] thermal_sys: Failed to find 'trips' node
> > > >     [    2.813611] thermal_sys: Failed to find trip points for thermal-sensor1 id=0
> > > >     [    2.813619] generic-adc-thermal thermal-sensor1: Thermal zone sensor register failed: -22
> > > >     [    2.813624] generic-adc-thermal thermal-sensor1: probe with driver generic-adc-thermal failed with error -22
> > > >
> > > >   And the same for thermal-sensor2. So both are missing the required 'trips'
> > > >   subnode.
> > >
> > > IIRC either the driver or the DT had comments saying "these zones don't
> > > need trip points". In that case maybe the driver should use
> > > thermal_tripless_zone_device_register() for them?
> >
> > I believe you're thinking of the SoC thermal zones, which had trips added (and
> > the comment removed) in commit 978979409209 ("arm64: dts: mediatek: mt8183:
> > Refactor thermal zones"). But these are the kukui board thermal zones.
> 
> I see. I dug through the schematics we have, and they all seem to say that
> the first NTC is for the SoC. The use for the second one seems to depend
> on the project, with some saying close to the LCM (display?) or LTE PA,
> and on the Jacuzzi family it's for ambient temp.
> 
> Regarding trip points, for the NTC close to the SoC, I guess we could copy
> the SoC thermal trip points and reduce the values by some amount, 20
> degrees maybe? For the other one we could probably make the critical
> trip point some value that feels hot to the touch?

I wonder if it would make sense to have thermal zones defined in the specific
board DTs for the second NTC given its position varies. I suppose it depends on
how much of a difference that actually makes.

Unfortunately I don't have physical access to a mt8183 board, so I can't tell
what value would be hot to the touch.

Thanks,
Nícolas

