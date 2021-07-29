Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BCBC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6D360560
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C6D360560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Yifc7FIf3Vpx7WwE0IH9u2AhCDyedEzuzC1OOElEDQ=; b=KnkOLxgS1iEJ5P
	TNkX6CLVa/7KeHGbsSinTt1rSdONUj90IWlh8byr+ed6aopi6yFgaYhF7guALseAdunsQ+sicatTS
	nf2UnvxkgYXdKbCjUYvtnA1/iXFn0AdepHoBhdNEdovnAvGHOQaQs7Yvbt5AF+IqQopINutPkBgcz
	WAi6+mIDLtxPLpLo8ndnHD3/UDecLZtJL6RU+hbnwh4G5ylIXRh5mhdHmHmea4Ap91MzT3zWT2obF
	/+N+nxcYQGTPKiqcavLeNoBGvsEYYFhoQkswbfcRM8QRF08nvDLIsN3avVqMdIBYHiUoQPVKYk9u5
	GSa1s8wsDEh6HGsMQ7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Eyd-006KfX-0Q; Thu, 29 Jul 2021 22:58:07 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Esj-006IIw-GY; Thu, 29 Jul 2021 22:52:02 +0000
Received: by mail-il1-f171.google.com with SMTP id r5so7478587ilc.13;
 Thu, 29 Jul 2021 15:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTJgy5VBZ0oMAHE9O7XmVIIL13K6DpLlQbEnJdwiDGg=;
 b=Jp8bC3rU1dQ1HRJZQOsqRoKOxgC9OI05Tq9myCHfQgFEgur8Sdti0SCn94MFk16fU5
 xr/v/Blp+skOxK/J8mrjZ1QR9Q8UIIbXvlsvWUjJ+Bko86IWs4rARwojXTeQexcElgY1
 TbPBDQZCEN8HU+l4xZJf6+Ra182XyRlqxErPC4t9rfOFJsVN03ViZtB4Bago4jkAio8W
 dlazQz132ihHNE3uwIAgKWSNMI8SS93eS1c9eFgE7vW0YIfCfUfdYL/5dWneNH3BX66b
 xItveudGO+AQyEVO2tEOFxkiWbJhhTgXuvKh3AaP8R8oosATVufIpYP0Zpcr++v0nyL3
 jUnw==
X-Gm-Message-State: AOAM532qsIZbOyG0yVR+XpykI3RT97A+EiFSD9MEsSc5uTNXl1Qk3c3J
 dzIJUde2R6Oqk+LsondyDg==
X-Google-Smtp-Source: ABdhPJxvwdp6rY9SUaluCLYLkZoGuVPcomNzfE5Ygq462J5Max8ViPgmc099fsR25cf7mnvNu3kFRQ==
X-Received: by 2002:a05:6e02:2162:: with SMTP id
 s2mr5369766ilv.99.1627599120624; 
 Thu, 29 Jul 2021 15:52:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q11sm1623611ile.71.2021.07.29.15.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:51:59 -0700 (PDT)
Received: (nullmailer pid 1054722 invoked by uid 1000);
 Thu, 29 Jul 2021 22:51:56 -0000
Date: Thu, 29 Jul 2021 16:51:56 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Seiya Wang <seiya.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 Ryder Lee <Ryder.Lee@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-serial@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Stephen Boyd <sboyd@kernel.org>,
 Matt Mackall <mpm@selenic.com>, John Crispin <john@phrozen.org>,
 Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 07/12] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Message-ID: <YQMxDIKR6+mR0gZt@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-8-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-8-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_155201_591202_1C03FB8C 
X-CRM114-Status: GOOD (  12.85  )
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

On Mon, 26 Jul 2021 15:14:34 +0800, Sam Shih wrote:
> MT7986 is Mediatek's new 4-core SoC, which is mainly for wifi-router
> application. The difference between mt7986a and mt7986b is that some
> pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
