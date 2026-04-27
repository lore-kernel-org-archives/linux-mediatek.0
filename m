Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F69EFF8867
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRDlSGzeZSZhT+5i20gQV7icup0IjvER/aasu0/952s=; b=l22PnHQwAyfepjzUzo/7DzurYJ
	OexXh+O4bIQtb0zWP9au/mqHK+L5reYmtk5hyTWiKX+G3DhzJ0J65y4l+pULDe2xRqVPt/+Grz0IC
	zfb4DAOazkuK9lOn0lStI8MVVHCOQFHJU7me0NpdXZpcuXk7t9JYt1hlOmNaQBfcBXdo54yGjvY4T
	TGo3dmtFZFYtqbAp7SliY+1DxrdUZYmZAb3YM09ZsuoS62njo37jRoRMhYn9ZVXTmXAnXUwvHC4HC
	uLFTJ0Y3nXl7H9JSXWFGaMJYL0g5+H+RKVo2P3nk2+EYefh8u1lcfwzXNC6nxvysJ4wzH71OkHp9c
	E/9z6olg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHS5H-000000004xY-0NVj;
	Mon, 27 Apr 2026 19:57:35 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHS5D-000000004x3-3HiD;
	Mon, 27 Apr 2026 19:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777319852; x=1808855852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pw7HNvlcyAS+y7RQOBGYuyt7kQu2IRAkfaF765xbBOs=;
  b=NlGS2VWnF/zpg4oHb0fueIrPVg12SxOYPfC7WM6MXLyXVKDHy0fdsUF5
   w8jS7RgZ7fQKXbrNm8ypPxzEK9Q5QcxxbZ4pxBX7YH00l2hXWNp370PfY
   Kl10G0MuWrJoDh88Y5ZrSYsnoPSkHvdTvhDpXvbcHA6g0YFIyImA/2QXw
   yMT6rB5x3wB+hyRvTO2Nm5uIUADFjwO9ePtMtCbPR1I8P580pqqyIKmvb
   E7gNUDF1fLBU+TA0aCvO6+TZfolfoCa71ULt/pFt1NE4J9knRsb0F+pNk
   uhNKrWwXoCViZcYqDynOY9ooO4gLeyc5mIqP0n+Zn6scdA1jOXUdYelFN
   g==;
X-CSE-ConnectionGUID: t7yOLOxKTx6u6AguqEPbeQ==
X-CSE-MsgGUID: vDDmyCmsQVGH0CuSPlWNHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100878790"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="100878790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 12:57:30 -0700
X-CSE-ConnectionGUID: pbPu76GKTGWypYYhuMR+2g==
X-CSE-MsgGUID: F9EgwQe4TK+9IAyoXjBwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229183594"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 12:57:27 -0700
Date: Mon, 27 Apr 2026 22:57:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <ae-_pCMGbnOXxkkC@ashevche-desk.local>
References: <20260427190849.14963-1-salah.triki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190849.14963-1-salah.triki@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_125731_891549_745B3DCF 
X-CRM114-Status: GOOD (  12.88  )
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

On Mon, Apr 27, 2026 at 08:08:49PM +0100, Salah Triki wrote:
> In mt6358_read_imp(), the variable val_v is passed to regmap_read()
> but the return value is not checked. If the read fails, val_v remains
> uninitialized and its random stack content is subsequently reported
> as a measurement result.
> 
> Initialize val_v to zero to ensure a predictable value is reported
> in case of bus failure and to prevent potential stack data leakage.
> This also satisfies static analyzers that might otherwise flag the
> variable as used uninitialized.

...

>  	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
>  	struct regmap *regmap = adc_dev->regmap;
>  	u16 reg_adc0 = cinfo->regs[PMIC_AUXADC_ADC0];
> -	u32 val_v;
> +	u32 val_v = 0;

This is hard to maintain. Better to assign it just immediately before the first use.

>  	int ret;

Otherwise, LGTM.

-- 
With Best Regards,
Andy Shevchenko



