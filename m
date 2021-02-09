Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B3EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:47:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE1664E6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE1664E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QjKUFrLVJdEcHqMvxXGxgblwyos+Z4mV+iVTQG6ysu4=; b=uoNPaMMzeLZzLRbxtPK9LonqA
	YSnpcP+VnTytnPTeZHRJnX7gDu3J6oR3EoyXe4oAhH/ERSTaE6GiOwRwCyVrfujI5nRNyhA6Sx0VN
	RJ3xIfxgNAqwsreyGDs5/Jc4NQXVA7SmKtFsbjM7kHYf13UzZhXALHcm988IvthED3qup10f4AdJh
	3UpDKcXq1LFRQnp0cFoD29oj+R5R0P3uoHxSP2+00Pl9ui9SzVj7STezHRiB0QQDf3g1o+3HW0OC+
	KnV4VCMga8GjaYjZ77vrJG3EzgYN2TxIsMX/mdtXVeQmGbN5c9INGZ6bomU1pEIMuGGF3DAHBJCx6
	OsrR/3G8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZvB-0005Qi-Nj; Tue, 09 Feb 2021 20:47:41 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Zv6-0005PK-Kt; Tue, 09 Feb 2021 20:47:37 +0000
Received: by mail-ot1-f53.google.com with SMTP id s107so18738000otb.8;
 Tue, 09 Feb 2021 12:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5HDCmk8HBTM9QYaMpmV4OtJzJOSSem/5EjbeVWW3FGw=;
 b=PIaVdljDb0frZ+TRF4RPacPYCGJIpDyen9KQdd6k6Cq5StqC9kxRtVuOrSUpk9RriH
 xi6S5wHSH8LqA4Mn7PUfFfOVTwxfOzxogz7TnnjNnrs8bZkjn1nKuSaNNoArVaTHbg2v
 su3AaWGujQHBGyBYW0oS9rbhA1EgwCSHOXrhs5bLXoAM0NkeL+CZbLmXa581NgxouGNc
 TPKmh2g9RhWAU3XuHpGYV5RHCvNZQU1NKGCwjHxV4siMeUzJJ0dZ4obT1See+ZSRoHT5
 Ma68PRK0rAkWDbqcJ7Gpr2QQixiZY5b3e9/b3KmkAmu/05SWXsFvuZd29rsoJveIU1fO
 HS+g==
X-Gm-Message-State: AOAM532VtClEE6UhlkMclm6vuYT2JNDLi0kYQEI3l1emZYoorQcu3Ibl
 pCv//pxk/EuR3n6c2uER4w==
X-Google-Smtp-Source: ABdhPJxkotZonO+874h4WPiv2w64CIW3eRlhi0d7O06Ay6TB0wtv2vO2vPPy61Xz3lTrRWMgINfgxw==
X-Received: by 2002:a9d:191:: with SMTP id e17mr871646ote.127.1612903655607;
 Tue, 09 Feb 2021 12:47:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l4sm4384051oou.8.2021.02.09.12.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:47:33 -0800 (PST)
Received: (nullmailer pid 149246 invoked by uid 1000);
 Tue, 09 Feb 2021 20:47:32 -0000
Date: Tue, 9 Feb 2021 14:47:32 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 03/16] dt-bindings: phy: mediatek: dsi-phy:
 modify compatible dependence
Message-ID: <20210209204732.GA149190@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154736_734924_92B3B74F 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 15:00:03 +0800, Chunfeng Yun wrote:
> mt7623-mipi-tx is compatible to mt2701-mipi-tx, and use
> "mediatek,mt2701-mipi-tx" instead on MT7623, so modify
> the compatible items to make dependence clear.
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: modify commit message suggested by CK
> v2: separate two patches suggested by CK
> ---
>  .../devicetree/bindings/phy/mediatek,dsi-phy.yaml   | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
