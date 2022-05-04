Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEFBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWiPqD79sXWPqSxDG7oi8uCDatU9cbk3bvQMKmgJibo=; b=DpmOpe3Hh6/FnA
	NSuYP6kkQbn9VoHQDqzdoUSANAp6cI9YwB+45+LggL7zfrS7ZcUlGWXDOGF/MadmZ2TIx9vge/qX7
	cbMfiOCX6nyuzj8fKIA8tMGBwnHRUCTtXoxq1lkp5IdfjTtS52X2EiSsIzno6irW7mKOU+ybp6SCq
	ocaZjEpkK8+W7zDs/Bhw8pQslgGLB5YsC6TAF0Si2R4SFvxRCXS+EFe3kB/WUXOv52GSuuUPdHAZH
	gBkRsPgViJrfdso9wix47+Ia8EbKdRA3K2iJg0peu7KRNfuPp9t+1BCm50WEab2m5xY4GWUUmQkAl
	t/JKYBlGv4SHLdBidXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmGwY-00BS6P-V6; Wed, 04 May 2022 15:29:34 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmGwV-00BS5D-EY; Wed, 04 May 2022 15:29:32 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so1111852ots.10; 
 Wed, 04 May 2022 08:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5NQ3hOnaopgb1u4v6GSL1A1TZUSjB62fOKP/GjKT+74=;
 b=Ve3LRVAKOsSNnVYxwJWq2vBBUqKDh6ssl09BnsoCZ3vvc9Tzx9dqpKyZDns/cUUIR8
 jjwHXAbMmyrj9ycQxAymjzz5bJm5RvWu3GJldvKkb2EZS3ST/iK+Oy5fWCmpS2i8v3mz
 gWjRcph6fDrLzKKKaL2A8lCai0SGU1KbS3LhETgwlRSqUOde7buHLzbXxd99J80A8ZcO
 /eDsPH6tYHRL3/GEduxZXiJWUeeh815jU94Nlqp58BBOl5W729nmEOWjVZi3bUGq6vo/
 ufhZG05OkSfW2FnvEyqziZYW4/d1doaq3QR2XFh5kIxHnCa6BXXIcBvfzdsb4RyXZe/A
 Ytjg==
X-Gm-Message-State: AOAM530GOCd/MpHkDINTI2AMzgNe3pwvSvZkWAvAAz4hUFRrDucaVPtW
 XN5eLSprhhivZV66bc1bIQ==
X-Google-Smtp-Source: ABdhPJwwPQTqIDALHv8/q9v5utopx/7unnTSMQlFLOQ11ycLjqa2kC8fkIoKQpZgOm7ijGGfQC+RQw==
X-Received: by 2002:a9d:634e:0:b0:605:f40a:258f with SMTP id
 y14-20020a9d634e000000b00605f40a258fmr7472854otk.375.1651678169476; 
 Wed, 04 May 2022 08:29:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p6-20020aca4206000000b00325cda1ffbbsm4339035oia.58.2022.05.04.08.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:29:28 -0700 (PDT)
Received: (nullmailer pid 1744191 invoked by uid 1000);
 Wed, 04 May 2022 15:29:25 -0000
Date: Wed, 4 May 2022 10:29:25 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, linux-clk@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Miles Chen <miles.chen@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: Re: [PATCH 03/13] dt-bindings: arm: mediatek: Add MT6735 clock
 controller compatibles
Message-ID: <YnKb1aDgiUKprKSS@robh.at.kernel.org>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
 <20220504122601.335495-4-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504122601.335495-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_082931_522028_AAF3B5B5 
X-CRM114-Status: GOOD (  11.16  )
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

On Wed, 04 May 2022 16:25:52 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for MT6735 apmixedsys, topckgen, infracfg
> and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/arm/mediatek/mediatek,infracfg.yaml          | 8 +++++---
>  .../bindings/arm/mediatek/mediatek,pericfg.yaml           | 1 +
>  .../devicetree/bindings/clock/mediatek,apmixedsys.yaml    | 4 +++-
>  .../devicetree/bindings/clock/mediatek,topckgen.yaml      | 4 +++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
