Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0F0C624D3
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4i1HvmYC+QCvkWjfP58W8bQ1OnikECCoFtWUyduYoc=; b=Jt/QVBY9Qf7Yxn/qWF/hYARh8+
	5wQLjRIW5sjI764gIlqPLAaheCFwSaoaxQ+HwjzGFxfld9203Sf5c3BXhWz6o8IgCbxr81ueHwyez
	52fd8DQjrAZYCKkb8eRBDO5janQM6Ya5NOHBi1oCjx0XlWce3qZoaRME03kbVFuKV0kKHxLnp++uW
	16O2R04Tjfkr6hVpldHJD7HD6lUKuf2kipa+Sb2uhurzkirPqNY+FxK1N+uLsIvZH3BNzBZLFhQ9w
	+zH8usg9AipkDJ2THXL/NVu+/8IFgW0nOMviaUNwUvdG3PdMIH33kGtIiVLQ2L6+l1DE8JrYShNvs
	UlI8hk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ujK-00000004J3T-1zF6;
	Sat, 05 Sep 2026 18:03:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ujI-00000004J3G-0u81;
	Sat, 05 Sep 2026 18:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DF84601DB;
	Sat,  5 Sep 2026 18:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AF01F00A3A;
	Sat,  5 Sep 2026 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788631382;
	bh=b4i1HvmYC+QCvkWjfP58W8bQ1OnikECCoFtWUyduYoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MNEexEVGh1RTnMaHT4+kKNk2D3jGJ2LiY1adZUzswWAxj/Lu3Dvmsx4rdCHWxTeIb
	 zuj+DcHdYm9lOmbshmvWY8wukdE7NX4amMJKiPnCPU3fu0Xud6rXCByZQ/7P4Jpp1+
	 rpGCbRWRvvkHto/QMITNm7jl9x+SiWoazoyy1xEu3ttOO7CikqsuL7NA/NLR45A5SE
	 qX12DApvPD3hUQSXxojNo12Plf0eARi8xpKq7AVrgWSGV3mfvqT1UuE14VIGsSfE4J
	 +0M+jXixgPCrD+fbzxu7hi2TWdN8kHwVDi1shNJ3bAmyhz5ymAW+2oI6/1JyDByfR6
	 O79OuJAZSsB1Q==
Date: Sat, 5 Sep 2026 11:03:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <kurt@linutronix.de>, <hauke@hauke-m.de>, <chester.a.unal@arinc9.com>,
 <daniel@makrotopia.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <ansuelsmth@gmail.com>,
 <linusw@kernel.org>, <luizluca@gmail.com>, <alvin.sipraga@analog.com>,
 <clement.leger@bootlin.com>, <justin.chen@broadcom.com>, <dlan@kernel.org>,
 <rogerq@kernel.org>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <opendmb@gmail.com>,
 <andrei.botila@oss.nxp.com>, <wangruikang@iscas.ac.cn>,
 <amadeus@jmu.edu.cn>, <kees@kernel.org>, <tmshlvck@gmail.com>,
 <c-vankar@ti.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
 <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
 <v-singh1@ti.com>, <oss@vassilevski.com>, <haokexin@gmail.com>,
 <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 00/33] Remove comma after sentinel entries in
 match table
Message-ID: <20260905110300.2b4825d5@kernel.org>
In-Reply-To: <cc1f9d12-e853-4000-8236-9e7f5a9ed314@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	<20260904085811.7e2c2db6@kernel.org>
	<cc1f9d12-e853-4000-8236-9e7f5a9ed314@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 5 Sep 2026 11:09:54 +0530 Siddharth Vadapalli wrote:
> > You failed to specify why this "cleanup" makes a difference.
> > have you ever seen the sentinel not be the last entry? =20
>=20
> The 'cleanup' in a way 'guarantees'/'enforces' sentinel being the last=20
> entry, by catching 'copy-paste' errors at compile-time rather than being=
=20
> a silent bug that shows up at runtime. If a new entry were to be=20
> accidentally added after the sentinel entry in the current drivers, it=20
> will not cause any compile-time error, but will fail silently at=20
> runtime. This series 'cleans up' the drivers by making it a compile-time=
=20
> error going forward (adding a new entry below sentinel will cause a=20
> build error with the comma removed after the sentinel entry). I do not=20
> doubt the review process on the mailing lists where such errors will=20
> certainly be caught, but isn't it better if they are caught at=20
> build-time instead, thereby saving reviewers the trouble of pointing out=
=20
> such trivial mistakes?

Is it polite to answer a question with a question? =F0=9F=A7=90=EF=B8=8F

Please be mindful of maintainer's time going forward.

> Trailing commas are an indication of 'scope-for-extension' in the=20
> future, which holds true for 'enums' or other structures where newer=20
> entires are added towards the end rather than being inserted in the=20
> middle. Since that isn't the case here, this series makes it clear by=20
> removing the trailing comma.


