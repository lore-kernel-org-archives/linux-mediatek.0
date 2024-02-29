Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9521C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re6qXz3o/b8SvRuyQAdXe/GP8greLRsmO3K6B3cgElE=; b=GcP2MyYBtljwm8Aae9pFtSvD+t
	E+lnbE/jV7L1pjehJynnqv1fY6OWlZvTB6QHE0tvBVeq54a/78OHpHS3LP0PQBiBiqXjrGB2IHqNv
	Wc6tjZlPw7n+96TjzXgd0aQ5QOupJiZZoXUCCb0HGjH7NCp97RGNvgj/Z9TrA3BgWjf8d7+lmjFiR
	9WEwQxHUz2FITGkGfuV2XssxWMZO+hU3kQpG8MRBIZxnokqVWVR5gzP/x33f6oyFYv2AYwDFoAn+5
	KQ8qnKHacuh9lxGSr6crM/iNuNUTdvGg3B/I0dWFcGWnaiJzOfFTRjzDDO3JXgAAa5xRWOjIJ1XT7
	3op2WSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfVRX-0000000BeKu-2YnY;
	Thu, 29 Feb 2024 01:42:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfVRN-0000000BeJZ-44LA;
	Thu, 29 Feb 2024 01:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AC1B61648;
	Thu, 29 Feb 2024 01:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CB4C433F1;
	Thu, 29 Feb 2024 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709170949;
	bh=Re6qXz3o/b8SvRuyQAdXe/GP8greLRsmO3K6B3cgElE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=r8peBKaeaFaNJML2f3KZ8Zp/77o6uF3WFFMSeBwTR0voty8TBptajgEw5VN+0PwNe
	 kBrkWX4E7m9aMEEgJg87EV8dUZUzzgwq1BSquJ3G2ejZT2NFJgxJ4JHykgIwOYYTV0
	 2SJA/b8CSdUUiVd1cFqoCqdGuS8BlVy1Z0Zci+ZB4LSs4JL9aDL7TRjSx07TInLdp9
	 g9Zd1qswqO8tWvYQT33KGAFZuhu/OsJvMqbeITggNz9FS+4UmqmTLPXQJDdwfdNji7
	 aszT2fx6ts30CsneTRPdLFPSLHWOutY1vVb72jBbnCF8iryxyu0JJ7jGBBFHG+Ox1B
	 PG+asZt3CeZ2Q==
Message-ID: <74bf05834dcd1a39da804f19f2a809fc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6a64e7b3-b1ce-46c4-9c85-89f731aee592@web.de>
References: <6a64e7b3-b1ce-46c4-9c85-89f731aee592@web.de>
Subject: Re: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Use common error handling code in clk_mt8173_apmixed_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
To: Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Markus Elfring <Markus.Elfring@web.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 28 Feb 2024 17:42:26 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_174230_118576_966F469A 
X-CRM114-Status: UNSURE (   6.96  )
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

Quoting Markus Elfring (2024-02-26 04:26:26)
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Feb 2024 13:10:37 +0100
>=20
> Add a label so that a bit of exception handling can be better reused
> at the end of this function implementation.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

