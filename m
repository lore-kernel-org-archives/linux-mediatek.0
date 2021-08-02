Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4DCC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A05860F9C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A05860F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eN22zcokMsqXZXIeCqknPsuz/RJRqfETjFyLKEQN60=; b=BgnmpHzEzcGlK4
	avGa2dVmb/k0YVQiZOHrYdtuCrGNnHUfi4ah+XGJydEKoyzacsWX1AouhAcG5gaP2gAq/H6mOQiQr
	k+5SGBbfYhAIcMm8f5toyIymY9s0YQ+tgZx9xYoFv40k7QQdYXkfnXsxMfhcVvdoHL/6cojfCNEv0
	OVoAr4grXBQxzqj8DlKUu0OhsKyKcRtrK2y/mtsvJNgu790KGx3vfLCpdVDI5Zm91vKduLHuzmZaZ
	BS98xP5a1wUSwzsbKB+xxFg4xcU849O/bjq6MkUbDgecpOvXnbKMlZfj3qgNTjWESm/eKifLDPC0G
	KHvkyCGg+UrcMH3pqePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAfUa-000HEA-8W; Mon, 02 Aug 2021 21:29:00 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAfUN-000HBX-0r; Mon, 02 Aug 2021 21:28:48 +0000
Received: by mail-io1-f49.google.com with SMTP id a13so21968440iol.5;
 Mon, 02 Aug 2021 14:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tp4KXngrXO5YFcCu25Pr4mtZcirjXylO0I9E5ahmR5o=;
 b=Jcekc4MBhz1JGjNd1WVkvfecke0tF0yW96ggW12u+VTimX93enCLYUiOd6VhopLoXL
 15OhWq90b2P9FqXTvc8YMW9COmqKuiOXgdaUQO9q/zfyP75GLGAu36jgRv/raC9Y1Zu7
 gZvdbayGae48+y0YG/lxwqGxWUn2ZGuHsNP/yrdk2bkC3xWegIF1i3CNkDqB9EAlMWAa
 /bkRxCq+oDzChNolu1Zbw2N4qFAEgsYPWWdk0P3ini7/eBuYsuiUaj7cRW/yor/618sd
 /lXue1tHnXnT/ZPNHEVh2DUnwtQcZZxvnbMLjnPuV0nniKPDIM6g0D3wqm7JWdzffo93
 dPKg==
X-Gm-Message-State: AOAM530U9gIA2A3xosJNJloFu27zDAl8H66oNdPccq+45T9vD0RML25d
 XEMX7BX6y/uhF43ugT8Tdg==
X-Google-Smtp-Source: ABdhPJyldCJgnalyfRFG+7ACY6zzoUaTex+igLoi0aih7vtZQps+sgRlFsWojK8EOIfhMzzjqCr3YA==
X-Received: by 2002:a5e:9602:: with SMTP id a2mr2332783ioq.146.1627939726284; 
 Mon, 02 Aug 2021 14:28:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b15sm6203762ilq.85.2021.08.02.14.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:28:45 -0700 (PDT)
Received: (nullmailer pid 1645679 invoked by uid 1000);
 Mon, 02 Aug 2021 21:28:44 -0000
Date: Mon, 2 Aug 2021 15:28:44 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, bjorn.andersson@linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-remoteproc@vger.kernel.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, ohad@wizery.com
Subject: Re: [PATCH v4 2/4] dt-bindings: remoteproc: mediatek: Add binding
 for mt8192 scp
Message-ID: <YQhjjFybXYEbGki0@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_142847_104472_54CD6EE6 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

On Wed, 28 Jul 2021 11:58:57 +0800, Tinghan Shen wrote:
> Add mt8192 compatible to binding document.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
