Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12095C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E756F22CF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEj0u0On";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="sxoCuLkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E756F22CF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NlfOPHlMQtvX9vbLgG8n3XwoTvniL471Tw14FHsiO8Q=; b=DEj0u0OnvxKAMatOP/bPsgchM
	hrS/BxD9EjqrkbRZkVPzDu5fFSiihTe16f9Lb9jML49c2CksVPSSz+L2+t3wU+l8ZaoLQggW+azLd
	xoEOE7L5ReGEFdVq5Qjt3PlbOkib3KFZwqvSYjMWP1JFFE0+e0YlUU5Kl2FzvJ939XJSwyOALxo2H
	OZFE4uX/7OYaXY43VjAOh5AG3W9duXB87LURIf2vbOqSKeY/Xf0kaNHkUT5iPAdupXnyblNDafAvT
	LEc1QuhrRxL4NIPi0WQhT1VyPiarBC0h23r9pfVp363xLkxuACVigIXXadCTFKph2JhdH93RSkyAK
	YML5dT/Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3aYR-0004C5-99; Thu, 06 Aug 2020 07:43:11 +0000
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3aYN-0004B4-4V; Thu, 06 Aug 2020 07:43:08 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 3aY9k75OMuuXO3aYAknFvT; Thu, 06 Aug 2020 09:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1596699775; bh=T4xmSgXs0W8ROOKjQGmNEDC52VAJozMGJbV9msYiY78=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=sxoCuLkSAHsCrhGUN8kwQr4MgQGFYrWB2DLyVpXFkivfqUfIMRF3Axub2IzCkgVO3
 i4/o8PgBy5XbA9siZ34LPHqyzlG0rcziTwo96agHx3GCfoNlCSVL3JTmm1Q59UeeE7
 OaTeQHHtezPZr9n4kHLmlhmR3ZWa1Ps1M26leVB66FAyGAWIONWmxiu18PpPL3P4Jb
 hbDYpuGX4Kg5445iP1RsVDLeLVeqpJ0oIJvA3pOWMyXA/w4nn4y5u7T+c5tWaSAZ2O
 /uX6XofWEL7KesSYhtgBeRLO29o1RG2qiSurrhyi6Gptu5bN/hNgua/zfsmPI5z6Ay
 k6q5TvaPBNwRg==
Subject: Re: [PATCH V1] media: mc-device.c: change media_device_request_alloc
 to match media_ioctl_info
To: frederic.chen@mediatek.com, hans.verkuil@cisco.com,
 laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
 matthias.bgg@gmail.com, mchehab@kernel.org
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
 <20200806072952.11709-2-frederic.chen@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
Date: Thu, 6 Aug 2020 09:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806072952.11709-2-frederic.chen@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOrGz3rAhHZCAaKgjiDYR2ekXp4TQjOJE+TmODTu53NnUKnI2WkbUL3u96jvhjAfRgG0gtyQoephVb46g6j0p2btiGqDXzrF9+GySKl3HRFIjJtPMB7W
 qu3P4GwP3E7L2lEI/Y0GaK8SYEI5KMI8UJB+OzAU64a/Mw067K6o4heiu8xuW46wccZIhdDSt4oRBpnDI5vEB6b2FwwlatIVYvO4PcWCxfbhABAzb1Smt2W2
 jk/OWrU82UCFeEt7PIc0WjYCoPFdQekx0sUv2jh5G8HN52IEOTUKuR9FWYyKHaHl7Bpmu8zWxNCuW2aaU52r3BNG8/j+pQ/7bImzKoMcL/bzl2vnDQeuIU5a
 uU/vlDwdeXOpeocMgKqdEZ3lnR3r53/rc8gKy9V96HDGGvi8IZrWs/XcG9NueXn2r2ZidwRdhYswaVyUiGuFzJhtvoeo1E4k9TCCxuAblNL6BtjjypwoxwiT
 edaovHKNoCPOd3qCawp+IzqkCIoWp7UZZqSev+zRq38QcXn7BMmb9ysjgPJgw01mA2qVEH9ldz4u2Kc1ioZLQweayu3ulPgx+zxiC6xt11WRIBttnDsSuqNu
 j3msTQY+9chXeMvlHUdj1X5VBosbO0r9S/nl6NkzN2Ahb4c8BADc9386LgNJnnLxVgYsouEvi5OzmLgJNLsWCmS/GOoFmu3h09Fz8zLrhwn/m1l4ioFHqS9d
 XH8M+05eUIcY1ozUs8wGXx5/d/w7zQkLysZWZEqlHVuyJec1HZrTi8Ka/CGfzwtyt/Z9IaNlMRcLtod7hCqOoF5asPg1n/utpDN7jXenpIVSlZXYFt56uQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_034307_498429_583BE77C 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 christie.yu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/08/2020 09:29, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We modified the type of media_device_request_alloc()'s second
> parameter from int* to void* so that it can match the interface
> defined in struct media_ioctl_info.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  drivers/media/mc/mc-device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index da8088351135..bc5b5ecb6581 100644
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
> 

This change is fine, but the reason this wasn't noticed before is the cast in
the MEDIA_IOC_ARG define:

#define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)              \
        [_IOC_NR(MEDIA_IOC_##__cmd)] = {                                \
                .cmd = MEDIA_IOC_##__cmd,                               \
                .fn = (long (*)(struct media_device *, void *))func,    \
                .flags = fl,                                            \
                .arg_from_user = from_user,                             \
                .arg_to_user = to_user,                                 \
        }

When assigning to .fn the func is cast to a specific function prototype.
Without that cast the compiler would have warned about the mismatch.

I see no reason for that cast, so drop that cast as well.

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
