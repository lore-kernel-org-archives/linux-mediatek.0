Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C5FC25B67
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPv8JKp9KG/NlfBS0NO1btDCqFNTPhmHXr7jXTmHJag=; b=EOlhidnT6Jz/NcMrtguIwMuZZy
	rI3VUopcIXeRcWbyPEtkBELJbDOdafTqGJWAsrdoUD2fsOE8n5oLiiuGRi07+Z2aJ6LM3ij1Ap/Fb
	zbyWZQABno3BnFnDeFTwW73xfbAKBRt5meVzlEysmmYxrQGHW+ir6zS4Hsz3LOVC0NOhTpYAWQKIO
	PnEVNGON1YTmjFF39WnhzJWyzW+Jy0RaPlDxXLyRqR/UQg0sNTxt0XSlBiJT0XEC4M2MNWU86CPWK
	Hf86VxIkBSan5HZjlgWKdDQB0TxSOjMbGhc64L2lYArt1SrKxATIQR0opKxsw15MewXQjn/JqC0JC
	bxJetbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7XT-008gFy-0m;
	Tue, 24 Oct 2023 02:53:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7XP-008gFJ-3B;
	Tue, 24 Oct 2023 02:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8A74BB8119F;
	Tue, 24 Oct 2023 02:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BDDC433C8;
	Tue, 24 Oct 2023 02:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698115973;
	bh=h2jUiV7w+D+V0ICMSRwNT/8tXnMjazXjCxp+F0zEHlU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lZRf15BSKSvTuXFMZbFDZSLqWwYcdtInuPJX5XboARnS8dJ6tfDyv2VDVUrWtp9Ev
	 An3lIMqO8hmY7bxQx9Q244Vglh+Somw1tyRLQ3KXOHpY6Ll8HpNT5kRnCVE/1QiHs+
	 z/ByvOoTR8c22da8D+oeVtgGydwMP1JgDz8kilqwpTSIKa2UBHx24LgvFOgrOKn1xT
	 +a9OUvqdQYjoy3HMMvQmRS8zwmMHEjb7rQi3xpgo2091fXiemOc6uyR09Wxof0gpm1
	 zn8N3GqnW+LjETeFaJTqRrxdc8D1J9zUElD98j+qUtibf6nU2KJdlUqvMSmZ/+n8l6
	 yHUFynsj/hk8g==
Message-ID: <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com> <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent to infra
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, u.kleine-koenig@pengutronix.de, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Oct 2023 19:52:51 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_195300_164524_C03CA0B9 
X-CRM114-Status: GOOD (  10.74  )
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

Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
> On Thu, Oct 19, 2023 at 8:49=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as those
> > are effectively parented to infra_ao_i2c{4-6} and not to the I2C_AP.
> > This permits the correct (and full) enablement and disablement of the
> > I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree of
> > those.
> >
> > As an example, when requesting to enable imp_iic_wrap_ap_clock_i2c4:
> >
> > Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
> > After:  infra_ao_i2c_ap -> infra_ao_i2c4 -> imp_iic_wrap_ap_clock_i2c4
> >
> > Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper clock s=
upport")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>=20
> I'm curious about what led to discovering this error?
>=20

Is that an acked-by?

