Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447FCD4F59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7lMuxXDKdnRadVlyGvJmusr9snm1f3uWY0aiaVQScI=; b=kW1OpXm/px9qDxhZQqgyxIQeSK
	vnzyQ8pDgjORsygdGDtVSJwEFu+qRPvut43jZ/VPlBtLObL9CFsAEadbAWXZ3sDwES/1gycC7qe0S
	uFwj44LReZ7H0PZNPyDsauSbyeoOll7tRqP6aaaz1KDnkCveC2sVZ+2N/RHmJmLQiatlzoVrP+AgL
	a9tYuLVvcsTOHuD+er3otidODrntXZ6j9CLqqHUVllNXlUfytKJ5Lo8C2kEy8WMgVEVWPY2Vqb293
	C2pJ5PBPt+nBcVB2HOTFtGlHSwlSucofZRRrsF/wGJcDZ/lnMOEgykOAkPbvy+R6awISrRn8vfMof
	zyWxXXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7vk-00000007bGc-0Zla;
	Thu, 05 Sep 2024 08:33:28 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7sd-00000007aYa-2gMy;
	Thu, 05 Sep 2024 08:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725525016; x=1757061016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iXBsd3oypDiySyTP3KMHchgA9ERUDyB4wPzDOwrSMoQ=;
  b=Qe9d4XydKK88wl6NTR6Vczn2k9oBSgWBaoCQ9yuaaBZ/15Vgn+l6iCf7
   8oIc2CQy46tJQZXw2shfEOobQDBS5ewIvGkIb7tpjfDU0apTc3FW7PZtF
   WpSNMKxWLC5sASyFc38Iz7DNZZhxHsnTF8PfgG7+FWLkCSnj5kwRBp0qW
   Z0RvhRtUkguMi+gAj52G+RuDBv4GMr4qpz5NzZN+bopdxNAr58z10dH1m
   QD2mT1G8ymup7pmku3rA8iQvgjqJqAFoUGZkPetynCHl8yLlQdFr0IIPr
   /asqt1y/kyBe9gBYqagmmjY/yPUMOWLo4uXKADlr5hb8ubJFYVMDWxRE5
   g==;
X-CSE-ConnectionGUID: aSOFz6WVTv6C6v7sSSj3yQ==
X-CSE-MsgGUID: RMLaaHdtRday8itEFuaA4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34892766"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34892766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:30:15 -0700
X-CSE-ConnectionGUID: 5zvZRKJrTl2+B4EI9zTBiA==
X-CSE-MsgGUID: gVuy0mQvQxyN4gOuKIoumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="88792411"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:30:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sm7sF-00000005KfR-0tbh;
	Thu, 05 Sep 2024 11:29:51 +0300
Date: Thu, 5 Sep 2024 11:29:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <Ztlr_hKm75fMBaBO@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
 <ZthdU6UGlM75GJVj@smile.fi.intel.com>
 <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_013015_715330_8D71134D 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Sep 05, 2024 at 04:11:18PM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 4, 2024 at 9:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> Looks like Mark already merged this one. I'll send extra patches to clean
> this up later.

I was OOF, haven't read this and I sent already a patch yesterday evening.

-- 
With Best Regards,
Andy Shevchenko



