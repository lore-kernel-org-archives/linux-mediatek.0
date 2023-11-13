Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F67C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gGsvo06bEQ2glGsencqSg5zVDS1qxuieLJRhlMBjAE=; b=sd/qYbeA0dY64K/o6Xs9QjGrZQ
	oRxPYFpYhHvU5z5dhNhK7cWluDqAni4+ejmoxxzn17PAmStrHpTaTj0Szo4spJMrI4GRB1DdXmtuI
	1AoWLUh916gzn2EoojSzX3qDU5Oh/XcHX29NYTW6kAvKw5NjXJOVVxhKos3oQI262JBuTcKxrJBlq
	VKln7WV0vEh8A3elNyBfnIhqwRADc2HpHTPVj9u3EXBT0BW4ALyB/X840jUWi61DcyBR0Cj6S+Tz0
	uXvIAPPusV/Ssux4GcV7U8RSiFKsC53HBM8pmph4YOKrTpLMU070Ntu4QuVSxV79Zrrg77fJSN5YD
	dMV8N40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Sx0-00DXIs-1I;
	Mon, 13 Nov 2023 09:09:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Sww-00DXHT-2p;
	Mon, 13 Nov 2023 09:09:44 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25D3C66003B2;
	Mon, 13 Nov 2023 09:09:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699866575;
	bh=+biIpFAEesmQeyQ0ajxFqoWe4IfKev4rpI+PhrI9rhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQ3C+vqtj839O3n3L/ymQgH5t2FA4orXI/4KbT4WaNjrPKOE9Zd2VJsOerugMFMDK
	 7gxj104S3lY4XsC0+1zWzEjORjCy5vKauxi14SaX5z8noDgNuw8aoDj4GM3bQ6XZW5
	 5v7erfC5J0ixZXoprbrjUaiIQK+96g2IW61NrTRRuFSTHaXINn0BVekFaloiQoIyuy
	 j0DwcdKMIoMh+5EKeg9qKvTxq1q/mrjYZtKPpPd1wg2R54ahkspMyhbHSdZb8nuxxc
	 EaavpD76t7v/qgNdgboQD5sK0vkceUzToyzWcyjYaEU5TlVl28UA7jGHq/fJuGr/vv
	 7c2XU5BP2NyGA==
Message-ID: <023e2184-c2e4-4f3e-a1e1-492dbf7a2e7f@collabora.com>
Date: Mon, 13 Nov 2023 10:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>,
 Petr Mladek <pmladek@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Johan Hovold <johan@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Richard <thomas.richard@bootlin.com>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel@pengutronix.de,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_010943_079936_7A1F5050 
X-CRM114-Status: GOOD (  11.85  )
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

Il 10/11/23 16:29, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


