Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C62FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 18:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E69A208C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 18:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="muU4y4uP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E69A208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3aY+gOAm8VPVPyVmmdvfX/kWybnxlaad69KyWiDEmc=; b=muU4y4uP1X+AQb
	hUpQ9w7f86P0jN9A5XsyPPGpDIv5WG8Ch542V3s5NxJwogXdt2yDWsplpwsVw6mITFE4hyxztIGvt
	KjlsaXp3lFkQui7Hz9Irbzz0x/fGZesyfJfkkLqB932RuAmOIrKK0CkxS5CJj06yJCegrPiFUCPXd
	Y8tU8qG41khWk1HDasFpFPo0ApBoZj5erDJHrzsINpYLbRV4QX1PrdZW7ZfsNVAjrMJHhUEMQW5UE
	SoZxluMKVqPr7jLUFq7Z1SSIBO2zGjP6kWrO0dIW61wgVWdfi80RpDI+XPugUukBWNfAAVYF+IONb
	Lmi3lhOQbRgC4SwU0VWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlzPX-0000LD-BQ; Thu, 18 Jun 2020 18:37:15 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlzPL-0000Aj-Ci; Thu, 18 Jun 2020 18:37:04 +0000
Received: by mail-io1-f67.google.com with SMTP id u13so8220941iol.10;
 Thu, 18 Jun 2020 11:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wygYqTNT6G3QvAJfF7oyk+ZOc5oZNOBZOOgIykuzly8=;
 b=VnzUDE8sPW983ym+XEmn+dgYjyr5wdROVlgXofNGHzZWIljh/4wI9cKis/jVglw17G
 1j9C2MZyLborvmJzQgD1Pq5R448KD7vfER+8/eWSEgnbzbWTJF26kxBXYfdgr7w/DcXu
 4Oue4RE1V7Ym0Lhqfky4CS8lyi61Hs4x6VBef52qUMrm7CUEqgQDrYoms1ETlEcPXnpL
 wQ8pYcwRZks2OfECWWUY9I0lxgQZI2h2KEhVf4ijOdvYIJGeWjO2kOiybC21devHLYoe
 cd8Yycn5SBsDDJ8ZjIwITwSJ9AmkyDSx5G6E6fg3TSZcwufAppxw5F9o5ytW8nYLdGU3
 htQw==
X-Gm-Message-State: AOAM531A+xeurnXfK0ooFVIE4GH0F/1kRWpE3nzBIdLHT4Gr9hE18H5F
 hvj3STA7A1hlWZ39uehWwQ==
X-Google-Smtp-Source: ABdhPJx7xeR3+HQ8b4NxOi/J+ZFJIhmbXIg3/1OQ2uZoV0cZx8iWwPc1ZPoV9VCjHN+gnoYYhdUOlw==
X-Received: by 2002:a02:844d:: with SMTP id l13mr5723498jah.105.1592505422376; 
 Thu, 18 Jun 2020 11:37:02 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b8sm2065295ior.35.2020.06.18.11.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 11:37:01 -0700 (PDT)
Received: (nullmailer pid 679615 invoked by uid 1000);
 Thu, 18 Jun 2020 18:36:59 -0000
Date: Thu, 18 Jun 2020 12:36:59 -0600
From: Rob Herring <robh@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v1] doc: devicetree: bindings: fix spelling mistake
Message-ID: <20200618183659.GA679453@bogus>
References: <20200615075835.15202-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615075835.15202-1-f.suligoi@asem.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_113703_431308_5FA14FA7 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jun 2020 09:58:35 +0200, Flavio Suligoi wrote:
> Fix typo: "triger" --> "trigger"
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> Acked-by: Guo Ren <guoren@kernel.org>
> ---
> 
> v1: add Acked-by: Guo Ren <guoren@kernel.org>
> 
>  Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt | 2 +-
>  .../devicetree/bindings/interrupt-controller/csky,mpintc.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/csky,mptimer.txt        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
