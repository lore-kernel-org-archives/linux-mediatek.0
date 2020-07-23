Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424C2C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC9D20888
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p87tLCS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC9D20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pt4UctHIdkfepUQgWimgp6+4tlCvXK0KHdDODcza5ZM=; b=p87tLCS2p2XvToIsWFK+8kDti
	eKhUQ/O65cOfQRsdWrgAiaE88p7cAxiW50/c0dIa4t9fIY1TwG9oIucLZHgfaa++EPtEqu2CKkrL6
	0WslN7eAIsNftOqP3Y9Pwhivx3g+9FIU/sTGc3y+tjrItXKOga2Cqc+A+KafQEj9goKbXeS74mQwl
	zG6fKNYzh9b3sOc7jbHYmLxmcQpDfb8iMRXBXzmVgNYIihC0NpPJWti/wY34g/6xq1p77x5C8dTU1
	MXO0b/ivPQ3MFHqm2ZdWTSJWrBt0x+IbiVFBZeTgylx22+MhI+ztojQHJT2YylUnvhhP24pOgU48S
	4a2FZJ9Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyimf-0004pH-AU; Thu, 23 Jul 2020 21:29:45 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyimZ-0004nK-3i; Thu, 23 Jul 2020 21:29:39 +0000
Received: by mail-io1-f65.google.com with SMTP id c16so7820095ioi.9;
 Thu, 23 Jul 2020 14:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PKjiq4T6ylU+ZE/im6S7vQ1AiFBJDWu+p5nUwbAC36I=;
 b=rLnYYqLIaPw5P/s8cavhUQVSgy4myJ1oKlXligli/5IywlELJVNToFFNH9Lfv3mQnu
 56PSj73OX64RU4cFVjMpkdVAuJkYuXQKTeDzuRw7vtg77wuNgpDmfNYseA1qH1E1elA6
 9wBZ7Df9eOpGlOuvmDi7ETtzIrYdxYinZL0+ua18yWPoXN9hV/0CMsdY6AWh3GCDAjS5
 nRTRbVYN1Xk6MOlDjmlM8cyqtoYXJwmQCz4ly+0kzxsN2sMzIE9vic/aIdc8H5b5F6ZN
 B/9JrqBqg2opI2XBUTPreawOItJcflhhPcs3adVcZiZJjCKoPfOtNDr/GzH/mWbJ8Tge
 0OOA==
X-Gm-Message-State: AOAM530wM25PUDa4v329i34SMmmsVjO7b+67DGrcJ+pZB8HJ0c7QFbJ5
 wFdmiLQXBLjsfH91SaCFJQ==
X-Google-Smtp-Source: ABdhPJwktoQrHUMPZb4LfKcFpGKWCTBn3uvkuMoKW0CGw3OW5bX4yYqjPO82L6bs2oZ16Kkzw7x4Kg==
X-Received: by 2002:a6b:fb01:: with SMTP id h1mr7090450iog.18.1595539778239;
 Thu, 23 Jul 2020 14:29:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n7sm2032759iob.44.2020.07.23.14.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:29:37 -0700 (PDT)
Received: (nullmailer pid 891483 invoked by uid 1000);
 Thu, 23 Jul 2020 21:29:35 -0000
Date: Thu, 23 Jul 2020 15:29:35 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Message-ID: <20200723212935.GA889594@bogus>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-5-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723090731.4482-5-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_172939_198232_047DE13E 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo <crystal.guo@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 05:07:31PM +0800, Seiya Wang wrote:
> From: Crystal Guo <crystal.guo@mediatek.com>
> 
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd3f1ad..d760ca8a630e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,8 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
> +

So, not compatible with "mediatek,mt6589-wdt"? Is so, perhaps summarize 
what the differences are.

>  
>  - reg : Specifies base physical address and size of the registers.
>  
> -- 
> 2.14.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
