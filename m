Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00168C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7JoMvq12GkBDAMpw0bQAgdVpKquBbUYn0pK97yJaOQ=; b=bDOAC8OmFMf67Z4bDxB3NqfP2C
	uZRpbgqGYUwC1TQOJ9KWAty6xKqD2CCm5fRSNN/ymDMKiYXFZSCG73QaecMM+sORoKuHEXhMgiwZ4
	3CtVKTPF7YvtcTIPeK5R7uIs9p27ITj+8Z1VJ9n529/GhvooWyUP+v/SeeFCjAWmkoevbdFMI+fNj
	CI8ADIUYLTIFmhk10hT86Trz0+kdC29gdB4Bu4XWIaLfyhG0t/KcpFNPoO7Nrkzjx8ATh4m0wf2Zw
	XGQtFMsvaYeOb+ONcNLTtweAPzxBZphnfBU6GpBMe+GGNwpQ1NW0Rxaavk8jDwDlGIRDPVlQw6yZo
	37N6ZJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqed-006xgl-0g;
	Wed, 10 May 2023 20:43:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqeZ-006xfP-1Z;
	Wed, 10 May 2023 20:43:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4017A635C9;
	Wed, 10 May 2023 20:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC2C433D2;
	Wed, 10 May 2023 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751392;
	bh=x7JoMvq12GkBDAMpw0bQAgdVpKquBbUYn0pK97yJaOQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZVp3Fh//rOZOI2KmFeakDBJXz14hmUm4L5JHlBzzzf056YNFNzroLjIX1zw2DU6YR
	 Cpb5ltYNlm9fwjaX3/Dw5a2lJwwIoznyyUI3K/PYSlAnX7jV2k6DUjMHeW9WIn7wIA
	 jVbkAjsVGILIyvAvpz3BZ9cOlghyBQoStxHGlXgictIFQ7jPZTD8iaQtyAxMgUpovA
	 ciIKUD+jCM5dvGAwkSG15u3S73r8Bq9GawfmQDrXJQjj8Kwk+RFY1ztkQlE5Ci0v/r
	 SHhdgVpH6ME0aoML9QFfHxTgLGpPYLya97LQsjFjRkwMDfZKhAcCPBCHmWUperndjk
	 XDk6wW8cDCEoQ==
Message-ID: <f1d5d02d31e6237087c81705907ed861.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230430190233.878921-2-u.kleine-koenig@pengutronix.de>
References: <20230430190233.878921-1-u.kleine-koenig@pengutronix.de> <20230430190233.878921-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/3] clk: mediatek: Make mtk_clk_simple_remove() return void
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 10 May 2023 13:43:10 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134315_585089_18B34F23 
X-CRM114-Status: GOOD (  10.00  )
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

Quoting Uwe Kleine-K=C3=B6nig (2023-04-30 12:02:31)
> __mtk_clk_simple_remove() and so also mtk_clk_simple_remove() return
> zero unconditionally. Make them return no value instead and convert the
> drivers making use of it to platform_driver's .remove_new().
>=20
> This makes the semantics in the callers of mtk_clk_simple_remove() clearer
> and prepares for the quest to make platform driver's remove function retu=
rn
> void. There is no semantic change.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next

