Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8733CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMTO8UWQCoX94E73XTeAOx24nxa4cTkNMfXh7S7Z5DI=; b=0US2YGEZ3a5W73C+lZEDlIq/i4
	PrAQ7bJPGUSasX25JeP7AfOZW9U1+5ivPfqYY6pq1n3Ta9PHH/8y7dCawX2uDCcBKjHHz8NWnZXih
	rh+0XGWPfqFZkD1Xc3Fxx7LfkXx7IEasKFk0Whz7s/Ws0B4lAAFF14PWp1HrK4Nnjcb0FddLMZ6Kb
	fXPNS0aX+zbWMWJ2WBVk4fDGUSdGE1BzyhE74/+xTC/ySEDKEGTapbCGKsUEDohh8f9rySeJ4A3ae
	hKwsPvtPJh26B1HGfFkksONe+/I18F0Dxo5QDOTgVF+URiepjAR8MLsNp7zFUJh2ma9ztDu2MSO0U
	7y9YEaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdO-00G2jK-1J;
	Thu, 19 Oct 2023 01:15:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdG-00G2iI-2s;
	Thu, 19 Oct 2023 01:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFF9A619F1;
	Thu, 19 Oct 2023 01:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A63FC433C7;
	Thu, 19 Oct 2023 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678124;
	bh=PMTO8UWQCoX94E73XTeAOx24nxa4cTkNMfXh7S7Z5DI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KjKKLc+UKiksoWp2TLvoOGwi61JlSjSDMtUYP/hTtIrWCr/xRwjQd2cC5atIgj06S
	 E8QF8q+jhQWglonqfg1cDB8vzGuPY+uggWJSNiHGI8S0aoVBBkW6NCRliZUqrGR68j
	 NUDS2QHvu1luzGw7f5cdXMg5Sq5WRHjlkYWQZ+M98YpniwxZQaLWYPH9WDsc4XHdRp
	 XEGcwUc1wlmmW2r7GK0SbVgPm/p8LyS2m7/wUkdrfY7Dgx3WJ5pO08dnyZuoB4+kgH
	 uF7spZjAIa/e4Y2pSZrsGD979SXEHREPIo/KIiRAwhyxvGtKrKVObiWMyp6Uulrho6
	 FSunhlD7A+KRw==
Message-ID: <9c8633033bb689bdaa18b672ed4ae40f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 1/5] clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com, angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com, frank.li@vivo.com, kevin-cw.chen@mediatek.com, luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org, ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com, wenst@chromium.org, wenzhen.yu@mediatek.com
Date: Wed, 18 Oct 2023 18:15:21 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181527_113820_8B45FB21 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Jiasheng Jiang (2023-09-12 02:34:03)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

