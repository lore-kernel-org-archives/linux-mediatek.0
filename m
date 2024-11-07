Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19820D5AE72
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2024 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoHtGBbIT7cejHYPy7w5YjJwSa89U1o7+v8ap+q+GxE=; b=ayjyNFBtRSYAA1FQLJ5eLie/2b
	oCX07w9EpRlJIomyHVv1+NP21mAoiLbm+2UumbuiK1L3p/a/Eg5WwoXg7SuLapj7JhtSIH5Yk2ZTK
	JcF/gw6L7Xuv+mczR6xqUp/T/iQPUl4LpgmchajtBYTqTAJMaweLFgoEnu6T6oN9EyaAHLJKQm2L8
	BziKc49JW4Wmdl8TlrrpIXLzAtkOHCQO1Qyr843vg7BGfqTXLCofFutO6KDwWuWcn8kLKk0MuzsGe
	VKL1J7uBjcqvTSnB0CA2/JS2+0QPfyOj74aDfTJHK0rqnoAVMPeWBvwjGNFD/zuKvasshdI+fVqhB
	DkPS3kYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y0B-000000068eM-46Qi;
	Thu, 07 Nov 2024 08:36:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xyP-000000068BI-0KpK;
	Thu, 07 Nov 2024 08:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CC135C46D1;
	Thu,  7 Nov 2024 08:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B21BC4CECC;
	Thu,  7 Nov 2024 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968475;
	bh=ekfKStdaRvxQJ8LnLOTxDNbCdjD/Ffnq9L/mjy1VY3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAXJaD3UZ0pIe5Zb+H5PrAOqqYxl+hu6sVhz+/a5gLCVgRToujV+i7YZbM5Ne2n92
	 RoVevRrtY6vgO16does91zknKuqf7n5KmWhIjTNuK6rUSbFQr4SKQg2W0gDLgg0lYr
	 ZxWE9YwKZHxw2vlDeO75a2U6amknWfLro6LBf1LA=
Date: Thu, 7 Nov 2024 09:14:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Haowei Cheng(Harvey)" <harvey.cheng@fibocom.com>
Cc: "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI0=?= =?utf-8?Q?=3A?=
 0001-usb-mtu3-fix-panic-in-mtu3_gadget_wakeup.patch
Message-ID: <2024110705-manmade-nullify-b95b@gregkh>
References: <SEZPR02MB54953820B2A9EEBD807D0ED18E512@SEZPR02MB5495.apcprd02.prod.outlook.com>
 <2024110512-popcorn-germless-01be@gregkh>
 <SEZPR02MB5495A8637098B92CDEBBFC6C8E532@SEZPR02MB5495.apcprd02.prod.outlook.com>
 <2024110735-lunacy-salvation-684c@gregkh>
 <SEZPR02MB5495C6CAF78EC669F65CD6398E5C2@SEZPR02MB5495.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR02MB5495C6CAF78EC669F65CD6398E5C2@SEZPR02MB5495.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_003437_192588_234F3512 
X-CRM114-Status: GOOD (  12.39  )
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

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Nov 07, 2024 at 07:47:14AM +0000, Haowei Cheng(Harvey) wrote:
> Hi greg k-h,
>    We have configured the USB RNDIS port protocol by default on the product and conducted extensive stress testing and validation.

Where are the RNDIS stress testing and validation tests?  What host did
you use for this testing, Linux or Windows?

> This issue was discovered during compatibility verification, and after making clear modifications to the API usage,
> the issue has not been reproduced in subsequent tests.

I do not understand what you mean by this, sorry.

Again, you need to submit this patch properly if you wish to have it
applied...

thanks,

greg k-h

