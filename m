Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D27C76196
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 02:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wQE/drT7e34/c/NgJ5QiJIMrN+6PpgP9tLD3o0ET40=; b=NpitFqWi5UXB9xl7YZFLHDbBe1
	o7jDQB7rmFvhs7LaGxuzMvfg/+DTCmqGUSd00bBAiPiwUiH2OESZDqhi9NOqmhLXUMzsHOyUq3MVq
	NKg+YOrXmgVwvza8vGPi9sZQow9Y9Ca3OnJw3LW03234tabX2etK97kicNacB9n5IMfnsjqjvQtOa
	GY8X90zLXoOUJuQ4+BWHK0R2hlKEFmtqVGIYvjMbYdhQhzMr51dpEyuFtjKpjdSQrDNGZnLxkn9B7
	AZp/vL+d3AQ5ESa32+9u61h4rANaf9JMv9hyXTRhsgVp0moh0tkUvT9Z8gbVVJ9fMmDgQnLQE7TbL
	JVyYrv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phLiq-00GMxn-0X;
	Wed, 29 Mar 2023 02:39:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phLim-00GMvb-1p;
	Wed, 29 Mar 2023 02:39:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2322461A34;
	Wed, 29 Mar 2023 02:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7804FC4339B;
	Wed, 29 Mar 2023 02:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680057571;
	bh=6wQE/drT7e34/c/NgJ5QiJIMrN+6PpgP9tLD3o0ET40=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nFnK+q+Khdv1ZYiE8apptSAhf8GvCJFSNU9I8S2yelfUbGceiLTZ5D06M7pCwuGhp
	 Odt3C9dadTUrMk28Qjfgdwdh9Rpu+llOlY/3c+8Tn0Sizsj63wvp2fOTC29vc6Xpnt
	 plyk/A1NPGA7uM05/21fPZKSU7ZOtcnyxruTV/5+VdyQx+FHYHUquvXrykKdxR0Nce
	 ehXGUNykDI3vWOZpFJm2T2EEHNv1/39uW65GCYgCa2oNSYc/OgvgMetlYUithoh8oc
	 n0nWAtf+hmViV67exKws/VJrzW7b0YF5uzqKWnQsx8JLpUKPt6W6YXz5LGPv3IntI+
	 TbYQHjsVPl3uA==
Message-ID: <2568dd009b37c4e9a183004dcade416c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-20-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-20-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 19/30] clk: mediatek: Convert to platform remove callback returning void
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 28 Mar 2023 19:39:29 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_193932_638131_439DA44C 
X-CRM114-Status: GOOD (  13.56  )
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

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:15:01)
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

Skipped this one due to all the conflicts.

