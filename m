Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E8606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0MuaT0a;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KToUjubY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kVnDN2YB/Rq2MZvuzYs7u9jJ/Ii0K42RtQhfqcB/k+k=; b=T0MuaT0a1CKO45cCEeyZL/PAT8
	O4kgJJreudVp27y0jmO4rtFiZFzgndVpTzrLog2fEwxltd3ykmyPxKq8xKQz6BioLnf7QpdfJ0E6T
	dRjslFRVkbDzrDbg9zJ9MCjqcjJZ8jRNy/pCHZre1Re5WnUECD1rxTyL2nfT/K+wWFvfQ84W7lqqO
	8pNfRLjdHVSMlm9+uXUC+IVPs9nse+GgcPrNxW5nwpiJwY1B/T9qEbj+9Db0GOjiWK+WhM98csDpb
	vEYpyApYf7jm6VQDiDfT+0VNLpwjJQkpAzdRkPTHQSqLVUswQBQrdmehx1RdnYJA69NrIPAiNPPnT
	ByF1moGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWa5I-0000000DT7A-13wq;
	Thu, 26 Nov 2026 14:04:24 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWa5C-0000000DT4w-0XsM;
	Thu, 26 Nov 2026 14:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795701858; x=1827237858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jShNgctqUDhIWWUL9t1y3IvHLsqM3SccaTZXZU0e1EY=;
  b=KToUjubYAOF9MhlMbME3aLNJVckfdQUbjsa4aqjAgDj4Gt8OZSoIoX/B
   9b5mjcSAImW2HDUbeWj3oVQdqny+Yas5cS1WZvKogu6EJFmcVFeYnHo3Q
   GUAszBaIA4dtqB1FKEmowPgS26XFMPrkP9OQ4uOGP7ufMPMQA5MJrrK5A
   ve0lzaofYfI34zgkZDkZC2//1TBwU7Qlq4v/FWVnhsz1xvF6x88BGh3Xh
   WnnaP3tq6n5mKxrZm+5nYXVnHlVgCSNhnF+UkcOkNoc3bC3F3NY0fJ2MR
   KjP/BYXo0kjrqeGVAdSHqM9GLKv5wOJMRRFYvjP6pwhm/EjjNluj69dEl
   g==;
X-CSE-ConnectionGUID: tdqqsYe4TzqQNro+P+TQaQ==
X-CSE-MsgGUID: iLhAbk0wS6aPjv+O4mYCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4569166"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4569166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:03:58 -0800
X-CSE-ConnectionGUID: HGnPPOSxRnusO++2XnpBxQ==
X-CSE-MsgGUID: dirvXu3SRB+32S9QfcV4ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12337320"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:03:55 -0800
Date: Thu, 26 Nov 2026 16:03:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: iasnezhkov@gmail.com
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359: divide scale by ADC resolution
Message-ID: <awg8SQRRCia77Guc@ashevche-desk.local>
References: <20261126005326.71926-1-iasnezhkov@gmail.com>
 <20261126005326.71926-2-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126005326.71926-2-iasnezhkov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_060418_252740_1605C500 
X-CRM114-Status: GOOD (  12.95  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 12:53:27AM +0000, Ilia Snezhkov via B4 Relay wrote:
> 
> mt6359_auxadc_read_raw() returns raw ADC counts for IIO_CHAN_INFO_RAW
> (12-bit or 15-bit depending on the channel), and returns only
> (r_ratio.numerator * vref_mV) / r_ratio.denominator for
> IIO_CHAN_INFO_SCALE without dividing by the ADC full-scale range
> (1 << chan->scan_type.realbits).
> 
> As a result, iio_read_channel_processed() and userspace consumers
> multiplying raw * scale obtain millivolt values that are 4096x (12-bit)
> or 32768x (15-bit) too large.
> 
> Include the 1 << chan->scan_type.realbits divisor in
> IIO_CHAN_INFO_SCALE: shift r_ratio.denominator left by realbits for
> IIO_VAL_FRACTIONAL when denominator > 1 (r_ratio.denominator is u8 and
> realbits is at most 15, so the result fits comfortably in int), and
> return IIO_VAL_FRACTIONAL_LOG2 with realbits otherwise so channels with
> denominator == 1 use an exact shift and unpopulated descriptors (such
> as MT6357 VDCXO where denominator == 0) cannot trigger division by zero.

> Found and drafted with an AI coding assistant.

Move this to be below the '---' line.

> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

...

> +			*val2 = (int)desc->r_ratio.denominator << chan->scan_type.realbits;

Make the struct to be s8_fract instead?

-- 
With Best Regards,
Andy Shevchenko



