Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD29C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSusYXl+QW4geeuVahIiZccPIu3lQiM8EzFLp84vDOo=; b=CD5hiQj8TXwhGUWQXmF9k2ibHE
	EH4r0yAWZLbOpPkacqPrQf+ucdLZSJkysnRFW0LgcPtdShBLxeO+UbsmxhjeIprzePRnBuWFMNIEz
	FHvUOrGfeGgXKaEOuCFw+KQQwmU5P76s/0WfOgSO5Br1RDykJYJ8ES/69lU8HXgECM5nt0JETzUkq
	QmrTBgMlkK77ZS/Iuci2HiVDJC4o/C7NxHs6ea+vZrIxsenFPRI9B9t2lTu19WAEBWbzL+Yk/jydD
	OQ+dOjUXLBbE0AR1TzL+JcypioCcX+eTii/eraAoGA5BOANBYZz+FaCb2TbyLfopCItgytz+W+bAU
	5dpYLx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY17-00GpH5-T9; Fri, 27 Jan 2023 23:20:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY0u-00GpBa-N3; Fri, 27 Jan 2023 23:20:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00ED461DD1;
	Fri, 27 Jan 2023 23:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542EDC433EF;
	Fri, 27 Jan 2023 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861607;
	bh=hSusYXl+QW4geeuVahIiZccPIu3lQiM8EzFLp84vDOo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qh2mWphlrznoc8QFyxl13/qBE0Aqnss7Ng1cYvDHObj1iEagYdR9q8BPRDsn2vOBP
	 Lvr5hcdlsjxIRC/3tsWav2hKxBjPvGfoaERY5aOel8XObuwI9Zf+DUpBfQE549sL54
	 iBVZSGo8x4j5FATsCBjLTWljJIN82bEOhpCSun0K5GzLvxLf2nOVBBtrPbbqHTpyMA
	 ek8eREGpxb48javYQkD276Wh3gyFJco2p/M4/TyTPjiFC3THoL1V5DPMe0Ev5n2d8C
	 JSRDom0Ioo6S4MbqbjNX00moF4eu7ZSSjMBVHIfRfLVaHPbQ7DPYYz4otD/18FfR8o
	 +2xSHXko7+76w==
Message-ID: <b88b235ea62db6e3200fef3d5abe1e99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118031509.29834-4-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-4-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Moudy Ho <moudy.ho@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 27 Jan 2023 15:20:05 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_152008_851093_6B2726A8 
X-CRM114-Status: UNSURE (   9.55  )
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

Quoting Moudy Ho (2023-01-17 19:15:08)
> MT8195 VPPSYS0/1 will be probed by the compatible name in
> the mtk-mmsys driver and then probe its own clock driver as
> a platform driver.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---

Applied to clk-next

