Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8F4C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/pH195r/WfB5txggbqLwuzpy+GoE09JXF+eaq5wkRU=; b=W4fwVhM5kl9FqdA/UkQd7Jkz1/
	aDJPZAQAJGH+QZb5e3xNMcRzo6z35AYqt9lXtuffPy1DJDU1DPLZPuaOirby6rL04eJn8qs//rO5d
	DXLxhmDTqhrG3IRl3JoBydKAVauhQ0oIEmimENqNERnSbrpecrNtOAYZEz7IcHp28w1NyeqByXavD
	ERRKzuB4vZU6wifJB5rqpVaPo1HQB/AYvc7SCMxh+pzKetLDGBwCjJBvXJTQrCNER7Ua5TW/Hng/7
	YbZTKADexr7bqVo6R5fOKSLDxpI18WwmVfhMWor2IrgcUxKsL8gIJaDvbgLRlVkagLSDMZ95w6LCn
	LbJE3AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYgF-00FZW9-IH; Thu, 05 Jan 2023 22:25:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVFN-00DnVr-Jc; Thu, 05 Jan 2023 18:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3/pH195r/WfB5txggbqLwuzpy+GoE09JXF+eaq5wkRU=; b=FiyZIpoVVPyybiEkouX8bknN7t
	S7Iwqj70cq8JVWz1HnYDxWdegF/jCEZo8rHuthbvKd23kR9s8jlYfF1Vf5xWTmhuCIWCRyUAOpBTh
	H3CmaUuRgw8lrhzQUenrZ4iyb84kYbcpFcswsHwfu/AEgTa2n01Pybd5WidXt10nVxV32Q5IoB76k
	jdkKjd4+Fax1tI8A+td12f4t0B0gtCT54RlaMUjIxzKGSCYoCecnOivXP8bc/eqv0rhWVzfe2IKkc
	5tkJ2qXXvB61N2o9AgRrEyeltz3mvr/FoBV3GnLgi5RASVXQhkYGo+rQ0jGQBYwm9SfQZTldrJxvs
	TMorBigw==;
Received: from mga05.intel.com ([192.55.52.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRrd-001PkO-2w;
	Thu, 05 Jan 2023 15:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672931352; x=1704467352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQr1KAn7DJn6wCEBbldmytZDYWPEdYKoAnRcIsQVKOc=;
  b=S9X24vrMZlcMIzzPof17+F9r1KzBR4tLl3T428VBlBkpdEQSaiterSV0
   evhWjbAbeNmAX2fb7rFiUCa85MMC4fWEXLHVkmcKgoCCYeurqhcayCA+C
   byKNQGKOL5wPY0shJsAyUvKk1RyQfxPecc+fKtNiJwPXUgLE4KTB7uoaf
   GaN+ztYnzc6tP0KKV7RgWU3yTaoSRUV3Sip5WxKTlOR+tvwUDWmBQU26G
   CcWwgXfBp/ADS5fjwKo1fCx3OYvI9Pp32zLK7zw9UDKRBdyhl/vxxRirO
   bSO+EjnQQPrIHUWtzTEK6K4ZxT2D9pAat7B00nwZ36wy59wr8B0TaLmbR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="408477491"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="408477491"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 07:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="686128134"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="686128134"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2023 07:08:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pDRr7-004oHa-0D;
	Thu, 05 Jan 2023 17:08:33 +0200
Date: Thu, 5 Jan 2023 17:08:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, matthias.bgg@gmail.com,
	chiaen_wu@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v15 RESEND 2/2] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <Y7bn8NPyBoBI2HFy@smile.fi.intel.com>
References: <cover.1672728620.git.chiaen_wu@richtek.com>
 <c1c6d3e51c93c15620ded0e2a53dcbe5de066ec9.1672728620.git.chiaen_wu@richtek.com>
 <Y7QoNpbFRsK3bW6V@smile.fi.intel.com>
 <CABtFH5KjksZ6GSOMafU8aS5mJzGkd8SDGEzH5irFUEFceQTWtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtFH5KjksZ6GSOMafU8aS5mJzGkd8SDGEzH5irFUEFceQTWtQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_150906_506397_6B0EB6DF 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Jan 05, 2023 at 06:25:01PM +0800, ChiaEn Wu wrote:
> On Tue, Jan 3, 2023 at 9:06 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > >  obj-$(CONFIG_LEDS_RT8515)    += leds-rt8515.o
> > >  obj-$(CONFIG_LEDS_SGM3140)   += leds-sgm3140.o
> > > +obj-$(CONFIG_LEDS_MT6370_FLASH)      += leds-mt6370-flash.o
> >
> > Can it be kept ordered?
> 
> hmm... I found "mt6360" actually did not keep the order either...
> Do you want me to put it after "max77693" or after "mt6360"??

Make it most ordered. From above context I can't say which one is the best.


-- 
With Best Regards,
Andy Shevchenko



