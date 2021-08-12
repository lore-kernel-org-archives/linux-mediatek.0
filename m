Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4975DC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097546103E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 097546103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUreZMbDe9rtgpfsTK4O+CvV8ybVHgsKku+fJja7xzk=; b=v/qkkJP6/Z0pKY
	v4JPSmSIlnV0zL5lRyxiGCsC39H/NHwTmj7xiiXxz5H5WpGIn8TgxZ8HrMbVe0KgqkVgcfD/d8hAF
	ZVnwfhH3WIPn4Z0xD3Mo3B2k7M5LnX/+qktM7MswdS3IeQ5RouuAe9BiggsuO6BrHmPma8fXHQBAC
	xtenzMYdRJBiT/K51wz4+m8nSqYnwSsf2afEBudbu+3bcnKTYiVQP6O69SbpH03TKinZTLBXg3/gX
	Ev/wFhWepKbiPu4gdwylajqqTQWGb5x8CI+o+r0MpNSXRpVkr6Te4VDHAhLRftVTTwFvYCGGxTZd2
	9OxWRwPB6aqKtugWmg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4a3-008mGo-SC; Thu, 12 Aug 2021 06:52:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4Zp-008mCA-CX; Thu, 12 Aug 2021 06:52:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A984E6101E;
 Thu, 12 Aug 2021 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751149;
 bh=bqEWfOZN0xk2EuCTwKF5niW1R0IpEsX+S8gvv0lSuj8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=DNwW1miNAufE67B8umgctZbFiTe682bcNz+tC4NrKz96H814QyIeeBnsNeDPEdkaM
 Kv+xBMuxFGpgwkUSJFjtIbRwNvrmpx+RLkrB9B7O8jZGD1mb1dbTJ/yJUmvZHfY3AC
 fhDSkGduLPDkILCAd5Ustdcl4RoKlYCeCtAT8v9p6QCvWzXdzldPICLHFA1DyEDwW6
 tNs/8EmS515RgP6y1tZxihRez6uVNtw8ZVmJ7GmNd39ewHy/rFcUd2EyRpPu7PpXKI
 lZA9wrEq9mVTKBHoA2L6c/BpuJ7gcPgqc/KX0Z8vX2I7VUq3R+v4oHG9SBP3FCypa6
 r0UvV5EmhUNXw==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-4-git-send-email-chunfeng.yun@mediatek.com>
User-agent: mu4e 1.6.2; emacs 27.2
From: Felipe Balbi <balbi@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak
 <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang
 <yangyingliang@huawei.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 4/6] usb: gadget: tegra-xudc: fix the wrong mult value
 for HS isoc or intr
Date: Thu, 12 Aug 2021 09:51:52 +0300
In-reply-to: <1628739182-30089-4-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87k0kryx20.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235229_483006_36BB0636 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
> of endpoint descriptor, not includes bit[12:11] anymore, so use
> usb_endpoint_maxp_mult() instead.
> Meanwhile no need AND 0x7ff when get maxp, remove it.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index a54d1cef17db..40a7417e7ae4 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -1610,7 +1610,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
>  	u16 maxpacket, maxburst = 0, esit = 0;
>  	u32 val;
>  
> -	maxpacket = usb_endpoint_maxp(desc) & 0x7ff;
> +	maxpacket = usb_endpoint_maxp(desc);
>  	if (xudc->gadget.speed == USB_SPEED_SUPER) {
>  		if (!usb_endpoint_xfer_control(desc))
>  			maxburst = comp_desc->bMaxBurst;
> @@ -1621,7 +1621,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
>  		   (usb_endpoint_xfer_int(desc) ||
>  		    usb_endpoint_xfer_isoc(desc))) {
>  		if (xudc->gadget.speed == USB_SPEED_HIGH) {
> -			maxburst = (usb_endpoint_maxp(desc) >> 11) & 0x3;
> +			maxburst = usb_endpoint_maxp_mult(desc) - 1;

this looks like a bug fix. Before this change, maxburst was always 0,
right?

In any case:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
