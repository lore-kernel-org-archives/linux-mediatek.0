Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA7C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMOQ8tyTvY6Y9KXnBUUvnuEqtz33/151pP1+klm/Eaw=; b=5E2cT9i4YR6DkpXtT6BDWUa/pu
	uRcaEm1r7apnoBGzUAgrWRFAPXDjdLgdW4hedwRQ0/Ll8PFUaxfnJkMoaMoS2stjeDoN/PXnvGP3f
	Xd9zMKshWjGA4+BqW9vjlhp36KSEldtzmJnf7SezGZwzy0A/C6h3aCKJQwMCS+dw/5OT8FgvUr44R
	YvJnDfviMWImTnbA0edB6awPuxelG0JsvoKWbVHJ+vdrtJd9KQ/JI1B7KG6YgSVz7cvymHRLJ3dnc
	2E50lPJMUZir0iJAIEUH+H7olQc68yGJJY7V3U+KXTB8a2KYSMAeVQGNBTwC3fKFNOBJylXVaLkhF
	444JzA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUdQ-0000000Gw1G-10rW;
	Fri, 23 Aug 2024 13:47:24 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUcd-0000000GvuL-0zK9;
	Fri, 23 Aug 2024 13:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724420795; x=1755956795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oj4nyYMV4gB+mypoya7w5RGqytEUERznSMy5TvYxR6Y=;
  b=HeVtSMUNgveKSRtG1UIa0YX8ECUoUU1synEkhOMgpPi+Cce43Fzaddux
   OUT66GJiGP2QDO4bvTsebq51rpIpd7yBt5hQGUoSmdZ7cnsYRbHp+1Kdf
   gvX1wPV/8682yzQolWgIdCQjs8m9Zp4fGWp2wcJenorFwRhs3QLJ6AlX7
   CNa/pNyvnQuRdGlHmbRN1Qj5VQ//qoZkgEyrv3D63FFizTMZj/flad/zi
   miSYkkLS06Vx01Ah9mAwTLWXKYhyntkn5Sk15VsBSWytk5tFaXa/+6xmJ
   k5LoQQykhjkcBvtKsiVeKtsxKvdwb/ubZ9QOeINgp5i3fgyxh7ZLPwwoS
   Q==;
X-CSE-ConnectionGUID: 16yeh2wNQF+wXD4+MmmpVQ==
X-CSE-MsgGUID: HRgEJbqCQHWHg/Fm2Okfig==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33456388"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33456388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:46:34 -0700
X-CSE-ConnectionGUID: WWhL323KQ3WR5KbQYnhSwA==
X-CSE-MsgGUID: rYcEtennSpqHFKRmjZnPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66729372"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:46:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUcV-00000000oDe-2JZj;
	Fri, 23 Aug 2024 16:46:27 +0300
Date: Fri, 23 Aug 2024 16:46:27 +0300
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
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Message-ID: <ZsiSs-OrZRrDBplk@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-6-wenst@chromium.org>
 <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
 <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_064635_349328_352F19AF 
X-CRM114-Status: GOOD (  20.25  )
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

On Fri, Aug 23, 2024 at 03:50:55PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:

...

> > > +     len = strlen(str);
> >
> > If it has a thousands characters...?
> 
> Shouldn't matter much? I suppose using strrchr() as you suggested
> requires one less pass.

Yes, this is the point.

...

> > This can be combined with the above
> >
> >         for (const char *const *p = gpio_suffixes; *p; p++) {
> >                 /*
> >                  * Find right-most '-' and check if remainder matches suffix.
> >                  * If no separator found, check for no-name cases.
> >                  */
> >                 dash = strrchr(propname, '-');
> 
> I believe this line could be moved out of the for-loop. Otherwise it
> looks much more concise compared to my version. I'll omit the comment
> though, as it is just rehashing the kerneldoc description, and now
> that the function is so short, it shouldn't be hard to read.

Agree. And I put comment inside the loop, while it should be outside. But then,
as you said, the function becomes so little that kernel-doc above does the job,
hence no comment in the code needed.

> I'll add you as "Suggested-by".

Fine with me.

> >                 if (!strcmp(dash ? dash + 1 : propname, *p))
> >                         return i;
> >         }

-- 
With Best Regards,
Andy Shevchenko



