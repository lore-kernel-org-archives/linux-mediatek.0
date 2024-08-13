Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD7C52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 19:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xilVwvJFOHbH+CiTklCMg9foHnVapDscltaBhFTISP4=; b=3oDHWlouCUen0B65ueQCYNKe/f
	sLRST0QWY/ed9LcFSq2ZYCAqF8KoZ58o0gfKbFOG/g5i5glaRr9Zic85vOPcIZ/V3F4lFmC6Hu5sf
	cFVpQDaaoMZQ1KTUNDw015BSMo8Lsn+9pflBtH6RYBbxUHWrt3Jt4QoxtPMQ7aCzaL8T+ID2msFtw
	s5n3hXC2wD5yPum6sclPhL78OyPvsjsuD2eWqxAA5gWy4zuT5+FlySOg0vldHUX0kJlxCuzdsw4Mo
	h4zWcsNRnJENTN/l4wIJAnHMEgoabIiTZ1covzDIs5q2ukjsiaLcEJXLgqVBsSIQaHNgJGMf+0NwP
	aarNC5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdx37-00000004jx3-2ZUp;
	Tue, 13 Aug 2024 19:19:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdx2U-00000004jpb-09ot;
	Tue, 13 Aug 2024 19:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82B7E61865;
	Tue, 13 Aug 2024 19:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B7C32782;
	Tue, 13 Aug 2024 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723576717;
	bh=LtGc6wajrhVOIl5CtVks89VZVqP++H1N10wAKeaRw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvTp4psBfGRcvAXdjnnn5oXghTeBEYPSpB4k2hcZvGs31b0skj9OQHPdtk/l1V9D5
	 jkz1kHZRmNquCYEgFpfuwQZfKCTPhj3lCfn9JIjb3K3AewMRlschTgITFSAkJMQAWm
	 TuMnXO+5aJo5puTSc48YiJHSYAr/2BDKjniCOTBbwUuo6oaxvU6H50AKpV7rXQG4k4
	 z9oHR4mUGOMOU7JtUBHyeL6RPd6ePCJVRQCkZw+bVhzXYXPfJyv9/bCNtvkVm/B7fA
	 VNbgLtUNF5Ox6JZluoo8kGFsYNerxBfSBgc5b9jI3N29MucDcNSo8oWK1wQN1JR3U3
	 Bnq5kywCNQKXA==
Date: Tue, 13 Aug 2024 13:18:35 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
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
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Message-ID: <20240813191835.GA1598838-robh@kernel.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-2-wenst@chromium.org>
 <Zrs_YijPxKBFQF0_@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrs_YijPxKBFQF0_@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_121838_142033_3B4EEB7F 
X-CRM114-Status: GOOD (  17.89  )
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

On Tue, Aug 13, 2024 at 02:11:30PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> > Add a helper function to add string property updates to an OF changeset.
> > This is similar to of_changeset_add_prop_string(), but instead of adding
> > the property (and failing if it exists), it will update the property.
> > 
> > This shall be used later in the DT hardware prober.
> 
> ...
> 
> > +int of_changeset_update_prop_string(struct of_changeset *ocs,
> > +				    struct device_node *np,
> > +				    const char *prop_name, const char *str)
> > +{
> > +	struct property prop;
> > +
> > +	prop.name = (char *)prop_name;
> > +	prop.length = strlen(str) + 1;
> > +	prop.value = (void *)str;
> 
> Is it the existing style in the file? Otherwise I often see style like this
> 
> 	struct property prop = {
> 		.name = (char *)prop_name;
> 		.length = strlen(str) + 1;
> 		.value = (void *)str;
> 	};
> 
> in the kernel (IRQ domain, platform core, ...).

Okay with me to use this style regardless of existing style.

Rob

