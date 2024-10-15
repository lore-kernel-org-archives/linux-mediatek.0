Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE2D1D893
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVqsL/V4GT+sMAadflCYXaBC+UFJTg07v0dEWhJESbk=; b=ho9c7w63cv/1Qe8dnmC26MimZy
	FNoekL/BVBtokGFPpge8yZXOLshiJkRjotnLGCYPKUiOvvBruOYJP3T/dHEnwQGs9VQkQEwUs9je6
	BkT3LYXR+0E2mrgAYecOaHCBYdPqF8PbMDHTu63a5ZHOnFGRfEZbsAAubL9LgKNqs7gz4bEdCi9XU
	pjVzLIEfTDg+tvzyurIeKM1/cKPAl26imLtPU9+w+DNNCuesvfrELN9tucaiSMQzgMFJU7p9zaKws
	9lP1v+oAThpRJHM4wIZdc3mVt2TP34DQ4fb1aLJzxZz3+XMPMxvQHNj8XlzM4okKpCIgIHFtf0/8d
	NbcrP4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lud-0000000982L-2pyW;
	Tue, 15 Oct 2024 18:04:51 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ltC-000000097gq-0v9s;
	Tue, 15 Oct 2024 18:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729015402; x=1760551402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eh6byDyRvz0D0m9V0d4eNpB5N5SL207MeVOFPzaUivs=;
  b=j7DpASe7RLW9RIYZjwlhNO/THE0O8BNdUQqyYwYp2heZMqP2W4vvY9Vy
   Zf/dY3vQc1om0tt1gxjakXUOd+TjrL0SuIcFOzF9Os7ewn0eosaxYPyeu
   TjUBU9QjKpRxvhGCum5lPHjrjnCN6zkD97HpCptsIX+LDW5lm13cL6n3q
   hUVQLyvoiZl2XVUTFWRN0jYAwf6Eoc+zzI45OFj2B656+HWcsgBHh8HQ4
   C+FSzG9ZO+u2+8ywF1hGTwKKdsT/guWffMJhc4vkfC9zu2mMQ2Vy5YFuC
   YdfJadfudEN/iGgLDEUtwPrf6LraRENnhuFx75Uh029GXpkNOmCVtVhSl
   g==;
X-CSE-ConnectionGUID: eKz4Cn4IQWemIuHlI/BFAQ==
X-CSE-MsgGUID: +yBmKYsdTmuaKfyK+vg2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28558238"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="28558238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:03:21 -0700
X-CSE-ConnectionGUID: jDCVe1NaS82xc497trlqsA==
X-CSE-MsgGUID: 0g268ps7TfOSgloJEy9fVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77988218"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:03:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0lt4-00000003Tee-1SQx;
	Tue, 15 Oct 2024 21:03:14 +0300
Date: Tue, 15 Oct 2024 21:03:14 +0300
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
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
Message-ID: <Zw6uYl0CXhl_ru08@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_110322_294450_02B72859 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Oct 15, 2024 at 10:58:31AM -0700, Doug Anderson wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > +       struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
> > +       if (IS_ERR(i2c_node))
> > +               return PTR_ERR(i2c_node);
> 
> I'm still getting comfortable with the __free() syntax so sorry if I'm
> wrong, but I _think_ the above is buggy. I believe that the definition
> of the free function for "device_node" is from:
> 
> DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
> 
> ...which means it'll call of_node_put() to free "i2c_node" when it
> goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> pointers. So I think that if you get an error back and then return via
> the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> ERR pointer. Did I get that right? Presumably you need to instead do:
> 
>   return PTR_ERR(no_free_ptr(i2c_node));
> 
> ...or change of_node_put() to be a noop for error pointers?

I could state that device_node FREE class has to be updated for these cases.
fwnode, for example, handles both error pointers and NULL.

-- 
With Best Regards,
Andy Shevchenko



