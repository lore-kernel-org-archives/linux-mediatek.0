Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F2C3ABCE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23takWRxov+IY0Q9lmEmxgV4xZ13TKeqqmIqmL1JAEw=; b=koM72uONA4En9vdT/lZAlLp5Lc
	aQrvxV1n6R6UL9xdJfz6a6GFc2Gm2AG23owRF8SjgFJ8k+6jHsmbedBLP5Ulwnysk5WwbbAlWEObU
	HU7/5soDIWABJ9um7KSF8PnIgzrqRL+R7Zz2/t02ZXUFCSl8d2dgHmMCDNACEeiQfSUSoPnnVT1tf
	dKyEWIEuXWn0tkX9Y4bSososUnBpT/CN1h7eHeHNdOWThigED8nmElM/R3Mj4AkuBptkTJ8fiOcth
	3K15nFvzh6Qegw3Zg02ewu703mwKZhgUQ+9hAIEMK/JqLYrSGJ8lBH981GIiA0UqLAWPOEKrs/dHa
	uvfusg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDax-00000004LZ0-0UUv;
	Mon, 16 Sep 2024 15:24:55 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDZr-00000004LNN-04P7;
	Mon, 16 Sep 2024 15:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726500227; x=1758036227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u1WK5mGbBpgkrsDPdh6PGHRYiqTBLU/04eRgolKlOW4=;
  b=i2IqdJTAClXeWdCN64CUie5nse2Gybg5ttrkmIKiVMPD9zdsJIPVyWyk
   pMq78hDdC4OUAqJo/IYkU1l3aDXeNNzOxM25Qc3iMjaIfB+1TKD6ktHK/
   7ktDF9sEabutLA7dHMx6tqbZnkwJP1jz0WBOQMY+F4ZOJDErZR2ChTRWK
   qWPf4H3UVPV9Xlv5YeJgG+zR0mu7ekPk6/cfqlmnMJKKkNeX/bT1ya6tA
   Bj6h0ZW2JuMkWxC79u3muXhCmhp4HIxsKnVWSZ42rgl5A41+GUy1Im14U
   KNJCha0Y3cZcBkIS+Oi6vUtAnLuERe3jSf0uowibTgx8wLHXuOfAI81nI
   g==;
X-CSE-ConnectionGUID: kIKh1I3BRRilLQTgXQbxIw==
X-CSE-MsgGUID: 0G2BUCgMTr2OEUpQzp/Mwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24865275"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24865275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:22:30 -0700
X-CSE-ConnectionGUID: 86rnqQMjR0mmCKUhs4Ik+g==
X-CSE-MsgGUID: mBOuEq5nRZuNT1rp++px/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69678112"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:22:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqDYU-00000009VOi-2We2;
	Mon, 16 Sep 2024 18:22:22 +0300
Date: Mon, 16 Sep 2024 18:22:22 +0300
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
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuhNLuNvwXWjqRqT@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com>
 <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
 <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
 <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_082347_130441_CB98F8A9 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, Sep 16, 2024 at 04:59:59PM +0200, Chen-Yu Tsai wrote:
> On Mon, Sep 16, 2024 at 12:36 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:

...

> > Hmm... I have looked into the implementation and I haven't found the evidence
> > that this is anyhow scoped. Can you point out what I have missed?
> 
> From patch 2:
> 
> +#define for_each_child_of_node_with_prefix(parent, child, prefix)      \
> +       for (struct device_node *child __free(device_node) =            \
> 
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^ scoped here
> 
> +            of_get_next_child_with_prefix(parent, NULL, prefix);       \
> +            child != NULL;                                             \
> +            child = of_get_next_child_with_prefix(parent, child, prefix))
> +
> 
> "node", or "child" in this snippet is scoped within the for loop.

Ah, nice, that's what I missed, thanks!

-- 
With Best Regards,
Andy Shevchenko



