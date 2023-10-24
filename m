Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46824C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 18:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lj2yuMAbBzCpLe+Lsng4EtNi0FGvYZXrgeqCwn7Ch04=; b=4hkjZkMPZ5JkOmwGXQ46IzEvZW
	SYzpx6FihfBx4MmenofZxq5NY9oaHAPLlja2Bm1n9TE1Cp57kEaJ/fF1tB9R5Sxk4jWxITxUSgJFF
	r6jFM9uHZQe0sIuUyxJ5Zyp2fE6hy3ZchYnU/8XmVnVxqxQVWyNqRK0aBze9hpFlx30cXG8dw36Tj
	KPAWAw1VT3bVt+TRXI+AZNKsf8h9y9qGBl2myxj8YszzenRzIIveowq5uIP/otZuFoiXaZ5wnN4uX
	UhC33HLHGAuyaJyfYmCsYFEJYEzXgqbMdIOi6cUAYzyLHyCQXsWzhH3zVOvsRz/NglppNizbaP6kt
	A0+S9ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMA4-00Afvf-19;
	Tue, 24 Oct 2023 18:29:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMA0-00AfuW-20;
	Tue, 24 Oct 2023 18:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0124861C7A;
	Tue, 24 Oct 2023 18:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E0C433C7;
	Tue, 24 Oct 2023 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698172187;
	bh=DBD2rWLQEyiC0RDc78PSECbeTSuIL4yYh9YnwcYuePk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OlMXTglx8Bxf3AMENvHq9aL0wvNWuAgdDCbHXQjT6UGz1SxWg8kJBu9/cAg2OgXKO
	 f8aHpAPw8vrx3uaCTP2K9n2VOYEKhcmfTBM/MTkX/I3+b1d7niRoSpK9AzQJ8jHNYo
	 alhool1sX9TdJEMNl/OnMiiIT/zWEJ3fKch3s7z/9deOY1CcJTEUlVuxH14K7I3Toe
	 9hY5EUvphqLJBpevsjCdix/CTl30C74fmZ+BMS+EZa5aMwFQQ6u4xurDOGrwsgzjaJ
	 CPUSUtwzhY9I/YLC0g43ZzoQpVjWsGCG/0+7YUYr1w2fVHIRdReWnhbat5KUJOknru
	 VeaFxyxGUmmmw==
Message-ID: <1d6b63192529f9ffd01d80421943b062.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
References: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
Subject: Re: [PATCH] clk: mediatek: fix double free in mtk_clk_register_pllfh()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@linaro.org>, Johnson Wang <johnson.wang@mediatek.com>
Date: Tue, 24 Oct 2023 11:29:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_112948_704846_8648A807 
X-CRM114-Status: UNSURE (   9.49  )
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

Quoting Dan Carpenter (2023-10-23 22:00:53)
> The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
> The function has two callers, mtk_clk_register_pll() and
> mtk_clk_register_pllfh().  The first one, the _pll() function relies on
> the free, but for the second _pllfh() function it causes a double free
> bug.
>=20
> Really the frees should be done in the caller because that's where
> the allocation is.
>=20
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL=
 hardware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next

