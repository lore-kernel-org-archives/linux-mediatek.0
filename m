Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCCDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRKUpiLh7Fx6HIKZAFAGgQa7xfk/p4eyepJ+zySseCk=; b=lW1iTRJbbms6rF
	sF+6HSH7WFAsh+ygs/V6HDvhjQhrRabn/XZoCJEUQ8i7EaleJ7S4OHs5rcHERAxbCAptXheEpk0fC
	By5RkkNBHQsoWgjvemyRmtQ0p3geqPnLMXJzLqXTMGyB2yMvlAca3kmht2n6Roq882QYGV8GfqX9N
	a7jOn8KtrRGw0h0bI7OZiKzmx16nZw/3UyPCPr3xha/njJV/YQDZhewz0pTRMrFX+8/QmfeTwVLHQ
	ktJrJhIDZPL10WF7Xk2N1b/duUvsVTu96qfLyXNvkuFWJt+4XHd7gwnys4A6eNnyxXgyQOHb1VPrc
	aZcpdqmF93IbpD3Fumgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLIN-00Cptz-QV; Tue, 08 Feb 2022 07:52:15 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLIL-00CptL-EQ; Tue, 08 Feb 2022 07:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644306733; x=1675842733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zSjGWEp/lad+yOmZqYzDcbgsisGuWA+cNAYLyxP20Lw=;
 b=iCCf0cFrOTqfG3ozo4WcCvGBKZCbSBCPL8wchRiUctZhgAxpPyE3lHaP
 MMWmOIcU1cuHisv/YJZpFXhjJ7q7WsoaJ3VBRz2SPn/+W7QJjAzNnKG9t
 VDRVQ3A2Eghoe98h/gm5IGuWqvV/4n0HA5adTwyEjuz/pQwZbT2q/JAkK
 CptBKq13aHU5Ppxk6dAvqzLE4yhE+gYrzrManDXUs1Yrc/OwWlPZLYzrG
 /1KEwL2V5WRZjGe1xCIlCaIkUD3gmrahfN9uSL4FnWN4gGmEFqWRyoFKC
 67GzL1S/Hk0loXRRcOV9uPaeF7OyW1OIzeTjELmN8YR1mE0kBi+H7iU78 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249103293"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249103293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 23:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="484724374"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 07 Feb 2022 23:52:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 09:52:05 +0200
Date: Tue, 8 Feb 2022 09:52:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 Simon Ser <contact@emersion.fr>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Intel-gfx] [PATCH v7 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <YgIhJb3+MckKD4dC@intel.com>
References: <20220208073714.1540390-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220208073714.1540390-1-hsinyi@chromium.org>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_235213_523360_19BAA13C 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 08, 2022 at 03:37:12PM +0800, Hsin-Yi Wang wrote:
> +int drm_connector_init_panel_orientation_property(
> +	struct drm_connector *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +			"panel orientation",
> +			drm_panel_orientation_enum_list,
> +			ARRAY_SIZE(drm_panel_orientation_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.panel_orientation_property =3D prop;

Leak when called multiple times. I guess you could just put
this into drm_connector_create_standard_properties() instead
and avoid that issue entirely.

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
