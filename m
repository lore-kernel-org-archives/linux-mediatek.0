Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C9223137
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ftwa9NAM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M46TxTpA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C9223137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NNAjS+ewSezx+wjuUh/S2Zo7+AQrPMPEQUgsEaNFfpw=; b=Ftwa9NAM5Q/r1Ro2ZzZcv6SfT
	qlq6nh41HUULcTr2U+dA8zR/d1yh49AjI7ZNaaED7Dcp3lgn7SEieVj5tT8Ng3e2SXK41BZqIRVj/
	6MUfU2DIQ1uq1loCubStF3o7FW/xLKjuvZdLmLbUto7H7GfvnTIyHiO0kHGV2FeQjiEhfvXfYkKDv
	8hh3sOMDFcaiDNlNq7my1FD+Oyw9HOquN2ZJJOVdfp9DbT5QA6sNGCngUURaS0mNY2f6n5m83znJ4
	hliSt32UIdHZD3GBgljx5rAX3U6q2kVXMqzLqJkQYN7Fr+eEwvDQAQkHgWySmZ2D4ukKRVp6cLqD/
	UnEQJsodA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3hoE-0001lr-RA; Thu, 06 Aug 2020 15:27:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3hoD-0001kN-4L; Thu, 06 Aug 2020 15:27:58 +0000
X-UUID: b83bacf6c77b4b0a96d26c0d648c259c-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LHDzGNEY2yp40h47jL9qAQX+uM62/KbKM8d4ZyLvJsc=; 
 b=M46TxTpAo2x/gPQTvKa1lPzDpOMWn8+QyrylN9AXnc71dnFJaoyPpprJ+I7KyeDMzjwvbwnkxMc3hrMQvNGyFUCbfb8i9zs2Hf4oXqvkA6GVigNqetpxBzEqeeRhJttcoY409bnohnPwCxxHdxUbPDrWzihRAvt6a/Sb2MOMo1c=;
X-UUID: b83bacf6c77b4b0a96d26c0d648c259c-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frederic.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1851490407; Thu, 06 Aug 2020 07:27:49 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 08:27:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:27:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 23:27:45 +0800
Message-ID: <1596727666.963.2.camel@mtksdccf07>
Subject: Re: [PATCH V1] media: mc-device.c: change
 media_device_request_alloc to match media_ioctl_info
From: Frederic Chen <frederic.chen@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Date: Thu, 6 Aug 2020 23:27:46 +0800
In-Reply-To: <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
 <20200806072952.11709-2-frederic.chen@mediatek.com>
 <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_112757_292270_0414C864 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com,
 christie.yu@mediatek.com, srv_heupstream@mediatek.com, tfiga@chromium.org,
 sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com,
 zwisler@chromium.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Hans,

On Thu, 2020-08-06 at 09:42 +0200, Hans Verkuil wrote:
> On 06/08/2020 09:29, frederic.chen@mediatek.com wrote:
> > From: Frederic Chen <frederic.chen@mediatek.com>
> > 
> > We modified the type of media_device_request_alloc()'s second
> > parameter from int* to void* so that it can match the interface
> > defined in struct media_ioctl_info.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  drivers/media/mc/mc-device.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index da8088351135..bc5b5ecb6581 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
> >  	return ret;
> >  }
> >  
> > -static long media_device_request_alloc(struct media_device *mdev,
> > -				       int *alloc_fd)
> > +static long media_device_request_alloc(struct media_device *mdev, void *arg)
> >  {
> > +	int *alloc_fd = arg;
> > +
> >  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
> >  	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
> >  		return -ENOTTY;
> > 
> 
> This change is fine, but the reason this wasn't noticed before is the cast in
> the MEDIA_IOC_ARG define:
> 
> #define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)              \
>         [_IOC_NR(MEDIA_IOC_##__cmd)] = {                                \
>                 .cmd = MEDIA_IOC_##__cmd,                               \
>                 .fn = (long (*)(struct media_device *, void *))func,    \
>                 .flags = fl,                                            \
>                 .arg_from_user = from_user,                             \
>                 .arg_to_user = to_user,                                 \
>         }
> 
> When assigning to .fn the func is cast to a specific function prototype.
> Without that cast the compiler would have warned about the mismatch.
> 
> I see no reason for that cast, so drop that cast as well.

I got it. I will remove the cast in the next patch.

> 
> Regards,
> 
> 	Hans


Sincerely,

Frederic Chen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
