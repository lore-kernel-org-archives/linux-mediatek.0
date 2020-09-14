Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD2AC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 16:07:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D20720715
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 16:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sN25172R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D20720715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=723vZyJsR7Lpr+6GaoA96zdI6Iffva8qNFCRTbNLwBo=; b=sN25172Rt/SbZrEeIEoHtvWMw
	rfUUWQZ1wxy169etiWvSiAenAo0pQthaf11Ws/juedToRT3gLHtPHgCKzU0s0v0dLFHVXnDNf9lmd
	AEKsEM7AaiPP0K+nzVZlq34NsvjlPPkx0UwVDn9/XmmL4fA6htFre9uGKPuLQTPlb8hM6cBgLxjC7
	0lhGdUzmMirGntyujd+VnvB1i+HDlpcIj6l7CSP5PVmW0+z6TguZWJ/JAVjM/qxHTGMtBMA4zbWCf
	C4FyIq5LvNQCO4NGgGLJsY7jl0TUBCqTyi4LohwrhwKWMSbEWucQLjHn77i5O0uaia6p89bsAkiRW
	4GSLdIKPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHr0G-00006b-Ti; Mon, 14 Sep 2020 16:06:53 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHr0C-00005j-Mm; Mon, 14 Sep 2020 16:06:49 +0000
IronPort-SDR: 5P8ZOtvrSgPnLgyYoLPCAqy6FkcP9F7YClCvtw1GZ1pXDfTQgftrrFnV2FDZfezSVJSwwbu7jr
 6R8G26qKQxBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156541362"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="156541362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:06:41 -0700
IronPort-SDR: QSuTLZPYyEx/9A4qq6SZEnLbfXsDH2Pdk9RcBl+P4oAtC0CPqqKrHLwbet1Df3Vp1mqEj+9ZMD
 kN0OORP71wCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="335327535"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 09:06:38 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kHqzy-00Gda8-Gs; Mon, 14 Sep 2020 19:06:34 +0300
Date: Mon, 14 Sep 2020 19:06:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/2] tty: serial: print earlycon info after match->setup
Message-ID: <20200914160634.GL3956970@smile.fi.intel.com>
References: <20200911093927.608024-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911093927.608024-1-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_120648_894173_AB5EB8A7 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Changqi Hu <changqi.hu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 05:39:26PM +0800, Hsin-Yi Wang wrote:
> 8250 devices may modify iotype in their own earlycon setup. For example:
> 8250_mtk and 8250_uniphier force iotype to be MMIO32. Print earlycon info
> after match->setup to reflect actual earlycon info.

But this means you do something which user didn't ask for...

> +static void __init earlycon_info(struct earlycon_device *device)

Can it be earlycon_pr_info() or earlycon_print_info() ?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
