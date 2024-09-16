Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF753C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khaSH+II0JRxVINYsBolrryi/4phRBoHQ8YPRGgqc0Q=; b=tktbhTxMdCKTBcHakJLreBQJ2z
	Pp29Llj+amnQMxUTcnSvARc2Bpqr082+6rrO+2IsTLVjbfWe9wCIju1D09Mx1gOOwRY4I4h8EAA2P
	x3UKVGsBc0Kx3kcjWeeiU5gWLm6VuCyar0Bg+jEI9LRH8qBrCYNSJPnpxiAcudWujoIXSyloiC8JO
	4es/DqU75h5LXcEtF44Tu6Iqcywe95ZKtE+Rmp4U82f3xoRe65HOeKyZ9K3KHEgFVAYHkL4w8u72B
	4KUMuk2QSIHYVuj6hqWFbWUKS0PIT+D65nfMqhqfUa25bZ1KWB3YS9mQNff0Ay2NGDHSH9hq0Zj7s
	7o9/ARZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq9Fr-00000003lyU-2A2d;
	Mon, 16 Sep 2024 10:46:51 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq95j-00000003jPM-2b1e;
	Mon, 16 Sep 2024 10:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726482983; x=1758018983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CDjA3xr2GeuvVu3jehLI18ppg/zZIc4QJHB1ZO9jvZ0=;
  b=UcpCfaxKbQMFgI59G4p8TupIihaPsWZBKTENZjuCq3IHrIMLr90NrS0k
   KSSmMyTIzYUFeZl/DGHH+DEu2DfyB5KJ1G71be84G6CNDZy3Yey2OrjpK
   JmRP6oodcW2ts4y2qV86JBUaUFQKOCMGhqZV3+FGIN2F2IfA97vSfvA+N
   ZaGWmkF5OPF2jMLXOtglsvxMVQOJRct4E7gP5CGIp0IwU8iygIhoLHMAl
   nfASIrRraGdLy3f5xDLS4sCJ+WwB//jXnP1ynJqpVh3HrPROmiHnkPYDq
   eRGRMmC/nHCLKBJUUKUifnb9fWHtcGAVEj+tYA+ks54WZ1+Bb52MgdSxO
   A==;
X-CSE-ConnectionGUID: AgJk/IZMRombop+VXYe6SQ==
X-CSE-MsgGUID: e5S+sCQoSZieYf399XVS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24787277"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24787277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:36:21 -0700
X-CSE-ConnectionGUID: Sr8ud2DJTkqIdiezt0xDVQ==
X-CSE-MsgGUID: ogisOK5yTAGgv4HbGLc7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68445987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:36:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq95a-00000009QO4-3oxK;
	Mon, 16 Sep 2024 13:36:14 +0300
Date: Mon, 16 Sep 2024 13:36:14 +0300
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
Message-ID: <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com>
 <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_033623_811055_02189615 
X-CRM114-Status: GOOD (  23.56  )
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

On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:
> On Fri, Sep 13, 2024 at 12:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:

...

> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx)
> > > +{
> > > +     const struct i2c_of_probe_ops *ops;
> > > +     const char *type;
> > > +     struct device_node *i2c_node;
> > > +     struct i2c_adapter *i2c;
> > > +     int ret;
> > > +
> > > +     if (!cfg)
> > > +             return -EINVAL;
> > > +
> > > +     ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > +     type = cfg->type;
> > > +
> > > +     i2c_node = i2c_of_probe_get_i2c_node(dev, type);
> >
> >
> >         struct device_node *i2c_node __free(of_node_put) =
> >                 i2c_...;
> 
> cleanup.h says to not mix the two styles (scoped vs goto). I was trying
> to follow that, though I realize now that with the scoped loops it
> probably doesn't help.
> 
> I'll revert back to having __free().
> 
> > > +     if (IS_ERR(i2c_node))
> > > +             return PTR_ERR(i2c_node);
> > > +
> > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > +             if (!of_device_is_available(node))
> > > +                     continue;
> > > +
> > > +             /*
> > > +              * Device tree has component already enabled. Either the
> > > +              * device tree isn't supported or we already probed once.
> > > +              */
> > > +             ret = 0;
> >
> > Shouldn't you drop reference count for "node"? (See also below)
> 
> This for-each loop the "scoped". It just doesn't have the prefix anymore.
> I believe you asked if the prefix could be dropped and then Rob agreed.

Hmm... I have looked into the implementation and I haven't found the evidence
that this is anyhow scoped. Can you point out what I have missed?

> > > +             goto out_put_i2c_node;
> > > +     }
> > > +
> > > +     i2c = of_get_i2c_adapter_by_node(i2c_node);
> > > +     if (!i2c) {
> > > +             ret = dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
> > > +             goto out_put_i2c_node;
> > > +     }
> > > +
> > > +     /* Grab resources */
> > > +     ret = 0;
> > > +     if (ops->get_resources)
> > > +             ret = ops->get_resources(dev, i2c_node, ctx);
> > > +     if (ret)
> > > +             goto out_put_i2c_adapter;
> > > +
> > > +     /* Enable resources */
> > > +     if (ops->enable)
> > > +             ret = ops->enable(dev, ctx);
> > > +     if (ret)
> > > +             goto out_release_resources;
> > > +
> > > +     ret = 0;
> > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > +             union i2c_smbus_data data;
> > > +             u32 addr;
> > > +
> > > +             if (of_property_read_u32(node, "reg", &addr))
> > > +                     continue;
> > > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> > > +                     continue;
> > > +
> > > +             /* Found a device that is responding */
> > > +             if (ops->free_resources_early)
> > > +                     ops->free_resources_early(ctx);
> > > +             ret = i2c_of_probe_enable_node(dev, node);
> >
> > Hmm... Is "node" reference count left bumped up for a reason?
> 
> Same as above.

Same as above.

> > > +             break;
> > > +     }
> > > +
> > > +     if (ops->cleanup)
> > > +             ops->cleanup(dev, ctx);
> > > +out_release_resources:
> > > +     if (ops->free_resources_late)
> > > +             ops->free_resources_late(ctx);
> > > +out_put_i2c_adapter:
> > > +     i2c_put_adapter(i2c);
> > > +out_put_i2c_node:
> > > +     of_node_put(i2c_node);
> > > +
> > > +     return ret;
> > > +}

-- 
With Best Regards,
Andy Shevchenko



