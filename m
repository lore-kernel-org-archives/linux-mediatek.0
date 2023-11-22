Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0BC61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiXXJIlFG9uWevend3gbqY45zhhsFdplnQO/NzqnhTk=; b=uUJlG8ne1/Az3/lhVlw/cI2A5l
	ixsEjptCFUcf76TF6PybnUM+ymB5xm+LyFcbULxJrIhtRxCHARwnoz6rVsrPIeGTj6s41fK1hRSIz
	7Xldtoce9nRDYLBu8diXRXF2khjgxo71YUuppjmYslkn6YClKCxAspTTLCeOwiZSaa/TtzKgCg2YP
	wUFu/AVYObGql6GkVcfNgYf0xR0YTtL9DAqcZU1pPpCkai+nd9im2HVmcNXjjMX8yP8epFyDHqEPK
	C9EB+2MNHTm+1+dcPdJDSRu/scmp5PfzF9tuJFLydbL9iTOuG3MDhapq+i0MeHTlEWaGGGJQs2eZd
	7aMIjhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5wZU-003IDx-2k;
	Wed, 22 Nov 2023 23:23:52 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5wZQ-003ID1-2B;
	Wed, 22 Nov 2023 23:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700695428; x=1732231428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wLu90c2ONU3nwRPuECsbNVwdI6Y/3s1bCFsGjUjQWds=;
  b=UmMBEP+m0KlVnCz5MQbFQsmqLO6g2FL71mXqPj96ZjPleT3JTz36Zcz2
   TLA0oYfahvnlUsHJxVirDaaTMsN1a7lzTNM3n3xznvbE+aWSyLNl+rdl4
   S+/xAbPJ91DNTBwXIYo3B6Aw6Zl/6jp1Ha/DWJ9e4Bj0rHETxOwSLMJpy
   K5G303bvSJ10GGkS+FUfzGa02QmktsGjhGOmFFqlxMxUNzz19eG6uEpTm
   /u/qXv/eotz1wm2Y0boLBfp5v2RmQEbsGnax5ZynT27Ktl+jHieM2SxUe
   iPxTjiZGQFC2ytR+BA4Jh2jM51gmhGMdO+dviFA3K8JJMzHcE6nwcvs3o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391935070"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="391935070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760507612"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="760507612"
Received: from amongesa-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.57.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:31 -0800
Date: Thu, 23 Nov 2023 00:23:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Ilpo =?iso-8859-15?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Lindgren <tony@atomide.com>, Petr Mladek <pmladek@suse.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Johan Hovold <johan@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel@pengutronix.de, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
Message-ID: <ZV6NcAXBUcj5wYx8@ashyti-mobl2.lan>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_152348_779939_368C9C02 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Uwe,

On Fri, Nov 10, 2023 at 04:29:31PM +0100, Uwe Kleine-König wrote:
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

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

