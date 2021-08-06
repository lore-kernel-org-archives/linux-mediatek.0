Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCE7C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 21:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5277C600CD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 21:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5277C600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrFc0VWBFo8mw9Wlu0x71rBYGIzEZxTUTd5zDKZGiiA=; b=EuVSAiciWIZ3Ow
	HBJ+1HWOY0Rv2FjHbVFgBrhO7ThpEuuJuiyM0sG1uEHpeKsFoXLs6peaFF/I9xxrwTM902dZswAk4
	3qfDnp2IXnOaCt2/SMzac8GOUnIXIertdNPPmTB7++oaohBS3FuFDZY4mWp0wIygPm6sYmRcFTUsq
	rMEuGtKFbCAmlGU3EBS5Or1/3C55eKYDjHsPXeM6ypBTDeBCn9HeBFVt4K3S/sxNFfx8yByIRNH3g
	VTWtgEr7BvpuK4wGyZ89Uq0aHiw+51dST5YygJsqqsyGoooRY4s7tQm7yOT2ZqPrUmVPDM161Hz/d
	H5OKtYAefqxCOCutQxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC7gj-00DhER-NQ; Fri, 06 Aug 2021 21:47:33 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC7gh-00DhDN-C9; Fri, 06 Aug 2021 21:47:32 +0000
Received: by mail-io1-f53.google.com with SMTP id d22so14232934ioy.11;
 Fri, 06 Aug 2021 14:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BnsmwWZ5UV2/LE+aqdhfs09L7FfJpBqefxeuDQt77V0=;
 b=JtNnB0TtPuiS/V1pdUJpvt0CekOD++BELI983sQu4zGcuz6GI9wacWlPujVcORaK4o
 U43WRFxdTsyrlPaeiP26lWD16XVtLX6kwm/Y4m3ARVoZJZcfYvYDcBHsyt7qXF52ca6O
 hONMl6Fr02AqXbHSRfVqKLdOmj7YsjM8cdMhC9GJuvVqWLqHpZzc2y/fpRWJ/HnSVW2u
 zkjLi+A33D3tX4u/6DvYjv4REUhzK8X0Zd2WPcb0c09QgvJ6A5AqFw7eWt9iwQP22pAZ
 labVr9UqG3A57qumHcTYsupE3Jgsxbd4s2m5cdJQLTRkJBQlNMbCI/v4Wduwpg/LWypa
 obhA==
X-Gm-Message-State: AOAM532z61rF/pYr2C7XVXBloxdpJ8Hb973xWUDWDM1pnmuMuwk4boTy
 Lbv1Ov4codiSsl1oet5pow==
X-Google-Smtp-Source: ABdhPJwY3vn+yJ5z1R0ZdpqJAsHZRNWFU1oMd54Rjtxc4mGO4QSs/gfI94S40UfF3mOemJERn/2Ohw==
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id
 h13mr289082ila.40.1628286450854; 
 Fri, 06 Aug 2021 14:47:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q2sm1054502iog.22.2021.08.06.14.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:47:30 -0700 (PDT)
Received: (nullmailer pid 1862298 invoked by uid 1000);
 Fri, 06 Aug 2021 21:47:28 -0000
Date: Fri, 6 Aug 2021 15:47:28 -0600
From: Rob Herring <robh@kernel.org>
To: Eizan Miyamoto <eizan@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, chunkuang.hu@kernel.org,
 Rob Herring <robh+dt@kernel.org>, yong.wu@mediatek.com,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 houlong.wei@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, enric.balletbo@collabora.com,
 wenst@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement
 from mtk-mdp
Message-ID: <YQ2t8DMqz/Ju1Qng@robh.at.kernel.org>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_144731_485909_1F5CEBB7 
X-CRM114-Status: GOOD (  11.08  )
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

On Mon, 02 Aug 2021 22:12:15 +1000, Eizan Miyamoto wrote:
> It is no longer needed by the mtk-mdp driver
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
