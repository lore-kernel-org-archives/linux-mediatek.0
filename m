Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1D5C02180
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC3eGZLqC1vNc/6zNqqn2xOkOaWSw2FibFx95di7mQk=; b=DRZENRLeOEGCf0LHES+oHvJ6EM
	Ms54wVvW4YoQ6G0QC5E0rSxyj6MOl8PEYGs5M5ht9iNCjBVBUtUHAMRN1T/IB8/io3ZEo3WcNYwov
	zUnXgwRChGTIbsHUVhTjIUniUY5ezsjKfBtM61uigaqztVkFJo3vpuLLhMK9eJO+4oJGt6jX925mg
	maNQpOlONxuH7/V8BvlMSlm5ls4R9iTurBgoeyrX9H6Uf53vXoD8/hpXdQNE3YWpboeDkxc81ptaQ
	mRcoslKh2uNAmd8dzSkwX508R4FHTZb66c9WlHtRJuAxtGZ5sBlzbpgpoXyXAaKNcu+iOGmGeHvaO
	8fNHWCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYML9-0000000EOUZ-1HGu;
	Thu, 16 Jan 2025 09:39:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYML7-0000000EOTW-0fUZ;
	Thu, 16 Jan 2025 09:39:02 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12F276B5;
	Thu, 16 Jan 2025 10:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737020281;
	bh=Sz7XGsB0jJiCVcgAYNC5ZZi+VkFA4hXqTcdj3HBGvi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0BH+gjPklcJM4K7npyiN+OizL+So166OYOAFCGwmyI31sasdC0hnhksHO/5bLnfw
	 HMc/eoseS5N2gVokQXXsjM5itCkOuGjpNUxwyWy3Ek6SdEbjqi0yC6yW0imGRrqVj1
	 1fRnvPVpWPsdUJLy5MKa4eyuKZRKjUpaQVwa4Knc=
Date: Thu, 16 Jan 2025 11:38:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250116093854.GG6754@pendragon.ideasonboard.com>
References: <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
 <20250116084340.GF6754@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116084340.GF6754@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_013901_338241_5C53C716 
X-CRM114-Status: GOOD (  26.13  )
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

On Thu, Jan 16, 2025 at 10:43:40AM +0200, Laurent Pinchart wrote:
> On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> > On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > > No disagreement there, we need CREATE_DUMB2.
> > >
> > > My point is that we have the current UAPI, and we have userspace using
> > > it, but we don't have clear rules what the ioctl does with specific
> > > parameters, and we don't document how it has to be used.
> > >
> > > Perhaps the situation is bad, and all we can really say is that
> > > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > > for all other formats is platform specific. But I think even that would
> > > be valuable in the UAPI docs.
> > 
> > Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> > linear layout. Not monochrome or YUV or tiled or displayed rotated or
> > whatever.
> > 
> > If it happens to accidentally work for other uses, that's fine, but
> > it's not generically reliable for anything other than simple linear
> > RGB. It's intended to let you do splash screens, consoles, recovery
> > password entries, and software-rendered compositors if you really
> > want. Anything more than that isn't 'dumb'.
> 
> We have lots of software out there that rely on CREATE_DUMB supporting
> YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
> implement YUV support in CREATE_DUMB. I'm fine replacing it with
> something better, but I think we need a standard ioctl that can create
> linear YUV buffers. I've been told many times that DRM doesn't want to
> standardize buffer allocation further than what CREATE_DUMB is made for.
> Can we reconsider this rule then ?

Actually... Instead of adding a CREATE_DUMB2, it would be best on trying
to leverage DMA heaps and deprecate allocating from the KMS device.

-- 
Regards,

Laurent Pinchart

