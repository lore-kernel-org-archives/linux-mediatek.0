Return-Path: <SRS0=D+wH=IE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497B8C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 20:05:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5EC964F00
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 20:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5EC964F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k5/xWUSaxCjPQn+5au7HDbxZOYnnYsm9QMMIOgZbDs8=; b=ItMuooEPy0FlT+jODmhW3aL4z
	cs5E1fDj40N9RVF7FQGSbW+v8oci+1zFXInCM9OpBy9cGvNZsIXsRK0ijv0oB7iqq4IhR6ba0OtTa
	Asc2hz4drQ8ERFa23+Qoqn6OCEsOp+AN4NPXF5ESvfVsfk0aDa1CSFihx3lLNgPrwY6gamQLRpcI6
	MpMNXwjFUNgi7z4rJ52HtPAVXP9H21il9IujBf4nWLVV8R8eH3yn1wYVXuMkC1e29HHJuO33ZfDgl
	+QpnNwiC3VdWzVIrHO6L15MVSuroG5XImfHp94RwWM/M0isWUw1DHFvoiHFcgfZDWw1hrQjKVH4n+
	NDKo4CkWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIdB3-004aL1-7t; Sat, 06 Mar 2021 20:05:29 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lId8g-004ZA1-D6; Sat, 06 Mar 2021 20:03:05 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so936071pjq.5; 
 Sat, 06 Mar 2021 12:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rl3gI39V/O9J9xA+OpvlcUMaQ1pI12CT1UU/vVwFAWA=;
 b=bM35pGXISXNNvLXYc4dGt89lRMShA/vDHqPXz1eYrg+IyMBwYPZQJtqrdvSFj607lM
 QxI5fqhY5ZH2lh+YeMKVyBO8PqqbUkIJhY5uxs/cyMtKQ1tipreYyR6HR9AEEjLOd0i7
 7ygZA4jvqz7r8c7TzHeSIHTg/uMIIxBj1FeqBeJT0iixiyCsads/oVeh/OtYmmD+faJ5
 qFdS/AL3j6GbNm0tc54ctm/23IEX67IcX4qdsjH1d6YJNvIGgCHH6WVd9QeGUBRgXb8L
 xaYzatZsdEt4QXq4qIzqIbdsAA+L4H7ObbumAKwb+w576Qg4HLNzo2uXnjaAy8I9L5WU
 bslw==
X-Gm-Message-State: AOAM533yR3sSHa2/rUN9Yicdte0lMkbOJyHXFnLN1c5C22pY7tHp49UV
 /H/IUxoIvq1MFlX3vG0Fig==
X-Google-Smtp-Source: ABdhPJyeBmfJrMc0Jnd9SiDCcJBT+V95QfZQwZweMLYv/hBsn4rVXviSu0TWef0nmS0FcuVJpJCXug==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr17429421pjz.191.1615060980719; 
 Sat, 06 Mar 2021 12:03:00 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id y1sm15824098pjr.3.2021.03.06.12.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:03:00 -0800 (PST)
Received: (nullmailer pid 1128306 invoked by uid 1000);
 Sat, 06 Mar 2021 20:02:55 -0000
Date: Sat, 6 Mar 2021 12:02:55 -0800
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, mkorpershoek@baylibre.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: Add mt8516-pumpkin
 board
Message-ID: <20210306200255.GA1128188@robh.at.kernel.org>
References: <20210223223613.2085827-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223223613.2085827-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_200303_334965_5BB42F56 
X-CRM114-Status: GOOD (  10.02  )
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

On Tue, 23 Feb 2021 23:36:13 +0100, Fabien Parent wrote:
> Add binding documentation for the MT8516 Pumpkin board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
