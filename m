Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8361F20848
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KWWK5Cc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8361F20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h1VX00jb4AHyijbZuh9usF3XihqzQ1k2UWFqUfHIRM8=; b=KWWK5Cc8aeMNkBoJBqldxkMn/
	JMslUuz4J1PoC00vkExAWZdwR3oUzsy9kWaVNerY6qY9Elgk5iF/RIleRwOTmyPldMfUaviA49272
	ljUECIyxcmAjCKPlC1uV7Wp0ZDuySp5DCuVlMQZeVByetotuOROEi2s4MiXEtosE7yzf8IJ+LADTz
	n0EhQToPyWXk+yfJlgC2L/mnn9boJnyVJfFRH6LW1x7iEMcaDhYsLL0BslJf66dDk2UTrzbmLe3Aw
	cFjNmu0bCd1n2Tu7/YxAWuUjfbgmj0Cp19Qkkn78jC4E5531zixmSvcgWmUoShWOgCU+FSOJbn3O3
	5ne0HtdrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTBT-0003Te-EI; Fri, 16 Oct 2020 17:06:27 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTBR-0003SO-98; Fri, 16 Oct 2020 17:06:25 +0000
Received: by mail-ot1-f67.google.com with SMTP id e20so3008830otj.11;
 Fri, 16 Oct 2020 10:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qTk3r2ciTgh4me1BoYFyfE+JWDJPOXnD3hJCbfqxA5o=;
 b=Kp10qPlLTLW4huMseEOa3l2Pk6pE9RrGL+GDEvbZVgM6HrEKZJyVC76HiveN0zP/6C
 xHPIGXdeDzf0hV2NobMozjxLj2Fo4nPYatfsIdgMYFiOtIyB1tjlVTPfN0kfr3UaCPoV
 5hxO0bqCj8j7NmTpru6AeNtMpF4X43NFLXhHgSb35j17DV+X31V2/o7IAJ0nD460UPpR
 MHiQGPeXllrQjs6EsqhZZoYogJpR8+kmNl7ynHa6rXRG0pn9E9T3/a43wRTstm83XtMl
 tquw6xu229KdwdXyWY6ywyHmLWnFHTskVTLsv321SL4kzSR0GSHn1AJ7q2FymPy/BRWs
 lVVQ==
X-Gm-Message-State: AOAM530gIetAJXjGtlwoKjZz55P/Pr4lWQA+pFC03v+swBTWQet7NWL3
 rgy/7M6dPngFadrqnIg2cw==
X-Google-Smtp-Source: ABdhPJyyosGHhSz7fBWayeJxfdk3OWayQGywHW7RULyDMfKvzBSgTsUyFnhJAZmvoFSE0v5DxfFSug==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr3231621otq.60.1602867984017; 
 Fri, 16 Oct 2020 10:06:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm1280277ooi.41.2020.10.16.10.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:06:23 -0700 (PDT)
Received: (nullmailer pid 1582215 invoked by uid 1000);
 Fri, 16 Oct 2020 17:06:22 -0000
Date: Fri, 16 Oct 2020 12:06:22 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Message-ID: <20201016170622.GA1582169@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130625_328625_3E88E361 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 16:52:02 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
>  2 files changed, 64 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
