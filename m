Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3031C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 08:39:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17162068F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 08:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsGz7YBY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dmdOp0ka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17162068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G2H+gMmzfFtA/rYP2qAIH2H40NhVpt0EVaHD9/rhsTc=; b=AsGz7YBYAH8O7zfpR/+MyrcOH
	FEYoi3w9GWtUN41u0z65woHcTGWt9c3c6QmCvXnFibwX3V9Dp9BNZZOThM9VXJYTZ8sKyOzAtUVie
	zbgeBGRu0ery9YdaziwafynQK2BxFlUfLnjt1vV8JmtNrV/tGwP5nMnrbKOIRi4R40FP4NZMRXSmx
	EXJyoGxFr3f2vylLzJpGvutmU88LJHlzps5Unuv9xM06nIyqikN95KG+OK+rNzJ69bzu8TgzQSCai
	uIxFzmxEEnd6b2aLlIgwi2yguCVfeVa1uTRfBRjAlI7QFijECp8xjj3Zwv9dgvXyVP+KvYPbjOTyz
	VfSVMXo5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jytEf-0000Qt-Rk; Fri, 24 Jul 2020 08:39:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytEc-0000Nb-9a; Fri, 24 Jul 2020 08:39:19 +0000
X-UUID: 1c624aed26a74d8383c592e5e3390d19-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8rc7FhONmXVK/ge9nGlAXM2K6HUrmjfmOch2/2WH7Ko=; 
 b=dmdOp0kaOsFzerm6v7CamkrZdmCLcKL8X6FjsA+ryC1k0qxhUvc2shTtM8eM/8F5eK0es6appmIxaY8x8YHe5JPA2N3Ylc54LmB+JSYxJgJs7Xk8ONqfM+/QSeDVvHTURoCphxSnpSJhaHT4HfrM3MynFXFT5ZuipFhSHL1eYWE=;
X-UUID: 1c624aed26a74d8383c592e5e3390d19-20200724
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1363192023; Fri, 24 Jul 2020 00:38:59 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 01:28:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Jul 2020 16:28:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 16:28:52 +0800
Message-ID: <1595579262.23885.65.camel@mhfsdcap03>
Subject: Re: [RFC PATCH] usb: dwc3: fix maximum_speed check for usb2.0-only
 core
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Date: Fri, 24 Jul 2020 16:27:42 +0800
In-Reply-To: <e94e9d0c-b0d5-b2e1-e3de-0a4e85bc95b4@synopsys.com>
References: <1594282250-25544-1-git-send-email-chunfeng.yun@mediatek.com>
 <6dff8574-e649-7a5c-4d80-c3fe6ddd6645@synopsys.com>
 <e94e9d0c-b0d5-b2e1-e3de-0a4e85bc95b4@synopsys.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2ACD6F938436F48A8374B2A2EA2AC37AF59CB494D4CCBAA901C1432351B171682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_043918_578904_6CE2DC66 
X-CRM114-Status: GOOD (  24.63  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-24 at 03:32 +0000, Thinh Nguyen wrote:
> Hi,
> 
> Thinh Nguyen wrote:
> > Hi,
> >
> > Chunfeng Yun wrote:
> >> The maximum_speed will be USB_SPEED_SUPER_PLUS, but the
> >> maximum_speed check for usb2.0-only core doesn't consider it,
> >> so fix it, and move the ckeck into dwc3_check_params().
> >>
> >> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >> ---
> >> Note:
> >>
> >> When I look at the code, find that this may be a problem, but no
> >> platform to test it.
> >> ---
> >>    drivers/usb/dwc3/core.c | 14 +++++++-------
> >>    1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >> index 25c686a7..ffd5ab3 100644
> >> --- a/drivers/usb/dwc3/core.c
> >> +++ b/drivers/usb/dwc3/core.c
> >> @@ -930,13 +930,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
> >>    	 */
> >>    	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
> >>    
> >> -	/* Handle USB2.0-only core configuration */
> >> -	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
> >> -			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
> >> -		if (dwc->maximum_speed == USB_SPEED_SUPER)
> >> -			dwc->maximum_speed = USB_SPEED_HIGH;
> >> -	}
> >> -
> >>    	ret = dwc3_phy_setup(dwc);
> >>    	if (ret)
> >>    		goto err0;
> >> @@ -1426,6 +1419,13 @@ static void dwc3_check_params(struct dwc3 *dwc)
> >>    
> >>    		break;
> >>    	}
> >> +
> >> +	/* Handle USB2.0-only core configuration */
> >> +	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
> >> +			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
> >> +		if (dwc->maximum_speed > USB_SPEED_HIGH)
> >> +			dwc->maximum_speed = USB_SPEED_HIGH;
> >> +	}
> >>    }
> >>    
> >>    static int dwc3_probe(struct platform_device *pdev)
> > Actually, the dwc->maximum_speed captures the maximum speed device
> > property value. It maybe be set based on the phy's capability if there's
> > no property specifying it (i.e. maximum_speed is USB_SPEED_UNKNOWN).
> >
> > So, this code should be removed. The fix should be in the check of
> > dwc3_check_params(). If maximum_speed = USB_SPEED_UNKNOWN and the phy's
> > capability is only up to highspeed, then set the maximum_speed to
> > highspeed only.
Sorry for the late reply, my outlook lose your email.
> >
> 
> Are you going into update and resend this patch?
I don't know how to check "the phy's capability is only up to highspeed"

>  If not I can create one 
> and add your "Reported-by"
Ok, thanks

> 
> BR,
> Thinh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
