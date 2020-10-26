Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258FBC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 14:49:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF37822263
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 14:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XwP0ev8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF37822263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7oyPOOGcQTSKK3xQ8isIM4kft/9c2hfHAavoyYu7FW8=; b=XwP0ev8qBQSDWTq6cttbH+7Wj
	kQYeOGSEA63gf/msPMskA/KR0ywiyAwR448ro0w8DXB5Iypd1R2nkOieB5ncKtcuowdMfN5RjVeYu
	Hx8yf3EBPsU+u/r/OQGvOnQuFwd6429+fP0rNbHJMy8wZfuOlHUgbuvnTSan1oYjM5RNv8ZSrgbiA
	03HsjavSkhLnHM5Sfdjdxl/zV571pZBlsYQVvqb//NM2resAgIiXaCZF+c9KABAwIq2ShvUF0GAZ0
	MXgkq6okvhHPTOL0PB0CWnZJFTJIv/PFD88Qa+t4N2OltGWYYMK+xX4RZ/5MWWCTOMTgHvTULPGxk
	e1u7xq1dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX3oD-0005Cq-IE; Mon, 26 Oct 2020 14:49:17 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX3o8-0005BM-U2; Mon, 26 Oct 2020 14:49:13 +0000
Received: by mail-oi1-f193.google.com with SMTP id f7so10732167oib.4;
 Mon, 26 Oct 2020 07:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+NfVc4x3xLzw7Zn7dJWrSR2PBWNHUkCvBLVaRL098Q=;
 b=SV6ha07OBMXPC8OrheyEt9imJXgZKmFRtT/qHSzdaiQu47sklGn5q7Tp0boQKDr+5c
 k/AILm/KqF+DtXPL8bknP4bEbSYo6jFG6PyvyDDMvWrg9Xc2IQMr/xU3rN/oh4tRgkf7
 YTBZ8AN8P7uuy7GN6EnUpvpN/9KiJf1Vo36vW4Oba39ZWevsRM0Fc5MF10UiPPtn7bCm
 /6VWwQlu9ArJjOlub24two4aGl24rTesYyHsXv4lzy9PfM9HaujEv1xtOThCMyW9AskP
 kMOh60fwwH9o/dYmnMrUQd9qzHGxXy4ZySbcRpCi4pSqfOYOqvYH+h/q49Uy6ATsjkyl
 PIkA==
X-Gm-Message-State: AOAM532cV20ZkDVpWyG2bOBjRav62FQ9JjKqo3VGiwBqsV1KBSvVNX5z
 1+lKcORCSFMIIFNLmf9cYA==
X-Google-Smtp-Source: ABdhPJxKK4fATZtny24CZPPg4Vw0oKX9Rpv6avltgTIyqzxCcII9w+9KmnT1CZ4tBPj5owmyhB/E3w==
X-Received: by 2002:aca:ab0d:: with SMTP id u13mr3417806oie.178.1603723752073; 
 Mon, 26 Oct 2020 07:49:12 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o8sm4051605oog.47.2020.10.26.07.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:49:11 -0700 (PDT)
Received: (nullmailer pid 138088 invoked by uid 1000);
 Mon, 26 Oct 2020 14:49:10 -0000
Date: Mon, 26 Oct 2020 09:49:10 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: mediatek: make resets property
 optional
Message-ID: <20201026144910.GA138041@bogus>
References: <20201021164231.3029956-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021164231.3029956-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_104912_983314_D4C6B59D 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: devicetree@vger.kernel.org, amitk@kernel.org, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 21 Oct 2020 18:42:29 +0200, Fabien Parent wrote:
> MT8516 Thermal IP does not support reset. Make the resets property
> optional in order to be able to support MT8516 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
