Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A5ECD1284
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Mar 2024 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J4UxMw8vCu/e4YwDL2de2cwdYJiMGR5S+olW6/Wq0o=; b=RtiHkKARvp8jdkYPlrwNnLDKBN
	j+SaJzp5hcLER7HcIqdDjGHM66nWGXOa6byzRTJvVYDkZdbpf+G7AX/zodjuxJELFI6AkB229xbi9
	QYaupV1W2LHn653wpoFjw7xOhXGJ5PDvv9t2Fy3C//9ZMVGxpA3gEAvMvucrmSmKu/HBToSJ7wzRX
	K9d8S6Hf3Ia53n76Ws5yFBE4WfiLWO+WLGItU4HW8KaIpwUl/XJ/3niRS6ly/kbubchPXY25j81lU
	lrGy8UnhM5WNp+5kmh5Ov373eUH59wbHFba1KkiZCKr20ffUmVFtz0y5kOsDoB3kQV05OPNMtjFdZ
	duZIul2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1vt-00000006HaI-2WF2;
	Sun, 31 Mar 2024 20:37:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1vo-00000006HZA-4AaM;
	Sun, 31 Mar 2024 20:37:34 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 907CA1FA4F;
	Sun, 31 Mar 2024 22:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1711917451;
	bh=4J4UxMw8vCu/e4YwDL2de2cwdYJiMGR5S+olW6/Wq0o=; h=From:To:Subject;
	b=oAZWgVnqbpNY/NnnmLvGf4jms0+WYBdOHuj6GVG2+twoiY2kvJ59PArKOwyHgrBFu
	 /MGz/tkWe+HyJtFWVkp5epS7wje5jgCr+lMQ4ElORxQO6762OoDo81tvY6X4FwXtNa
	 HtADJytvzwGNfGcbyBDGljlmMSyQ8Dy7odJIiQ1jHODmYQLfOU1g5/m4W/jjtva54a
	 Q/u5I2zChQUKUzs781NCH5eFrqXybF+IgTiw37MCg7aj8nrUAtNk1lSZF159sZhKP8
	 C4OKL4DuR+tHGgQgT6myIyyFmHPMFt4OTBBONnZQayJGV06MpVBND6girIBxOdCYJr
	 MPrpOIkJWhgrQ==
Date: Sun, 31 Mar 2024 22:37:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Brian Norris <briannorris@chromium.org>,
	=?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH 1/7] mmc: sdio: store owner from modules with
 sdio_register_driver()
Message-ID: <20240331203729.GC4116@francesco-nb>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
 <20240329-module-owner-sdio-v1-1-e4010b11ccaa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-module-owner-sdio-v1-1-e4010b11ccaa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_133733_222544_0B748A50 
X-CRM114-Status: GOOD (  11.37  )
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

Hello Krzysztof,

On Fri, Mar 29, 2024 at 06:24:31PM +0100, Krzysztof Kozlowski wrote:
> Modules registering driver with sdio_register_driver() might
> forget to set .owner field.  The field is used by some of other kernel
                             ^^ double space here

> parts for reference counting (try_module_get()), so it is expected that
> drivers will set it.
> 
> Solve the problem by moving this task away from the drivers to the core
> code, just like we did for platform_driver in
> commit 9447057eaff8 ("platform_device: use a macro instead of
> platform_driver_register").
> 
> Since many drivers forget to set the .owner, this effectively will fix
> them.  Examples of fixed drivers are: ath6kl, b43, btsdio.c, ks7010,
       ^^ and here

> libertas, MediaTek WiFi drivers, Realtek WiFi drivers, rsi, siano,
> wilc1000, wl1251 and more.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

My nit comments are irrelevant, but given you did the same twice I felt
like letting you know.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


