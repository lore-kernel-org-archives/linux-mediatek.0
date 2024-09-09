Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FDEECE589
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK0vooX06fNMJDsOaDbjgFNdPUmm25HgOZttNw444Wc=; b=y28Sy2Mf34yk+9k1/Ij7W/Q365
	mNJtS6PVxnIieI5dPPqxMv1BfyLboTl47Jnp6azRACTzCbvfkACIL8UG1UiAsz6hLT4XC5CEt20+M
	THQqrjpJQDBh7jHGiUeCgMvy4ow9+LxwUV7FII5h+ccxoZkd2iUPOnTAbOPYFXUy7N9ShRI7k5h07
	ShJ4stsK86SwTOcTLn1XnmtTbME4DDwWzNUMOS5umyJuqbekMUxJ1xeLnBuQxL6D6N4J/2QXDf3q5
	bOCYNtov83nsUHrkdaqBo6xnHIzHghBckIOoOnv/aUPu/eiZr1W11vVC/ICS6ZqLho0tnAcvKwswI
	P7n+2zBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlph-00000003Lvu-1fh0;
	Mon, 09 Sep 2024 21:22:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlog-00000003Ls3-1SwV;
	Mon, 09 Sep 2024 21:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E6CE5C029A;
	Mon,  9 Sep 2024 21:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A2BC4CEC5;
	Mon,  9 Sep 2024 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725916857;
	bh=tK0vooX06fNMJDsOaDbjgFNdPUmm25HgOZttNw444Wc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FKV7PFNoHKTi30ShjIpCoZkwRE9t9Bfen1obWZlTvE/7kBYKoIEn31C3N39nYrzLS
	 wV2jGW6w3KN0K3zsvrErlzYPWwBetvWrY2f307qC1q/3r6J+/p1zFtPeTYhXIBOgN0
	 eciafNUixANNFxl6vSdZtqlBS5a9LmNMRn55+D94diIDR7T0G/PHhYyWeO5X33k4FG
	 eTc+U7uq9LECMV+8qgZJNyPQQ3B1/4G+QyMY4iVu63qvL0PddnNwd/KXYnczd4Jcm4
	 IDC2sERGEVlUEXtxEBNhzMRj5ryAeR0lohVqt8NWNujt4iZz2fJvqK4Z8M+XAaInC8
	 wBai1QZE/xkAA==
Message-ID: <ca22b69fe6311ba87a7dcca9948a62a7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 09 Sep 2024 14:20:55 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_142058_473787_E4A1EEEA 
X-CRM114-Status: GOOD (  12.04  )
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

Quoting Uwe Kleine-K=C3=B6nig (2024-09-09 07:40:25)
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all clk drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> I was lazy and created a single patch for all of clk. Please tell me if
> I should split per vendor (or per-driver). Given that touches so many
> drivers, I also stripped the individual maintainers and just kept the
> mailing lists. I hope this doesn't prevent people to give feedback, but
> otherwise the Cc: list gets Huge.
>=20

I'll apply it on top of clk-next right before sending the main clk PR to
Linus.

