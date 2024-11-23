Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F059CE69172
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCIHdusfQUmUzmwiZTq/xXQVvBLG1xueohwyeD4v6CI=; b=tSFjkQZCoBPQWEqfU5pDt2APuT
	AKVCYvw3XwnQx4Fq+8JOBSV715YscL502CDHNSSbSG1uV0Ao2xFDAD2wrDHYOpotmSyxWxUGSFVyG
	gVknQW78O44/b7I3Y4j1Bk3pIOFiUSwrRyokJwTD7lf6hCKZZmp/aAXxnnldhEUJygbws3+OZvGeo
	YRK/BdN2+Z0rstT4d0txq7WLkZip8z+toC8/fctg/+VA/oQABPlzljm9BZ78mRbJ+0OBNvIn6mtcu
	uGin9Y/e+00dj61SrjGbJE0He8EJgvRxz3LpXt+3GVsgVdvsfneDSzN6aLnExBVbLQej5VOkVZOPr
	pbYKL0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvpD-00000004mEO-2vMw;
	Sat, 23 Nov 2024 19:29:47 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvpB-00000004mDy-1fUZ
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 19:29:46 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 470d06ed-a9d1-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:29:39 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:29:37 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/18] leds: switch to device_for_each_child_node_scoped()
Message-ID: <Z0ItIQWHOGL-GTi8@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_112945_610909_22C67AC7 
X-CRM114-Status: GOOD (  18.52  )
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

Fri, Sep 27, 2024 at 01:20:51AM +0200, Javier Carrasco kirjoitti:
> This series switches from the device_for_each_child_node() macro to its
> scoped variant, which in general makes the code more robust if new early
> exits are added to the loops, because there is no need for explicit
> calls to fwnode_handle_put(). Depending on the complexity of the loop
> and its error handling, the code gets simplified and it gets easier to
> follow.
> 
> The non-scoped variant of the macro is error-prone, and it has been the
> source of multiple bugs where the child node refcount was not
> decremented accordingly in error paths within the loops. The first patch
> of this series is a good example, which fixes that kind of bug that is
> regularly found in node iterators.
> 
> The uses of device_for_each_child_node() with no early exits have been
> left untouched because their simpilicty justifies the non-scoped
> variant.
> 
> Note that the child node is now declared in the macro, and therefore the
> explicit declaration is no longer required.
> 
> The general functionality should not be affected by this modification.
> If functional changes are found, please report them back as errors.


Thank you for this series. It may now benefit from the next steps:

1) converting to return dev_err_probe() or dev_warn_probe() directly since
   the goto had been replaced by direct return, hence saving even more LoCs;

2) dropping or refactoring the complex conditions due to your nice series
   being applied.

I'll comment individually on some to show what I meant by the above.

-- 
With Best Regards,
Andy Shevchenko



