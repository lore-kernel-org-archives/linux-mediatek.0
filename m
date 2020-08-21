Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202C8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 01:53:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34A120748
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 01:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0vLDkI4A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y53ysHDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E34A120748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2mD2z1g1HI7cDIuMBxhwCNkem3Q77OKuK7HkvKdtMY=; b=0vLDkI4Ab9PdvMi1u/IFrFkK6
	6G4MMalTX8o0CVGLv9svykYkQPbdB/8GhAHkqBPVGXoEwWb3h4S4jdlodRvG14AJflDyJ51USW3pa
	hKEWtYuJ2E5+M4PUnu+AQ8Lk/xkJB40194mtAUnAFi4GXxX4tdupHkEC20x2PV8AVX9QWa2otYcKi
	47fjpEs5eCPvBjQS7W4c424lMLs5p6TQCoA/TTXZrvbZsUPdZjUQjBIZVbYzmLt/Deas7JHAYQlCa
	FEK8hQdxz97B2irpX1R/0ibEQoMiW82sHePgQ3BifWBDWnS0f7Ln8f8iW8Fnb56lZbElnBxW3uIw6
	TY7Jsm4LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8wFQ-0000ha-JR; Fri, 21 Aug 2020 01:53:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8wFM-0000gU-Hj; Fri, 21 Aug 2020 01:53:37 +0000
X-UUID: 2d0d7c122c63467ebcb942a53391d1fb-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DNATBZmya/r8+01Q+rXYCbAj9lKFVgdL+QN+XzMD0nY=; 
 b=Y53ysHDiVT91reZQ3uvOky6WNRgUX4jXYcPKPACSJ/MyzaoT5j4BnEa8d/N3RCaVtq0wKEXvZ7A3LzNhwIevE6So5Z2Xblt/F30WzqEA+Q4Ml4L3EPblzplX7OiASu8CUxHQXumpbERawI5l5jWetpmbaVpvV1YFooFeOppMuOI=;
X-UUID: 2d0d7c122c63467ebcb942a53391d1fb-20200820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 86033532; Thu, 20 Aug 2020 17:53:28 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 18:53:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 21 Aug 2020 09:53:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 09:53:22 +0800
Message-ID: <1597974730.21253.4.camel@mhfsdcap03>
Subject: Re: [PATCH v2 09/11] usb: phy: phy-mv-usb: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Fri, 21 Aug 2020 09:52:10 +0800
In-Reply-To: <c28a906c-ed1a-8884-3016-b8664a313331@gmail.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597902349-8998-9-git-send-email-chunfeng.yun@mediatek.com>
 <c28a906c-ed1a-8884-3016-b8664a313331@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BFAD47B2BB6678131E731A333C4AC4201A6540906581AA4BE044CDB55F7722AC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_215336_766987_D4EFED44 
X-CRM114-Status: GOOD (  20.46  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-20 at 13:17 +0300, Sergei Shtylyov wrote:
> On 20.08.2020 8:45, Chunfeng Yun wrote:
> 
> > Use readl_poll_timeout_atomic() to simplify code
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: udelay 10us instead of 20us according to kerneldoc
> > ---
> >   drivers/usb/phy/phy-mv-usb.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
> > index ce767ec..e801569 100644
> > --- a/drivers/usb/phy/phy-mv-usb.c
> > +++ b/drivers/usb/phy/phy-mv-usb.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/module.h>
> >   #include <linux/kernel.h>
> >   #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/device.h>
> >   #include <linux/proc_fs.h>
> > @@ -135,8 +136,8 @@ static int mv_otg_set_timer(struct mv_otg *mvotg, unsigned int id,
> >   
> >   static int mv_otg_reset(struct mv_otg *mvotg)
> >   {
> > -	unsigned int loops;
> >   	u32 tmp;
> > +	int ret;
> >   
> >   	/* Stop the controller */
> >   	tmp = readl(&mvotg->op_regs->usbcmd);
> > @@ -146,15 +147,12 @@ static int mv_otg_reset(struct mv_otg *mvotg)
> >   	/* Reset the controller to get default values */
> >   	writel(USBCMD_CTRL_RESET, &mvotg->op_regs->usbcmd);
> >   
> > -	loops = 500;
> > -	while (readl(&mvotg->op_regs->usbcmd) & USBCMD_CTRL_RESET) {
> > -		if (loops == 0) {
> > -			dev_err(&mvotg->pdev->dev,
> > +	ret = readl_poll_timeout_atomic(&mvotg->op_regs->usbcmd, tmp,
> > +				(tmp & USBCMD_CTRL_RESET), 10, 10000);
> > +	if (ret < 0) {
> > +		dev_err(&mvotg->pdev->dev,
> >   				"Wait for RESET completed TIMEOUT\n");
> 
>     You forgot to re-align this argument, it should start under & on the 
> previous line...
Yes, will fix it, thanks

> 
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
