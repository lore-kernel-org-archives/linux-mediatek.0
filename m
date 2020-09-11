Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1238C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 08:34:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6024F206F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 08:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNcyzGq0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjsNQ/VG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6024F206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BoDGJw8o2J60bwfUmlIKqlTIP/3JixCJnh2buykJ1wI=; b=aNcyzGq0I5Eyy0UHmqvAwsl0G
	qIU28U4HZREisIcp6igmTR6ACPv43LmDCgrqqVI4YqcJwQEG6qqKf8IbMo5U/ymBoUUHOKZvcKPyY
	eyzosNvSMxJeYvq3K8eqm4Xn5Mjuiqe478twqoJ1OA06afONBbdk+hHVgb5wA+lunwDZDqHHqCQtj
	5scB3yl5PFLcn1DnfXIM78KoDWxyOkxCySsWHX8hhUBAH4q3iHiVwSkRjWHTz0W58aM7qMbFmwiF4
	K/tep9il6iY7no+rNd8pbfxGauSmtZz4AyeRL7SUMlP0sZ/5+5khB1/I8acPowdVwrIHY+fEgc90P
	FjpWok/vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGeVo-0000HQ-53; Fri, 11 Sep 2020 08:34:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGeVl-0000G4-51
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 08:34:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id t10so10631438wrv.1
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M0S4mP0yQ288Ht2IB3N+dbHxuqNNpIHZMkWTvJtXhOc=;
 b=PjsNQ/VGfWEB/Je9D2ogZjHZiDGDyOpS4ISuRBopjuEgW6j2F2opOiYWud3Q5U5GI3
 AQeU9UOKGJv01qSSw1DB1PVTcy3ESKJYkbxgo7Nm08xdMV5HNfX1FK0KYi9N4L21ES1k
 9U/1QUSJes6b4cEvGOcHiC1J0281ylA2mrnajr+Zz06h9OKNDuFugNOqajsZ3QumU0eZ
 /x0BHg7x2ioMEalsdP8EQcU998V8ejjZs40169D0Dc4vOzndI7VIzlVpcC+FzfcBXsqq
 fajcI4JOzvFDntYJ6wFTqoNnvj2yJUr57Lu0jh/M/UeE7LpGNCcTIUhnov7H9XqHLXwX
 G8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0S4mP0yQ288Ht2IB3N+dbHxuqNNpIHZMkWTvJtXhOc=;
 b=F1wx2vyVu8OSjUGyhLC7itsupxm7kBV1siuOzBhLek0oxkRfIEF+kObJ2Al74e3eb9
 yGpxaY7LssrZCBzmzJ9pswfOncbHYY6TCHm9DceeXgkq3lopZcTv7iM0x4/kVClsfWPP
 9l17rdrCMryZNxGBUJd/2sZSWhlw4mFHIdW5gxD96jznlJLAUY/JZ0hJRtD50xGPellw
 uYfIeqMncCKbxALPP4rCMeU0O5waW8wd4L45HflQmqlPbZwBATf50DCyVTWo13/O52mx
 Yw67iA1GFzWzFPMIslN3duqfJ/H2f+8+Gyv+nki2Uw1ICcwpiJgud5e9rfRYp67QfHsz
 u2hA==
X-Gm-Message-State: AOAM532FLui3tP8YeizNdJ4zJwUzQhPKHD0/MpvOeabFFbxDIoFMZ9F1
 MzoKN61uoInNLH6yS66rXVPoKQ==
X-Google-Smtp-Source: ABdhPJz+kgniz8iKUb4blQrRirzDIa4lhBqRbiiOpeC5E8r1DBQFs2ka64TSwdoiUTGozKH7QGOAjw==
X-Received: by 2002:adf:f290:: with SMTP id k16mr982616wro.124.1599813263810; 
 Fri, 11 Sep 2020 01:34:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q186sm2803894wma.45.2020.09.11.01.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:34:23 -0700 (PDT)
Date: Fri, 11 Sep 2020 09:34:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200911083421.g5cidlnwfiksggvk@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599791601.24609.5.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_043425_330113_CEB3FE98 
X-CRM114-Status: GOOD (  25.59  )
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
Cc: linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 10:33:21AM +0800, Chunfeng Yun wrote:
> On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > Use readl_poll_timeout_atomic() to simplify code
> > > 
> > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > v2~v3: no changes
> > > ---
> > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > index c1025d3..74f836f 100644
> > > --- a/drivers/usb/host/xhci-rcar.c
> > > +++ b/drivers/usb/host/xhci-rcar.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >  
> > >  #include <linux/firmware.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/of.h>
> > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > >  	void __iomem *regs = hcd->regs;
> > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > >  	const struct firmware *fw;
> > > -	int retval, index, j, time;
> > > -	int timeout = 10000;
> > > +	int retval, index, j;
> > >  	u32 data, val, temp;
> > >  	u32 quirks = 0;
> > >  	const struct soc_device_attribute *attr;
> > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > >  
> > > -		for (time = 0; time < timeout; time++) {
> > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > -				break;
> > > -			udelay(1);
> > > -		}
> > > -		if (time == timeout) {
> > > -			retval = -ETIMEDOUT;
> > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > +				1, 10000);
> > > +		if (retval < 0)
> > >  			break;
> > > -		}
> > >  	}
> > >  
> > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > >  
> > > -	for (time = 0; time < timeout; time++) {
> > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > -			retval = 0;
> > > -			break;
> > > -		}
> > > -		udelay(1);
> > > -	}
> > > -	if (time == timeout)
> > > -		retval = -ETIMEDOUT;
> > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > 
> > Directly assigning to retval at this point will clobber a previous
> > -ETIMEDOUT error.
> > 
> > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > DW_SUCCESS, then we will return the wrong return value.
>
> Yes, agree with you, but seems I keep its original logic unchanged.

I disagree.

Your patch does not preserve the original logic. Your patch explicitly
sets retval to zero if the second loop succeeds. The original code does
not do this. As a result there is a change of return code for one of the
error paths.


Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
