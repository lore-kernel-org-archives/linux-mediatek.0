Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBC8CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AgQ5AISZZ1ssep2yGiu41tQFkna3VBpDnGenFC5mK4=; b=wT+uyXjKQBBCsAA2Tuv1XnUhc+
	9hXqZyLqWw7vg+tWFRaoF+wVPJ0tQCA/9DulAox1jhIj+hc+ZFjgPbICM2Vg+gSdkF51q/mF7bS2b
	PU0eSBsakwWMYLdZqokawcjSQV2/nH06W0l2hh5r1NtCE8PjfY6/ucSIFnu4LmNFFau5042TAfKSV
	KYrBwV4A4I3B4RUZ/HGLMyKFR7JT8k+6pOKGZDPDgDoUR7/cSY6YUG5u+hSVoWEb5dlONjut/xpYh
	8O4vTIvLibZbtH4IiMZa19o4j8+59hB0kuX2Rzcf4UA3mqh48yQjmIaqHE9Sz36bkKhecK49I/wFK
	eGgL2iEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqK2-00000004cQG-2K4U;
	Wed, 04 Sep 2024 13:45:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqIB-00000004bsh-47sS;
	Wed, 04 Sep 2024 13:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA431A44381;
	Wed,  4 Sep 2024 13:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3CAC4CEC2;
	Wed,  4 Sep 2024 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725457406;
	bh=kE0X7wspkpxVH1tIDaeGEqIrVA9YrtMyOtuxX4FrNRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCrN3BJwrnkJylI3AHIVOu+JPvpU3xjzr+2K2+H+Rk/DYpys1kb23fmHuCQ+zIHL+
	 GpfXxfeDc84NCy+BkvSf76BQawFIwYmQeSICEt3LcZj2Nc1rl9mYNyxKrh/953gZOf
	 oigq1scn6Qpex2HtUPIOuFzzyAaBwdTDTDu5u4i8ZkuGOA3NztWJE+qLe9ASJxeH5t
	 vWaM+TWrwBkGeRaON+zOKqSklStlgtQ3ugRR2tja03EisNhSp5sHMkCr4fJZSHRSbK
	 5YJcNHp6qvaHwpEpJsNOySRSQh2D4i/QXmTyzFh/LPudb1OOvH9F3haSSzirIqXBFx
	 w99KibqkqfLPQ==
Date: Wed, 4 Sep 2024 08:43:25 -0500
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>,
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
Subject: Re: [PATCH v6 02/12] of: base: Add
 for_each_child_of_node_with_prefix_scoped()
Message-ID: <20240904134325.GA2416154-robh@kernel.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-3-wenst@chromium.org>
 <Zthasx8VNCw_yj5q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zthasx8VNCw_yj5q@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_064328_231857_D692D918 
X-CRM114-Status: GOOD (  16.67  )
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

On Wed, Sep 04, 2024 at 04:03:47PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 05:00:04PM +0800, Chen-Yu Tsai wrote:
> > There are cases where drivers would go through child device nodes and
> > operate on only the ones whose node name starts with a given prefix.
> > 
> > Provide a helper for these users. This will mainly be used in a
> > subsequent patch that implements a hardware component prober for I2C
> > busses.
> 
> ...
> 
> > +#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
> > +	for (struct device_node *child __free(device_node) =		\
> > +	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
> > +	     child != NULL;						\
> > +	     child = of_get_next_child_with_prefix(parent, child, prefix))
> 
> I'm wondering if we may drop _scoped from day 1. Yeah, probably a bit confusing
> as the rest of APIs without that suffix do require reference count handling on
> the loop abrupt.

Yes, please drop. We have other new ones coming and they don't have 
"_scoped". I was on the fence, but if you use a scoped one like a 
non-scoped one (declaring child outside or using it outside the loop) 
you will get a compiler error.

Rob

