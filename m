Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BFAC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 02:45:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CBF2075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 02:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0YSw4vc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aruydvhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CBF2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idLWr9zC9o5NwTj0rYlSDmyFqVsL4lMuLPx3bIeRP9U=; b=j0YSw4vc4TslHi
	4+cqVNvUpY28Ax3AMXEYmW43/lOnvEnr5mU8i1YRXwxmP1E6OUbIJ/ye7+ULfxMzUcNz/3n7LUcP7
	AgZ5sFVfN29kmTFUuXCnjvVKkVGc+NmfgSsIExjIGAE+WwkbIo5gR7cbLBOf/wQpEAsYem8ZimyQ/
	Zq1RSzmftiGzbT6gTPxsnmlEN16MN4raR3ZucZmFzRhJ7/5GQb69ez3EXz8gDuRrQz048nJ6KK+p0
	gklxP+2AjCPXewoRCDx9s088VgOc2RLSwmqIropMfI3ElTG8zWyKLsrnVDlTiItkWWcQqm6s2DQ9S
	JsUx4hOkvKVTb4hESmNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbEj1-0003mF-V0; Wed, 20 May 2020 02:44:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbEis-0003dE-QY; Wed, 20 May 2020 02:44:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04K2ig9e038487;
 Tue, 19 May 2020 21:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589942682;
 bh=4LA7BQvWOOiT0ndwf7oyzTtXGkJFmJHqlSXFIPNcau0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aruydvhM1RVJGbXuIcbt+D9bSr6ZhmWn4jG8zxGvvTR8yjctJ7LU501+0NlbjZO2v
 GnPmYp7KNDjfp1W84ksGrGKl6IG4vJTnjbLFhaupbSPSwL6GNJSv/zfxXGmUqbCpo8
 yJbC5EcEJc6L4y0HQDus9dTTtEOnNSZsWhTjP+D0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04K2igFZ043373
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 May 2020 21:44:42 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 21:44:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 21:44:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04K2iffQ007005;
 Tue, 19 May 2020 21:44:41 -0500
Date: Tue, 19 May 2020 21:44:41 -0500
From: Bin Liu <b-liu@ti.com>
To: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH] usb: musb: mediatek: add reset FADDR to zero in reset
 interrupt handle
Message-ID: <20200520024441.GB5684@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Min Guo <min.guo@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>
References: <1589428872-29282-1-git-send-email-macpaul.lin@mediatek.com>
 <1589441605.28160.27.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589441605.28160.27.camel@mhfsdcap03>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_194446_989677_90D58202 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 03:33:25PM +0800, Min Guo wrote:
> On Thu, 2020-05-14 at 12:01 +0800, Macpaul Lin wrote:
> > When receiving reset interrupt, FADDR need to be reset to zero in
> > periphearl mode. Otherwise ep0 cannot do enumeration when re-pluging USB
> > cable.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >  drivers/usb/musb/mediatek.c |    6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> > index 6196b0e..eebeadd 100644
> > --- a/drivers/usb/musb/mediatek.c
> > +++ b/drivers/usb/musb/mediatek.c
> > @@ -208,6 +208,12 @@ static irqreturn_t generic_interrupt(int irq, void *__hci)
> >  	musb->int_rx = musb_clearw(musb->mregs, MUSB_INTRRX);
> >  	musb->int_tx = musb_clearw(musb->mregs, MUSB_INTRTX);
> >  
> > +	if ((musb->int_usb & MUSB_INTR_RESET) && !is_host_active(musb)) {
> > +		/* ep0 FADDR must be 0 when (re)entering peripheral mode */
> > +		musb_ep_select(musb->mregs, 0);
> > +		musb_writeb(musb->mregs, MUSB_FADDR, 0);
> > +	}
> > +
> >  	if (musb->int_usb || musb->int_tx || musb->int_rx)
> >  		retval = musb_interrupt(musb);
> >  
> 
> Acked-by:Min Guo <min.guo@mediatek.com>
> 

Queued for v5.8. Thanks.

-Bin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
