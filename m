Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B44FC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVBCWzFetwNOEZbaOkHjXIbR5S1H59ECoFgt2F3gfEQ=; b=fpleg2NmiIvIB9grdC0YLYWZSs
	ZuSNlHx8EPDRjFjso9MD7wkXjACOX0Y3EmIDUC7l6NpDZ8feO4rvN2fj+bUBaKkHHIXMWTwLWsRXq
	q/sBY1SN9LvBJRxqlAGu3LuvaqKNYlJPeOxNGb8jidJggNkFS86YEMirSvDdVT8vF1B33eFcnQvW8
	SsawiqarAFw/kc+EF8jHZhamETrxRfFs/dbdrzfBU+aDE5KpgVh0zxUbC7dJ2K7b6DVU78Vh9Gu1X
	lmhYhxw2xbzkYDLfwpVHT04/8ZkG8SNDBV80/uA4qJM6CNDMI+Dn7zkwdwlgDahE/qU0H16LFMOgH
	zbJzKzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniFo-000000083yJ-2MRh;
	Fri, 22 Mar 2024 17:00:28 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniFk-000000083ww-0IwI;
	Fri, 22 Mar 2024 17:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711126824; x=1742662824;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=eijYIPLIRnSAkyrL//Qucwww06P+qCR4wOCt19HryXE=;
  b=fkNsD6sn7kG3VNojJNPSX1zDG+ZAZtMGzgurDKheDFbMS5oVVeOPwHgQ
   rd1FphQ2pY5MSdjRuNXBfznlSghFWajWzp58dJWzuzNPnCjQlrremA7Uh
   r3BZF2l7ULmSKTjQfM/6KypHcikR8FLzJfiftTFeWhi2WEU2GFCrMghSZ
   MvjmhlaEJaXQCyWr5d7Wd3AkKEQUvY9gAr0wymIO+N67VEQlsi+ozyevL
   F9AqnLbYwZ360gtscpovMZl7kaHdTg7yJ3TKsi/HqqUelom+tH+lKWfSm
   VclEj15mYxlPBnZ6Ygz/vv+45+NtEXoZu6ZtiukPM2HFSuUzqkoz/JIQQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17619589"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="17619589"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914749126"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914749126"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rniFb-0000000FDED-2Q86;
	Fri, 22 Mar 2024 19:00:15 +0200
Date: Fri, 22 Mar 2024 19:00:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf25H-LlAFmfuyYT@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
 <Zf22dmwBpN7Ctk3v@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf22dmwBpN7Ctk3v@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_100024_178556_723EB156 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Mar 22, 2024 at 05:48:54PM +0100, Wolfram Sang wrote:
> 
> > >  static const struct i2c_algorithm at91_twi_algorithm = {
> > > -	.master_xfer	= at91_twi_xfer,
> > > +	.xfer	= at91_twi_xfer,
> > 
> > Seems you made this by a script, can you check the indentations afterwards?
> 
> Yes, I noticed as well. But other (not converted) drivers have issues
> there as well, so this will be a seperate patch.

The problem is that you add to a technical debt. We don't want that.
If you have not introduced a new indentation issue, it obviously is
not needed to be fixed in a separate patch. So, please consider this.

-- 
With Best Regards,
Andy Shevchenko



