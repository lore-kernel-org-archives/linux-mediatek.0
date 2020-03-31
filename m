Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA28AC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5D920784
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaQPmeGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE5D920784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzLJJBGafX56j02d6B6u7r8wAcSH69uSEHflus8pIOQ=; b=VaQPmeGQLEHcOC
	AtWhnt8SiET8OraRFQr1vDnd7TUFlmcBCy+9/ua2gEJWwPEkUKVGO4kewtnsZ+F43sIxSFNAYgdB9
	3EtO5lFl7DPJhJq91ZL0lFXBCRzDNIgAaDUr2O2++733Dbmu28CjoCT/hRPHa7PnCCpfeQDrvQUCs
	fAXvS8vY73VF5XUHCEU6JVX08IHPbzF9kRMj/B/AmffHA2E0F0B5z8akcmsZr+4ObVM+OYBdiCmf4
	DIFmOlPtxyVBiVXVnjKjL0AqsQAbz4Ag7M2A2IAqpjH09qPQy/EUIG4pTzqUU115V1+O6vy8LWhH3
	ViTI61qBMNzqc2YBLeGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJh2-0003Rl-Ht; Tue, 31 Mar 2020 16:24:48 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJgv-0003PR-S4; Tue, 31 Mar 2020 16:24:46 +0000
IronPort-SDR: NtVZUr5HNkWRFfS4DNlJTSmMmp8F33rhkvX4EiLf+dpLfso/AXOGfzC1uAB0t+IKK0t7qdyf+W
 9CYiZIhCuA7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 07:21:28 -0700
IronPort-SDR: sdD6GgxeRL8Ps3R76lYFgQENIIr/nUulSPpqBkmBlF2QxdA1PYfxR9lYbKWOdVtEbSPjj2FdCE
 x6r1ZBRfi/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; d="scan'208";a="267296473"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 07:21:14 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jJHlS-00EWMm-GN; Tue, 31 Mar 2020 17:21:14 +0300
Date: Tue, 31 Mar 2020 17:21:14 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v7 00/10] Support ROHM BD99954 charger IC
Message-ID: <20200331142114.GL1922688@smile.fi.intel.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMj1kXGUJpBnLUX0J-cHCMrYzvoPB38O42_WB58Z6jtnT7XZUQ@mail.gmail.com>
 <168c9184cd4781f27a3d53339610849894263800.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <168c9184cd4781f27a3d53339610849894263800.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_092441_929872_E135E760 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "milo.kim@ti.com" <milo.kim@ti.com>,
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "Gary.Hook@amd.com" <Gary.Hook@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
 "rafael@kernel.org" <rafael@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "Laine, Markus" <Markus.Laine@fi.rohmeurope.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "bp@suse.de" <bp@suse.de>, "pmladek@suse.com" <pmladek@suse.com>,
 "zaslonko@linux.ibm.com" <zaslonko@linux.ibm.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>, "davidgow@google.com" <davidgow@google.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "talgi@mellanox.com" <talgi@mellanox.com>,
 "changbin.du@intel.com" <changbin.du@intel.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 31, 2020 at 02:02:55PM +0000, Vaittinen, Matti wrote:
> 
> On Tue, 2020-03-31 at 14:24 +0200, Ard Biesheuvel wrote:
> > Hello Matti,
> > 
> > On Tue, 31 Mar 2020 at 14:20, Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > Support ROHM BD99954 Battery Management IC
> > > 
> > > ROHM BD99954 is a Battery Management IC for 1-4 cell Lithium-Ion
> > > secondary battery. BD99954 is intended to be used in space-
> > > constraint
> > > equipment such as Low profile Notebook PC, Tablets and other
> > > applications.
> > > 
> > 
> > Is it *really* necessary to cc this to 50 different people?
> > 
> > In the future, please trim down the cc list and keep it to the
> > mailing
> > list, maintainers and reviewers of the affected subsystem.
> 
> Sorry Ard (and others). This is the list get_maintainers.pl gave for
> the series. Partially the large amount of receivers is caused by the
> regulator framework change which impacted bunch of individual drivers.
> Please, see the amount changed files from summary below. In addition to
> that the linear_range code has been drifting from one place to other
> during the review iterations until it settled to /lib. For example Greg
> gave me some comments while linear_ranges was still heading to
> drivers/base - so I did not drop Greg off from new revisions of the
> series even if it was no longer changing drivers/base

I'm wondering if the command line I usually use gives you such amount of recipients.

	scripts/get_maintainer.pl --git --git-min-percent=67 ...


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
