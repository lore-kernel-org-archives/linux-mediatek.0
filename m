Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF228C4320E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65EAB610FB
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65EAB610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CDkHueYC4dm8AiaUKm0FTtIQDxeUeNOI1R8kF0LOlk=; b=E7oniFyIhWbEX/
	V9i12rt6hQZq3BtU6+WAq9wlwZyX6IDfVOw3+l8xVBmMnDAO3E1/NzBdFAdMLKdIhmFJ2neFcVL3E
	pdFqhBep9B+EfJ3IFVJNe92dbpc9ai524f+d6vce2kmUNPhhBN9d2vGNbywFPSrsujYvYaeYcVe/v
	aysOSzTSLSh4RZw3TGkOUW/yQ7w07Et/neEH7/YSkMyrrADxJF5igAgUr6J7xaMiBIgjfcwGIZWYC
	/cjUKmvp9Emn69DIBI6CgM9SucvHwLsYANkYbj9vy/Lt/C5vqxBLb9ugIOIz9AbjEojFaGyjIThDF
	dO0bHvf0YdAxaWTpnQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAfUA-000HAD-4f; Mon, 02 Aug 2021 21:28:34 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAfU7-000H9k-Ox; Mon, 02 Aug 2021 21:28:33 +0000
Received: by mail-io1-f44.google.com with SMTP id f6so16148388ioc.6;
 Mon, 02 Aug 2021 14:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rwbz+9oA10Q9QsdsMkjyZuBQ2lk9vcIPiTkjDfV8lmw=;
 b=PDD+yNwBeKCRNYrnO3McQe4hst5PBisE47+KTe0j8tmjHaqzRmwU+V0Qf3btGV6f0m
 hjt0rbXmvNQxmd3cSfwLStxf4EJe7iDzRAzs1Eqd+9AzQU/1IxQTCnkL+qrapj6+ym2L
 GUf0m5YDGv3Bz3VjUEv6FVIldHRrsa1WMhcS/xdNVOMIS9LIFB0q1W/3GiGga7JZYGrQ
 ggYVcz1DJEV4+eJ2Xv4Rq0C8hM/RDbCZaMR6bf0kiQx1/9FZ/ZIKMDKNyZkXHdWi3wSW
 YIockvC1aOsyinmjqRBpJbhRGf+9iyDikUTzP5cfyyNoNvWCjUus+lKDabmEJWcQWjDB
 hJlw==
X-Gm-Message-State: AOAM530fui8o4OwLWYGwun/Tgn2ZQa85NVwL/SjZraHITTu69rmtr8wB
 iABBYXIWWFyZuNVzcKcAhw==
X-Google-Smtp-Source: ABdhPJwE9OTwBkhkpNH5jrk9TiJwhIICdzquhDmeR+v16AGfUIj1mXQKD5hGQ/Df2Gh+mxcZ48aBJg==
X-Received: by 2002:a02:a69a:: with SMTP id j26mr16479456jam.9.1627939710985; 
 Mon, 02 Aug 2021 14:28:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g9sm1038291ilj.70.2021.08.02.14.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:28:30 -0700 (PDT)
Received: (nullmailer pid 1645191 invoked by uid 1000);
 Mon, 02 Aug 2021 21:28:28 -0000
Date: Mon, 2 Aug 2021 15:28:28 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 tzungbi@google.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 srv_heupstream@mediatek.com, bjorn.andersson@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 ohad@wizery.com, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: mediatek: Add binding
 for mt8195 scp
Message-ID: <YQhjfMoloq6uza42@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_142831_850238_7187455F 
X-CRM114-Status: GOOD (  11.35  )
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

On Wed, 28 Jul 2021 11:58:56 +0800, Tinghan Shen wrote:
> Add mt8195 compatible to binding document. The description of required
> properties are also modified to reflect the hardware change between
> mt8183 and mt8195. The mt8195 doesn't have to control the scp clock on
> kernel side.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
