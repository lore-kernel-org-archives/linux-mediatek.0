Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C23C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 11:48:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED9D221E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 11:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xXV/noYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OBsVanP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED9D221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wX8AXudCfhnq+19nV9cdCiKjdBF7F928friqMbklyBs=; b=xXV/noYk8yrofdK8BoW0l+aC+
	GtYr2dYZ8Nu+hi/wn2TemfetXRcw0r6P8zCe53UBUtPPpHVr+M4oAokM2WCZVjfJaIq/Uw24XP7O2
	XgwIVuwiPwx5RM7gGDGvlHjC2V9p/9cAd60omFhWh8gk0YM2KQlL995enR0DZYZ+QbFDvqcI/FsY2
	US2/7sW2RdHM1MhQvcg4mSoYcaKPqssY/AqX+NlA4zK3vpFk+4p3xQ3vH6nWbZlKGbxAuSrgTwOW5
	tFqcLN4SJpQb26BjLlIZgVsZC5v5YMuXljvXpe1o6piRZSQa/9S+0jqwN7MPOli+Zs6F3PmPlQ5Nq
	n2LvvXBEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGhXj-0006Q9-Q2; Fri, 11 Sep 2020 11:48:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGhXf-0006PY-NT; Fri, 11 Sep 2020 11:48:38 +0000
X-UUID: b26e85b3115340dabc7a80738c25a8bc-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DLomLN9zNFDunBiob0rT4DbaL1hDl/x0cwjtBBhXfp4=; 
 b=OBsVanP8HENc5eRufKF9yWvNr8hvKldnqrKu3kzjpM8jklGZIgqTw+Mj3fl6kbA0ZqtTmdqHupu71aGoE8CGUOL7YZ6kKvgENNRrp5bR0fy/T5oH+c7aETACWQBmmfUfvYenePPIyTLZuNkIEK9f9v3vh/yVBjuJEH/DTWRQ6MI=;
X-UUID: b26e85b3115340dabc7a80738c25a8bc-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1756776294; Fri, 11 Sep 2020 03:48:30 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 04:48:28 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 19:48:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 19:48:24 +0800
Message-ID: <1599824789.29909.11.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 11 Sep 2020 19:46:29 +0800
In-Reply-To: <OSAPR01MB3683A8CE38F900DC0CA5D472D8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <OSAPR01MB3683CA015AB25BC00D8459EBD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <1599797572.24609.8.camel@mhfsdcap03>
 <OSAPR01MB3683A8CE38F900DC0CA5D472D8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C6ED5B7AE39852F8B74E88F4557590F378A11ACC86403F44D061AA00A2F8FBC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_074836_780169_D34A50C6 
X-CRM114-Status: GOOD (  34.66  )
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Felipe Balbi <balbi@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>,
 Chuhong Yuan <hslester96@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 04:57 +0000, Yoshihiro Shimoda wrote:
> Hi Chunfeng,
> 
> > From: Chunfeng Yun, Sent: Friday, September 11, 2020 1:13 PM
> > 
> > On Fri, 2020-09-11 at 03:13 +0000, Yoshihiro Shimoda wrote:
> > > Hi Daniel, Chunfeng,
> > >
> > > > From: Chunfeng Yun, Sent: Friday, September 11, 2020 11:33 AM
> > > >
> > > > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > > > Use readl_poll_timeout_atomic() to simplify code
> > > > > >
> > > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > ---
> > > > > > v2~v3: no changes
> > > > > > ---
> > > > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > > > index c1025d3..74f836f 100644
> > > > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >   */
> > > > > >
> > > > > >  #include <linux/firmware.h>
> > > > > > +#include <linux/iopoll.h>
> > > > > >  #include <linux/module.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/of.h>
> > > > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > > >  	void __iomem *regs = hcd->regs;
> > > > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > > > >  	const struct firmware *fw;
> > > > > > -	int retval, index, j, time;
> > > > > > -	int timeout = 10000;
> > > > > > +	int retval, index, j;
> > > > > >  	u32 data, val, temp;
> > > > > >  	u32 quirks = 0;
> > > > > >  	const struct soc_device_attribute *attr;
> > > > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > > >
> > > > > > -		for (time = 0; time < timeout; time++) {
> > > > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > > > -				break;
> > > > > > -			udelay(1);
> > > > > > -		}
> > > > > > -		if (time == timeout) {
> > > > > > -			retval = -ETIMEDOUT;
> > > > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > > > +				1, 10000);
> > > > > > +		if (retval < 0)
> > How about free firmware and return error number here ? instead of break
> 
> I think clearing CTRL_ENABLE code below is needed.
> And, I think this patch should not change a lot of things...
Ok, thanks

> 
> > > > > >  			break;
> > > > > > -		}
> > > > > >  	}
> > > > > >
> > > > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > > > >
> > > > > > -	for (time = 0; time < timeout; time++) {
> > > > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > > > -			retval = 0;
> > > > > > -			break;
> > > > > > -		}
> > > > > > -		udelay(1);
> > > > > > -	}
> > > > > > -	if (time == timeout)
> > > > > > -		retval = -ETIMEDOUT;
> > > > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > > > >
> > > > > Directly assigning to retval at this point will clobber a previous
> > > > > -ETIMEDOUT error.
> > > > >
> > > > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > > > DW_SUCCESS, then we will return the wrong return value.
> > >
> > > Thank you for your comment! I didn't realized this.
> > >
> > > > Yes, agree with you, but seems I keep its original logic unchanged.
> > > > Hi Yoshihiro,
> > > >
> > > >   What do think about Daniel's suggestion? should I fix it up?
> > >
> > > I think you should fix it up like below:
> > >
> > > if (readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > 		val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000) < 0)
> > > 	retval = -ETIMEOUT;	/* Overwrite retval if timeout occurred */
> > 
> > readl_poll_timeout_atomic() only return -ETIMEOUT error number, so this
> > likes what I did, doesn't fix it.
> 
> readl_poll_timeout_atomic() returns 0 if timeout doesn't happen.
> So, when my suggestion code runs, the retval is not overwritten if
> the readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL...) returns 0.
> 
> Best regards,
> Yoshihiro Shimoda
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
