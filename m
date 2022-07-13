Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKAUXPLBrNevdC9OiqEXv5Wg4h8+PAmTG/9uIdwRKNA=; b=xnQ8j9vQPid6HXxIkaWo+B3F27
	MWae7z2OHC8z8BDCrwyLrgBjNTIomtfxQ0DakMdgpCBh2crcu1PeqMPXSyRyJPIAgPjRnsjYWoyPa
	Fv5FkBMutQnRtkUBnEKWixsFvMfKcIgMVlziGnBu9LT24KALPb/NFio8ywj3Q541fxcZZ5beb7zKM
	jZgFkPaFQemLZ+jTXH2l3RbXPvHjGK0TiysqFC5LQwna9B5C+AARquoDKZFyAICqamhekCzBrbj7X
	zEvtug12InGrBUy1o6PMHK5yFf2SfL2RlmCG2tvzsjzbCTPgpcRzD1iDHUNZAbFmivdwD3wu3L1mV
	FiNFG6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBej0-005Lk7-D0; Wed, 13 Jul 2022 15:56:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBeio-005Ld9-Hr; Wed, 13 Jul 2022 15:56:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so4335507pjr.4;
        Wed, 13 Jul 2022 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jKAUXPLBrNevdC9OiqEXv5Wg4h8+PAmTG/9uIdwRKNA=;
        b=aBupZpHtg8XwLvVKFAXLuBmAAWVRVghrIn9ZNgreYANgaU0v/qCvdDEIc9xI6H79sA
         NZ9TpP6vHRQfG0DdPuQH99iG2Or/tN6/USEXUEs94hwwJ9T1Ot0kdHuLklolhFTu1Vu9
         cKQ6OXNFiSNTWdoo8iVDnSAn3mrj0hegvaqHgYgwIMTY9yydRqsECiJY8UoWpnWVLHDN
         FcDZGik/5xc59Zm0aKoHj/wl6bramtnIqRkQpLRP/6gZglOCfL9cKd2/o7COVFIMV6Dd
         Uj8Nj+baniaDNUtmjMqcutA/zmMl6wqmPchds9edCbIIq6IseZdbXIU74IjSddrpobOK
         BVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jKAUXPLBrNevdC9OiqEXv5Wg4h8+PAmTG/9uIdwRKNA=;
        b=VfO7oj7BbwXpCYNH3QC6tFYMrGAJKge3vAkulsmttI4BdnuMpVPrShgi/4zN1ePGeO
         Xoa9zP8miokkQsDY8Gb2nEgv5cy8XHwvGBUu8iA81ggRI9LjOCUG1muPQoIYR+YhWor+
         kVWZxOo9mLweRMv3lvdgqWQt6YP/qm2/E9kJV1BnZe5hZ5ouE20/dTc9zbKC94buV/EO
         k9HKOmmtArTnK4np7+wYME4aiznQjrdIZBr/ffQSpQDGnpWLZ2+3JpZuLDNj6lRaMbwx
         yQr1PY6UzyknEXMRPNSKiTJjf6SUZTWxLa5Sqmr4DOdpb05ny52iio/eX/kH3fU3xufz
         ztSA==
X-Gm-Message-State: AJIora8mdlpC8zLxXWu/gUhr/Mn4i8PxcDiuGd5MUSkGkXG9aV4JfO/N
	VSddluoBmT1nxL06E5L5nTs=
X-Google-Smtp-Source: AGRyM1uztx7H1jzf5s+TTvAW1XBZNKgEQoYqHpqn6WNTf/pSYOGA8xIgngVh0T1SEhc5aR5zpYFJEA==
X-Received: by 2002:a17:902:7106:b0:16c:6c95:6153 with SMTP id a6-20020a170902710600b0016c6c956153mr3706590pll.166.1657727776276;
        Wed, 13 Jul 2022 08:56:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902a38a00b001678ce9080dsm8962079pla.258.2022.07.13.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:56:14 -0700 (PDT)
Date: Wed, 13 Jul 2022 08:56:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xin Ji <xji@analogixsemi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v16 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <20220713155613.GA2194204@roeck-us.net>
References: <20220712090534.2783494-1-xji@analogixsemi.com>
 <0bd85140-f006-8b29-0a43-500733f1654c@roeck-us.net>
 <Ys16lEvhVSSSRMP7@kroah.com>
 <20220713062845.GB2788915@anxtwsw-Precision-3640-Tower>
 <Ys5oBTeIcLjf7gnX@kroah.com>
 <20220713064818.GA2789090@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713064818.GA2789090@anxtwsw-Precision-3640-Tower>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_085618_672106_B1E16C36 
X-CRM114-Status: GOOD (  26.64  )
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

On Wed, Jul 13, 2022 at 02:48:18PM +0800, Xin Ji wrote:
> On Wed, Jul 13, 2022 at 08:36:53AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 13, 2022 at 02:28:45PM +0800, Xin Ji wrote:
> > > On Tue, Jul 12, 2022 at 03:43:48PM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, Jul 12, 2022 at 06:31:22AM -0700, Guenter Roeck wrote:
> > > > > On 7/12/22 02:05, Xin Ji wrote:
> > > > > > USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> > > > > > and a port controller (TCPC) - may require that the driver for the PD
> > > > > > controller accesses directly also the on-chip port controller in some cases.
> > > > > > 
> > > > > > Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> > > > > > 
> > > > > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > 
> > > > > > ---
> > > > > > V9 -> V10: Rebase on the latest code
> > > > > > V8 -> V9 : Add more commit message
> > > > > > V7 -> V8 : Fix Guanter's comment, remove unnecessary explain
> > > > > 
> > > > > We are now at v16. The change log has not been updated since v10,
> > > > > making it all but worthless.
> > > > 
> > > > It's also already in my tree for a while, so I have no idea what this is
> > > > being generated against :(
> > > Hi all, I'm little confused, do I need update change log from v11 to
> > > v16? There is no changes since v10.
> > 
> > I'm confused, why are you sending a patch over that is already in my
> > tree and in linux-next?  You got an email saying it was merged, see
> > commit 7963d4d71011 ("usb: typec: tcpci: move tcpci.h to
> > include/linux/usb/").
> > 
> > thanks,
> > 
> > greg k-h
> Hi greg k-h, sorry for that, this serial has 3 patches, so I just think
> need update all 3 patches in each upstream.

If you resend patches as part of a series, please explain in the change
log that this patch was unchanged.

Guenter

