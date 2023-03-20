Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E831FC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fGON+9vlo8O171eVGVxUiOYPdlLCuWs1odLvjB4snM=; b=iGM+HtgkU9TzUNmoWnbVMiEvVG
	omN8u8Ax5HDuk/mfhoM5zCfdRgUww1ZLL1Q+pQPeB6dob+/61tPganTIqMPNEIXNCfC/d3aJEu92N
	UGqLME2o5QbEHC1Q3XU+ZZ8uWZ4b+IZ8DemygWPYKPB9Q+AAq76oOO5m+fQwSagPiEMod6DdtrCtG
	mtjG3zGd4xkIvR2wIAH0SpvVL1lW1kjV85o4a2P1rajjKtiAs2084WEjW+tmiLin2VMVA0rc3C7B/
	RzVrbz0/ndiZ1NpLoZ1A5Eo/EMu49qCUGUM8T68k6XjS6vwhpgyfrrKJWDoYjLBa75DJEtVJMO0Tj
	wwVZ/Ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peL8c-00AGiW-0J;
	Mon, 20 Mar 2023 19:25:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peL8Y-00AGgw-1M;
	Mon, 20 Mar 2023 19:25:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4242AB810B0;
	Mon, 20 Mar 2023 19:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA46C4339C;
	Mon, 20 Mar 2023 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679340339;
	bh=3fGON+9vlo8O171eVGVxUiOYPdlLCuWs1odLvjB4snM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IE1JaW8XlsCYmNWYDCunL7D09hl66J+hH+/gcUEnMiCbdg0pEAmcIFv3neTxEwYiD
	 OcVvQg7zD3C5SzMO5YV2VlJKUlBYmG5rOAXFh5u7XTaDtwpAJdTpRmI1KQVniYkyI6
	 fFir/5FQZHEnQZ2zNGTFXk5aKfNfZ/fnrphq+1sBIXHOukd7mXXENa771BbyOenUVN
	 WXaRzhEgv+T1r+IPbdn/BRI29uJQwrwox3v5bXiR6OCKDWvnAkoyF2yzOlxfvSme8O
	 Nu7JIZEtilOPLb233mha0boxScOBQ7BU4nPkEJcizS5HBixaz+tBF13ac/YR4NPZPh
	 aVrtKp+03e/fQ==
Message-ID: <037449463ec342ec8d053163e4e58ee5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230320091353.1918439-1-arnd@kernel.org>
References: <20230320091353.1918439-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: mt81xx: Ensure fhctl code is available
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Arnd Bergmann <arnd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 20 Mar 2023 12:25:36 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_122542_601039_6F631B04 
X-CRM114-Status: GOOD (  10.33  )
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

Quoting Arnd Bergmann (2023-03-20 02:13:42)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Just like in commit eddc63094855 ("clk: mediatek: Ensure fhctl code is
> available for COMMON_CLK_MT6795"), these three need the shared driver
> code, otherwise they run into link errors such as:
>=20
> aarch64-linux/bin/aarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmix=
edsys.o: in function `clk_mt8192_apmixed_probe':
> clk-mt8192-apmixedsys.c:(.text+0x134): undefined reference to `fhctl_pars=
e_dt'
>=20
> Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency ho=
pping through FHCTL")
> Fixes: 4d586e10c428 ("clk: mediatek: mt8192: Add support for frequency ho=
pping through FHCTL")
> Fixes: da4a82dc67b0 ("clk: mediatek: mt8195: Add support for frequency ho=
pping through FHCTL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

