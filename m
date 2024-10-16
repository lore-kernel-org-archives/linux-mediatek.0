Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85BDD1AD4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO/Ph9dqP3FSpv+f2JumS/dGOd7gZyetstTxMyMBUOA=; b=Gm2Oolg965+TgJg5PbFr3bbD0g
	Px5OILXb3Cbm22F9qK/D/1FobgM6eoj4Zrrhji7UeCr1WU+JSn/43tpMgkwUTE3ezJaed/qn1Ofd7
	vzd53V3019M95uCp4ZJCMJeQuyOF6s1JJUBuk/xulXC2wKgF40Clsu2/+LuEJ1IjXPFJ5rfk2heOU
	vGp877FguKRpqzeG81qKUHUJ572EAl+JmU2OFD+rHl6DWxC0SStPPeTFpPl0EmV4pAbEcTWoFU4nZ
	BmL9O2+P8nMSrobJmOrOXfglNyVztOVjBhF2ZTh8YYqlAlm00nHR2zQFh58/B2Pa/hDWQ9/9fhJMp
	AvLS+cPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12TI-0000000Bccx-1CJO;
	Wed, 16 Oct 2024 11:45:44 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11Hn-0000000BS5s-0B4c;
	Wed, 16 Oct 2024 10:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729074587; x=1760610587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/I9NuBzwS0z/PzxTR4AlnYAU0plH7o11dVm/FJnJcMY=;
  b=Y91frKDxefqMW/I+5KqIfTfIEi2eKydi5W2Tq9xaZmrld1cyraQqYRlq
   LhG9CMejhyCowffrjT+lvWsiN4oe2qrueZQCmLFO1xunuFNmEJkeHzEpu
   TZdC08AWYW/qRmhapLqTuWP9kXh2iR5gZR3mlRa3WP48mx0A8OKCcpJH4
   Bl+YBTm5fCrHsvOv0M6rQwKMgrdjfHu4RBWdtdOUKDdzuErBAxh3UyViy
   d8zsw8GdLZmBitnFihdtPxouTR2/0IhFuVhj4N+zskAHNdX4Ve/7wFzMe
   r9Ojke44Y7vtd/zn6fNHgZJTQ8u7thQFac+QHWOn653p6dp9//TaN0wZ2
   Q==;
X-CSE-ConnectionGUID: VK2JaScaRReJL1QAjGARXw==
X-CSE-MsgGUID: UHSPpbJ3SR2jEpmviyB9TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31380240"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31380240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:44 -0700
X-CSE-ConnectionGUID: TYPotaPhQ9idPd4HWmjtZg==
X-CSE-MsgGUID: 78XPk2XQRJyYgT1Pni6Yzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="82148971"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t11He-00000003imA-05Ek;
	Wed, 16 Oct 2024 13:29:38 +0300
Date: Wed, 16 Oct 2024 13:29:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
Message-ID: <Zw-VkQ3di5nFHiXB@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
 <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
 <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_032947_128577_7E830315 
X-CRM114-Status: GOOD (  17.43  )
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

On Wed, Oct 16, 2024 at 05:28:05PM +0800, Chen-Yu Tsai wrote:
> On Wed, Oct 16, 2024 at 3:01 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Wed, Oct 16, 2024 at 1:58 AM Doug Anderson <dianders@chromium.org> wrote:
> > > On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > > ...which means it'll call of_node_put() to free "i2c_node" when it
> > > goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> > > pointers. So I think that if you get an error back and then return via
> > > the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> > > ERR pointer. Did I get that right? Presumably you need to instead do:
> > >
> > >   return PTR_ERR(no_free_ptr(i2c_node));
> > >
> > > ...or change of_node_put() to be a noop for error pointers?
> >
> > Good catch! As Andy suggested, it should be updated to handle both.
> > I'll add a patch for this.
> 
> On second thought, it might be better to change i2c_of_probe_get_i2c_node()
> to return NULL on errors. That seems to be what most functions do. I only
> found a handful of exceptions.

It seems that OF has been written in the assumption that device node pointer
is never an error pointer. So, probably fixing your function is the best
approach right now.

-- 
With Best Regards,
Andy Shevchenko



