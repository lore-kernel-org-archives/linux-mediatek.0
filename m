Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715C8C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:20:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D88E60C3E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D88E60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8xGQpGWOvuarCwoyA8e95KEQvY7hDrFxH+1WqLfzxs=; b=ZYlsXonsl71AlX
	1o1Iv4OYX3whq6Cw6Qb5lqZ15PUyM8CH+ywMjit2ku44BaE1xRCTgGjosxN2C+X80drF2oX21gtnZ
	OPPhmZr8ft4oJ9KmK9Twk6aEReuecBD7ZQVYm8K8E4hSdGZnNNwLsSwRVghPUqapnl5SWqgZLMpDg
	EtBV0HdqyLVbKVdx84Jy5FoczkOPlMyrTOCEsoRl4gMD/9dgfG+E17yjYLIqzG476i57a735aCLHs
	EVmmRgrQwpffmTnkycQ8LVoym2SNCxtHgz0tiVQhseXIX5AXnJuzmr86rPqgBomNuJLcowCiAGmdY
	lLDV27Ob02URm+fddB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAFw-003rhd-Tb; Wed, 18 Aug 2021 01:20:36 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAFt-003rgK-HA; Wed, 18 Aug 2021 01:20:34 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso749192ott.13; 
 Tue, 17 Aug 2021 18:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SvKci2pGuG7ajQwJqFrJTn5mqUzF+JKynExPCCsdFYI=;
 b=ndCEZxDtLHLhYvQuFEbhHSCG/R/95Yj4Uv/WyYF8whMWw+ta1870cCMJLYGNq4O9fE
 EW+jfHl0+xpwjcOG7OKDGQQPFcWqgC/LxPSEoP0v435GbeELzUpLPlTDGzTDOhLXvpmu
 3r6BIzzYS1I8pCcqsqqUMXdz56e84zpjxLfwtN1Fnh+oNH7Xh2KR8RERyC8suVEHJpy6
 3tlIyFFAYNCckh+YrPBOHdV5g6JKS3WcQeGX7P72jIVqbisihXP0NDmBVy9cndZjrLa6
 lW6I3b3hbfxcW7hBqVcddqHHwc9sjYSs26LZ1YSWuU+81GhQVwMOlc4zXEqmILSR6dup
 3T5Q==
X-Gm-Message-State: AOAM531xwQgj2S4VZzTWMHUtEDOYtkQJ7QEROmrjWwsPwoxn3ILRNV3x
 c5nJkv2KqST4evAKrivkXw==
X-Google-Smtp-Source: ABdhPJw+xR0Z6Q/+z2YaeF5ZyVo4tytqq09prFN4la6ON8Lt4wub10K9mhw5q6rk8gFvLBnMjoJ6XA==
X-Received: by 2002:a9d:71c7:: with SMTP id z7mr5012000otj.194.1629249632592; 
 Tue, 17 Aug 2021 18:20:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d26sm781598oos.41.2021.08.17.18.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:20:32 -0700 (PDT)
Received: (nullmailer pid 1182736 invoked by uid 1000);
 Wed, 18 Aug 2021 01:20:30 -0000
Date: Tue, 17 Aug 2021 20:20:30 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-watchdog@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-serial@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Fabien Parent <fparent@baylibre.com>, linux-crypto@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [v2,02/12] clk: mediatek: add mt7986 clock IDs
Message-ID: <YRxgXso7qQcAqg6+@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-3-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-3-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_182033_614460_72E9CF72 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, 17 Aug 2021 15:45:47 +0800, Sam Shih wrote:
> Add MT7986 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: changed to dual licience
>     applied the comment suggested by reviewers:
>     - removed 1:1 factor clock
>     - renamed factor clock for easier to understand
> 
> ---
>  include/dt-bindings/clock/mt7986-clk.h | 169 +++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7986-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
