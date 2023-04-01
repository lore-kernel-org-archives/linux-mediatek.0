Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305EBC761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3dshhW+v7IxhaqirYDlAAAqOEmQopXkxep4LQ59nTU=; b=18swXEhwVixnV63po9PPMxNyra
	HmblNn3Igcx+psP8WAspvqx/EDS3sQy1gfsn8tnsUO5gmpBqrm8LD5FJUziqYsitgSQtjhP+Fsn7o
	f6B5akJAA6hVrKHoQzPFDt0v8V6pODKMYizgPFzlEkheaHBHjL4UlIEEOXENSS2ijxxWuAoqIL8xu
	yOoO/PkbwmXt1QjRjbyPbf5Xbhd4KmgDb2DzDs81TjNswi9fv1ujuvVbzoPxVHsNzDuNm8lOVRmte
	yOlj+s1YItYuXHOald5t+A78qL77RoISR22zMSR2UCxN7OwGzyekOXmF9IZfU2G1o+DCAKJxM5YcQ
	A406bejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgZ-009EUd-0y;
	Sat, 01 Apr 2023 00:01:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgJ-009EMj-2y;
	Sat, 01 Apr 2023 00:01:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B8D6B832B6;
	Sat,  1 Apr 2023 00:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B028C433EF;
	Sat,  1 Apr 2023 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307277;
	bh=f3dshhW+v7IxhaqirYDlAAAqOEmQopXkxep4LQ59nTU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=e1wl1PeJGDwlGewSBwRAja1t+ujuQnY5VFIrpmKkGs6RR67wjT98cOxjzapLUSmxO
	 OAgX96Z37trcbsyjuQ8eTUxMbAOBAbdfjFcMOfKG7HIEjTKMU2ZHPrO46/aLvovqyO
	 FhiFwAsq+hJecRQGCM9GtyW9CpQJ7TKD4+Ticrq2sqf/bB4ltB/OYlnVp4sxKfXI1F
	 Y9xkrfw8cnu/6hpXNzagzpZqGrnk6JbZOkwxnEiAWISR9bb7fayss1UFMoQFOaFXg/
	 rn5SIe9fhUxdDcbiptUSRvStYsBqHr348f4aMcTEMBiydqS+9ZORarWQhX+cHShNM3
	 sZfFBB0A2f4Sw==
Message-ID: <1b1bf42b79026e4f8b7542818f088023.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-6-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-6-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 05/19] clk: mediatek: Add MT8188 infrastructure clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:01:15 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170120_109101_31524205 
X-CRM114-Status: UNSURE (   7.72  )
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

Quoting Garmin.Chang (2023-03-31 05:36:07)
> Add MT8188 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

