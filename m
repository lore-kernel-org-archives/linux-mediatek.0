Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABA4C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tndkleIjyMNiQ8/7vt/ybi9DdjZVS+pTPWE39SqAuQ4=; b=Lj+0yLn3l+W2ZKrYP7emsougf2
	8eINdNaURpoRLZsumubIkYLHlmuZ3psvTPmQO+s6eZjSreIo+AhMWvEfhOS5WhU2XLEb7HNTLMQCp
	zhf9jQRkmScgxFvw6i0wNq30iskU/7hgF2LyiXqW8Uzxwk9ZcEW/T3TIL4keVifgZ37CglGW2G144
	sPOe/IXn0H2habtGvsZO4GDQtJqEvUnWh0NnUIfcUJ8mulQhKoyxBXiwM3fCFehmsu3Qmz3OgqtdZ
	ldP1xdWcuqV8V+aG6oV3yteMxkqUvGZNh9K+rAD+dhHwW1i1AYivo633BLf1Fd0hy84G+JKpQ9PPM
	9+oMQlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqex-006xnM-2E;
	Wed, 10 May 2023 20:43:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqeu-006xm8-1F;
	Wed, 10 May 2023 20:43:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5B53635C9;
	Wed, 10 May 2023 20:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB84C433D2;
	Wed, 10 May 2023 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751415;
	bh=tndkleIjyMNiQ8/7vt/ybi9DdjZVS+pTPWE39SqAuQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rfrtV3xrj0Cw+JJr+SLnl2LDMXdIUr5OlUQvzoQ6CE2+9YjYxQadHapbYsI47bJa3
	 ErHXCz1BIdWYEFUkIXJFZggD50wGDAV33mRDdtCWrWUTNFfRcaJueAehUtexCPYFvZ
	 mCXO5YCF5s4hw5zbcbK7JUD50lovGRza3M5o52mWKQmkyBtyvdYOM+m0aZ2UvxTeIL
	 DZ4Nt3t03SY/5ZCDbhgus+doxhxrHVaWUosYYrOz4Qx6f4Yl8B1V2GXz9rNdgZfr+W
	 vi9vYZavWCaTDmDldGsjIyAko0eRA5B6S7+mj2sh+PYJCg0Xd4SGt79ajCTTr5uZ6C
	 5EVRp8mhi3W7Q==
Message-ID: <5e0438103c4ec0a2fadb34d7a66b82fc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230430190233.878921-4-u.kleine-koenig@pengutronix.de>
References: <20230430190233.878921-1-u.kleine-koenig@pengutronix.de> <20230430190233.878921-4-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 3/3] clk: mediatek: Convert all remaining drivers to platform_driver's .remove_new()
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 10 May 2023 13:43:33 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134336_465505_54FA8B52 
X-CRM114-Status: GOOD (  13.05  )
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

Quoting Uwe Kleine-K=C3=B6nig (2023-04-30 12:02:33)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert all mediatek clk drivers from always returning zero in
> the remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next

