Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AB9C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 17:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GOmv67d1uaUxNasSKtVHOsVSz+aOSr8H5YSEGNShNg=; b=iFJoWC3z2o9sbk
	YKzlRmgw9Hj/xc5qw5LC+ywzgQ2uyJzAiIo1/k8ob1L+OmDMdvMb2rJXpWznrYO90wFiuJkzcdl6e
	vWOTIb1i8c0FqxbWJxiBGpyE1v4ahYJ7xym/OKGRTAuachyuk7YxisEiPNxat80aGbWUhI2OurTEq
	Qdn24Q5fEWXt6ndL0aaOXr2gozuYi70K/use650WDTBGNqbCWq48cX6oTCegdWdwZrBW4mYiYCnJT
	SdUnosfRga+mI/djKUb+nfmLtQduia8sroZiVeFGk55rmrXR+0PL7WhmaMyti7agAdqOfMw1DuWX8
	UGRkuLmucTM3y5URB2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxB3G-008IrH-SL; Fri, 03 Jun 2022 17:25:34 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxB3E-008IpY-C4
	for linux-mediatek@lists.infradead.org; Fri, 03 Jun 2022 17:25:33 +0000
Received: by mail-yb1-xb31.google.com with SMTP id r82so14831809ybc.13
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jun 2022 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9d7m1DB2JYorAFcfrJRCyYngv/Ipyhp23NdS37Fbtxg=;
        b=URVQb1JkqaW1ZxUmYQ5sQlIodWx8/3heQ74G3ifWb6OpIziXlv8ER/kur16b8WoQp4
         Lc75UyQ3wEz6iiXKQ8UhcNPavNi5XJQbcreWYMbvM5B1SvdDeRX2QhDybf7QiVx3ovoa
         P9UtVL9f2yrR7ABjofsD/R/Wawv52H4VhdVBY2dYjjOPRr2oet+wr58sqTAgUHoYjoUb
         QpvYsttsm2TqMFvOve3llhXgR+a3j2q2nJMOxhNJOScXi11csrk7F00sVwfpQAJ//JqB
         un16nZdFbn+rv+2qfdYf+R1Xsx8fbDZo0yOXaVS9L05xFbaYKY8IaFxLUs5lR0uGl7zz
         ZZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9d7m1DB2JYorAFcfrJRCyYngv/Ipyhp23NdS37Fbtxg=;
        b=dRpNgRsaSFls6UWniou/BrIuUDBdjWtoNvLUpVk5br3ex7TJDDgkOrpJcxdqkPTsTs
         Hdy2iqb3aiZ9XMU0rOvqZvYMRo/UKy0sVv6W+5R9t9dsNqgEbl4sCkDy03/QaD8oCEpo
         urMD3RDD1e+0zGhm01cDSs2PA9IEtXdyy9PFEANpw4d82FA5yDOcUisN7iBok37KZ0vy
         6FCblWvoEEnRzSbnMCprADgaiB/zkpPfpcHLJ9DMmcktpUdi/fd/Uj2qCKItws/Q6OwN
         nfB9ulQ9xsKkHZbNWP7KfGhf+GxkBLCGxUCJIYO1DyrTVgLjt8akkgiG99ndPV/idKbY
         Ce+A==
X-Gm-Message-State: AOAM530Bn9YaHcveGi0YMtA7H1W1pgb1SNY5vL58GtKt/KmwWASFfOBn
	wLmuwPV+gdDB3hXueAJgdo0SPtk+PIQVVUc+si9QLA==
X-Google-Smtp-Source: ABdhPJxf9t98itOGujrgic0ySJOm8xg1lh3ELD9RztTvYghZn9PWg0G/2n3G5/cLA3+ZqRARoLBWHk2qXYPDrLAVE04=
X-Received: by 2002:a25:aa32:0:b0:65c:af6a:3502 with SMTP id
 s47-20020a25aa32000000b0065caf6a3502mr12290545ybi.598.1654277127473; Fri, 03
 Jun 2022 10:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name> <1654245968-8067-1-git-send-email-chen45464546@163.com>
In-Reply-To: <1654245968-8067-1-git-send-email-chen45464546@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 3 Jun 2022 10:25:16 -0700
Message-ID: <CANn89iKiyh36ULH4PCXF4c8sBdh9WLksMoMcmQwipZYWCzBkMA@mail.gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
To: Chen Lin <chen45464546@163.com>
Cc: Felix Fietkau <nbd@nbd.name>, Jakub Kicinski <kuba@kernel.org>, john@phrozen.org, 
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Alexander Duyck <alexander.duyck@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_102532_440103_119B4DA6 
X-CRM114-Status: GOOD (  12.60  )
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

On Fri, Jun 3, 2022 at 1:46 AM Chen Lin <chen45464546@163.com> wrote:
>
> When rx_flag == MTK_RX_FLAGS_HWLRO,
> rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
> netdev_alloc_frag is for alloction of page fragment only.
> Reference to other drivers and Documentation/vm/page_frags.rst
>
> Branch to use alloc_pages when ring->frag_size > PAGE_SIZE.
>
> Signed-off-by: Chen Lin <chen45464546@163.com>

...

>                         goto release_desc;
> @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>                 return -ENOMEM;
>
>         for (i = 0; i < rx_dma_size; i++) {
> -               ring->data[i] = netdev_alloc_frag(ring->frag_size);

Note aside, calling netdev_alloc_frag() in a loop like that is adding
GFP_ATOMIC pressure.

mtk_rx_alloc() being in process context, using GFP_KERNEL allocations
would be less aggressive and
have more chances to succeed.

We probably should offer a generic helper. This could be used from
driver/net/tun.c and others.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
