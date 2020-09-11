Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C0BC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:33:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D572078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CB5FE6at";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ifxPbdLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D572078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xH6KkeP53hlAmQ65JX8K563t94FKi+POPskCLqPrR4s=; b=CB5FE6ateUUafS3NexHPTfWdv
	teU/stOfW08vizonRR5zINvPTqqRNByGy0+vWiZuGBIWIO+0Xs0Cag3jLi+mwA8k3SB/CveoTWSvg
	wOlOh/2t+RcrsF6FZOlDR93rIC6oNzuo2AzUijVhJmQde1RXAluy9k2L1zhj4+ppn9igGi0ptGh2n
	7saB5tbAlmBYQHJzcpEGlALPJWNrx1axulGtJGSjzSj/0DPWUXMl88Ootvg+EXan1P9VP6+EXouPc
	iS2gqBqIpxgi1NolY9fvZbPIVurzlZ7/o5D43eIu+9d2LQCc+HltGgraCpjycOgEsa3P21LcS4d+8
	DqIIpF2jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGYsQ-0006YD-Rj; Fri, 11 Sep 2020 02:33:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGYsO-0006Xb-63; Fri, 11 Sep 2020 02:33:25 +0000
X-UUID: 8a65a973dad0420fbfeb78b55a1e24c2-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PwCD43rd691vuKeYiP0pJUixc3+a3XIXXvJJKbF9gm4=; 
 b=ifxPbdLl1SVMJJaoX1SotthH28/Ax2A21ouPXsKAw7LnBdTF1YQcJgartXsVw+VUoISMAfmnm6sOt19hjzpH+k5Iu0a75P9y45JIpwnZPGhbByqE27/ZUFybazbWzvZNKmH37QtNDhFFb1LvPuvzcKNMWuEJSBB5eIvujKco3FA=;
X-UUID: 8a65a973dad0420fbfeb78b55a1e24c2-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 974772788; Thu, 10 Sep 2020 18:33:15 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 19:23:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 10:23:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 10:23:09 +0800
Message-ID: <1599790874.24085.4.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 11 Sep 2020 10:21:14 +0800
In-Reply-To: <TY2PR01MB369214103C701DC5E78D56F9D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <TY2PR01MB369214103C701DC5E78D56F9D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E726212FDA9BF31E90C2592A545596892CFBE2F964F285D5C4390154E2FF3CEF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_223324_434838_57801C5E 
X-CRM114-Status: GOOD (  25.58  )
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
 "Eric W. Biederman" <ebiederm@xmission.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ben
 Dooks <ben.dooks@codethink.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 12:56 +0000, Yoshihiro Shimoda wrote:
> Hi Chunfeng,
> 
> Thank you for the patch!
> 
> > From: Chunfeng Yun, Sent: Thursday, September 10, 2020 5:22 PM
> > 
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
> Some parentheses are not needed like below:
> 
> 	retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> 			val, val & RCAR_USB3_DL_CTRL_FW_SUCCESS, 1, 10000);
> 
Ok, will modify it

> 
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
> 
> Likewise above:
> 	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
> 			val, (val & mask) == mask, 1, 1000);
> 
> > +	return !!retval;
> 
> This breaks the code. If I changed this to "return retval < 0 ? false : true;",
> it works again.
Oops, my bad, will fix it

Thanks a lot

> 
> Best regards,
> Yoshihiro Shimoda
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
