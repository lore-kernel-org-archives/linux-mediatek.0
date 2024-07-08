Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD76C3DA41
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8/Nus0e7IW0C9Eu5Ta/MA+sKFXKraYblzR3qp2a6xQ=; b=ToHEVwPYT+SzK0qGXJmMDd0FsU
	7JqeLMNCEIzTz+RZPqmhfoxQOfyoTe+lo3pioQiJLt7mwsIsu0R5wBwgWzQWXqGx2784qOiK5uphR
	0p0ImdSNHZoaK8ebJY/jrt3TbTi/NmYVr+6H57xmE85GSN/I96DXJtapRnYSs42ksANTRQNYAodqI
	hfoLseoGExKROM4tKT2RvF8Yu3M6rMnq4a53FpfEAEzqP7Tc4Mf2RgvgU9zcGoj03tCKbFSVKzgX1
	XymW4xfcAs8eZ4Qnggmyg12qyKGeoNyuK6aOYEIolqjluWokjyGvJOgOzRrRNtU6GwSchqZuR8U60
	6s/+oafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtj5-00000004n6H-3rez;
	Mon, 08 Jul 2024 19:08:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtie-00000004mxD-0XnD;
	Mon, 08 Jul 2024 19:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5175C6108A;
	Mon,  8 Jul 2024 19:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB86AC116B1;
	Mon,  8 Jul 2024 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720465691;
	bh=R8/Nus0e7IW0C9Eu5Ta/MA+sKFXKraYblzR3qp2a6xQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PFXOJpe2b/wv9Zp0SpgMXqF9oWbgwtMxtkPM1PeuY+BSmzW/zKQ8CNgfAUtdErEAx
	 mxUr+N5w/7hG58fL75t3pPed3kDt+SXKjs/g8qK6H0ZooD6/XcBY26p1ZvyYN97mUA
	 yIF8Qe0Ue6fn49rFbtExg9jHNcRMIsr/ZCSDP/GnqPvEOgrjbjJPwDz+MQ00+7HAuQ
	 1m+iNacvsTFg0Ocn9bbjT5n1AlQbHDHg1S26nrBrs/WzVr6Uui7dvTLef/IbFKZQrL
	 WLFR+H687vPdmjsojDlaw518Rnyy9qblJmsd8GEgVmksYCa5cAtk8ldOI9FIvvJH4P
	 yhbPvOZCHgBBw==
Message-ID: <c43d0d221df30fe1a215dab07da10245.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240619085322.66716-2-angelogioacchino.delregno@collabora.com>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com> <20240619085322.66716-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: clock: mediatek: Document reset cells for MT8188 sys
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, jassisinghbrar@gmail.com, garmin.chang@mediatek.com, houlong.wei@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, Elvis.Wang@mediatek.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, krzk+dt@kernel.org
Date: Mon, 08 Jul 2024 12:08:08 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_120812_251617_B8CE11BC 
X-CRM114-Status: UNSURE (   6.56  )
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

Quoting AngeloGioacchino Del Regno (2024-06-19 01:53:21)
> The MT8188 sys clocks embed a reset controller: add #reset-cells
> to the binding to allow using resets.
>=20
> Fixes: 1086a5310f9c ("dt-bindings: clock: mediatek: Add new MT8188 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

