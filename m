Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC2FC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 08:56:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF5A7206C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 08:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y8o5Xier";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mkyc7HvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF5A7206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z5vnn3W6QjifBTdKBpyNTxOIrdRyCTeT4bpJeylI9Gw=; b=Y8o5Xierm/EVOACzwzotaDfLw
	haawsTovUwZ0QFyH7JSoEinZaFDgVvwAQtC1rTh/M4aiFnPb42MbWd1l0Yn/glShwWb/7jVNVLImc
	xFvaVz7QF1EkoBK3IyFzpD3HuhWh8CZCR8HL+a95qiuYCnXFAyAzpQx6Ma4Fv8qEHo8pNTqE0fw7j
	6vaFzUz8MbHxZyVFnrz2mHg0VTOCH8EJxR2wscXgu56rWrA1++qzn0nNpdtlKwX4vVFJFXZNTt+CX
	rPM0CDce0Hx51c5Uou6AND8bHednm2Jq3tATSsf3TMtzbxF4DGnZKu+UGpERD8qvdjv7NwPBeb0gr
	YUwe1R8Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL0ZL-0002f0-0U; Wed, 23 Sep 2020 08:56:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL0ZG-0002cZ-2U; Wed, 23 Sep 2020 08:56:04 +0000
X-UUID: fb480d1ffb6f419f953ad6a6ea120fa9-20200923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NhDFo4XEQ22ht9DWcD1rv2Z1SL8D0UP7rC77FJzJezA=; 
 b=Mkyc7HvHouBd7qmDGDL4oDUnaXvMFYNbv1JjKb/i9JhpF/z1QRn3INYtwCiD27tBsVMwC8p1i0a6mrTvEoXbsk8NZzSDHRLB7b0vPFxL3KPkmzGBZdLfHjd62DALKadN3KgG3DoaoPmMLJQz2jRGyB7DNS5EY0Kzr538qsDsRqQ=;
X-UUID: fb480d1ffb6f419f953ad6a6ea120fa9-20200923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1053516855; Wed, 23 Sep 2020 00:55:51 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 01:55:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Sep 2020 16:55:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Sep 2020 16:55:46 +0800
Message-ID: <1600851204.21970.0.camel@mhfsdcap03>
Subject: Re: [PATCH v4 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Wed, 23 Sep 2020 16:53:24 +0800
In-Reply-To: <TY2PR01MB3692184CBB3C12EE8A02BA48D8380@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
 <1600668815-12135-4-git-send-email-chunfeng.yun@mediatek.com>
 <TY2PR01MB3692184CBB3C12EE8A02BA48D8380@TY2PR01MB3692.jpnprd01.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE3AB98C311EFA98981F2CBA12670AB0267560B3D3B7CB0206D39F82BE2A85D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_045602_273143_8792D65A 
X-CRM114-Status: GOOD (  25.19  )
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
Cc: Sumit
 Garg <sumit.garg@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Yan <yanaijie@huawei.com>, Chuhong Yuan <hslester96@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-23 at 08:47 +0000, Yoshihiro Shimoda wrote:
> Hi Chungeng,
> 
> Thank you for the patch!
> 
> > From: Chunfeng Yun, Sent: Monday, September 21, 2020 3:13 PM
> > 
> > Use readl_poll_timeout_atomic() to simplify code
> > 
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: changes
> >     1. remove unnecessary parentheses suggested by Yoshihiro
> >     2. fix the wrong return value suggested by Yoshihiro & Daniel
> > 
> > v2~v3: no changes
> > ---
> >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> >  1 file changed, 12 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > index c1025d3..1bc4fe7 100644
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
> 
> We can also remove these unnecessary parentheses like below.
Ok, will remove it, thanks a lot

> 
> +	retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> 
> After fixed this:
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Best regards,
> Yoshihiro Shimoda
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
