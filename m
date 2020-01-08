Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B34C33C9E
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 11:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442FB206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 11:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecVaxJ8Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442FB206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCRjL2BQvs1ccnR8wq5gHhSWe/SK0FYz7uPi+SWh8YY=; b=ecVaxJ8QPmmx+M
	hs63e9hz5BF879MvNtBu+sNloq4j4L6nZ+gxO01x/2WSrtkDdlqNstlGw82crz4VYHaRHV+wRD34V
	M49vhQa/t9z5Yo2ALjLBUqb+j8oV7sl0XcXiDeeYVcPxsa9nNx43/QRR4ATBImtxGbfnN+G2Y0jsQ
	wcX6Ugcba43NCpq5kR1yjEhiwpQQFCMOroVAWqXvLhOJvQ/PsB5Ad+1qcGCKwAh3x08u9FS2Aohb/
	/YIZobCTFo1JhzjRBhNpYyvStHrMbnxTPnrWjsFhjtK4NffABcgt+ezaIChpqwGqw6IhupTVwiIbY
	d+XVVW51Sonf/4Q+uuqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip9Te-0006s2-Ku; Wed, 08 Jan 2020 11:26:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip9Tc-0006rG-0G; Wed, 08 Jan 2020 11:26:17 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 03:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; d="scan'208";a="218043679"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2020 03:26:09 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ip9TV-0001sB-6p; Wed, 08 Jan 2020 13:26:09 +0200
Date: Wed, 8 Jan 2020 13:26:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200108112609.GN32742@smile.fi.intel.com>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
 <1578473162.12131.13.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578473162.12131.13.camel@mtksdaap41>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_032616_054529_86693B70 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 wsd_upstream@mediatek.com, Stefan Agner <stefan@agner.cn>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>, YueHaibing <yuehaibing@huawei.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-input@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, fengping yu <fengping.yu@mediatek.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 04:46:02PM +0800, Yingjoe Chen wrote:
> On Wed, 2020-01-08 at 14:29 +0800, fengping yu wrote:

> > +	tasklet_init(&keypad->tasklet, kpd_keymap_handler,
> > +		     (unsigned long)keypad);
> > +
> > +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> > +		     keypad->base + KP_DEBOUNCE);
> 
> You use a 13 bits mask and set it directly to KP_DEBOUNCE register. Are
> you sure the debounce unit is ms?
> 
> > +
> > +	/* register IRQ */
> > +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> > +			  KPD_NAME, keypad);
> 
> please consider using devm_request_irq, otherwise you have to free it in
> _remove function.

No, you may not use devm_*_irq() when tasklets are in use. There is a nasty
race condition.

Actually the rule of thumb is to NOT use devm_*_irq() unless you exactly know
what you are doing.

P.S. Why simple not to switch to threaded IRQ handler and drop tasklet? In such
case devm_*_irq() is fine.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
