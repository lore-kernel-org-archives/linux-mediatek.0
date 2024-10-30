Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86242D7494F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g97qSBk0nfVaTQ4nSQz7mm5l86i31AAhLyCvLjCxnwg=; b=NMiFpAVJtvyzyP/M1Z1XE+WtZC
	PVl4w8syRHPJe2I780xLykbtKqq2+95jH1S+IprmVYlnezc91w4XpLWaHjdVgQQSCdfzeyJiPKUYE
	bPIm9RDdwn8iO02oT0Ofzpl4cdZPgP5SllUxvJuPJxi646tWVnIir4zpCHuJjJQyQhCrPoQDPmOa+
	816XsHEp46CzruOxEA/FPbo48XsvyptZFUb+ABC6f7cBKXqP3TVQ+tfyhpzU47qh4bGyUXdEpPzfk
	77+Cp1yB4HGk0IagbXTTUNJZRDNrB6BOy+RluFlC7yjkpYyPHugv/VCj1hf+kxJ+eRhDbfWMvpHdu
	3q+P/T2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wUl-0000000GK5t-2p7D;
	Wed, 30 Oct 2024 00:23:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wUi-0000000GK54-3kMm;
	Wed, 30 Oct 2024 00:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730247801;
	bh=g97qSBk0nfVaTQ4nSQz7mm5l86i31AAhLyCvLjCxnwg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=di+ZrdRmCd/lQns/8eExuvjbnZpOwlfJZqQhT0vk6A4dWQSREGaSjYA1NUpuSXq/9
	 zLOKIqOjor7p9tE0dyGfw4ybWiryzyo+iipRVF2kM5VpPdFA3d+3Ou9jXOVP2gRjYg
	 nxhaMgbcn/2U32y5829iQGbhb4KxNznUA2+K/2a0+EQ2SswvR0VQC5IX3R2gM1Hc5H
	 qIqUDA2Y9Sx6OWg9iXKjz7Q61ZLM8qzV89E79bImydBlZ3cYU8OsnRBo4eKdTRLt29
	 HKUqM1u67bcl+f74e72B6y7/Ev8hL3bEW1/AqAaeVkze+VI+uRfQfKCa7B551KThzG
	 ud9Ehgxe8s9Jw==
Received: from [192.168.68.112] (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.243])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A1A9067E6D;
	Wed, 30 Oct 2024 08:23:10 +0800 (AWST)
Message-ID: <3c7893f5186f0c6d64c063dc0a609ec8d6c8bcf1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
	Arnd Bergmann
	 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Joel Stanley <joel@jms.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa
 <hasegawa-hitomi@fujitsu.com>, Huisong Li <lihuisong@huawei.com>, Linus
 Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Gabriel
 Somlo <gsomlo@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,  Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>,  Santosh Shilimkar <ssantosh@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?Q?Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>,  Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>,  linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev,  linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org
Date: Wed, 30 Oct 2024 10:53:09 +1030
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_172329_145776_4BE8AF19 
X-CRM114-Status: GOOD (  20.21  )
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

On Tue, 2024-10-29 at 08:48 +0100, Uwe Kleine-K=C3=B6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement
> for
> platform drivers.
>=20
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is
> done
> by just changing the structure member name in the driver initializer.
>=20
> On the way do a few whitespace changes to make indention consistent.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> I did a single patch for all of drivers/soc. While I usually prefer
> to
> do one logical change per patch, this seems to be overengineering
> here
> as the individual changes are really trivial and shouldn't be much in
> the way for stable backports.
>=20
> There is no dedicated maintainer for all of drivers/soc, but I'd
> expect
> it to be ok to be picked up by the arm soc team.
>=20
> This is based on today's next, if conflicts arise when you apply it
> at
> some later time and don't want to resolve them, feel free to just
> drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.
>=20
> Best regards
> Uwe
>=20
> =C2=A0drivers/soc/aspeed/aspeed-lpc-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A0drivers/soc/aspeed/aspeed-p2a-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/soc/aspeed/aspeed-uart-routing.c=C2=A0=C2=A0=C2=A0 | 2 +-

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed

