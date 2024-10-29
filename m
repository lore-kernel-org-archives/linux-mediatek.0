Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59154D5B155
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFdAzUkd+0GcTyGkQ9/oIIo1dvmqpp5hrlTc3EhXZOY=; b=OQ0/W8r1HtB4qcV8xkrQ6q4mqo
	5qHClrYSCGfR9gZmKzl/p96OMxfiLbNRNnFiH1elX7Y1U0RD05isI+Bw6NtbCyPtMR12CLv8onN/o
	jufnyUnZbTD/6QYnAqEGpd3LUbCll80I0VQ01tqbPfTTEufVRU7uIkN+/hPPbjL5dsJ3Wem/+B6po
	XUn8VEgnzR2uL3XHSdvIn54hm/0jsArAg5OxqCG4U7hLUvIS1BjObeeuAWSSCVtjOxrUfZ8TE4hwS
	Qz5riyLGhVFBxe0cDAZLHfUhz7SY5WvPUinoLyjznilZToL+2K5U5VcD6fXJmm1t2y4BpvOYfcGGy
	zisqDJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hFt-0000000DcdG-1FvD;
	Tue, 29 Oct 2024 08:07:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hC7-0000000Dc4X-0C4N;
	Tue, 29 Oct 2024 08:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iFdAzUkd+0GcTyGkQ9/oIIo1dvmqpp5hrlTc3EhXZOY=; b=E9WrE7kocNrMH0KBtISYyOsT32
	PSMSsRWWc5ttyuBz9k08bNtdV2pmnSIxLwf8TSavrfVanzPnFH+vFeWHa8X18XX4W7rs2HhWaEF39
	lMenGv8tWDu71gfI8++INuZmUySPZj8ECT1w4N5VRO5xYI/DzO+6lz3e6/1j5NgdinKJL8R+6sYWF
	eWDftBCWLy1wRDPEblOrOj+6ShySW3PiIVJ9DC83Ds6qlsvQRzdWknfrBAB0lg5znZL0QsVoR8zpi
	LB5SGxCh96C1CN9NxF/9ho2aS0Rb79rGDcq/QHH7rG9oiG32K6IP9wBS4BK0I3BhMQOOMdoFjeky8
	DpvOJkLg==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t5hAk-0002ap-A3; Tue, 29 Oct 2024 09:01:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>,
 Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>,
 Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Date: Tue, 29 Oct 2024 09:01:46 +0100
Message-ID: <5089490.31r3eYUQgx@phil>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_010315_128519_B5D6369B 
X-CRM114-Status: GOOD (  12.07  )
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

Am Dienstag, 29. Oktober 2024, 08:48:58 CET schrieb Uwe Kleine-K=F6nig:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> On the way do a few whitespace changes to make indention consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>


>  drivers/soc/rockchip/io-domain.c            | 8 ++++----

=46or the Rockchip part:
Acked-by: Heiko Stuebner <heiko@sntech.de>



