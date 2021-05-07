Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FB9C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 09:38:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6AE6145A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 09:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6AE6145A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUdSkjIc5dx3RF0SuiT5iaGXXiWM+kOENyaQffkx97k=; b=Fc6XGYK4JH5bn7H73p/w0bkRk
	xltrxYd14wmRcj3i3P3ewTIL0loJ4YbOyW2vHt+OyzzppIoql+uKherYuE6gaMQd34FaOP38zhJTx
	p+d2BjMJu/u8nqFulwEkY25rbqwAt9R3NWErFPN5d74xQ36YZwXWn7bcoV26EonIBPZilw+TlrMr1
	F+VU1wrNyjQlOtTa+nQgSa8Y3dy0p3CW/y047kmUmxGNDU+91wvd1Qp/8nuLRn7jsO0UJFxJPBhh1
	Zya9pdAVfkg4eVd+UD2vSNlyzy4tIJgEjKyiKALMGL3hB2UMicgbZMim7iBFC4JzEJfCJvrAmTMiJ
	tCyto3sXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lewwR-006gwP-VN; Fri, 07 May 2021 09:38:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leww5-006gtu-TL; Fri, 07 May 2021 09:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IikC1VuiX/FiNYk8otnLVsc7j9Eoac70iFYc0RKwmyk=; b=JmZj6ZQ6keGHMCdKm9dfmWMyrk
 eYSIzRU5LvYk3rSGnruj32QxRW8db4XZhAdrPBEmJ9E3L8ZspK5dEV4Ls6+Syeh/ejzKuRmXKLafI
 SUkOS1SSdc/3kPe41OT8fbheOmAjElhucdY1JHWxnl71hzcfGMw8W5fVwZ5H9Mh4yBuoR+IiEjmQR
 kKBAMB+TIKAtQLBRpBupgccNeIyuwKaaHTJUnRbuikCtBtR8iCTan+zCXFWpjLZAnvgJR7VBE2ch0
 lYMdZw4GULXyAAGVuiR08Q3Hd/OMs37iHtYypRZXsGTtRkDUM3cZ3blI3OZwZNad+I7P73jnKJqIO
 2QbZJ1uQ==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leww2-006k6D-J0; Fri, 07 May 2021 09:38:16 +0000
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi
 [84.251.93.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C26861B00C84;
 Fri,  7 May 2021 12:38:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1620380285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IikC1VuiX/FiNYk8otnLVsc7j9Eoac70iFYc0RKwmyk=;
 b=r3WKbbjXk3UpIlcfxabNPA4ch0xJ9t53Bq2c1tQLYDowKsXKHnkce2ULHMvOZh1FCIuR5p
 yedhhcH8MY0BLblNNMFKtgBbMD5dzmVfbvc6kfu+vGl9W4sezNe2zzdkx/lsTPiuXTLGX7
 FLRlnJncMIXuOoZlxgwDFFfWsh3KFXZu2gkvepDpnxM9hUk6hPtWBy7QexmQd+xS/7K+gt
 H+3X2LsSb9rKs8FWUkg23ILMcTZ76KMOCnlr6UGMgtiHMcYk2Hw++vwkJi7Qojly+ls8/J
 +a+SLUtZEWH5s+OurIKilu13ABPTOCpnmVJMWvPnm1stHcbMIVkSEygVQwtV9w==
Received: from valkosipuli.localdomain (valkosipuli.localdomain
 [IPv6:fd35:1bc8:1a6:d3d5::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AEA81634C87;
 Fri,  7 May 2021 12:35:31 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
 by valkosipuli.localdomain with esmtp (Exim 4.92)
 (envelope-from <sakari.ailus@iki.fi>)
 id 1lewvu-0006dp-BJ; Fri, 07 May 2021 12:38:06 +0300
Date: Fri, 7 May 2021 12:38:06 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: john.wei@mediatek.com
Cc: louis.kuo@mediak.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH V0 0/2] media: v4l2: extend framework to support
 advanced feature of Mediatek Camsys driver
Message-ID: <20210507093806.GN3@valkosipuli.retiisi.eu>
References: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1620380285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IikC1VuiX/FiNYk8otnLVsc7j9Eoac70iFYc0RKwmyk=;
 b=vpaP0hQ2N5dECjoQ2ZzGzzRoyhrEgJWAT0IlPu0eNIqplHqttmruWWcQbBQr+yrSMyYO/S
 UeZguNgU7r+dMV/P/+UmgJ/4stFOy+26bneNGXhae3Bt3XCRmYdjsPQ8YWwTx5GJPGMsen
 0eX00gQMJ51Uf1W19D81Z/gwWtQnD0WxMbfSGDLpiWlPVAxGPxR7AqZc+vMwfje26tq8YV
 gnTwzq2vFASbgo2R0x6okRIlhoSbZKnbctq2gU3hRJOIas2Xx5QZmnkG9uGHPm1TTDKwRq
 hoXFwLb+Va9E/PLYNdPN41qnGy2LleqIht8anRPXk1IbK94OSijBH0ZS+hcC1Q==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1620380285; a=rsa-sha256; cv=none;
 b=ph/lw6+z9npfuLpxAdZitS/6mG++KpJE7Ll1TSmi4TEL5KBnS/y2SSnQy2zy50GkGod1qN
 oIqG1hmzA3f5EKfQ7K7w+LTQgXjmFEdxLMRQFS6pzezFwMtfohnVi/dm3pt5rY1xWIVUev
 85wsOgjZtnS7Bn+VW7cq1mySEdmotv+QbyIWTbDVPdjGCJkHetw36++yEVbPdVIllzYDZE
 +R+cepP7rtr+r5uAaG8/jqQm1jiyK+2S0ZDJ0hnf1LT8N7tilrBFTLBpK+/KsWFi1c53EU
 yAf3KkPUZysabhAJe/suaiMalExVKvyeRpDiKof558Eb7j6DVmWrF7XnOvzmnQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_023814_801670_9E62D693 
X-CRM114-Status: GOOD (  19.34  )
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

Hi John,

On Fri, May 07, 2021 at 10:53:35AM +0800, john.wei@mediatek.com wrote:
> Hello,
> 
> This is the first version of the RFC patch series to v4l2 and media framework
> to support virtual channel (an advanced feature of MIPI CSI). Virtual channel
> was used commonly among modern image sensor. It was used to transfer
> metadata of an image such as statistical data of AE or AF.Some advanced
> features of camera such as HDR (High dynamic range), PDAF (Phase Detection
> Auto Focus) were achieved by virtual channel. Medaitek made some modification
> to frame descriptor based on https://patchwork.kernel.org/patch/10875875/ and
> https://patchwork.kernel.org/patch/10875875/.We extend the struct
> v4l2_mbus_frame_desc_entry by add enable, hsize, vsize and user_data_desc.
> With this modification, frame descriptor are now more powerful to meet all
> kinds of need among different applications. Here is an example that we use
> frame descriptor to describe all data streams in a frame output by a
>  stagger sensor.

Thanks for your e-mail.

Work has been done to address the problem area previously but it hasn't
reached upstream yet.

Tomi Valkeinen has posted a set here:

<https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/>

Cc Tomi as well.

> 
> static struct v4l2_mbus_frame_desc_entry frame_desc_cus1[] = {
>         {
>                 .bus.csi2 = {
>                         .channel = 0,
>                         .data_type = 0x2b,
>                         .enable = 1,
>                         .hsize = 0xF00,
>                         .vsize = 0x870,
>                         .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_LE,
>                 },
>         },
>         {
>                 .bus.csi2 = {
>                         .channel = 1,
>                         .data_type = 0x2b,
>                         .enable = 1,
>                         .hsize = 0xF00,
>                         .vsize = 0x870,
>                         .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SE,
>                 },
>         },
> };
> 
> The first data stream, data for long exposure was transfer by channel 0 with
> data type 0x2b and the resolution was 0xF00 by horizontal and 0x870 by vertical.
> The second data stream, data for short exposure was transfer by channel 1
> with data type 0x2b and the resolution was also 0xF00 by horizontal and 0x870
> by vertical. Both long exposure and short exposure data will be fused in ISP
> stage to output a HDR image.
> 
>   media: v4l2: Add fields to frame descriptors
>   media: v4l2-ctrl: Add user defined base for ISP user control
> 
>  include/media/v4l2-subdev.h        |   25 ++++++++++++++++++++++++-
>  include/uapi/linux/v4l2-controls.h |   10 ++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 

-- 
Kind regards,

Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
