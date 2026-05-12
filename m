Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE69CD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBQE77at087Kv/UO/D97NZLBnF4zFFcQ2W7UuyX7pOQ=; b=dNDO/JS3K635AkwBbFnkV4ocg9
	lfHoBuJLGpDhedhS7tlMEdrk+FJwRn++lt2pVVg/5GbgCXbnaH+vUPiUTYxIs0n4k6GwwT8Wp2CX3
	1HubD3FTio9hxR508Po/pj8+ELwi7TH4ZCVisKO1S5Gq8K3KkqKeo0jZLdmeNDirV9XbzSE0sniww
	N2kOjvc/WLr/TXasADw+n8uoWrygB5ST7UXMlA5xMySmDc22sXAk1MvaiGefH1dkcnK+P5VYPH/52
	Yg9CCMjrK5fFNZf3X2jrR6W+XpUagD8zfZu1Ta0cPGL3K0y6yx2KYq1Sbju8DJJQlRiKtkWGrt8Yq
	nKLdFosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnSr-0000000GuAo-2Pif;
	Tue, 12 May 2026 13:48:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnSo-0000000Gu9n-3mj5
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 13:48:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DADFD1691
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 06:47:51 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E49503F85F
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778593677; bh=AHvaIjAEownr1UuDMvzjOHmJ1x9P7IhUK8cJvIHHPdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmgtZpNF4t42DuWKE0QUppE04r6GtNWmmJYN4tKBMcVD12lhhCGGcbG/tuR6XWZsQ
	 vVduXHnyeUipQeBwxb3OQGfPI1EbrUZqU8YN3sO0Eo41lAtrTc/mzl/TQjG5JTDkAl
	 ISpsG46Psa9ck9VbNBFceLYKhUZbGAxsMWbMTptI=
Date: Tue, 12 May 2026 14:47:27 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <agMvb_jeRsO7tSS-@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507135356.5428d50d@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_064759_020777_11D91E83 
X-CRM114-Status: GOOD (  34.64  )
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

On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> On Thu, 7 May 2026 11:02:26 +0200
> Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> 
> > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
> > > >  			return ret;
> > > >  	}
> > > >  
> > > > +	/* If a protected heap name is specified but not found, defer the probe until created */
> > > > +	if (protected_heap_name && strlen(protected_heap_name)) {  
> > > 
> > > Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> > > name is "" already?  
> > 
> > If dma_heap_find() will fail, then the whole probe with fail too.
> > This check prevents that.
> 
> Yeah, that's also a questionable design choice. I mean, we can
> currently probe and boot the FW even though we never setup the
> protected FW sections, so why should we defer the probe here? Can't we
> just retry the next time a group with the protected bit is created and
> fail if we can find a protected heap?

The problem we have with the current firmware is that it does a number of setup steps at "boot"
time only. One of the steps is preparing its internal structures for when it enters protected
mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
process when we have a group with protected mode set.

So unfortunately adding support for protected mode where the heap name is provided means we
have to try our best to set it up at boot time, or otherwise disable protected mode support.

Best regards,
Liviu

> 
> > I'm not sure why it's needed at all, but if
> > it is really needed, then s/strlen(protected_heap_name)/protected_heap_name[0]/
> > would simplify this.
> 
> It's not so much about how you do the test, and more about the case
> you're trying to protect against. I guess here you assume that
> panthor.protected_heap_name="" means "I don't have a protected heap for
> you". If it's deemed acceptable, this should most certainly be
> described somewhere.
> 
> > 
> > > > +		ptdev->protm.heap = dma_heap_find(protected_heap_name);
> > > > +		if (!ptdev->protm.heap) {
> > > > +			drm_warn(&ptdev->base,
> > > > +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> > > > +				 protected_heap_name);
> > > > +			ret = -EPROBE_DEFER;
> > > > +			goto err_rpm_put;  
> > > 
> > > If you move the heap retrieval before the rpm enablement, you can get
> > > rid of this goto err_rpm_put.
> > >   
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = panthor_hw_init(ptdev);
> > > >  	if (ret)
> > > > -		goto err_rpm_put;
> > > > +		goto err_dma_heap_put;
> > > >  
> > > >  	ret = panthor_pwr_init(ptdev);
> > > >  	if (ret)  
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

