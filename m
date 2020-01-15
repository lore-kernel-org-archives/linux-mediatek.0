Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4511EC33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 15:20:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2632465A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 15:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKc2LrSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2632465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajM1spEhmg3YMlQg3lQVLkKgDuxab7Pfk+QrUjXVWV4=; b=kKc2LrSasKU4Q/
	K0KuL1Exe90ye8zFtIOJICEBkeaJ5NuvPbaj52RMiVJLdxkjvZsbjIVs/GWVtddsP99HZzC7hxCsV
	fuf8mDE+V1qIZ2OX14KirCNfxEK3NCJxhITDYWJp4mhggpCraYHNa4Q/D3YWqzw4m80u3v7Y+s6t3
	nbMpQAQ/b9Eyof/FvRbZ+9bkf7prVzAW57L0/yUYJGjSu8jGzq389gxPzYmUIiEvbfAvmu8UIIq7H
	jMQ00Coi+Z1FB9WEhy0/eYQdDZW7horwMVQ0QPr2veG0kT+fMyv3+rl2KmZP8ZiUEA4U+GHE4KV0L
	b38RDnE7aiX8on9EZT1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irkSU-0004yU-Uc; Wed, 15 Jan 2020 15:19:50 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irkSO-0004xA-6n
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 15:19:49 +0000
Received: by mail-ot1-f66.google.com with SMTP id a15so16415919otf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2020 07:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eb54G3sc1CCAx4sR/HWrdZKKEAIXwHpDF1vWmKUoplc=;
 b=sSwKCCA6sFxMV28jk6VTtaROMLoDFYO93vMWBvfZr5PTK1YOmc0uWMYlKkYZz/Nrsu
 4KoXeNFZ33FZFtqrkkK4tQSNzpt13ZyiN45RV8zw4CtnN3qCTpYO1CxoqRYNFRlIO9xr
 FWXMbuzkzVUwocBDw3h3mSjAAbHtlu8N0iGSv6mDScF13BdrH/AlQNJ+gQ0OsFbS61KG
 CwKxHIYsTV3a1sLUuRt1qfyfiLaTRbCyv82+ranfHRCZMqvhu33722wFIEfAlJJhdgoo
 ZJ/GGj9tNgO9Xpg0DDF80WrcGb8wsw5/65YT+JnGIWzrKAXWJYhTGNGIwAlICPBauPNk
 JHEA==
X-Gm-Message-State: APjAAAXraV4K0z0sPCRGPbDnoggt2y4i7E9ku0O5S+jDVDA6r7fIcrHu
 /hfucFjx7tHdiNFiDuf5nDEJ7w0=
X-Google-Smtp-Source: APXvYqzFqac6rMzo2yvswxXM0SLZqsoa8zXy7J3nmjMErJ1cnCxHmMixeOGhaEktlBUUXKLqCUNe4g==
X-Received: by 2002:a05:6830:2147:: with SMTP id
 r7mr3175182otd.94.1579101583370; 
 Wed, 15 Jan 2020 07:19:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j8sm2405638oii.32.2020.01.15.07.19.38
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:19:40 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220379
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 09:19:38 -0600
Date: Wed, 15 Jan 2020 09:19:38 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Message-ID: <20200115151938.GA8182@bogus>
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110145952.9720-1-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_071944_245063_882ED356 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 15:59:51 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The MT6397 mfd includes a pin controller. Add binding
> a description for it.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
