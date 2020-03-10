Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53336C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C358227BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRCoAzud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C358227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7999XR74J78N73H1pKZyWZkQY2xxlWUsrzXk4ypjbvc=; b=oRCoAzud9n5IyP
	L8gH+2GY+QxOoZBDoEaKmgfxyI4smBV+LIuFHXDCt4yROY5O8vV+X6d69+ImIcEmu9sYVajULnIff
	QqKB/V/LOolnGtbF6QFFl9bJCfiXTDynbb4r9Mt9EQjXjPJrQGOrfWV64Gf4ENt83QKQg39fogoAU
	tSmRtMro/npXaFD+wdn7RwfV9JlZcC/dqi9XgS7aSj8/IVJReHRMPkU73CPPzESSrLCDxyZyBBEu7
	fGcO4ZYB9Ud9M4S9PWXuZjiNYnLGpdn4w4xNjvjbBxf7kXK0raImzaKPMj5wTTD0IOHMjm424Qxt+
	M66FT78D3rJuiUmNUPtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBftp-0004bG-Ne; Tue, 10 Mar 2020 14:30:25 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBfti-0004TT-IO; Tue, 10 Mar 2020 14:30:19 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 07:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="443182666"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2020 07:30:13 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jBfte-008U3F-Qf; Tue, 10 Mar 2020 16:30:14 +0200
Date: Tue, 10 Mar 2020 16:30:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [v1 3/3] media: ov8856: Implement sensor module revision
 identification
Message-ID: <20200310143014.GL1922688@smile.fi.intel.com>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310134603.30260-4-robert.foss@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_073018_659073_85902824 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, ben.kao@intel.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 02:46:03PM +0100, Robert Foss wrote:
> Query the sensor for its module revision, and compare it
> to known revisions.
> Currently only the '1B' revision has been added.

Are you sure you send latest version?

I have a d=E9j=E0 vu that I have seen this already and this one doesn't add=
ress any
comment given.

...

> +	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
> +		val,

> +		val =3D=3D OV8856_1B_MODULE ? "1B" : "unknown revision",

This is weird. Can you add a bit more general way of showing revision?

> +		client->addr);

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
