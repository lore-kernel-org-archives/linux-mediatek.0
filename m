Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABC3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9F02068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2JOFEIjM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KaU0BzgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9F02068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpz0TyqYik08LuQF6KCtkEo87UNqFYYsMBgXkUl2oIg=; b=2JOFEIjMNt5yB2QacGFBQWIW4
	pWnywkrB856ASI6XQfEsgqUEuqjElnM4W8OUr2wi9oV9/XbaFEpOYixSpp4u8E2O8hjPh6v8y8vbh
	Otb58Hrb5XLu+HkXQkF1C/OIi/cI1E+FqzEcIt7q1zYocQmpv2GhMDgA0bxIWy80SQyguvwEzp6Wt
	qKfNgJYS2niFV2ECHyzU3ZhHBby9aOWE7pKX93PsSJd5huCbnzP5g4d8vMsVsganaD2gPWi15Qx8d
	+1LlKIynrOSKttbkV+x6d3r/HXieCvByLEGxiuIIO5OsMw1DFh6smQd45z21zHxDVsXt6wmqomXop
	J3hmU6Kog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juote-0000h7-Uz; Mon, 13 Jul 2020 03:12:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juotb-0000gX-SD; Mon, 13 Jul 2020 03:12:49 +0000
X-UUID: fffab50abc2949578f65286d748f3262-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2l8vL3u3679ezEkrX69hcehMR167w1K+mBHFYSW1lf4=; 
 b=KaU0BzgX/sQ9LtEB2ql0u2/+kmiV9yue7GHjcxHwF1Pj1hFOhk8cXwCj6RW8S+mvqkDIdwIFFeuCoPgGcI6n6iFNy196fyu+Gwt3l0sljMjTU+dQOcl0J0+eXIr9ISf7hFNkESfDClI71SNd2K/ha0fKtoSFGAQp9nBFWx9Q6M0=;
X-UUID: fffab50abc2949578f65286d748f3262-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 947349880; Sun, 12 Jul 2020 19:12:38 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 20:07:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 11:06:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 11:07:00 +0800
Message-ID: <1594609574.23885.35.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
Date: Mon, 13 Jul 2020 11:06:14 +0800
In-Reply-To: <159442422281.1987609.11864731950347548589@swboyd.mtv.corp.google.com>
References: <1594351856-876-1-git-send-email-chunfeng.yun@mediatek.com>
 <159442422281.1987609.11864731950347548589@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5ED3BABE978817700309295AA67CE6BCA2D7FAEDCB2EABD67461765368135CB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_231248_102507_C2F0301F 
X-CRM114-Status: GOOD (  15.89  )
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-10 at 16:37 -0700, Stephen Boyd wrote:
> Quoting Chunfeng Yun (2020-07-09 20:30:56)
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index 02a3a77..fa173de 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -32,21 +33,14 @@
> >  static int poll_oip(struct bdc *bdc, int usec)
> 
> Can we change usec to unsigned? Not sure why negative time is important.
Yes, it's sensible to use unsigned.

> 
> >  {
> >         u32 status;
> > -       /* Poll till STS!= OIP */
> > -       while (usec) {
> > -               status = bdc_readl(bdc->regs, BDC_BDCSC);
> > -               if (BDC_CSTS(status) != BDC_OIP) {
> > -                       dev_dbg(bdc->dev,
> > -                               "poll_oip complete status=%d",
> > -                               BDC_CSTS(status));
> 
> This debug message was lost in the conversion. Any reason?
No, will add it back
> 
> > -                       return 0;
> > -               }
> > -               udelay(10);
> > -               usec -= 10;
> > -       }
> > -       dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
> > +       int ret;
> >  
> > -       return -ETIMEDOUT;
> > +       ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
> > +               (BDC_CSTS(status) != BDC_OIP), 10, usec);
> > +       if (ret)
> > +               dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
> 
> Please drop "Err:" as we have kernel log levels (i.e. dev_err() used
> here) for that.
Ok

Thanks

> 
> > +
> > +       return ret;
> >  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
