Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246BAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxCoGPhxplNDhnPh2ShLIE9JOa0S02JCoeWQv5wamPs=; b=KGDigAtoWN4O0ItozC9u7czX0I
	dUl3d0bUrHPese98TKOTw40SP+QpcaBzeOeTvIVmSspPz4/nZOJwkGXE05CbG/4CgqF8DCMig+lSu
	eFOvAOkxk3nwMrV7oqfcUiWJtaBGll1/opo3caI6OjiwBz7SYav+kV4z31BV4lDZSUAikPDgaGHrp
	pug0tf0kU0cwZd28SanNX0207/jylxuYg9GiOuY/fpV8AOxcgdfcQuRxXSLZRdIEAqCd4tJgy4Dp9
	KNxLQIW5+KqSBeduogrMke1+Maaxb40dmoSVSu7U7TUSQ43dQuG+1dGe/0zjrS4dEMOGAGgDSIRa+
	VkTkplNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRSL-00FqQQ-2S; Fri, 14 Oct 2022 20:38:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRS9-00FqOr-Mi; Fri, 14 Oct 2022 20:38:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2D632CE2755;
	Fri, 14 Oct 2022 20:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CD7C433D6;
	Fri, 14 Oct 2022 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665779919;
	bh=zD96eUSxSatwE9POdv8DucX3Ox8BNf2yVFULzp6knVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hkUgk4QXkDFui74OYyvU7iGCacSjsw/u5doG3ZMrfqSQ3HUX/0g9W1CnA0nNT+pJE
	 iah1PEGaYg4tT79oHejD5ehxK4hTJZbxGASzdx19O3PIz4QWWW0LyhH/ohj/XWVQsC
	 7Rdd27KFPJjN5gRO6q81N33bKvC+IB5UPQ0tI4vZ7pTX8G35ifurA3s1W3xBL3Dt8Z
	 3wlkGUVqI0Qu+KXpC9dx94tp+wDSgySvBqlrdreaAYfb8hazlwKFCj7dOSUOMNY1cQ
	 4buV8N82Fmrw6OjrSXtQXfnnP5NKnpTworF4Ye4B9inBR/NRHvz8LEEjMGbC6VwMRe
	 PcS5Hx/iI1HBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, maxime@cerno.tech, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 14 Oct 2022 13:38:37 -0700
User-Agent: alot/0.10
Message-Id: <20221014203839.53CD7C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_133845_934632_4F079B44 
X-CRM114-Status: GOOD (  12.82  )
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

Quoting AngeloGioacchino Del Regno (2022-10-11 06:55:48)
> Since commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests
> to the parent"), the clk_rate_request is .. as the title says, not
> forwarded anymore to the parent: this produces an issue with the
> MediaTek clock MUX driver during GPU DVFS on MT8195, but not on
> MT8192 or others.
>=20
> This is because, differently from others, like MT8192 where all of
> the clocks in the MFG parents tree are of mtk_mux type, but in the
> parent tree of MT8195's MFG clock, we have one mtk_mux clock and
> one (clk framework generic) mux clock, like so:
>=20
> names: mfg_bg3d -> mfg_ck_fast_ref -> top_mfg_core_tmp (or) mfgpll
> types: mtk_gate ->      mux        ->     mtk_mux      (or) mtk_pll
>=20
> To solve this issue and also keep the GPU DVFS clocks code working
> as expected, wire up a .determine_rate() callback for the mtk_mux
> ops; for that, the standard clk_mux_determine_rate_flags() was used
> as it was possible to.
>=20
> This commit was successfully tested on MT6795 Xperia M5, MT8173 Elm,
> MT8192 Spherion and MT8195 Tomato; no regressions were seen.
>=20
> For the sake of some more documentation about this issue here's the
> trace of it:
>=20

Applied to clk-next

