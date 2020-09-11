Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC802C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 04:25:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92ED3221E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 04:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NorMh0pg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V8RAtwZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92ED3221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VARPNeK1CUPrqj0YOEzk1FlUvZexk5nmQvNYtmfrm9o=; b=NorMh0pgdVxT6PGHWV+JwZHdr
	FEnyN5VM3yHOMvy3GcEpq/p8DvP6L11Tw0ga9L72asS14GJG+frgVqbL7VA+o4ueAIDL6Sl6+BCnL
	csK71iVj/ZeyZqXJ0WFKx5155vMIuglwptYDQE3NOAuNjEm22HTdZMglR83YfTP6/CGPwm375HnE/
	YSR7Eeam97nD6iCU2MnWVYZC9HzxSz2wiBST/SVVt6dZZ9qxs1Zfni1AGJdKE/79DHdIwg3Fy+YNC
	FdIKhuW97l0VpYUwKGeA9HLFFa0ExUXzLAfS1oLMDbrw7oq4fS2DeQIJF71lueJKtAZzEsB/PeZ3I
	bsOLQeDRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGacP-00031c-I1; Fri, 11 Sep 2020 04:25:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGacM-00030z-4f; Fri, 11 Sep 2020 04:24:59 +0000
X-UUID: ed491ab25f1247d29a019f1338ba7269-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S8V5Akl7eiGW/k+oP2VPh5gqJCICXAtbHzsKCE8cyBY=; 
 b=V8RAtwZTKPlVwsijCbs+Lqhmv/3NY7mippvnVSGgDPadUDB7LjTbeEaqiN5A/n4tCxdGov304ZJmVfHeHtM7ptu40EKpr4a/bEHMEJ4Wii8y9ZR3Lf+WKwdZyfgnMV/CjpjwTmJ7PU/E0lxcCxrxFxC/7lD+l9h0nRubix3DSzY=;
X-UUID: ed491ab25f1247d29a019f1338ba7269-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 117493882; Thu, 10 Sep 2020 20:24:54 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 21:14:51 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 12:14:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 12:14:48 +0800
Message-ID: <1599797572.24609.8.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 11 Sep 2020 12:12:52 +0800
In-Reply-To: <OSAPR01MB3683CA015AB25BC00D8459EBD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <OSAPR01MB3683CA015AB25BC00D8459EBD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4BBBF29723D19EFB7DEBE93A32BA78B9759C1FC910FE727AC46D1BE3BA4A1A0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_002458_377333_BF5E46FF 
X-CRM114-Status: GOOD (  32.45  )
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

On Fri, 2020-09-11 at 03:13 +0000, Yoshihiro Shimoda wrote:
> Hi Daniel, Chunfeng,
> 
> > From: Chunfeng Yun, Sent: Friday, September 11, 2020 11:33 AM
> > 
> > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > Use readl_poll_timeout_atomic() to simplify code
> > > >
> > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > > v2~v3: no changes
> > > > ---
> > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > index c1025d3..74f836f 100644
> > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > @@ -6,6 +6,7 @@
> > > >   */
> > > >
> > > >  #include <linux/firmware.h>
> > > > +#include <linux/iopoll.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/of.h>
> > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > >  	void __iomem *regs = hcd->regs;
> > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > >  	const struct firmware *fw;
> > > > -	int retval, index, j, time;
> > > > -	int timeout = 10000;
> > > > +	int retval, index, j;
> > > >  	u32 data, val, temp;
> > > >  	u32 quirks = 0;
> > > >  	const struct soc_device_attribute *attr;
> > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > >
> > > > -		for (time = 0; time < timeout; time++) {
> > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > -				break;
> > > > -			udelay(1);
> > > > -		}
> > > > -		if (time == timeout) {
> > > > -			retval = -ETIMEDOUT;
> > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > +				1, 10000);
> > > > +		if (retval < 0)
How about free firmware and return error number here ? instead of break

> > > >  			break;
> > > > -		}
> > > >  	}
> > > >
> > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > >
> > > > -	for (time = 0; time < timeout; time++) {
> > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > -			retval = 0;
> > > > -			break;
> > > > -		}
> > > > -		udelay(1);
> > > > -	}
> > > > -	if (time == timeout)
> > > > -		retval = -ETIMEDOUT;
> > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > >
> > > Directly assigning to retval at this point will clobber a previous
> > > -ETIMEDOUT error.
> > >
> > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > DW_SUCCESS, then we will return the wrong return value.
> 
> Thank you for your comment! I didn't realized this.
> 
> > Yes, agree with you, but seems I keep its original logic unchanged.
> > Hi Yoshihiro,
> > 
> >   What do think about Daniel's suggestion? should I fix it up?
> 
> I think you should fix it up like below:
> 
> if (readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> 		val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000) < 0)
> 	retval = -ETIMEOUT;	/* Overwrite retval if timeout occurred */

readl_poll_timeout_atomic() only return -ETIMEOUT error number, so this
likes what I did, doesn't fix it.

> 
> Otherwise, the xhci_rcar_download_firmware() cannot return -ETIMEDOUT if
> timeout happened on the previous poll [1].
> 
> [1]
> +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> +				1, 10000);
> 
> Best regards,
> Yoshihiro Shimoda
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
