Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F5C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 21:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRNEn7f7Eo7iWPPTjjTSUErA1k1uT+jLhXHuPrrDIoM=; b=Ji+m5dFoOKhUZ4
	0i3PWHEpioN3juw3msVqmCIN9aQElDYX42JpUorsDavi+auQb1D/+g30RojWflx7IZgdyLbtgG8+X
	P61zT2Z87O0GR6m47VsqQ9eBvCL1+Wh+9p8XGg4SREEj18GlLu6GAeQki0UA1dFsvWSqJpOqlaFzQ
	TauyV2SWKIANoTQmAGG+7/C0SDoRSwoqKAq+DkAds37wH7oImXdMmqas+qhvAdbmj013ChqU80hxT
	y8z8c/xx5SLPix5NBWnCgayVwOo4lUkD/uTrciGirV9U0n9lCre0rfIWScqoXDiFikRp/x7W87xtH
	iOGmK5xiyr2Nt07UeWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9k2-00CkpS-4i; Tue, 31 May 2022 21:49:30 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9jp-00CkmC-F1; Tue, 31 May 2022 21:49:18 +0000
Received: by mail-oi1-f171.google.com with SMTP id t144so179365oie.7;
        Tue, 31 May 2022 14:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+YdK30offKzuTZgxr62+00M+QWbwt3uA7V7H9/gNhvY=;
        b=tPCjd2kpAg+PIuXCjPW6jxqksVG4FxsYM2BW/Eh3svy5l9FcJ/LlaqzF2nsbiNzHn2
         mM8Dg7cS7iRftaqtwLCYtAxZSghoCbLydOI85n78lPlHFITm3rZIAkyi842tCVKWrjQW
         nFry/fC5/WAG4d2LpXPhg2eCAFFk1KacukT44NM6N9QVpoj6SsS3TzD5iibj3dlWi6Ap
         J2JbrWiYbhZUg8hDYFhqtydq+QGlVZZDlJjlQB8lYLM0B94IYTgb2bUACeh+UoTWwv8Y
         gW6jKy2HtjzMdChfSkSKNFbn4v5t7gBFiegDH9ids8g2k0lFlFfhx+1Ua2s8eJoIXupH
         uELg==
X-Gm-Message-State: AOAM530Y8ZTxR4Rpi/nD9+T5CIGj8CuI67beVctT5iIRao0q1SDHd31d
	fXfY6QEL7oayjsi6mR6bkw==
X-Google-Smtp-Source: ABdhPJwD6RXkPuAfYUMkWIfLQdr63/fiIfROvhb2rUyYgLwVv4ReaS7o65TXF0o2cMbd5Q2Pb3LLiA==
X-Received: by 2002:a05:6808:1315:b0:32c:3e3e:c2d7 with SMTP id y21-20020a056808131500b0032c3e3ec2d7mr4283979oiv.299.1654033755383;
        Tue, 31 May 2022 14:49:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ek29-20020a056870f61d00b000f44c6041e1sm2048257oab.50.2022.05.31.14.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 14:49:15 -0700 (PDT)
Received: (nullmailer pid 2394769 invoked by uid 1000);
	Tue, 31 May 2022 21:49:14 -0000
Date: Tue, 31 May 2022 16:49:14 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, matthias.bgg@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, casper.li@mediatek.com, chinwen.chang@mediatek.com, kuan-ying.lee@mediatek.com
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
Message-ID: <20220531214914.GA2388344-robh@kernel.org>
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
 <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_144917_545258_3ED6849B 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, May 31, 2022 at 04:43:18PM -0400, Frank Rowand wrote:
> On 5/31/22 01:33, Qun-Wei Lin wrote:
> > The function check_node_name_chars_strict issues a false alarm when
> > compiling an overlay dts.
> > 
> > /fragment@0/__overlay__: Character '_' not recommended in node name
> > 
> > This workaround will fix it by skip checking for node named __overlay__.
> 
> This is not a false alarm.
> 
> Do not special case node name "__overlay__".  This node name should never
> occur in a modern overlay source file.

A dtbo -> dts pass will give warnings, so handling these nodes is 
worthwhile. Though thinking a bit more about it, I think this one is off 
by default, but W=2 turns it on.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
