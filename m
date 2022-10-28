Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F6EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 00:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AzsoUE0rePpZbDqReVe3Q4DRi9Xz6YXEX1Qv13iM14=; b=R2VCJ6A5wgd5oB8LkavAqzk3vk
	ljswyJBslyCiolUlHPHDM15DdlNDcgvXBgdCLBc83K8KyZDMi45gDp+arRt3TqvZwPaOPWKbViEmy
	mJxDwfpoSv8NLXgamFsQbxB3/2chjhbK5bu0rWpk3bcqmJ6hVLmIQoPq9OFIPRnIeT2cDadkmMI7S
	B6+8Ubw64jc+Z/OClDgsub5YlE7xF7yHgzLqZaEAWynSvBr3D+sQxozzONS1sxVZSYuxl8qPMFbVd
	jcAlCMIUC0CB7aQBeJN8CUKEiX+LjMtxAjm9DFjCi74l5p3zh/M7hAH9okouOzt7oaeL2EOSSU9DH
	nhpoV4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDHA-00FIOi-OM; Fri, 28 Oct 2022 00:31:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDGz-00FIMs-Hy; Fri, 28 Oct 2022 00:30:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 183966248B;
	Fri, 28 Oct 2022 00:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E83AC433D6;
	Fri, 28 Oct 2022 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666917056;
	bh=7AzsoUE0rePpZbDqReVe3Q4DRi9Xz6YXEX1Qv13iM14=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Olckj3vv9hu4ai3gmJOB1gAkrx/e8s467ngyyU0jziLGXp4acIubZ4KUFTOVI3D/v
	 coH7hSDl7knKh3k7V0HK+bqe5fA5ranAc6h6+WGmjbQwdyazlWR4UYEBpCSuLQMI5s
	 CElCk59xG2+IqqPdg+GBIWh785z7tkjWH767L1mpLPOfmfaDfpRl1i3lFwywddf2eW
	 9FCBoDSfzr/aFacknU6vwnP5cQh+kZOot1tMYZN4QOvs3MoviOtd9vDgX3e1ipSg4c
	 gbbs+fTvuZo8+YnQ9iqaQSdmj65aYkObr5By8B9TQpdo6fde874TpGy0viWmyof+hb
	 CDj9Ld9bbEBMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018070653.gsvnacqe7chvzux2@houat>
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com> <20221012085555.3nls7ja56vlnaz2w@houat> <c4a1eb9f-016d-c184-e494-c869038b87ff@collabora.com> <20221012094004.jgiyvmbgomiyedik@houat> <6e76f90f-3b6a-330d-6902-b31bf3d33ad4@collabora.com> <20221012114813.6d6adro746w5bd7c@houat> <decfd5e5-a48b-b2d1-f21b-1a4d52e05538@collabora.com> <20221012135619.wxyzuqheolhypoec@houat> <20221014193652.0C745C433D6@smtp.kernel.org> <20221018070653.gsvnacqe7chvzux2@houat>
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com, matthias.bgg@gmail.com, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 17:30:54 -0700
User-Agent: alot/0.10
Message-Id: <20221028003056.6E83AC433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_173057_653326_98BF1024 
X-CRM114-Status: GOOD (  23.21  )
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

Quoting Maxime Ripard (2022-10-18 00:06:53)
>=20
> We spent some time with Angelo yesterday debugging this, and it's still
> not clear to me what happens.
>=20
> He provided a significant amount of traces, and we first checked that
> the round_rate part of set_rate was returning something meaningful, and
> it does. The rate is fine, the parent is too, everything's great.
>=20
> Next we checked the decisions by clk_calc_new_rates, and it does return
> the proper top clock, and its proper rate.
>=20
> Finally, we hooked into clk_change_rate() to see what kind of decision
> it was enforcing, and it seems to be ok as well. It doesn't change
> parent, and it sets the proper rate, in both cases.
>=20
> There's still one thing we haven't checked: one of the clock in the tree
> (the parent of the one we want to change the rate on, and it has
> SET_RATE_PARENT) has a notifier. As we've had a bug recently over this
> I've not ruled out that this could be a similar bug.
>=20
> I don't really think it is though, since the notifier callback doesn't
> use the data provided by the framework:
> https://elixir.bootlin.com/linux/v6.1-rc1/source/drivers/clk/mediatek/clk=
-mux.c#L279
>=20
> I've pushed a branch for Angelo to test, just to confirm.
>=20
> So... yeah. I can't explain the regression at this point. Do you have an
> idea?

I don't really know. If the removal of WARN_ON() helps then it sounds
like a console related problem where we hang the system trying to print
the warning to the console. Did you try replacing that case with a
trace_printk()?

>=20
> The good news is, since you merged this patch the regression is
> invisible now to that platform. We still could encounter it on another
> platform, but maybe it will also have a more obvious setup to replicate?
>=20

I guess that's good news :-/

