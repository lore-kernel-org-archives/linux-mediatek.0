Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F615ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbjg+owo86hpnjwamnOfabM7nvSIZkhgBWmkx34Wq7M=; b=GPG/0AmGSWCwe4tfJEom0aW8qn
	QFsKHUNkmh1Rv66FM7z7teoWa/pjkm9nOKW+J8eab2c6zNZwDhzALHWKqtzhBTo2OyXukalEyR5Ne
	ERelxYceL7IJdV0DbHAc8NIC03wuH9BgLU2BsYqXqzXMWfrbv956ezrm5b4ppNIenqsOV9NMNGBwx
	MAuCbCGab8NyL5ya8zv1OfVmssu+yefIay3ITKMny42zkkvyRXhqHitW+0AestXpDFGkH1Er9W5SV
	i7GFaBAwJX/L7jBGg71jnuobW3mJGBm/H7RtK9wZE5Awjh993MzkbF2R+0aKPfXBtJn38RyHI8HK5
	27pIyLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2ve-000DB3-Jt; Tue, 30 Aug 2022 15:13:26 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2vR-000D5J-RW; Tue, 30 Aug 2022 15:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661872393; x=1693408393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wTIUsBF5sTdJ6JbPdR2fBQZlqEWSeLoC7AVXPmb6j1c=;
  b=SuP1AmgPfYDDKyQa7ZG3cb94ej3kSVwmvnEzorYR2Yz3T++5ktBQXJIs
   VW2PpnGlhr48HPTBKlVRxP+8rJZ1FB3I5nvpViFF1aHpvHH439ECAyC07
   zC8h208d2jOJQtdanfDwTlaAviKyZoHwCf26rheRxGoNSF+SkC5bM7PAh
   6R8Qb0D1IPoCwN6xyUh7M5kOOWvcwxDol6Rt+f8AiDI9U64AxLvYE+7vS
   o9tmkxJpilRX2qfg0RAoZPtTW8jdkVngckBEny5fnDBV90bMYYKRZVzjV
   mwIOCb0dLFtCmYyxjPsbQRo8iQlP8/dp9osv2w8Ngx6IkFFt3YOZJZjBT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295203382"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="295203382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 08:13:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="562682956"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 08:13:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oT2vF-0060PI-2k;
	Tue, 30 Aug 2022 18:13:01 +0300
Date: Tue, 30 Aug 2022 18:13:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org,
	lars@metafoo.de, deller@gmx.de, broonie@kernel.org,
	mazziesaccount@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org, szunichen@gmail.com
Subject: Re: [PATCH v9 00/10] Add MediaTek MT6370 PMIC support
Message-ID: <Yw4o/Sx6frEtaFDp@smile.fi.intel.com>
References: <20220830033729.9219-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830033729.9219-1-peterwu.pub@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_081313_924238_0913134F 
X-CRM114-Status: GOOD (  16.03  )
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

On Tue, Aug 30, 2022 at 11:37:20AM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> This patch series add MediaTek MT6370 PMIC support and add a index macro
> to <linear_range.h>. The MT6370 is a highly-integrated smart power
> management IC, which includes a single cell Li-Ion/Li-Polymer switching
> battery charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> First, in this series of patches,
> 'dt-binding: mfd', 'mfd driver' has been applied by Lee in the v7.
> https://lore.kernel.org/all/YvJdpq0MWNPQZw5c@google.com/
> https://lore.kernel.org/all/YvJdxEpC2cB58Bq9@google.com/
> 
> 'tcpci driver' has been applied by Greg in the v8.
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c2a8ea5997fdfeb43eda259d5533234c3cae05d7
> 
> Second, the LED RGB driver is based on Andy's patch which moves
> led_init_default_state_get() to the global header.
> https://lore.kernel.org/all/20220805154907.32263-3-andriy.shevchenko@linux.intel.com/
> 
> In addition, we added a macro to the <linear_range.h> for declaring the
> linear_range struct simply (see patch v9-0005) and made some changes for
> MT6370 drivers (see v9 section of the change log below).

Your cover letter is dangling. Make sure you are using --cover-letter --thread
when preparing the series.

-- 
With Best Regards,
Andy Shevchenko



