Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CBFCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Sep 2024 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phXqp9sx1SQ3XnHPFtM1vPkRhWKw5lBZejOf6LQt9ao=; b=tB5zaMcMhW5hTCeyMGngS3HInR
	RMQXdkVXNeK5cAe9GxGo73Ru8dzYUp5ZnQ8vGJ92SnIsaBwj6YgGyhrLa2/TRiZxvFcxLlMe3KQt/
	SHOUWVXdHJDpkXTQlwWEj7Kp8g7eOig0mD+aIVIRtlCOIVV3v/GblnH/LVsc77zQ3DZDHZAs7HjhA
	pcpsk45HUBi/1jZ8bq4NUkrOtnSAW37lLeP/qDwIXqomJgxS/QdYz2Y/8wVPtJkNjGtqQuFKrSsNF
	anUpwEX2BwDD2tiuKeJkDrR551x3MCq04XOAfvDEOYmNOFivmKx9q5iIMbaq/l6LMvFn52hkDH4a3
	HUGDpHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ss7QK-0000000EFJA-0ano;
	Sat, 21 Sep 2024 21:13:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ss7PB-0000000EFEC-4483;
	Sat, 21 Sep 2024 21:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEE035C03B2;
	Sat, 21 Sep 2024 21:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF62C4CEC2;
	Sat, 21 Sep 2024 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726953156;
	bh=phXqp9sx1SQ3XnHPFtM1vPkRhWKw5lBZejOf6LQt9ao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HPfuKriUJ7XdvindCQ93kJOi52p/hb4yEY19k6ESAe5MkEtBmJzu1PVvFJG1LoVLP
	 wt2gbB1hm8mXSgJ9yO9wDdJIgVrhnjL6MVQVoDQx5VYg2H+cNvLKGaTlLdcm/0F9iq
	 jOQTk9vsaQgUwOuDDUMLYeA6DfZceX5/WoleSw5xz1AURC+vIslXn6+LqnhKmaQUYA
	 cSMriGt6YbVN6H0msczVVKOSyNe6LmyAHERtIuW1Gld5uDFeDTwM7xayTORfk4IYUn
	 UvMSFvyEdL1tKjtYhCNEpMMYtSlvDkTCLNllo+OW+Vc1BQTTK1KvaMNDNiBlZRB4nK
	 R/h+nnCFE873g==
Message-ID: <1a96db1609b5b3b26584d8f823d85b7f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Sat, 21 Sep 2024 14:12:34 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_141238_073501_ABD5CD49 
X-CRM114-Status: UNSURE (   7.44  )
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

Applied to clk-next

