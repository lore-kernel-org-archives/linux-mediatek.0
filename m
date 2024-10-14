Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75576D16260
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKXnvWmle3mDEymeG0VPOLYl/kepVPvB0FnUbukgzZk=; b=wQt2RuCobjmpjwHKkQ8KT5nDtH
	B2ze0BqTO0dWF4jcM0hpOs7cp+Gsj3SBXl12dEcBCERUfRZ6WjX2OcdW+WRystAHrOxrlTGbMma06
	8LBswf8uVHXPYoEvBCzyFCw46S2d3DVJefYzjzEgs/gtILRuGZSpPbsql/9PhrU1WSdw8N2CrqzOy
	K/YDHMny9vQkUIS6BEXH8JfzULlJkt1ODlP57LRYchEYD9kXMTuVNv2AM83nKbPZ6kJuNUNFA+SQF
	sabmcrq+XBw2izG1DgO/VrP1MxmepmCuw0OmyO66kqNYdCOo7XvKfSHJI3DiUMe0YB/dhQ237dcep
	xxMlw1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0L1e-00000005F3T-0mxt;
	Mon, 14 Oct 2024 13:22:18 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0JAh-00000004uUO-09qZ;
	Mon, 14 Oct 2024 11:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728905011; x=1760441011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=F6OtytiL7+JS9gPiOc57+sw/mfDS+IMkcUewiU8ceGQ=;
  b=OpSOL+NmLim3mOiQeD35rhMmhEmmUSAEmdlHmFwU8s3ANbNvlEwm6Bzs
   uNHFkIDbmSmSum2GoSMECLNgMowtmIZj7EO0aR91g1HV+Npjy1Z74fGuW
   7Hvyz0AAZ2jeAn5LF7YBMwzLo41pH2vOm5H/+4ubUM7Vh20+09yjNDm66
   kVjFZyWZatHp2PhUe12J0GZK9AFP/Boc8+uRbp9lyUxx9bK2bppsG0VTm
   ph99l6e3dtZDBWAMn8Th0fjOzj5CQwuzciUaDjoiydR05OzOUsWsnBJwa
   x7RHjuCwySi3Wp52pbn8r0J2m4fTTn36qKJ/0VRSBRpE+GgVhU8uFOcUH
   A==;
X-CSE-ConnectionGUID: hAbJPrNxQ1K8fb4ZM/+bUQ==
X-CSE-MsgGUID: JO/r0aBtQnePd+3LdD3RQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15878316"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="15878316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:23:29 -0700
X-CSE-ConnectionGUID: YcWC7ZFLTc6LAyGu3A9NIQ==
X-CSE-MsgGUID: lZxKA49mTcSf+Sb9vfj03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77414868"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:23:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0JAY-00000002sWN-1clp;
	Mon, 14 Oct 2024 14:23:22 +0300
Date: Mon, 14 Oct 2024 14:23:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_042331_114755_8F6BA06F 
X-CRM114-Status: GOOD (  15.39  )
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

On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:32 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > > +   .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > >
> > >       .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > >
> > > Or even
> > >
> > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> 
> I'm not inclined on using compound literals here. "simple X cfg" will
> likely get shared between multiple |chromeos_i2c_probe_data| entries,
> and AFAIK the toolchain can't merge them. So we would end up with one
> compound literal per entry, even if their contents are the same.

I'm not sure I follow, you are using compound literal _already_.
How does my proposal change that?

> > With that also looking at the above
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
> >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> 
> For the "dumb" case it makes sense though, since it would be one instance
> per type. But we could go further and just wrap the whole
> |chromeos_i2c_probe_data| declaration.

Maybe it's too far from now...

-- 
With Best Regards,
Andy Shevchenko



