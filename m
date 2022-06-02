Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDECC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcOtI6c+X+DgU980187Wdm9puK+zLVtZYn60tBfFWww=; b=MMChpvrvZPlAIY
	0+nNLNQGqn9CPwEcMc+JhVl52XQ++mBf7QTW4BksNfDOrbLWzzRETUP4eO5aL+RwvCNo6j2UEDhql
	OqZffYMEX4ovjX6C8JsmHQjyuk1qO7/T5CWAprVOuXE0ipGyqlQ+5yFC0HSuf2Vkj5skGfZEnqduq
	o1yad2VKxPsnCbzFAOqga1tYEpNbCQBiFcILfOdvYRuznuBDGtSgUfa68UTHcfINNcr7cHo2Xd9/t
	az1m4zbukKD3zlp23yqVGl3TP4YluMWJhx0YDis8p/v2UcN/XTEUOAkOe6+w0nVSt2pp2N+rQl1Cl
	CJP+ORBWgUsHTfLEnfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwijE-002u5v-Id; Thu, 02 Jun 2022 11:11:00 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwijB-002u4B-OF; Thu, 02 Jun 2022 11:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654168257; x=1685704257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=olQ0OA0H1c6Sts3x+w8aOXscdnJ5P5s3LhpfS4yRNpE=;
  b=ShIBqHS5Nr8wkm50r0MvMrT8caR/Sw0hibuYhmCdhbEiBFP4ke1H73hk
   omTz8aRy22HF7SGw8r8OWx+IAeXAbEITl6cnVkXA1/WGTV7nxt4IgQd0q
   SIH6pBjRozzlHVLxjh2nmS0wRRdYDdQoNhC9eBdug9pe7w/jfgm+7hBf4
   m9OghfSWWPC+RAChNvMIi2RG0KapGqvI3aKYItZjjzlB9iIpbgy2aKQaA
   O1EGYBH0cjLIf8ATHOYzOqvcXjxhzEJiaOSDIGfoIGpVwefNrDsQiCkX8
   D2uEze6NhFzrSCpFjhxvftBc3tGm8S+5MynEJCEqvcL8n2Z4OFgDrqtfl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="256394204"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="256394204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:10:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="721260311"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:10:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nwiiz-000RZf-AX;
	Thu, 02 Jun 2022 14:10:45 +0300
Date: Thu, 2 Jun 2022 14:10:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Satya Tangirala <satyat@google.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lucas Stach <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Stephen Boyd <swboyd@chromium.org>,
	Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND v12 0/3] mmc: mediatek: add support for SDIO async IRQ
Message-ID: <YpiatZh+ZMpoAp/K@smile.fi.intel.com>
References: <20220525015140.384-1-axe.yang@mediatek.com>
 <1d07579c0a6b8853ab72e345a0bd0be73549de8c.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d07579c0a6b8853ab72e345a0bd0be73549de8c.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_041057_908344_68DE5914 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 02, 2022 at 02:07:04PM +0800, Axe Yang wrote:
> Hi,
> 
> Gentle ping for this set.

It's a merge window, so your code perhaps will be considered next week,
or later.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
