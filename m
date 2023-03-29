Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623EEC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbMXPFEyi3ngtrwHaocHzfA+F1do5R7/Rt65wdFf0ss=; b=wkswhwFnq3uxdqzXOk4l47NEGu
	q5ZGEFySRK9RTXov6r5mny5SSymlfOV4SKPvFn2z6MEn47LacD3ZN1ZATPaRukzHBYH+oO8J0HvS1
	VIFDCoiujdERyLeUJ/On0scmBfhiJ05iKxAMYUOfcubxRPE8gsRQXh2zmD89CJQfVYxY4LV9t+pAN
	4QXbo0NZfYOyBh7IH2E8Rik+ZgH8EaB0rYBTn9lbjUoZpOqoHSVAZubZxIBlXQtz+FHIeP9VssrUz
	f7TO1nVf66sIYtWeX9Bk98OM+1NCtbjCOngX8X4QJTgrlFx0L8MdvpwHWb7wM0fDA66+IS6zjlYz6
	Nqeo2lYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNBF-00GWOw-1S;
	Wed, 29 Mar 2023 04:13:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNBC-00GWNc-05;
	Wed, 29 Mar 2023 04:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F8DEB81F88;
	Wed, 29 Mar 2023 04:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2816EC433D2;
	Wed, 29 Mar 2023 04:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680063172;
	bh=mbMXPFEyi3ngtrwHaocHzfA+F1do5R7/Rt65wdFf0ss=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RI2cYj1JL2pKIcSknABeihKHiTycGFzIjKw5pFgxNjV022Xu0NECF7MBCFMjoglBW
	 d/OfUq/PEPCnCnJYRs3XINTrgDGuO08hH3mYsPCcdC01N6yOutyt3FhET46K9FLTgI
	 iJd4hZdqMl+1tp8giLlJJr4QxO49wNovesXm+8aDCwrIic7VOXjT2FuF0TOMC8bYcp
	 aTtG1f3GmJHz/5JxYO3O1HXQV3skcw6Enw7uLw6+hNKrbrcVjfU2TH2VOYvg8UAqDV
	 5VMnMYkld2r2favqNfGw3IBTh0EDvuK/aZMoDGxRZTPo1OjUw016IYhOmsuvuR45YO
	 TVmAX8jD3WnDg==
Message-ID: <4fa881ea6b0eb18395e6b13c965466ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230306073446.2194048-3-u.kleine-koenig@pengutronix.de>
References: <20230306073446.2194048-1-u.kleine-koenig@pengutronix.de> <20230306073446.2194048-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] spmi: mtk-pmif: Convert to platform remove callback returning void
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
To: Matthias Brugger <matthias.bgg@gmail.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 28 Mar 2023 21:12:50 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_211258_218849_7D4C67A0 
X-CRM114-Status: GOOD (  12.96  )
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

Quoting Uwe Kleine-K=C3=B6nig (2023-03-05 23:34:45)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to spmi-next

