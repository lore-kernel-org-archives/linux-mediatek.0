Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A82D1D893
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaQRljfn1I1FSFQvwpBktwVxnSZSKCi2PozwETYuCEM=; b=qV3tL7FAn/CNuCV+iYP6u6xlEf
	y0r/wIl76An3mS2/udv/PuNNAyFRlidBLi3oDRt0gPCyXolEYAll10vILpNB53c8WCh1MlyMRBBYp
	Vo7RGkgTju0iUi1twaWpuAdAgOnUQPlxf4rcWIPrRns2/wZe4G0oYfWlQCmhZMSLYT1aNBpywy0x4
	6Xa2Q6OHiNuyeCHEFvpk8JEU25UfKhPp8+0M4BSxBsKD9zQHjSJmJw2BqQ71pEi2lF/8d0X8mMeWU
	GRK/Pdmzsya7lseqMcwsx3bE/GSnG/TaywlkaCMuOps7RpX93NgvnVRtTqgpXK48WVizDazt7togZ
	XsNlOUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lwK-000000098V8-2LrB;
	Tue, 15 Oct 2024 18:06:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lu5-000000097ro-1EPE;
	Tue, 15 Oct 2024 18:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729015457; x=1760551457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6d/cMzHxJYfxTVbJFM7CFUuaoh2hWWe4To4Wt5P9CNI=;
  b=h8D817eLUgFoFQcE82svmxnQX3RsZCSv0wJgvdKCrumq8TbST/q+H4J2
   KCTPk6NsyYu7U6nRyxeBTyzCAhPk2m259nB/06A5QM97LN3q9Gzcq1pi7
   5uM5Iu2bj46/VUWj1FxiMntg/Ez5tKChxfsYm+WCa2UVOUNdeepV4WcgY
   RoI49jngd/2KVvcMgt8TZHfvob2OpbrXvtSTGuo4idzxUSHe1DzaGHy1A
   +g+xubuWJoh0R3mP9JI5c6kXe+areZ3wWJ6cfmtfaiZ+cwgk04+B7qQBO
   ZgHO0kp440NLOTcYTnGq+zKQ7JAAiHKRJQdV1xUo7Sgq2DBOicITIeLW+
   g==;
X-CSE-ConnectionGUID: Gie8YC72QGeglWxVJ7U5ug==
X-CSE-MsgGUID: qjdBcpLnQW++K2+oruOjbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16049549"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="16049549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:16 -0700
X-CSE-ConnectionGUID: is6Ub5LHStGlZsxZl094aw==
X-CSE-MsgGUID: kLe7S2OPTkeUNN/dAT6Xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="78318785"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0ltx-00000003Tfo-2pDg;
	Tue, 15 Oct 2024 21:04:09 +0300
Date: Tue, 15 Oct 2024 21:04:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator
 support
Message-ID: <Zw6umeIp3l-pfMSb@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_110417_369505_AAED1852 
X-CRM114-Status: GOOD (  10.79  )
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

On Tue, Oct 15, 2024 at 10:58:41AM -0700, Doug Anderson wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and release it.
> 
> nit: was the double "*" starting the line above intentional?

I think so. This is documented in the kernel doc syntax. This gives proper
lists in the rendered document.

-- 
With Best Regards,
Andy Shevchenko



