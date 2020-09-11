Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0F9C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:35:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8EC020732
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BErSgmuY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j/FKkf4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8EC020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gkbGNvPvvpD8/iCITng2Ze4iKnLo407fdHwczt0AGH0=; b=BErSgmuY8436gKnjDf+nmB+VK
	ddRPsjUz1qcM2wbYVZR0N99mNtCnapufPwfdI6wWIRhlNb/0F+L62Yi/17zPPa5lOqoRkeb6UhTAu
	fIQzQhgy1B8iwXcEzfvVoddslLmHwNLb2CajslKyPyqt9Vmdw9d9I+wDjbVvKjrM6m/pDmc1xSKxN
	m3Q8aEy7xucULhxurVN4vwaKmrhNytdj7HKC454uE20jSErxvecHUOp0ffgbm5+c+xntOmdixhwSE
	Ka89ynka/poMNo9Y+rE/xVGUqDr0wvnp8WwlT9QeWgrzJRn30bAFK3K8jxrl1ZWYFa95wcDttPHX5
	j8i4bUUzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGYuS-0006i8-O0; Fri, 11 Sep 2020 02:35:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGYuR-0006he-0Q; Fri, 11 Sep 2020 02:35:31 +0000
X-UUID: 8e5f035b24dd4c36bee7fb785fc39d1e-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7MYSoZ5QxzUzH8hLs5rwGOWaWX5IAIFzofz6EFN77nw=; 
 b=j/FKkf4wivoA5ucnYnCKfcuyalX+xfATSkFEQx70M9RwXojUDxWJTWlipjpQqMTsUVWsXnJIPjjwJ55s17SgVITAzdSz2586XRYc79M5A8kV+J8mH3G7M2Mh7xiF8OfweP1aXW8mPJIrNTMC3tbRyTrMdgCi3hWbPeol/Ol6mpM=;
X-UUID: 8e5f035b24dd4c36bee7fb785fc39d1e-20200910
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 627694989; Thu, 10 Sep 2020 18:35:22 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 19:35:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 10:35:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 10:35:13 +0800
Message-ID: <1599791601.24609.5.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 11 Sep 2020 10:33:21 +0800
In-Reply-To: <20200910131212.wm7zskxvcesl652c@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0656D636ED552509600E962FFCC7659B588E3C6D24BA40A07694E3B2815115EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_223531_212976_CD6D1685 
X-CRM114-Status: GOOD (  25.61  )
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
 Douglas Anderson <dianders@chromium.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Saurav Girepunje <saurav.girepunje@gmail.com>,
 Jason Yan <yanaijie@huawei.com>, linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > Use readl_poll_timeout_atomic() to simplify code
> > 
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2~v3: no changes
> > ---
> >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> >  1 file changed, 12 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > index c1025d3..74f836f 100644
> > --- a/drivers/usb/host/xhci-rcar.c
> > +++ b/drivers/usb/host/xhci-rcar.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #include <linux/firmware.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/of.h>
> > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> >  	void __iomem *regs = hcd->regs;
> >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> >  	const struct firmware *fw;
> > -	int retval, index, j, time;
> > -	int timeout = 10000;
> > +	int retval, index, j;
> >  	u32 data, val, temp;
> >  	u32 quirks = 0;
> >  	const struct soc_device_attribute *attr;
> > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> >  
> > -		for (time = 0; time < timeout; time++) {
> > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > -				break;
> > -			udelay(1);
> > -		}
> > -		if (time == timeout) {
> > -			retval = -ETIMEDOUT;
> > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > +				1, 10000);
> > +		if (retval < 0)
> >  			break;
> > -		}
> >  	}
> >  
> >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> >  
> > -	for (time = 0; time < timeout; time++) {
> > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > -			retval = 0;
> > -			break;
> > -		}
> > -		udelay(1);
> > -	}
> > -	if (time == timeout)
> > -		retval = -ETIMEDOUT;
> > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> 
> Directly assigning to retval at this point will clobber a previous
> -ETIMEDOUT error.
> 
> In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> DW_SUCCESS, then we will return the wrong return value.
Yes, agree with you, but seems I keep its original logic unchanged.

Hi Yoshihiro,

  What do think about Daniel's suggestion? should I fix it up?

> 
> 
> Daniel.
> 
> 
> >  
> >  	release_firmware(fw);
> >  
> > @@ -200,18 +187,12 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> >  
> >  static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
> >  {
> > -	int timeout = 1000;
> > +	int retval;
> >  	u32 val, mask = RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK;
> >  
> > -	while (timeout > 0) {
> > -		val = readl(hcd->regs + RCAR_USB3_AXH_STA);
> > -		if ((val & mask) == mask)
> > -			return true;
> > -		udelay(1);
> > -		timeout--;
> > -	}
> > -
> > -	return false;
> > +	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
> > +			val, ((val & mask) == mask), 1, 1000);
> > +	return !!retval;
> 
> This function returns a bool so !! is either wrong or redundant... I
> think in this case it is wrong and should be a single ! .
Yes, will fix it

Thanks a lot
> 
> 
> Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
