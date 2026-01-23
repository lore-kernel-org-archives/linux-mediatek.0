Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB9D6CFB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=; b=lAlYiI+IUSb8Ev+FxuvKe/KlHH
	1F6GwntMj8+g3oPNv0p0EWnPvp4AaVvQf//Dv+QNxj0QDh6nwN14wyafgcyn+I2qiU2AXO77tfHhH
	hgYwleXc0anw1wcimVhf4+DruNm2AMDgcs+CcDodZL1QBXAUNh26m3uE9fMh6pjArDOV0V08AjP2d
	d3+zdhJfBq83oYJKuZ3qaCjXF/GLoAV6QqEjSvFNCo4GjHRonfdRLnRxoaXf8J2aZv69b7z3Lb81/
	YWjnlUNd9f60vtP8Ije4wurmSebA/MWui3/THE9p/ojEsazQBbcPsJ1XQMgALsgpuaON43aUrZTKI
	6DmJKlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6El-00000007zBF-3vlz;
	Fri, 23 Jan 2026 01:45:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ej-00000007z9w-2APT;
	Fri, 23 Jan 2026 01:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36EBB43691;
	Fri, 23 Jan 2026 01:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080AEC2BC9E;
	Fri, 23 Jan 2026 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132721;
	bh=SUqt5//9x6ikkcTBwd39LjEZbg7/SrQDa2wNA7zOQow=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NhENHPB5ww4MTDz+GSgWQrvVQlmm8vLjHi0m1XU6gUMIwMrOiFWB/NUytwI8IvE+y
	 erSmmJH7L7Lfql6j7XJmDFPyDeYn3JzpHWvuB4dfYDyQH+o9DfvjeQ0KsIzj+NNPs/
	 Fxd5uY/Db7Wa1UJAfNzSBTJ72mxWKAmH3fJkPgvaCdOKj7oV3atXQjsktQc9NY+zNK
	 aEXJ8jEWshAqH0qVUinuv3uYB/pz0Om+c6zH6l9P9eGPA7E4290y5IWOPKGSUXrOmu
	 h6Sqt0jdb79DqhtwvlFwZcSPil9OrTxoL1huIM7U97FPaDU3weAsHtByXDzCjHECBZ
	 mcaKFBdp8Iurw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-2-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 2/5] clk: mediatek: Refactor pll registration to pass device
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:19 -0700
Message-ID: <176913271924.4027.2857487573564767197@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174521_579650_18D09471 
X-CRM114-Status: UNSURE (   9.76  )
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

Quoting Nicolas Frattaroli (2025-12-15 03:23:59)
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>=20
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

