Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E1C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqm4qtGh5X7VQ2ZIzlQV4yJvQ+ZhC2H7zx2PY73LdsA=; b=S96D0pNhfvb0z7ZNOJYZoaZ/3e
	tXEI9HH0irjxtNZHJxCDm0LQpl7lo8glHa9oqfW6i8JnzpkgFU5mj5MQG2uc80viG+aaetb0C4XdN
	FQZlydpwJDLLZYrAGMkXVPMiCzZopo+MY9z/FBENP7omfc63aqFFzXCEv+kESNP70iysK9c/BKwzQ
	fU54bYjJuRBG25d18L9pPWaAWtD11feEkU0isEuDPgFOQY9cNH+hpZcDQjUiX4NdbmSZ3QM2BqZN0
	WQisWFRfzAj2NHxstqVjlvgS7TuPKW774bl7Wl7X7hDfbdmB8fWvndLYstAbYKolds26V5SKeBK3t
	DurPShjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd13m-00000003Vuo-0TRY;
	Thu, 22 Feb 2024 04:51:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd13j-00000003VuK-2iDu;
	Thu, 22 Feb 2024 04:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBEE7616AE;
	Thu, 22 Feb 2024 04:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89818C433C7;
	Thu, 22 Feb 2024 04:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577506;
	bh=Kqm4qtGh5X7VQ2ZIzlQV4yJvQ+ZhC2H7zx2PY73LdsA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YcQqu2kNN29T3Z51lNh60xwqsX+awcPkZ/MZumOPOcqIigGS17IrY2Ti7kaSaG2Uk
	 dkiSUP0r6hgqIEIE5tVlNPnxEwVQw9sLskiVekU+ERNuN6SomAfEunI9MSGpH8bXrT
	 /CWtzElONcF7v+TunxLiH3nNyQdLwVieANCz8oY+anTozViOtQl/G7R+ax3h5Ec6XH
	 OlivNVgikog5occyxMUlgBhaYf4GBQi66KEAqMiw+0jHAaqTzUWpvJBSLgS6FNHAiI
	 KxOTAidH3G833mzG5HEVXCyPHyNPFSFx8DwtFN44rjc3d3BBtEojH9e5iZeJ/xiJqj
	 F02ZZJsDMKdGQ==
Message-ID: <17ab00b5cbf2b9aefa7ee99daf305f46.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6cd6af61e5a91598068227f1f68cfcfde1507453.1704615011.git.christophe.jaillet@wanadoo.fr>
References: <6cd6af61e5a91598068227f1f68cfcfde1507453.1704615011.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: mediatek: mt8135: Fix an error handling path in clk_mt8135_apmixed_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Feb 2024 20:51:44 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205147_752645_81FFE760 
X-CRM114-Status: UNSURE (   6.19  )
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

Quoting Christophe JAILLET (2024-01-07 00:12:17)
> If an error occurs after mtk_alloc_clk_data(), mtk_free_clk_data() should
> be called, as already done in the remove function.
>=20
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platfo=
rm_driver and module")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next

