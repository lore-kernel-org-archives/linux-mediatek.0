Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B01C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 22:30:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8266364DE4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 22:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8266364DE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tr0S0IKKb+47XvKdXkDDmXSyDi/hBm0nRZUkaiNBQEU=; b=AA3KUqOUZ9GYnq3liH/Piga3o
	SILheos1AHrXtrQP/8p6zNqk630rWsK9J3AdJkBIhy4L+LIsL/DhY49korEzWgRYONXUcKPFOVxDX
	2m+EvYMJIa3VcAXE7gFdj7IO02TfaEJAyPn+K0kSAmwgeOP4JQOOUC/AeXgT/UjurCS1XIQWAR9l4
	hrfaqgeF/4lB7hOJAAdYMOX0wGMbj4xOen76j3853WbildxZbBN8mReEhTLC3oD0XqCEi6V4oobd4
	Oo/Jxl+D9JHVwxao2SEWsLaGUJYXrwobTsg6EHMUoJguxVDbdfoTA3Oxv+ypzLxWFGy9YHE8dUWU/
	dOLjxDapw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIIxb-00GphR-5P; Fri, 05 Mar 2021 22:30:15 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIIxV-00Gpe3-Ei; Fri, 05 Mar 2021 22:30:11 +0000
Received: by mail-ot1-f43.google.com with SMTP id a17so3351964oto.5;
 Fri, 05 Mar 2021 14:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EG3oJ5PRX0DYUjC6mcyCt0rOTflE0zkFNOBLyyJWSWY=;
 b=r8iVk8mUQaz0tD6Lj39UTYMbJ+pkGTTIpFFGKPSKZhKGRc+qt+ZjzWvTu+J0xYgao4
 HDDxn46fi7W7VSywiZmET1FihAc2xSZUV5J7tYw3AZl+GGY4HzeedSX2X0m9wISAzhM9
 nBl6b4omvDKSyoi/4xYQAhuYAcj6DJpSjAsqYpTEoxQJ8qzwm5Bb0YSQotJ8El2a6mJ+
 J4jlpDRJP9Osz7AAtShqJnRYXr7I608hR96ocAsaLdQZoWY0n6UiccLzWWEQLlZg4OR/
 wViLi9Th+/5xgqgrlfWUXu52jNYe7DUIccTryQGPXm/MCdEt6DvMTmufdWSMMAIBuIbo
 OnBg==
X-Gm-Message-State: AOAM531eL98D+B61/uOudZj6pQMuBKuRN0G52L8GlZIpmAacvtvgbeZv
 7mpDpZylorywZ81no+ibQw==
X-Google-Smtp-Source: ABdhPJwbxmDpm+hfKjSxJ9aA3XJLGWVWCaIgXC53dtLMdkzCRvvoH+H1XbT7wXmprnO3BZe9Vj/z1w==
X-Received: by 2002:a9d:400a:: with SMTP id m10mr9623177ote.33.1614983408268; 
 Fri, 05 Mar 2021 14:30:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n11sm807413oij.51.2021.03.05.14.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:29:49 -0800 (PST)
Received: (nullmailer pid 760212 invoked by uid 1000);
 Fri, 05 Mar 2021 22:29:47 -0000
Date: Fri, 5 Mar 2021 16:29:47 -0600
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, mkorpershoek@baylibre.com,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-pumpkin board
Message-ID: <20210305222947.GA760161@robh.at.kernel.org>
References: <20210217205945.830006-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217205945.830006-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_223009_863900_15A0EC1E 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, 17 Feb 2021 21:59:43 +0100, Fabien Parent wrote:
> Add binding documentation for the MT8183 Pumpkin board.
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
