Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D5BC4741F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 15:51:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3308D206E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 15:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q8Aitwlf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3308D206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xILOYNaifXSW1E+7TR/GAfSpbFA3OAypz1JdhazFV64=; b=q8AitwlfnEhHGacRbvMStss6z
	uymD3QJt/wp4jpTTdiJsYNMY8/M+ZuLkzAYT6aLFSz/c13Y4Pn6IyxFxjB/83kkkKKiKp+QcEqIva
	gAVdfWwgciL6l5W048h2qyhOqU/5kYFdVRL8/1Iy8NAKDvkkV3wqY9u3/IVhCZqob0ss5GlTJv08Q
	XcEds97u7/F3mQf/AcVroWPybvfCrNk8c5hzXEdxqZpO00af7HMO+JFkMeKR98ywETkNxKv3YF9kS
	RJzToXbuFGATtmeSXWfCADRN0/PCGXMwhtDZMZe7dvzxznyBQIgTcuTsxMx3+WUbYjVRKmGa3MTFR
	IA3lUN6nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYWgt-0003dK-DT; Fri, 30 Oct 2020 15:51:47 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYWex-000307-9p; Fri, 30 Oct 2020 15:49:59 +0000
Received: by mail-ot1-f67.google.com with SMTP id m22so5951920ots.4;
 Fri, 30 Oct 2020 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1ftl2mmglzVyNPpTmwwRhyO51W+rV9lT76LSvntTyw0=;
 b=B50Rvlp0YCWAbpa2cmdF1g7hU1n9TUubvGfq9adseHX7lQ2lAHf6euZpbNqs7s+puD
 wuWjSQSPMv258yYIEV/SyWkjgGZN6+6NNED19zizWfg9FP4VdxuTXDdKU5bg0jlvwFIi
 C12wSrruKZQ13gTWvP8EliIIYA/4IU9nCEKxcLAeh7Getmv/ElHFS3ZEYGgGNjPvYW4O
 ap+Z2V98aaBISUuPyRwfwAWMXtqldLm9dt+H+pwCJ4OZwiu1RogP3O8ewQBKkYTAAzIh
 /CxK/aAsCJ9mx1I8obrjg3nfV58jP+hLgqYBMLa6c8jcZAgny1TRegILWz7b0CNAyZyw
 bgiw==
X-Gm-Message-State: AOAM533L3ivXX5QKIq+/DwSFjAcufPjMC6u7rMmTw9Xx9w36kiito5sg
 xvtrAhND957P/pN1QRN0yg==
X-Google-Smtp-Source: ABdhPJz9aMo+yJ2ejJuLVzoOC70cg6U3LofBzYRBqTxOKAB+DSztHTx+rg5h2SrWLXIwxS+SilU8AQ==
X-Received: by 2002:a05:6830:2018:: with SMTP id
 e24mr2241291otp.278.1604072985738; 
 Fri, 30 Oct 2020 08:49:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w8sm186211otm.64.2020.10.30.08.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 08:49:45 -0700 (PDT)
Received: (nullmailer pid 3905477 invoked by uid 1000);
 Fri, 30 Oct 2020 15:49:44 -0000
Date: Fri, 30 Oct 2020 10:49:44 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
Message-ID: <20201030154944.GA3905431@bogus>
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023133130.194140-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_114947_479973_C8171CB7 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 23 Oct 2020 15:31:26 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8167 SoC
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
> 
> Changelog:
> 
> V2: No change
> 
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
