Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55833C2BC11
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:49:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C48206F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9wvIf3N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmJgrSMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C48206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OxGwV/cXkeHv4X9qCgerkfe7q3N2QScZV3WA4J/eRC4=; b=l9wvIf3N4zdFfUjLst2glBBWT
	DKZLotcFSY2rPx4wSLcxCxnW/u9leiMMyM5oOHS7lJPR5Jtchg7LV+CjvSz65U0xcI7Tpm+oUAoIr
	AYewAhdRy74E/dQ8tD7BBIIH6+DDSiyxeOIhw26v/UcH4sOPgugyEUTYEDwWyCZQ/jtPc5Ezxx9pl
	FNZVRlcQpyu+8Q9UD5s9RFLNellJ1LTBHKt9Os42WXzRFH5iyWrusGNV/0a5T2BArY0rbBX44o6ug
	LLozCnpSCOZSa44w0yXnm/cSwLrP8PPJPzKjYaTgF9awgnlHve/53GauOxzWx0Mx3TbRZkILpajGN
	8PanLHnhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfg2-0006Ed-T8; Fri, 11 Sep 2020 09:49:06 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGffz-0006De-GX
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 09:49:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id e17so3845071wme.0
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9A++ewy8sVp6thBcPOOtbsKFvGPTO2SoiU/BMG02wq8=;
 b=MmJgrSMYoiVBokXHZc4aTskAuomxprJ7MaYaG+sU2biRH5WdQ5hvCNYeEhwh1mllhV
 POSHe3VvNWfA2At3j0JoC4OcALmT8yfhnYyfrnUPJzd9qb74FpW84zZwx10r3yl117BZ
 UpdklLK+p44ymorq/xa/2T2/tcdO71IFq4aeTagml7xomDou/T84yJ8lFYkebPG+x2BK
 1Avo0G+iAFcqbV807/eW41JANHtVCbJ0W5BUmo1XWkVV8VmOIrKmLMU2SYU2LichxXjU
 +LvrMQuteq2ezkJQxv4SmFZyCQzgAEbmdm3AkF1aIGXI+9BNcxq+wUfzoLKb1mwSs9Q0
 mCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9A++ewy8sVp6thBcPOOtbsKFvGPTO2SoiU/BMG02wq8=;
 b=a51R2qJOhJsHBmC2qSYkIZS1inoS39z0NOchhV7T1rBlsMK7CfmKb2qRuQ+Ecr7TZn
 xwYWqHCfSAldoJsTyZ/wUG4aTyfHoGoiiQcBzmclJk7JKUmYCUWTtBPGU6sR2mobkylI
 ZIhCSuY9QIqIeg6AMSiKlo66Z5bMrmYKF/V95VgX2EHxD6/kYP1T05c/g30wzskcNJQb
 t29IFgg2JJcoYXGJ1jebDd5Rg0deRRddMbSSuxc+4Xvrl2ZY5qNhGFf0Iw61+1trlunh
 OQPlHeQUADY5C2LJW4fFms0yV2jDvNIOMzlsvcQ/8/sb58NwCR+5ESV4PP1Qv0NrjnVS
 hvbg==
X-Gm-Message-State: AOAM530W/stl+LMigKXXu1whLvgA8ApWjOAdxt0dm4tyJlPG13vYr7Yb
 N05i0jNE+MynCV4D68Nf9IFMEQ==
X-Google-Smtp-Source: ABdhPJyFqCl0VUl+g10iEXvosWPQJqdSR+Yit/3/I+53mTW4FRef+/DbhGVSRBxXqQdFvFZhfLapeg==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr1330703wmb.35.1599817742032; 
 Fri, 11 Sep 2020 02:49:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b18sm3644841wrn.21.2020.09.11.02.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 02:49:01 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:48:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200911094859.tk2jlcjbolsrkeeh@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <20200911083421.g5cidlnwfiksggvk@holly.lan>
 <1599816442.29909.10.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599816442.29909.10.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_054903_878127_9DBB3B73 
X-CRM114-Status: GOOD (  29.08  )
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

On Fri, Sep 11, 2020 at 05:27:22PM +0800, Chunfeng Yun wrote:
> On Fri, 2020-09-11 at 09:34 +0100, Daniel Thompson wrote:
> > On Fri, Sep 11, 2020 at 10:33:21AM +0800, Chunfeng Yun wrote:
> > > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > > Use readl_poll_timeout_atomic() to simplify code
> > > > > 
> > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > ---
> > > > > v2~v3: no changes
> > > > > ---
> > > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > > index c1025d3..74f836f 100644
> > > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > > @@ -6,6 +6,7 @@
> > > > >   */
> > > > >  
> > > > >  #include <linux/firmware.h>
> > > > > +#include <linux/iopoll.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/of.h>
> > > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  	void __iomem *regs = hcd->regs;
> > > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > > >  	const struct firmware *fw;
> > > > > -	int retval, index, j, time;
> > > > > -	int timeout = 10000;
> > > > > +	int retval, index, j;
> > > > >  	u32 data, val, temp;
> > > > >  	u32 quirks = 0;
> > > > >  	const struct soc_device_attribute *attr;
> > > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >  
> > > > > -		for (time = 0; time < timeout; time++) {
> > > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > > -				break;
> > > > > -			udelay(1);
> > > > > -		}
> > > > > -		if (time == timeout) {
> > > > > -			retval = -ETIMEDOUT;
> > > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > > +				1, 10000);
> > > > > +		if (retval < 0)
> > > > >  			break;
> > > > > -		}
> > > > >  	}
> > > > >  
> > > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > >  
> > > > > -	for (time = 0; time < timeout; time++) {
> > > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > > -			retval = 0;
> Here will set it 0 too

Doh...

Thanks.


Daniel.


> 
> > > > > -			break;
> > > > > -		}
> > > > > -		udelay(1);
> > > > > -	}
> > > > > -	if (time == timeout)
> > > > > -		retval = -ETIMEDOUT;
> > > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > > > 
> > > > Directly assigning to retval at this point will clobber a previous
> > > > -ETIMEDOUT error.
> > > > 
> > > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > > DW_SUCCESS, then we will return the wrong return value.
> > >
> > > Yes, agree with you, but seems I keep its original logic unchanged.
> > 
> > I disagree.
> > 
> > Your patch does not preserve the original logic. Your patch explicitly
> > sets retval to zero if the second loop succeeds. The original code does
> > not do this. As a result there is a change of return code for one of the
> > error paths.
> > 
> > 
> > Daniel.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
