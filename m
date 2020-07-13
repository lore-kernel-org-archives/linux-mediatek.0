Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A65CC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 23:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB6320DD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 23:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZgncIsZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB6320DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9skdBEEGwRnoCBLt8LKIH1zNczVgnmYHjBxUmmHwjRU=; b=ZgncIsZRPtPsB5cZkeg2cuYn0
	5aIau8BaF24BJuJ/00Rz6eCvgnzVRj+aomaALN7oPp6taDo6RD77YhurmHKM9NIVcs/76Vm4hC0kn
	FvZ4ReIrl+WYiEI4Nf6zUISmiIjJm+jZzT1imvamRihTc3XxfC054CBBmpmPVvlZdiumMC9QkuPdL
	1xr6pUOcdukd7YuyRPxK7jI3tHt6rrBRP+LMK1yCmt8RSs1VI/tNRy1QiaoIjKQ5xBkbreMUgI8w+
	j5Nt8cDRQsro6vdiDMhFb7HfNSEF722/y+XhcCPrRBYjwH2p8f3zRE3T8Dm+W9eIjNQAX3ejgKjuM
	1c7lKZMvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv7yL-0007kd-21; Mon, 13 Jul 2020 23:34:57 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv7yJ-0007k7-6y
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 23:34:55 +0000
Received: by mail-io1-f67.google.com with SMTP id q74so15443393iod.1
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 16:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h09mBGtHi8i5lSRssVJKTabDr88RFU9DFJVpDRWqOyY=;
 b=pxsK+WikG1N5FAsI5c+++5YS7qkH4wsFIghOp7WoXwI/IjE3F4I8H39WkfuRGJNJMw
 z2z9boAr0KtL1SXFJPY7RwLWHX6iiSZqt072GDL0uWTCuA6d05vsRrkw0zD5XTS1T5K9
 vO7S42JPtvfmKYQmgjV1+/y9C3YTpLrPaKWBWNDyqejaxRq8ACHxnWQ0/DaGuNNUhQ0w
 4N4njFM5nrXTzXmenHSvMT2ZVmHdxSqAUljAz1ecU49mkyyYYVZ1teqj+z2rGvXH9pgx
 iMJb3z4f9UpEGCQcY5R1ZSl9l1Buo4BK2c0f4lpiH8meq3sBMUKYcvgqwZ5C5q2V+6dK
 eRgw==
X-Gm-Message-State: AOAM531sztVbxvoitnFR1ya5xGmC9rO8UB1Jp3FXhN46uD7xvSfpVtqi
 xYIt971dd3LOvBgvtcNEhg==
X-Google-Smtp-Source: ABdhPJwfI7+jWURn6sHIGYi1OZze4wchDmNC/r88ULrNM/NVokDGIeeAUfetYg1n5a5T/nSqq97g0g==
X-Received: by 2002:a05:6638:d8b:: with SMTP id
 l11mr2765494jaj.124.1594683294403; 
 Mon, 13 Jul 2020 16:34:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s18sm8922933ilj.63.2020.07.13.16.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 16:34:53 -0700 (PDT)
Received: (nullmailer pid 928397 invoked by uid 1000);
 Mon, 13 Jul 2020 23:34:52 -0000
Date: Mon, 13 Jul 2020 17:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v3 08/16] dt-bindings: media: document
 mediatek,mt8183-vcodec-enc
Message-ID: <20200713233452.GA928367@bogus>
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-9-acourbot@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713060842.471356-9-acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_193455_294953_8790E08B 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 15:08:34 +0900, Alexandre Courbot wrote:
> MT8183's encoder is similar to MT8173's.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
