Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8CAC761AF
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzYp5GZ3ncPSncuWnU/JCyhmeSE8bxY5oSz4V1eSUok=; b=MtGDe1+N+t3f2VY7mkkhXI7GYU
	yHZ+x1LLyuK7bSc4oGOJIuZcs5x9seyYB2kFFP43WXGYbGfuczzBmCdY2XXSZQcW4yzrX70YPdohd
	aqLx/gDXSC97cUkYtuKiFxI2EVNLFsJDEw+weEAuuseUvvXMCAlD+hDb63tHq+wRp5f1PLK1r2rcE
	ace9HOhONK5tds0J401gHvT5n4VOv6Xrhrz8yLGRqiTH/V7fHQ5UCQgcYapzzTzXFypDKLcX3s84C
	tIzGBH5BEEvyTxZTkB7TDuHM9/fUFWzcKvpQ8KzKwF3ETPlXiuVeYsqAt+VyBiNcoZqxgDM/4lSNK
	m5Qf5FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgl-009EbL-3D;
	Sat, 01 Apr 2023 00:01:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgW-009ERL-1j;
	Sat, 01 Apr 2023 00:01:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 719B8CE3104;
	Sat,  1 Apr 2023 00:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC1BC433D2;
	Sat,  1 Apr 2023 00:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307286;
	bh=SzYp5GZ3ncPSncuWnU/JCyhmeSE8bxY5oSz4V1eSUok=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k0O2zDfJ3r80iewotJWB6QyUjmbbmmaMimgPl2DfcZa+4z40b9Clnvf2miOEm9+eD
	 iEaZBu9UjA7Lfw9i5Z2fiXZsyz3JDJ+0vWOlym6VGvxpVGT1xPbUlfu0UHGHWQb5z+
	 slSq5PdklWVV4J3zD8w8zmQBBmCV8ZsngBOzggfXYSWPAVmhP1ibB6JPi7Y4Tkuxok
	 UI6RBmxdIoI4V9mHgsXQSD2/2P4BgdDM4AP+xR9LmR8q5PF0z5GsBUAlpLwUcOyatG
	 AdYMAwpdG+9P/6K/xx9iMMrI7pCc7U9u12szeA1hKwdrKRPvbxr5qwA2So8jlvc+iG
	 N2+arDJGrOWsA==
Message-ID: <e25beaeb461752b80f9c851f4e6ad059.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-7-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-7-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 06/19] clk: mediatek: Add MT8188 camsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:01:24 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170132_801262_35BCF2B3 
X-CRM114-Status: UNSURE (   7.09  )
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

Quoting Garmin.Chang (2023-03-31 05:36:08)
> Add MT8188 camsys clock controllers which provide clock gate
> control for camera IP blocks.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

