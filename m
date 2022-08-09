Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9C3C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb2mUFuhV/5563JBcGDuPjCytDVMGbor0Cr16TboDN4=; b=RdsFSQ0lbDc2Pmq9e8HBIEEwbm
	7/DIbdQMjh0w4p1qZhldeXLHXYOb8Y20mNEC61PvKOVkZuTBOlTjpz7yAa0SoeAnPOefTJtGuaQRU
	1MUXSZKG0PrSdxoV+q40hIAQHDuNeJhx3cume62Lazr6rnZAk3YHHQD2sGQKJeGOmkkWuWTadR69d
	b673lhFxReVILhAhezSrV48rHODTa4WND6bd4WqPhrzGYqnIAL6YuFdKww+BO0s2t2FcHNJl7VDxL
	FZ724kw3hfSKkkXANl1kn76a/Za7iUg62xjc2RqybW8aifoNg4ZmLfXwARy6ZJRg17aP1MgiR0vFm
	g1ERRKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVoh-006GUW-O3; Tue, 09 Aug 2022 20:27:07 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVoe-006GR3-7e; Tue, 09 Aug 2022 20:27:05 +0000
Received: by mail-io1-f48.google.com with SMTP id v185so10519802ioe.11;
        Tue, 09 Aug 2022 13:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Zb2mUFuhV/5563JBcGDuPjCytDVMGbor0Cr16TboDN4=;
        b=a0lrDK6GzqnX3VSVbqzxNTrKAz+WH3t9gj/1qm3hbVhGdAdA01gEYQwbc3JFuQV0Hj
         ZHRy+ZkICB5THXAVWTuc359K3UcIS6108Qi3SFLNb2AC4xT089/NifVSEu94igUEMLyE
         jZh4i3kvfYUBGT8CQQeMw+TNSicYL7q4lwemUBCYkF8iKk6FSnjZiODtVJBdk9Ar0tLf
         RQ4YppY4876DYrnR1WwtkedxT8csmbYpuFgFKoVyZ5YyJzA6DPUzDQ9Dl6PuYF4YUIJu
         3PyNeqHmUATwbEvCoH68S31ys2YU1KMdVFtErkQDRh9jH2hxunkK/rw12xH0iVeXPQoL
         QPQQ==
X-Gm-Message-State: ACgBeo2FzXBxxUeDK4nTNmrirtmLO9f+6hcrgcE4e8YGJnFfGniv3jW9
	iVmUbWVhDWDjlvnzgOB8AA==
X-Google-Smtp-Source: AA6agR6j2p346k+I02Zk8Bb1xrsh7e5KG6n1XfqqbHRoGaWf9D10TZrdC1haRNCdPLAusLwZhwv7GA==
X-Received: by 2002:a05:6638:204c:b0:342:bb9d:95f1 with SMTP id t12-20020a056638204c00b00342bb9d95f1mr10007590jaj.147.1660076820521;
        Tue, 09 Aug 2022 13:27:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m6-20020a92d706000000b002de73e822e9sm1367117iln.87.2022.08.09.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:26:59 -0700 (PDT)
Received: (nullmailer pid 2337716 invoked by uid 1000);
	Tue, 09 Aug 2022 20:26:54 -0000
Date: Tue, 9 Aug 2022 14:26:54 -0600
From: Rob Herring <robh@kernel.org>
To: kewei.xu@mediatek.com
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com, david-yh.chiu@mediatek.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, leilk.liu@mediatek.com, liguo.zhang@mediatek.com, caiyu.chen@mediatek.com, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/1] dt-binding: serial: mediatek,uart: update
 bingding for MT8188
Message-ID: <20220809202654.GA2337658-robh@kernel.org>
References: <20220809084457.31381-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809084457.31381-1-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_132704_324874_6D15E988 
X-CRM114-Status: GOOD (  10.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 09 Aug 2022 16:44:57 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
> v2: Resumbit the patch based on the linux-next branch.
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

