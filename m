Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1241BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcxyvINPoEJ9XeooP/I2OX2GjtzlmhtI8x/UUy0Mxew=; b=W7dcQ2Lnqz1vC35GKTqO6aCb3h
	RnUA+OS7KTFzsS6Ru0/+l/oeXV+1y+LSNraSIlr/tF3cTz2AAvi9s0MBFxEIa+Yd/2TCdzI2an7dv
	bYPkCN/t5JxPEFC44DH20w9NZ2zegFvgBP+EDtxppMgsqtg5s5RBAuD9A/RBMxmBQ6xZl2mkF1BmC
	e66dvS8Wc+bmCUljjLucwKl4RWu8OIH201QHbGwaOxcJaDf5KC6dCmu7ImZeIH79IoBSyPawXElyd
	89Ul2XHjODaqxcrw0m0NxdbucEyK2EL8Zqfyr6zPsrrNXCZSvK43iUFiGo1WcsUy4rO83/YAlNEkc
	6qGdwcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtfP-0000000E7WN-3SRv;
	Thu, 11 Jul 2024 13:16:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtfB-0000000E7RR-2JUr;
	Thu, 11 Jul 2024 13:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9831761A8E;
	Thu, 11 Jul 2024 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEA8C4AF07;
	Thu, 11 Jul 2024 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703804;
	bh=r4dU6vqYjav3VvaXX3Sjsxc+xsxGdgu1+j2zgdtBir0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6+2Cwc3E4O2uSx+DH2Km80jUBJZO8J64ERrKxq9KkUeFczRflG9OflmEO510OaXv
	 45jt2cHUGxBY/BUC0Z9hW6R8nyC6DamtRdsZkHJARIg7E3kp7GzysSngCujqlP3VWR
	 TPqx6sTZQOFskGr1UzbUnP1+s/mtIHMsYSvjvwH86bewjS89AL3t0A4IeTK4ozMmE9
	 VfQlqnSZYJdUae8LIwJEfllYADu4Q5SdM6BISkS88tS/ThyaimP+0SKo9mM2mVW7a1
	 WrZ7yUkx93n0H/pTz8Qc0943VkrKQagoUfasatX2jprIFXJOAYW6pqWFKD3Q2FcVk5
	 vMsq9BOw/f7RA==
Date: Thu, 11 Jul 2024 15:16:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Andrew Lunn <andrew@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Baruch Siach <baruch@tkos.co.il>, Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>, 
	Benson Leung <bleung@chromium.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Chen-Yu Tsai <wens@csie.org>, Chris Brandt <chris.brandt@renesas.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, chrome-platform@lists.linux.dev, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Conghui Chen <conghui.chen@intel.com>, 
	Eddie James <eajames@linux.ibm.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>, 
	Hans Hu <hanshu@zhaoxin.com>, Hector Martin <marcan@marcan.st>, 
	Heiko Stuebner <heiko@sntech.de>, Jean Delvare <jdelvare@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jochen Friedrich <jochen@scram.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michael Shych <michaelsh@nvidia.com>, openbmc@lists.ozlabs.org, 
	Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Paul Cercueil <paul@crapouillou.net>, Peter Korsgaard <peter@korsgaard.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Ray Jui <rjui@broadcom.com>, Robert Richter <rric@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Scott Branden <sbranden@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thor Thayer <thor.thayer@linux.intel.com>, Till Harbaum <till@harbaum.org>, 
	Vadim Pasternak <vadimp@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	virtualization@lists.linux.dev, Vladimir Zapolskiy <vz@mleia.com>, 
	Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH v2 00/60] i2c: reword first drivers according to newest
 specification
Message-ID: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_061645_731888_2E3B40D0 
X-CRM114-Status: GOOD (  25.43  )
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

Hi Wolfram,

pushed in i2c/i2c-host.

Thanks for this big work, at the end it turned out quite nice and
I'm happy of the outcome!

Thanks
Andi

On Sat, Jul 06, 2024 at 01:20:00PM GMT, Wolfram Sang wrote:
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7 and SMBus 3.2 specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.
> 
> Changes since v1:
> 
> * changed wording according to the terminology we agreed on and defined
>   upstream. That means consistent use of "controller/target", and no
>   more "host/client". I added "local/remote target" where necessary.
> * added tags which I kept despite some changes in wording. The approach
>   and code changes (if necessary) did not change.
> * rebased to Andi's for-next branch
> * this series only contains patches which convert the drivers fully. If
>   all goes well, no more updates for them are needed. The previous
>   series converted all users of "master_xfer". But to avoid tons of
>   incremental patches to one driver, I will incrementally improve i2c.h
>   and see which drivers can be fully converted step-by-step.
> * do not mention I3C specs in commit messages, not really relevant here
> 
> Please note that I am not super strict with the 80 char limit. And, as
> agreed, I did not convert occasions where old terminology is used in
> register names or bits etc. or in function names outside of the I2C
> realm.
> 
> The outcome is that before this series 115 drivers use old terminology,
> after this only 54. Hooray.
> 
> And a comment to all janitors: Do not convert I2C drivers outside of
> drivers/i2c yet. Let us first gain experience here and present the
> well-tested results of what we figured out to other maintainers then.
> This ensures they have to deal with way less patch revisions.
> 
> Thanks and happy hacking!
> 
> 
> Wolfram Sang (60):
>   i2c: reword i2c_algorithm according to newest specification
>   i2c: ali15x3: reword according to newest specification
>   i2c: altera: reword according to newest specification
>   i2c: au1550: reword according to newest specification
>   i2c: bcm-kona: reword according to newest specification
>   i2c: bcm2835: reword according to newest specification
>   i2c: brcmstb: reword according to newest specification
>   i2c: cht-wc: reword according to newest specification
>   i2c: cp2615: reword according to newest specification
>   i2c: cros-ec-tunnel: reword according to newest specification
>   i2c: davinci: reword according to newest specification
>   i2c: digicolor: reword according to newest specification
>   i2c: diolan-u2c: reword according to newest specification
>   i2c: dln2: reword according to newest specification
>   i2c: fsi: reword according to newest specification
>   i2c: gpio: reword according to newest specification
>   i2c: highlander: reword according to newest specification
>   i2c: hisi: reword according to newest specification
>   i2c: hix5hd2: reword according to newest specification
>   i2c: i801: reword according to newest specification
>   i2c: ibm_iic: reword according to newest specification
>   i2c: iop3xx: reword according to newest specification
>   i2c: isch: reword according to newest specification
>   i2c: jz4780: reword according to newest specification
>   i2c: kempld: reword according to newest specification
>   i2c: ljca: reword according to newest specification
>   i2c: lpc2k: reword according to newest specification
>   i2c: ls2x: reword according to newest specification
>   i2c: mlxcpld: reword according to newest specification
>   i2c: mpc: reword according to newest specification
>   i2c: mt7621: reword according to newest specification
>   i2c: mv64xxx: reword according to newest specification
>   i2c: ocores: reword according to newest specification
>   i2c: octeon: reword according to newest specification
>   i2c: opal: reword according to newest specification
>   i2c: owl: reword according to newest specification
>   i2c: pasemi: reword according to newest specification
>   i2c: piix4: reword according to newest specification
>   i2c: powermac: reword according to newest specification
>   i2c: pxa-pci: reword according to newest specification
>   i2c: riic: reword according to newest specification
>   i2c: rk3x: reword according to newest specification
>   i2c: robotfuzz-osif: reword according to newest specification
>   i2c: rzv2m: reword according to newest specification
>   i2c: sis5595: reword according to newest specification
>   i2c: sprd: reword according to newest specification
>   i2c: stm32f4: reword according to newest specification
>   i2c: sun6i-p2wi: reword according to newest specification
>   i2c: taos-evm: reword according to newest specification
>   i2c: tegra-bpmp: reword according to newest specification
>   i2c: thunderx-pcidrv: reword according to newest specification
>   i2c: tiny-usb: reword according to newest specification
>   i2c: uniphier-f: reword according to newest specification
>   i2c: uniphier: reword according to newest specification
>   i2c: viperboard: reword according to newest specification
>   i2c: viai2c: reword according to newest specification
>   i2c: nvidia-gpu: reword according to newest specification
>   i2c: virtio: reword according to newest specification
>   i2c: cpm: reword according to newest specification
>   i2c: st: reword according to newest specification
> 
>  drivers/i2c/busses/i2c-ali15x3.c         |  2 +-
>  drivers/i2c/busses/i2c-altera.c          |  4 +-
>  drivers/i2c/busses/i2c-au1550.c          | 15 +++----
>  drivers/i2c/busses/i2c-bcm-kona.c        | 13 +++---
>  drivers/i2c/busses/i2c-bcm2835.c         | 10 ++---
>  drivers/i2c/busses/i2c-brcmstb.c         | 11 +++--
>  drivers/i2c/busses/i2c-cht-wc.c          |  8 ++--
>  drivers/i2c/busses/i2c-cp2615.c          |  8 ++--
>  drivers/i2c/busses/i2c-cpm.c             |  4 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c  |  4 +-
>  drivers/i2c/busses/i2c-davinci.c         | 17 ++++---
>  drivers/i2c/busses/i2c-digicolor.c       |  6 +--
>  drivers/i2c/busses/i2c-diolan-u2c.c      |  2 +-
>  drivers/i2c/busses/i2c-dln2.c            |  4 +-
>  drivers/i2c/busses/i2c-fsi.c             | 56 ++++++++++++------------
>  drivers/i2c/busses/i2c-gpio.c            |  8 ++--
>  drivers/i2c/busses/i2c-highlander.c      |  2 +-
>  drivers/i2c/busses/i2c-hisi.c            |  8 ++--
>  drivers/i2c/busses/i2c-hix5hd2.c         |  6 +--
>  drivers/i2c/busses/i2c-i801.c            | 12 ++---
>  drivers/i2c/busses/i2c-ibm_iic.c         | 27 +++++-------
>  drivers/i2c/busses/i2c-iop3xx.c          | 15 +++----
>  drivers/i2c/busses/i2c-isch.c            |  2 +-
>  drivers/i2c/busses/i2c-jz4780.c          |  4 +-
>  drivers/i2c/busses/i2c-kempld.c          |  4 +-
>  drivers/i2c/busses/i2c-ljca.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-lpc2k.c           | 10 ++---
>  drivers/i2c/busses/i2c-ls2x.c            | 11 +++--
>  drivers/i2c/busses/i2c-mlxcpld.c         | 14 +++---
>  drivers/i2c/busses/i2c-mpc.c             |  4 +-
>  drivers/i2c/busses/i2c-mt7621.c          | 26 +++++------
>  drivers/i2c/busses/i2c-mv64xxx.c         | 12 ++---
>  drivers/i2c/busses/i2c-nvidia-gpu.c      |  7 ++-
>  drivers/i2c/busses/i2c-ocores.c          |  8 ++--
>  drivers/i2c/busses/i2c-octeon-core.c     |  6 +--
>  drivers/i2c/busses/i2c-octeon-core.h     |  4 +-
>  drivers/i2c/busses/i2c-octeon-platdrv.c  |  2 +-
>  drivers/i2c/busses/i2c-opal.c            | 10 ++---
>  drivers/i2c/busses/i2c-owl.c             | 12 ++---
>  drivers/i2c/busses/i2c-pasemi-core.c     |  6 +--
>  drivers/i2c/busses/i2c-piix4.c           |  2 +-
>  drivers/i2c/busses/i2c-powermac.c        | 14 +++---
>  drivers/i2c/busses/i2c-pxa-pci.c         |  2 +-
>  drivers/i2c/busses/i2c-riic.c            |  8 ++--
>  drivers/i2c/busses/i2c-rk3x.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-robotfuzz-osif.c  |  4 +-
>  drivers/i2c/busses/i2c-rzv2m.c           | 12 ++---
>  drivers/i2c/busses/i2c-sis5595.c         |  2 +-
>  drivers/i2c/busses/i2c-sprd.c            | 16 +++----
>  drivers/i2c/busses/i2c-st.c              |  8 ++--
>  drivers/i2c/busses/i2c-stm32f4.c         |  8 ++--
>  drivers/i2c/busses/i2c-sun6i-p2wi.c      | 20 ++++-----
>  drivers/i2c/busses/i2c-taos-evm.c        |  2 +-
>  drivers/i2c/busses/i2c-tegra-bpmp.c      |  4 +-
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  2 +-
>  drivers/i2c/busses/i2c-tiny-usb.c        |  6 +--
>  drivers/i2c/busses/i2c-uniphier-f.c      | 26 +++++------
>  drivers/i2c/busses/i2c-uniphier.c        | 15 +++----
>  drivers/i2c/busses/i2c-viai2c-common.c   |  2 +-
>  drivers/i2c/busses/i2c-viai2c-wmt.c      |  8 ++--
>  drivers/i2c/busses/i2c-viai2c-zhaoxin.c  | 12 ++---
>  drivers/i2c/busses/i2c-viperboard.c      | 10 ++---
>  drivers/i2c/busses/i2c-virtio.c          |  2 +-
>  include/linux/i2c.h                      | 24 +++++++---
>  64 files changed, 313 insertions(+), 320 deletions(-)
> 
> -- 
> 2.43.0
> 

