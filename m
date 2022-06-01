Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5A3C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEtsb3njemQplpaduHD9hqxSC8Q5fP7eVHKxfIymqD8=; b=xDFy2xwSKBNGH4
	Nwv+S1GIw7LScE+NGEgaI85XYby8RmRATughSheGNL9G2Ms0/ygevIAuewAfYWh5l4IRbnEA8oNoD
	nf5bKIqdbO1K0yq8LhwE7lqcbPv1VYhBiXm6PdoKZCIqpTX7cx9SIQ6X3eXRgtlKH38A4d0Ryd9B+
	9y7v9Vs0RxGROH5zKLisge96yHJUVhYeb5RPGJzDRGI8WvVKeIOixlHHOwmge1UTlw2TyGadtGbEz
	3ox9MzGwNgOAtjyMRaHbh0R/F7I4n8RfGdwiBsWCd/ZwgZswRMEwu66sgrOZCyf/4dxQIpgmRqSOg
	KRZH3H8Hk19zAARBbOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVlc-000STF-SW; Wed, 01 Jun 2022 21:20:36 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVla-000SSJ-PD; Wed, 01 Jun 2022 21:20:35 +0000
Received: by mail-oi1-f180.google.com with SMTP id y131so4276509oia.6;
        Wed, 01 Jun 2022 14:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ELpqiUTUS9/MflkdXo00nljVnHKNvu4z7mxeaxEY9EY=;
        b=SWVWFnY+3J7U0vVdA/WeYDGTpBBtZFykYVntB4NAQiQjhoxi2LhopKWSUjErP2qJ4F
         A8Up8SZzVBAi13Y9nQIzvM1tnyhbk/XPRemuyDBS3gNWnXci3B3xkebUqsQGkQbeEtvI
         h+2AR1aNgRU8cYhYajSoJA2adwAioIqFAtRUPdDqD+w5+RSZ1Wm0qMFj11R+yL1c3rWe
         SGziS4fbwYZQPlh3XNq3hVcZF6B71mNoSM5NPcq+zD3VUMMRO6wfcdgx6ObzlYzhnuhO
         MxccO7KEn3nwF1LcJoFdUUD88BP7DZqW7ShiD7GWbBZkHNr6ERxqBwav+MxuwPp4mhuz
         hvVw==
X-Gm-Message-State: AOAM532wnwqNznuPnq9Fhid3qh9e4biHkdngCuiF6zHnIsX0n9kp060L
	42f2TwV8eU/aRtP0T0Rh7Q==
X-Google-Smtp-Source: ABdhPJzXDEUMMEXjcJlhrMRFbLzgWr3OPihQXysk4ZN96spRUhvecHfdDhmKbFwb7uSg9kt5rREemg==
X-Received: by 2002:aca:3945:0:b0:32b:3a61:35d6 with SMTP id g66-20020aca3945000000b0032b3a6135d6mr852287oia.293.1654118433226;
        Wed, 01 Jun 2022 14:20:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p21-20020a4ae155000000b0035eb4e5a6cbsm1435366oot.33.2022.06.01.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:20:32 -0700 (PDT)
Received: (nullmailer pid 476464 invoked by uid 1000);
	Wed, 01 Jun 2022 21:20:32 -0000
Date: Wed, 1 Jun 2022 16:20:32 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, maoguang.meng@mediatek.com, linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, kyrie wu <kyrie.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, xia.jiang@mediatek.com, linux-media@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [RESEND V1,1/2] media: media: jpegenc: add
 mediatek,mt8186-jpgenc compatible
Message-ID: <20220601212032.GA476431-robh@kernel.org>
References: <20220520085910.28839-1-irui.wang@mediatek.com>
 <20220520085910.28839-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520085910.28839-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_142034_876956_EA688AC8 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri, 20 May 2022 16:59:09 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8186-jpgenc compatible to binding document.
> 
> MT8186 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
