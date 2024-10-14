Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB15D16262
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbkUydGFhVnd8y0iwnbfz+f3J81RYlN0/MxWdCptKqQ=; b=w1e5lK1UFau0Ea/sKmd18ecEcL
	hfY0tHSCPAlbMzbxaoz+mLvbN9RmMPWDTL1b6X4zRMVzX6zB6iz9H6/oBwyX76JftDF1+HBYM0EcM
	ElI9aGK2XqnGa/qcGoUE31fbWip09DXRfaKZZ2Aqp0BkRffP1ZHHfi+gpyj7TsBYflUhfRqYIFxBJ
	mgyhzVK5FonH+gdASV3AuhSrDr91Gi8MGeMXg0DKMq5h7BXu/NtlF4aXrlhZlqNCLPyEEvxPOUxio
	MZ1FuGgAzferYW826XQnZbfW8ecwTm0oXgcpRfDPXxF7nl+rv2wBTVp0qabutTX7F5ggPA7w/E3Z/
	TPzmSDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0L1p-00000005FBb-1CGv;
	Mon, 14 Oct 2024 13:22:29 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0JCg-00000004v7q-3oXr;
	Mon, 14 Oct 2024 11:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728905135; x=1760441135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SLqJFOsn5q2qjbckf2ljncx5lrxLVkzu1xfzSt7sS5w=;
  b=bMb0FBKmECzSEsP6Q9dmlqRyieWfBKheOSXiKZGzSMCApNjoIyllFS3I
   JfgsbLma9/FbLXYUPR0vX3ERNQYjYS5UybYvT3vfRctcz90vuzYiNZCH3
   jJfkhoItEIzjhKpUSbMzmog8WDssUeWd789B3u3ZEFb5xZRqVCM42MYHD
   1fTmv2tO1S8isj5ouf579w6KO/mGM2O2ZTq9miJEjhJaO1+6jR52TFLvU
   EnV0Z4OCCP3wWQpCRiEDLzMa83EiX09AFGJoN7p32aIA4sH3O6JlvQHsM
   ZnkQ0WMO6TMLRgsmVPFBzaYk+OlXFFWP87xhgl3YGyR2dab9mMeK7iimM
   w==;
X-CSE-ConnectionGUID: CSVJtuqUQB+YYBj6hdAj+g==
X-CSE-MsgGUID: Xtzj+XEuS1CVPhyshmk/Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32165960"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32165960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:25:34 -0700
X-CSE-ConnectionGUID: yYETopAaQiGK1J/Khy5GJw==
X-CSE-MsgGUID: 7exEHq4kQwagftdiOKZAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82116585"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:25:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0JCZ-00000002sYA-2ZwM;
	Mon, 14 Oct 2024 14:25:27 +0300
Date: Mon, 14 Oct 2024 14:25:27 +0300
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
Message-ID: <Zwz_p3o1PJF6sl2Y@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_042534_985686_454E23FC 
X-CRM114-Status: GOOD (  21.64  )
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

On Mon, Oct 14, 2024 at 03:04:44PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
> > > +     .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> >
> >         .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> >
> > Or even
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                  \
> >         DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> >
> > > +     .opts = &(const struct i2c_of_probe_simple_opts) {
> >
> > Perhaps also DEFINE_xxx for this compound literal?
> 
> I think it's better to leave this one as is.

Using a compound literal like this questions the entire approach.
Why you can't you drop it and use the static initializers?

> Not every entry will
> use the same combination of parameters. And having the entry spelled
> out like this makes it easier to read which value is for what
> parameter, instead of having to go up to the macro definition.
> 
> For comparison, this entry uses just two of the parameters, while for
> another platform I'm working on the full set of parameters is needed.
> 
> > > +             .res_node_compatible = "elan,ekth3000",
> > > +             .supply_name = "vcc",
> > > +             /*
> > > +              * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
> > > +              * Synaptics trackpad needs 100 ms.
> > > +              * However, the regulator is set to "always-on", presumably to
> > > +              * avoid this delay. The ELAN driver is also missing delays.
> > > +              */
> > > +             .post_power_on_delay_ms = 0,
> > > +     }
> > > +};

-- 
With Best Regards,
Andy Shevchenko



