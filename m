Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD17C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:56:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C9A2075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuZDhPw0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hcTBR1V0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C9A2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NgAbCixf0KbsUr84b52apXyK+jsPnc9jB0r6kYI2HZE=; b=YuZDhPw047vywLN5PfHNIKQ3z
	CEa/J/emHUDBRUNp/vOZSaNHh1dY+BpkHUbG83hTGocshiPeqquhhsSODoeJHdTSDPmE5jXbtS9ki
	oz/jAWDJ6G1786SYxL18kEUsXgtwC79GipvieO1xdVRGL7PhQyX5k2D797KhNuWP8wJ2LKrhkppeS
	yelGylVQ8pzemvSJVHURfpqKI+fZtCFt0TXUAN4+crUewSjTW7kw5tly9jwtkISI13B62RkinURZI
	JN5pqivl5S8YzFUaaVvdf1Dy1ROCKcl7r5ay7f0+Y3kONXjFZxy0L+wxv5oydMOj+z7dMD/s3nI/G
	zDDbDKWjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusNb-0008RN-3z; Mon, 13 Jul 2020 06:55:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusNY-0008Qe-JJ; Mon, 13 Jul 2020 06:55:57 +0000
X-UUID: e49cdc040b764925a3d501148c42c9a5-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+Ge9G9rSePdPEHWfzy1cfUe7vMpgioTYIlHODRFrwkk=; 
 b=hcTBR1V01BvFVOcL44C3w3YSZLGRuq/FvLGwAt6XomEoV1yYRvZFBkRHNVTx1M6WesSiSY+7aPclKNgqNZreRNhgIQQH1hrtVBa890fnkMCBgKoDvX3mQ0TuwNdKE4VmlkYnEZiKMDMG3wGuxdINFJ4nq/X6ys/epgshYJ/Jt1s=;
X-UUID: e49cdc040b764925a3d501148c42c9a5-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1699424253; Sun, 12 Jul 2020 22:55:51 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:55:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:55:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:55:45 +0800
Message-ID: <1594623300.23885.36.camel@mhfsdcap03>
Subject: Re: [v2 PATCH] usb: gadget: bdc: use readl_poll_timeout() to
 simplify code
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 13 Jul 2020 14:55:00 +0800
In-Reply-To: <b73d8a90-96cd-42b5-bbc2-26e300da0603@gmail.com>
References: <1594611017-4535-1-git-send-email-chunfeng.yun@mediatek.com>
 <b73d8a90-96cd-42b5-bbc2-26e300da0603@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5DE5EC88EF47CDA1AC3C74117593930ACC115D18580B92FF06D31A130EB8FCEE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_025556_787981_EF1A4AFA 
X-CRM114-Status: GOOD (  23.41  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-07-12 at 20:53 -0700, Florian Fainelli wrote:
> 
> On 7/12/2020 8:30 PM, Chunfeng Yun wrote:
> > Use readl_poll_timeout() to poll register status
> > 
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2 changes, suggested by Stephen:
> >   1. use unsigned int instead of int for @usec parameter
> >   2. add dev_log() back
> >   3. drop "Err" in error log
> > ---
> >  drivers/usb/gadget/udc/bdc/bdc_core.c | 26 +++++++++++---------------
> >  1 file changed, 11 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index 02a3a77..53dccb1 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/ioport.h>
> >  #include <linux/io.h>
> >  #include <linux/list.h>
> > @@ -29,24 +30,19 @@
> >  #include "bdc_dbg.h"
> >  
> >  /* Poll till controller status is not OIP */
> > -static int poll_oip(struct bdc *bdc, int usec)
> > +static int poll_oip(struct bdc *bdc, u32 usec)
> >  {
> >  	u32 status;
> > -	/* Poll till STS!= OIP */
> > -	while (usec) {
> > -		status = bdc_readl(bdc->regs, BDC_BDCSC);
> > -		if (BDC_CSTS(status) != BDC_OIP) {
> > -			dev_dbg(bdc->dev,
> > -				"poll_oip complete status=%d",
> > -				BDC_CSTS(status));
> > -			return 0;
> > -		}
> > -		udelay(10);
> > -		usec -= 10;
> > -	}
> > -	dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
> > +	int ret;
> >  
> > -	return -ETIMEDOUT;
> > +	ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
> > +		(BDC_CSTS(status) != BDC_OIP), 10, usec);
> 
> You could probably indent this to the opening parenthesis, 
Done, v3 is sent out, thanks

> but with or
> without it:
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> and thanks for picking up the MAINTAINERS file update ;)
> 
> > +	if (ret)
> > +		dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
> > +	else
> > +		dev_dbg(bdc->dev, "%s complete status=%d", __func__, BDC_CSTS(status));
> > +
> > +	return ret;
> >  }
> >  
> >  /* Stop the BDC controller */
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
