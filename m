Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B60C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 10:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6130208A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 10:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="diU9FXA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6130208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26dvDs7eAFHs8PCBwIO3Vkm6L+tJ7elJmWlJlm5iWrY=; b=diU9FXA6YYTyZl
	tSlXvtQCxZmthoNKYoXZ/xUtdJQ4lT1IRAsJPMZGizxDS/qGEAAxblm1QMkJo+UEO9v5Em2klKwVB
	GE9OPRZQvoOZNS1IJgP4GbTGxh8MoyyUYbinlK8J8tG+dWUvP6Di8IeRU3R/4Zjt2hn1bI/UA3rqz
	n3L3WJeGUwdTAd3qQObYkgLPuq174zDuUmaptaaZPb0aZewDj4AxRydtsiYynHKxAV7JMnuVAHtj7
	lAheN2vxOM84qGzXb5ORJZMUK/11TyQQ99i/MsPCjwo2H4b0dJwYgH72s8IM358rxQ40MFz21Nqkk
	uWaqtU4caKBL4/NtOPVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeFlI-0000E8-Sn; Thu, 28 May 2020 10:27:44 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeFl4-0008Tb-Oq; Thu, 28 May 2020 10:27:31 +0000
IronPort-SDR: KJhq/bqMJ2zqpCboiJG/987FLYzjXz/RV6p0XdAN3dOP4BmJDROWy07/H1/7g1ztXfbQr2DtVg
 ErFEkAuqjPzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 03:27:29 -0700
IronPort-SDR: QUbWppTdipRmkK6s3TNjKXxDmOVRiFx+Anq76PGnZ8ysN5MS/bpNf3b8K3wf/qJwZvs4uvoVXl
 6VHpJrTTuyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; d="scan'208";a="291950293"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 28 May 2020 03:27:27 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jeFl4-009PNm-Uf; Thu, 28 May 2020 13:27:30 +0300
Date: Thu, 28 May 2020 13:27:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528102730.GK1634618@smile.fi.intel.com>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528090144.54033-3-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_032730_819218_32C0537C 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This adds matrix keypad support for Mediatek SoCs.

...

> +config KEYBOARD_MTK_KPD
> +	tristate "MediaTek Keypad Support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST

> +	select CONFIG_REGMAP_MMIO

This is wrong.

> +	select INPUT_MATRIXKMAP

...

> +	ret = devm_add_action_or_reset(&pdev->dev, kpd_clk_disable,
> +				       keypad->clk);

I would leave on one line (only 81 characters).

> +	if (ret)
> +		return ret;

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
