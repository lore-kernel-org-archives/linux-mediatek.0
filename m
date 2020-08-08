Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2F3C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 22:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E0F206C3
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 22:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/rzgnvX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kbq7pkBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E0F206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aL1+Czz4YWRg+XcXZkv+93yO9YeUQhsY5eJM2wSI5wU=; b=B/rzgnvXIzNTyeq4Lg11wFs45
	5bIWmFApa6jNoiV+tP6Kwjh/V2ewfHdIh6Alwyqt9u8pl7wDDfaG2DtU/aqjgX/szuZ0GI5inPtOa
	3u+1LSUWkFBNuw1uH7lvjdEtOvUD2bp/1qE6t7FIZlmnP6C1P+2VdNhYg8NjIQgqYtQ4xatmjokgc
	D/cBi2UtfXSiGfpFnV5lNuDNvSbMzWQPlSMByW+0yaQA/cN7Bk15zeIL6jvPj+d42WEm5o2W9brVp
	wcK2CeUr2q5Ops0lmFdk3TguvbS19cCMBx9L2f+b7T/XGFLFhPATEwDFXlVFCyhlT1FARz98R1dxS
	QdLA4AnxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4Wxb-0003PO-73; Sat, 08 Aug 2020 22:05:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4WxS-0003NU-5D; Sat, 08 Aug 2020 22:04:55 +0000
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90F1BF9;
 Sun,  9 Aug 2020 00:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596924280;
 bh=/Ahnodr9RqbqcUOwUfhTd06mCNouczDt++/t+ejw0Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kbq7pkBRQzU5SVvHPcAGZ+K7jXtRT/C4/wy/aXyh4qGPqgiZ3Buk+8Tqr8b1EAHPy
 2Z259suOzD5zxZbz8rBMhkkBMuONLujjPouxzCFRQtTmjxylX/aPqJc/nrxmK+CIPb
 8Xkag+BGeKOOxcI5nSgH2C212JEOHfPYFYerM0b8=
Date: Sun, 9 Aug 2020 01:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: frederic.chen@mediatek.com
Subject: Re: [PATCH V2,1/1] media: mc-device.c: change
 media_device_request_alloc to match media_ioctl_info
Message-ID: <20200808220419.GY6186@pendragon.ideasonboard.com>
References: <20200806155822.3772-1-frederic.chen@mediatek.com>
 <20200806155822.3772-2-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806155822.3772-2-frederic.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_180454_329758_931190C7 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Frederic,

Thank you for the patch.

On Thu, Aug 06, 2020 at 11:58:22PM +0800, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We modified the type of media_device_request_alloc()'s second
> parameter from int* to void* so that it can match the interface
> defined in struct media_ioctl_info.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>

This looks fine to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-device.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index da8088351135..6b66c2091bae 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
>  	return ret;
>  }
>  
> -static long media_device_request_alloc(struct media_device *mdev,
> -				       int *alloc_fd)
> +static long media_device_request_alloc(struct media_device *mdev, void *arg)
>  {
> +	int *alloc_fd = arg;
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
>  		return -ENOTTY;
> @@ -407,7 +408,7 @@ static long copy_arg_to_user(void __user *uarg, void *karg, unsigned int cmd)
>  #define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)		\
>  	[_IOC_NR(MEDIA_IOC_##__cmd)] = {				\
>  		.cmd = MEDIA_IOC_##__cmd,				\
> -		.fn = (long (*)(struct media_device *, void *))func,	\
> +		.fn = func,						\
>  		.flags = fl,						\
>  		.arg_from_user = from_user,				\
>  		.arg_to_user = to_user,					\

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
