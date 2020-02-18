Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7EFC34026
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 15:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012FE207FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 15:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="trwbkfrj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012FE207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJseZ54Z9oBNULYDdpbEk6eY7tw7r0qpbwiKJvPbQhQ=; b=trwbkfrjL/SqQp
	uH6ODhn1pmejMJsqr40FQi8tN8piwbGqblhlfW0fh4O5J4tWjXVizxDgSy2g9uYbrtJ+L2CmYF6hI
	SDj+F0ii7F7Bo6QSlHe/0kbYa9nbk0SVWrUj3tYm0qkEb7QTHWbkN1LQGy9hB2jBMhckyWVE5S+do
	iItxtx9Ov8GWdamz6YdARwLMwBPOVSSN2P3nCukjQA9R9En8/oIW4gEdFCq1CdwCnTVvxmgY8ZXX+
	KOK/dzJyxMGK1oj2OcYrcPIvi5GThrVrNDy6oy1uMC8mkejSI0g4O5YzXNMWarbAH6Qy6HKPAjKAC
	iGrNaed9TNnY2+hktqHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j45CB-0003KP-Ms; Tue, 18 Feb 2020 15:53:59 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j45C8-0002iy-Ue; Tue, 18 Feb 2020 15:53:58 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 07:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="382490238"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2020 07:51:46 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1j45A4-0035xT-CI; Tue, 18 Feb 2020 17:51:48 +0200
Date: Tue, 18 Feb 2020 17:51:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH V3 2/2] drivers: input: keyboard: add mtk keypad driver
Message-ID: <20200218155148.GJ10400@smile.fi.intel.com>
References: <20200114122738.103344-1-fengping.yu@mediatek.com>
 <20200114122738.103344-3-fengping.yu@mediatek.com>
 <CAOwMV_w=Ad8gt1rftFw_EbtaZ2uCz=oWpm_P5YMHLNpok7Q09Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOwMV_w=Ad8gt1rftFw_EbtaZ2uCz=oWpm_P5YMHLNpok7Q09Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_075357_035154_D4141CAD 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Cc: DTML <devicetree@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "fengping.yu" <fengping.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2020 at 04:14:24PM +0100, Fabien Parent wrote:
> On Tue, Jan 14, 2020 at 1:39 PM fengping.yu <fengping.yu@mediatek.com> wrote:

...

> > +#define KP_STA                         0x0000
> > +#define KP_MEM1                                0x0004
> > +#define KP_MEM2                                0x0008
> > +#define KP_MEM3                                0x000c
> > +#define KP_MEM4                                0x0010
> > +#define KP_MEM5                                0x0014
> > +#define KP_DEBOUNCE                    0x0018
> > +#define KP_SEL                         0x0020
> > +#define KP_EN                          0x0024

...

> > +#define KPD_NUM_MEMS   5
> > +#define KPD_MEM5_BITS  8
> > +#define KPD_NUM_KEYS   72      /* 4 * 16 + KPD_MEM5_BITS */

> > +       kpd_get_keymap_state(keypad->base, new_state);
> 
> kpd_get_keymap_state(keypad->base + KP_MEM1, new_state);

Why?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
